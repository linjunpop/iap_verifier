# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iap_verifier/version'

Gem::Specification.new do |spec|
  spec.name          = "iap_verifier"
  spec.version       = IAPVerifier::VERSION
  spec.authors       = ["Jun Lin"]
  spec.email         = ["linjunpop@gmail.com"]
  spec.summary       = %q{In-App Purchase receipt verification.}
  spec.description   = %q{In-App Purchase receipt verification.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httpclient'
  spec.add_runtime_dependency 'oj'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
end
