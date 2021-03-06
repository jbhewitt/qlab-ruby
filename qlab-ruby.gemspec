# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qlab-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = "qlab-ruby"
  gem.version       = QLab::VERSION
  gem.authors       = ["Adam Bachman"]
  gem.email         = ["adam@figure53.com"]
  gem.description   = %q{Interact with QLab in Ruby.}
  gem.summary       = %q{Interact with QLab in Ruby.}
  gem.homepage      = "https://github.com/Figure53/qlab-ruby"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'osc-ruby'

  gem.add_development_dependency 'rdoc'
end
