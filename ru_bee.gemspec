# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ru_bee/version'

Gem::Specification.new do |spec|
  spec.name          = "ru_bee"
  spec.version       = RuBee::VERSION
  spec.authors       = ["dan"]
  spec.email         = ["dbickford83@gmail.com"]
  spec.summary       = %q{Dictionary in for ruby.}
  spec.description   = %q{See if a string contains any misspelled words.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.2.0"
end