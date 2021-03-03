$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "holiday_workday/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "holiday_workday"
  s.version     = HolidayWorkday::VERSION
  s.authors     = ["wuyingchao"]
  s.email       = ["wuyingchao@meizu.com"]
  s.homepage    = "https://github.com/crosspass"
  s.summary     = "HolidayWorkday set holiday and workday"
  s.description = "Set holiday "
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency 'jquery-rails'


  s.add_development_dependency "sqlite3"
end
