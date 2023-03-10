require_relative "lib/rails_comments/version"

Gem::Specification.new do |spec|
  spec.name        = "rails_comments"
  spec.version     = RailsComments::VERSION
  spec.authors     = ["Adrian Marin"]
  spec.email       = ["adrian@adrianthedev.com"]
  spec.homepage    = "https://avohq.io"
  spec.summary     = "RailsComments is a modern commenting engine for Ruby on Rails."
  spec.description = "RailsComments is a modern commenting engine for Ruby on Rails."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/avo-hq/rails_comments"
  spec.metadata["changelog_uri"] = "https://github.com/avo-hq/rails_comments"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4"
  spec.add_dependency "zeitwerk", ">= 2.6.2"
  spec.add_dependency "turbo-rails"
  spec.add_dependency "class_variants"
  spec.add_dependency "redcarpet"
  spec.add_dependency "rouge"
end
