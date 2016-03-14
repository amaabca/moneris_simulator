# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moneris_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = "moneris_simulator"
  spec.version       = MonerisSimulator::VERSION
  spec.authors       = ["Michael van den Beuken", "Ruben Estevez", "Jordan Babe", "Mathieu Gilbert", "Ryan Jones", "Darko Dosenovic", "Jonathan Weyermann", "Adam Melnyk", "Kayt Campbell", "Kathleen Robertson", "Jesse Doyle"]
  spec.email         = ["michael.beuken@gmail.com", "ruben.a.estevez@gmail.com", "jorbabe@gmail.com", "mathieu.gilbert@ama.ab.ca", "ryan.michael.jones@gmail.com", "darko.dosenovic@ama.ab.ca", "jonathan.weyermann@ama.ab.ca", "adam.melnyk@ama.ab.ca", "kayt.campbell@ama.ab.ca", "kathleen.robertson@ama.ab.ca", "jesse.doyle@ama.ab.ca"]

  spec.summary       = %q{Simulator for Moneris Hosted Tokenization}
  spec.description   = %q{Simulator for Moneris Hosted Tokenization}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "coffee-rails"
  spec.add_dependency "jquery-rails"
  spec.add_dependency "rails", "~> 4.2"
  spec.add_dependency "sass-rails"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "capybara-webkit"
  spec.add_development_dependency "combustion"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "factory_girl_rails"
  spec.add_development_dependency "launchy"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "webmock"
end
