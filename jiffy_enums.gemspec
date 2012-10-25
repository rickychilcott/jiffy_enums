$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jiffy_enums/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jiffy_enums"
  s.version     = JiffyEnums::VERSION
  s.authors     = ["Tejas Ravindra Mandke"]
  s.email       = ["tejas@identified.com"]
  s.homepage    = "https://github.com/Identified/jiffy_enums"
  s.summary     = "Easy way to add enums"
  s.description = "Easy way to add enums"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  #s.test_files  = Dir.glob("{spec,test}/**/*.rb")

  s.add_dependency "rails", "~> 3.2.0"
  s.add_development_dependency 'rspec', '~> 2.11.0'
end
