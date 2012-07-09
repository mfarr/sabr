# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sabr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mike Farr"]
  gem.email         = ["mike@tokenize.ca"]
  gem.description   = %q{Provides a simple interface to the SABnzbd API.}
  gem.summary       = %q{A gem to interface with the SABnzbd API.}
  gem.homepage      = "https://github.com/mfarr/sabr"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sabr"
  gem.require_paths = ["lib"]
  gem.version       = Sabr::VERSION

  # Development dependencies
  gem.add_development_dependency "rspec", "~> 2.10"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "webmock"

  # Dependencies
  gem.add_dependency "httparty", "~> 0.8"
end
