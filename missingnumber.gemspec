# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'missingnumber'

Gem::Specification.new do |gem|
  gem.name          = "missingnumber"
  gem.version       = MissingNumber::VERSION
  gem.authors       = ["umeyuki"]
  gem.email         = ["umeyukik1326@gmail.com"]
  gem.description   = %q{A subject for xxx}
  gem.summary       = %q{A subject for xxx}
  gem.homepage      = "https://github.com/umeyuki/ruby-missing-number"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end