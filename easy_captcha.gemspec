# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "easy_captcha/version"

Gem::Specification.new do |s|
  s.name = %q{easy_captcha}
  s.version = EasyCaptcha::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Marco Scholl}]
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
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Captcha-Plugin for Rails}

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0.3.8"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<yard>, [">= 0.7.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<simplecov>, [">= 0.3.8"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<yard>, [">= 0.7.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<simplecov>, [">= 0.3.8"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<yard>, [">= 0.7.0"])
  end
end

