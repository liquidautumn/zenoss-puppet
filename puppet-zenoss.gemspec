# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'puppet-zenoss/version'

Gem::Specification.new do |gem|
  gem.name          = "puppet-zenoss"
  gem.version       = Puppet::Zenoss::VERSION
  gem.authors       = ["Thomas Vincent"]
  gem.email         = ["thomasvincent@steelhouselabs.com"]
  gem.description   = %q{Configure Zenoss via Puppet}
  gem.summary       = %q{Configure Zenoss via Puppet}
  gem.homepage      = "https://www.github.com/steelhouselabs/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
