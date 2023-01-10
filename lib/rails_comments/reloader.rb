class RailsComments::Reloader
  delegate :execute_if_updated, :execute, :updated?, to: :updater

  def reload!
    # reload all files declared in paths
    files.each do |file|
      if File.exist? file
        load file
      end
    end

    # reload all files declared in each directory
    directories.keys.each do |dir|
      Dir.glob("#{dir}/**/*.rb".to_s).each do |file|
        if File.exist? file
          load file
        end
      end
    end
  end

  private

  def updater
    @updater ||= config.file_watcher.new(files, directories) { reload! }
  end

  def files
    # we want to watch some files no matter what
    paths = []

    # we want to watch some files only in Avo development
    if reload_lib?
      paths += []
    end

    paths
  end

  def directories
    dirs = {}

    # watch the lib directory in Avo development
    if reload_lib?
      dirs[RailsComments::Engine.root.join("lib", "rails_comments").to_s] = ["rb"]
    end

    dirs
  end

  def config
    Rails.application.config
  end

  def reload_lib?
    Rails.env.development?
  end
end
