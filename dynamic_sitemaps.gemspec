Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'dynamic_sitemaps'
  s.version     = '0.0.1'
  s.summary     = 'Add gem summary here'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'bzt'
  # s.email             = ''
  # s.homepage          = ''
  # s.rubyforge_project = ''

  s.files        = Dir['README.textile', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

end