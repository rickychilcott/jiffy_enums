$:.push File.expand_path('../lib', __FILE__)

require 'jiffy_enums/version'

Gem::Specification.new do |s|
  s.name        = 'jiffy_enums'
  s.version     = JiffyEnums::VERSION
  s.authors     = ['Tejas Ravindra Mandke']
  s.email       = %w(tejas@identified.com)
  s.homepage    = 'https://github.com/Identified/jiffy_enums'
  s.summary     = 'Easy way to add enums'
  s.description = 'Easy way to add enums'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_paths = %w(lib)

  s.add_dependency 'rails', '~> 3.2.0'
  s.add_development_dependency 'rspec', '~> 2.13.0'
end
