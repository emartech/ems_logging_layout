# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'smart_insight_logging_layout'
  spec.version       = File.read(File.join(File.dirname(__FILE__), 'VERSION')).strip
  spec.authors       = ['Adam Luzsi']
  spec.email         = ['adamluzsi@gmail.com']

  spec.summary       = 'SmartInsight Logging Layout'
  spec.description   = 'SmartInsight Logging Layout'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'logging'
  spec.add_dependency 'multi_json'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://gem.fury.io'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end
end
