# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wordfor/version'

Gem::Specification.new do |gem|
  gem.name          = "wordfor"
  gem.version       = Wordfor::VERSION
  gem.authors       = ["Adam Bachman"]
  gem.email         = ["adam.bachman@gmail.com"]
  gem.description   = %q{Find synonyms and antonyms from the command line.}
  gem.summary       = %q{A thesaurus for your command line.}
  gem.homepage      = "http://github.com/abachman/wordfor"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('httparty', '~> 0.9.0')
  gem.add_dependency('json', '~> 1.7.5')
end
