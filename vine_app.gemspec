# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vine_app/version'

Gem::Specification.new do |gem|
  gem.name          = "vineapp"
  gem.version       = VineApp::VERSION
  gem.authors       = ["Bryan Shelton"]
  gem.email         = ["bryan@sheltonplace.com"]
  gem.description   = %q{Load Twitter Vine App resources from vine.co urls}
  gem.summary       = %q{A library for loading Twitter Vine resources from vine.co/v/ urls}
  gem.homepage      = "https://github.com/bshelton229/vine-ruby"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday", '~> 0.8'
  gem.add_dependency "nokogiri"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"
end
