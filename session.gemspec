# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','session','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'session'
  s.version = Session::VERSION
  s.author = 'Mark Grossman'
  s.email = 'mark@testwith.me'
  s.homepage = 'http://testwith.me'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A CLI for creating a session based testing charter'
  s.files = %w(
    bin/session
    lib/session/version.rb
    lib/session.rb
    lib/session/charter.rb
    lib/session/charter_template.md
    )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','session.rdoc']
  s.rdoc_options << '--title' << 'session' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'session'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.9.0')
  s.add_runtime_dependency('redcarpet','>= 3.1.1')
end
