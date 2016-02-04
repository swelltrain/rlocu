# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rlocu/version'

Gem::Specification.new do |spec|
  spec.name          = "rlocu"
  spec.version       = Rlocu::VERSION
  spec.authors       = ["Stephen Philp"]
  spec.email         = ["stephen@stephenphilp.com"]
  spec.description   = %q{A simple ruby wrapper for the Locu API}
  spec.summary       = %q{Rlocu is a ruby wrapper for Locu's API. The Locu API gives you access to real-time local business data, from opening hours to price lists, such as restaurant menus.}
  spec.homepage      = "https://github.com/swelltrain/rlocu"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.add_development_dependency('rspec')
  spec.add_runtime_dependency('rest-client')
  spec.require_paths = ["lib"]
end
