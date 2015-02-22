# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polyspec/version'

Gem::Specification.new do |spec|
  spec.name          = "polyspec"
  spec.version       = Polyspec::VERSION
  spec.authors       = ["TJ Taylor"]
  spec.email         = ["dugancathal@gmail.com"]
  spec.summary       = %q{Write specs in ruby for ALL the languages}
  spec.description   = <<-DESC
    RSpec's DSL for writing tests for your app is fantastic. This gem
    brings that DSL to all your apps.
  DESC
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "httparty", "~> 0.13"
  spec.add_dependency "rspec", "~> 3.0"
end
