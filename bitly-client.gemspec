# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitly/client/version'

Gem::Specification.new do |spec|
  spec.name          = "bitly-client"
  spec.version       = Bitly::Client::VERSION
  spec.authors       = ["Aron Filbert"]
  spec.email         = ["afilbert@lyconic.com"]

  spec.summary       = %q{Extremely simple one-way URL shortener client for bit.ly.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/lyconic/bitly-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "=0.9.9"
  spec.add_dependency "httparty", "0.10.2"
end
