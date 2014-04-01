# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','charter','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'charter'
  s.version = Charter::VERSION
  s.author = 'Mark Grossman'
  s.email = 'mark@testwith.me'
  s.homepage = 'http://testwith.me'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A command line tool for creating a session based testing charter'
  s.description = 'A tool for creating exploratory test session charters'
  s.license = 'MIT'
  s.files = %w(
    bin/charter
    lib/charter/version.rb
    lib/charter.rb
    lib/charter/doc.rb
    lib/charter/charter_template.md
    )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options << '--title' << 'charter' << '--main' << 'README.md' << '--markup' << 'markdown'
  s.bindir = 'bin'
  s.executables << 'charter'
  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rdoc', '~> 0'
  s.add_development_dependency 'aruba', '~> 0'
  s.add_runtime_dependency('gli','2.9.0')
  s.add_runtime_dependency 'redcarpet', '~> 3.1', '>= 3.1.1'
end