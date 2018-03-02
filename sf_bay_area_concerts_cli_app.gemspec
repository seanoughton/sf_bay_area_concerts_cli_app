
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sf_bay_area_concerts_cli_app/version"

Gem::Specification.new do |spec|
  spec.name          = "sf_bay_area_concerts_cli_app"
  spec.version       = SfBayAreaConcertsCliApp::VERSION
  spec.authors       = ["Sean Oughton"]
  spec.email         = ["seanoughton@gmail.com"]

  spec.summary       = "Upcoming Concerts in the San Francisco Bay Area"
  spec.description   = "Provides a list of the concerts in the San Francisco Bay Area and allows the user to see specific info about the concerts and the artists"
  spec.homepage      = "https://github.com/seanoughton/sf_bay_area_concerts_cli_app"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
