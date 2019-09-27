# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scheduled_value/version'

Gem::Specification.new do |spec|
  spec.name          = "scheduled_value"
  spec.version       = ScheduledValue::VERSION
  spec.authors       = ["Nat Budin"]
  spec.email         = ["natbudin@gmail.com"]

  spec.summary       = %q{Ruby classes for values that change over time}
  spec.description   = %q{ScheduledValue allows you to create and store values which change over time based on a schedule.}
  spec.homepage      = "https://github.com/neinteractiveliterature/scheduled_value"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest"
end
