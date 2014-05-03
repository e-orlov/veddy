$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "veddy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "veddy"
  s.version     = Veddy::VERSION
  s.authors     = ["Ben A. Morgan"]
  s.email       = ["ben@benmorgan.io"]
  s.homepage    = "https://github.com/BenMorganIO/veddy"
  s.summary     = "Get your position from Google with Ved parameters"
  s.description = "Veddy is a Rails gem that allows developers to send data to Google Analytics about their position on the Google search engine via the ved parameters."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
