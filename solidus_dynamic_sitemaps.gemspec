# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_dynamic_sitemaps/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_dynamic_sitemaps'
  s.version     = SolidusDynamicSitemaps::VERSION
  s.author      = 'Jonathan Tapia'
  s.email       = 'jonathan.tapia@magmalabs.io'
  s.homepage    = 'https://github.com/magma-labs/solidus_dynamic_sitemaps'
  s.summary     = 'Solidus Engine for sitemaps'
  s.description = 'Solidus Engine for sitemaps'

  s.required_ruby_version = '>= 2.5'

  s.files = Dir['{app,config,models,db,lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)

  solidus_version = ['>= 1.2.0', '< 4']
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support', ['>= 0.8.0', '< 1']

  s.add_runtime_dependency 'sitemap_generator'

  s.add_development_dependency 'cuprite'
  s.add_development_dependency 'solidus_dev_support', '~> 2.1'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
