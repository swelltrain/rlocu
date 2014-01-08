# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rlocu/version'

Gem::Specification.new do |gem|
  gem.name          = "rlocu"
  gem.version       = Rlocu::VERSION
  gem.authors       = ["Stephen Philp"]
  gem.email         = ["stephen@stephenphilp.com"]
  gem.description   = %q{A simple ruby wrapper for the Locu API}
  gem.summary       = %q{Rlocu is a ruby wrapper for Locu's API. The Locu API gives you access to real-time local business data, from opening hours to price lists, such as restaurant menus.}
  gem.homepage      = "https://github.com/swelltrain/rlocu"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
