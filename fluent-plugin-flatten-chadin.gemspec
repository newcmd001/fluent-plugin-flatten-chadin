Gem::Specification.new do |gem|
  gem.name          = 'fluent-plugin-flatten-chadin'
  gem.version       = '0.0.1'
  gem.authors       = ['Chadin Anuwattanaporn']
  gem.email         = ['chadin@sogamo.com']
  gem.homepage      = 'http://github.com/newcmd001/fluent-plugin-flatten-chadin'
  gem.description   = %q{Fluentd plugin to extract values for nested key paths and re-emit them as flat tag/record pairs.}
  gem.summary       = %q{Fluentd plugin to extract values for nested key paths and re-emit them as flat tag/record pairs.}
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency     'fluentd'
end
