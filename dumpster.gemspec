# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dumpster/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yves Senn"]
  gem.email         = ["yves.senn@garaio.com"]
  gem.description   = %q{Abstraktions-Layer für Exporte im Tabellenformat}
  gem.summary       = %q{Dumpster kann aufbereitete Daten in verschiedenen Formaten ausgeben}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dumpster"
  gem.require_paths = ["lib"]
  gem.version       = Dumpster::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"

  gem.add_development_dependency "axlsx"
end
