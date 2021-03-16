# frozen_string_literal: true

require File.expand_path('lib/calculate_subscription/version', __dir__)

Gem::Specification.new do |spec|
  spec.name = 'calculate_subscription'
  spec.version = CalculateSubscription::VERSION
  spec.authors = ['Attiq Rao']
  spec.email = ['attiq.rao63@gmail.com']
  spec.summary = 'Calculating subscription days for users to buy a subscription'
  spec.description = 'This gem calculate the subscription days for given amount
                      and currency for the user to buy a subscription'
  spec.homepage = 'https://github.com/attiq/calculate_subscription.git'
  spec.license = 'MIT'
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.7.1'
  spec.files = Dir['README.md', 'LICENSE',
                   'CHANGELOG.md', 'lib/**/*.rb',
                   'lib/**/*.rake',
                   'calculate_subscription.gemspec', '.github/*.md',
                   'Gemfile', 'Rakefile']
  spec.extra_rdoc_files = ['README.md']

  spec.add_development_dependency 'json'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
end
