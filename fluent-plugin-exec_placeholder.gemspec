# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-exec_placeholder"
  gem.version       = "0.0.1"
  gem.summary       = %q{ExecPlaceholder plugin for fluentd}
  gem.description   = %q{ExecPlaceholder plugin for fluentd}
  gem.license       = "MIT"
  gem.authors       = ["toyama0919"]
  gem.email         = "toyama0919@gmail.com"
  gem.homepage      = "https://github.com/toyama0919/fluent-plugin-exec_placeholder"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'fluentd'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry', '~> 0.10.1'
  gem.add_development_dependency 'rake', '~> 10.3.2'
  gem.add_development_dependency 'rubocop', '~> 0.24.1'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
