# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'axlsx-demo/version'

Gem::Specification.new do |spec|
  spec.name          = 'axlsx-demo'
  spec.version       = AxlsxDemo::VERSION
  spec.authors       = ['Tuan Ha']
  spec.email         = ['tuanht.unix@gmail.com']
  spec.summary       = %q{A Ruby Gem for demo Axlsx Gem}
  spec.description   = %q{A Ruby Gem for demo Axlsx Gem}
  spec.homepage      = 'https://github.com/tuanht/axlsx-demo'
  spec.license       = ''

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency('railties', '>= 3.2.6', '< 5')
  spec.add_dependency 'axlsx'
  # spec.add_dependency 'json'
  # spec.add_dependency 'roo'
  # spec.add_dependency 'activemodel'
  # spec.add_dependency 'monetize'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-expectations'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
