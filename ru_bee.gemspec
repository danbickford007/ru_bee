# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ru_bee/version'

Gem::Specification.new do |spec|
  spec.name          = "ru_bee"
  spec.version       = RuBee::VERSION
  spec.authors       = ["dan"]
  spec.email         = ["danbickford007@yahoo.com"]
  spec.summary       = %q{Spell check for Ruby String.}
  spec.description   = %q{Checks for words within a String that are spelled incorrectly and offers suggestions for a correction . Usage: 'this is a test'.correct? or 'this is a test'.spell_check or 'this is a test'.misspellings}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.2.0"
end
