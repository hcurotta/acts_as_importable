# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_importable/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_importable"
  spec.version       = ActsAsImportable::VERSION
  spec.authors       = ["Harry Curotta"]
  spec.email         = ["hcurotta@gmail.com"]
  spec.summary       = %q{Import CSV fields to ActiveRecord model}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'smarter_csv'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'activesupport'
  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'activemodel'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'debugger'
  spec.add_development_dependency 'database_cleaner'
end
