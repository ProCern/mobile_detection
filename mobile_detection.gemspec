# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'mobile_detection/version'

Gem::Specification.new do |s|
  s.name        = "mobile_detection"
  s.version     = MobileDetection::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Adam Vaughan"]
  s.email       = ["ajv@absolute-performance.com"]
  s.homepage    = "http://github.com/absperf/mobile_detection"
  s.summary     = %q{Utility methods for detecting mobile browsers.}
  s.description = %q{Utility methods for detecting mobile browsers.}

  s.add_dependency 'activesupport'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
