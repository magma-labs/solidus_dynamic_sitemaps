$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'solidus_dynamic_sitemaps/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'solidus_dynamic_sitemaps'
  s.version     = SolidusDynamicSitemaps::VERSION
  s.author      = 'Jonathan Tapia'
  s.email       = 'jonathan.tapia@magmalabs.io'
  s.homepage    = 'http://github.com/jtapia/solidus_dynamic_sitemaps'
  s.summary     = 'Soldius Engine for sitemaps'
  s.description = 'Soldius Engine for sitemaps'

  s.files = Dir['{app,config,models,db,lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)

  solidus_version = ['>= 1.2.0', '< 3']

  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support', '>= 0.1.3'

  s.add_runtime_dependency 'sitemap_generator', '~> 5.1.0'

  s.add_development_dependency 'byebug'
  s.add_development_dependency 'database_cleaner', '~> 1.4.0'
  s.add_development_dependency 'factory_bot', '~> 4.5'
  s.add_development_dependency 'ffaker', '>= 1.25.0'
  s.add_development_dependency 'pry-rails', '>= 0.3.0'
  s.add_development_dependency 'rubocop', '>= 0.24.1'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'simplecov', '~> 0.9'
end
