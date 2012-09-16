# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rebat/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Omar Mekky", "Khaled Gomaa"]
  gem.email         = ["omar.mekky@mashsolvents.com", "khaled.hassan@mashsolvents.com"]
  gem.description   = %q{Rebat DB driver for ruby }
  gem.summary       = %q{Rebat DB driver for ruby }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rebat"
  gem.require_paths = ["lib"]
  gem.version       = Rebat::VERSION

  gem.add_dependency 'thrift', '>= 0.8.0'
end
