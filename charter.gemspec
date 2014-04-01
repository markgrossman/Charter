# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','charter','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'charter'
  s.version = Charter::VERSION
  s.author = 'Mark Grossman'
  s.email = 'mark@testwith.me'
  s.homepage = 'http://testwith.me'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A CLI for creating a session based testing charter'
  s.files = %w(
    bin/charter
    lib/charter/version.rb
    lib/charter.rb
    lib/charter/doc.rb
    lib/charter/charter_template.md
    )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.rdoc_options << '--title' << 'charter' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'charter'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.9.0')
  s.add_runtime_dependency('redcarpet','>= 3.1.1')
end