# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "easy_captcha/version"

Gem::Specification.new do |s|
  s.name = %q{easy_captcha}
  s.version = EasyCaptcha::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Marco Scholl}, %q{Alexander Dreher}]
  s.date = %q{2011-09-15}
  s.description = %q{Captcha-Plugin for Rails}
  s.email = %q{team@phatworx.de}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = `git ls-files`.split("\n")

  s.homepage = %q{http://github.com/phatworx/easy_captcha}
  s.licenses = [%q{MIT}]
  s.rubygems_version = %q{1.8.15}
  s.summary = %q{Captcha-Plugin for Rails}

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency('rails', [">= 4.1.0"])
  
  s.add_development_dependency('bundler', [">= 1.1.0"])
  s.add_development_dependency('simplecov', [">= 0.3.8"])
  s.add_development_dependency('rspec-rails', [">= 2.8.1"])
  s.add_development_dependency('yard', [">= 0.7.0"])

  if defined?(PLATFORM) && PLATFORM == 'java'
    s.add_runtime_dependency('rmagick4j','>= 0.3.7')
  else
    s.add_runtime_dependency('rmagick','>= 2.13.1')
  end
end

