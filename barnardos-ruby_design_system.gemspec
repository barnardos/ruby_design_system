# frozen_string_literal: true

$:.push File.expand_path('../lib', __FILE__)
require 'barnardos/ruby_design_system/version'

Gem::Specification.new do |spec|
  spec.name          = 'barnardos-ruby_design_system'
  spec.version       = Barnardos::RubyDesignSystem::VERSION
  spec.authors       = ['Rob Nichols', 'Marcin Jedras', "Barnardo's"]
  spec.email         = ['rob.nichols@barnardos.org.uk',
                        'marcin.jedras@barnardos.org.uk']

  spec.summary       = %q(Tools for applying Barnardo's Design System to Ruby projects.)
  spec.description   = %q(Includes helper methods and modification to simple form.)
  spec.homepage      = 'https://design-system.barnardos.org.uk'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     f.match(%r{^(test|spec|features)/})
  #   end
  # end
  spec.files         = Dir['LICENSE.txt', 'README.md', 'lib/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'simple_form', '~> 5.0'

  spec.add_development_dependency 'actionpack', '~> 6.0'
  spec.add_development_dependency 'activemodel', '~> 6.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'faker', '~> 2.9'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'nokogiri', '~> 1.10'
  spec.add_development_dependency 'rails', '~> 6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.0.0'
  spec.add_development_dependency 'yard', '~> 0.9'
end
