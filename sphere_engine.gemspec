# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sphere_engine/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'addressable', '~> 2.3'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'http', '~> 2.0'

  spec.name          = "sphere_engine"
  spec.version       = SphereEngine::VERSION
  spec.authors       = ["Martin Villalba"]
  spec.email         = ["14tinchov@gmail.com"]

  spec.summary       = %q{A Ruby interface to the SphereEngine API.}
  spec.description   = %q{This gem was made as an interface to the SphereEngine API. I try to abstract in the best way all his methods that SphereEngine give us}
  spec.homepage      = "https://github.com/14tinchov/sphere-engine.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
