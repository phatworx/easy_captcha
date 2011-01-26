require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'


require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "easy_captcha"
  gem.homepage = "http://github.com/traxanos/easy_captcha"
  gem.license = "MIT"
  gem.summary = "Captcha-Plugin for Rails"
  gem.description = "Captcha-Plugin for Rails"
  gem.email = "develop@marco-scholl.de"
  gem.authors = ["Marco Scholl"]
  gem.add_runtime_dependency 'rails', '>= 3.0.0'
  gem.add_runtime_dependency 'rmagick'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

namespace :cover_me do
  task :report do
    require 'cover_me'
    CoverMe.complete!
  end
end

task :test do
  Rake::Task['cover_me:report'].invoke
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "easy_captcha #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
