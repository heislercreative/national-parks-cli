
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "national_parks/version"

Gem::Specification.new do |spec|
  spec.name          = "national_parks"
  spec.version       = NationalParks::VERSION
  spec.authors       = ["Brennan Heisler"]
  spec.email         = ["brennan@heislercreative.com"]

  spec.summary       = %q{National parks}
  spec.description   = %q{National parks by state, with location & description}
  spec.homepage      = "http://heislercreative.com"
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
