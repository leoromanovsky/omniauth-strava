# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-strava/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-strava'
  spec.version       = Omniauth::Strava::VERSION
  spec.authors       = ['Leo Romanovsky']
  spec.email         = ['leo@strava.com']
  spec.description   = %q{Strava OAuth strategy for OmniAuth}
  spec.summary       = %q{Strava OAuth strategy for OmniAuth}
  spec.homepage      = 'http://strava.github.io/api/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 2.7'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
