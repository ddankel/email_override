require_relative "lib/email_override/version"

Gem::Specification.new do |spec|
  spec.name        = "email_override"
  spec.version     = EmailOverride::VERSION
  spec.authors     = ["Dave Dankel"]
  spec.email       = ["ddankel@gmail.com"]
  spec.homepage    = "https://bitbucket.org/pnmg/email_override"
  spec.summary     = "Allows overriding of outgoing email recipients"
  spec.description = "Allows overriding of outgoing email recipients"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://bitbucket.org/pnmg/email_override"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
  spec.add_development_dependency "rspec-rails"
end
