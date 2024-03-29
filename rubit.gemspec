# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubit/version'

Gem::Specification.new do |spec|
  spec.name          = "rubit"
  spec.version       = Rubit::VERSION
  spec.authors       = ["Rafael Mazza"]
  spec.email         = ["rafaelmazza@gmail.com"]
  spec.summary       = %q{Ruby program that simulates a basic interactive bitmap editor.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "cucumber", "~> 1.3.16"
  spec.add_development_dependency "aruba", "~> 0.6.1"
end
