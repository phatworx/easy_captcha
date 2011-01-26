require 'rubygems'  
require 'rake'  
  
begin  
  require 'jeweler'  
  Jeweler::Tasks.new do |gemspec|  
    gemspec.name = "easy_captcha"  
    gemspec.summary = "Captcha-Plugin for Rails"  
    gemspec.description = "Captcha-Plugin for Rails"  
    gemspec.email = "develop@marco-scholl.de"  
    gemspec.homepage = "http://github.com/traxanos/easy_captcha"  
    gemspec.authors = ["Marco Scholl"]
    gemspec.add_development_dependency "rspec", ">= 1.2.9"
    gemspec.add_runtime_dependency "rails", ">= 3.0.0"
    gemspec.add_runtime_dependency "rmagick"
  end  
  Jeweler::GemcutterTasks.new
rescue LoadError  
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"  
end

#require 'spec/rake/spectask'
#Spec::Rake::SpecTask.new(:spec) do |spec|
#  spec.libs << 'lib' << 'spec'
#  spec.spec_files = FileList['spec/**/*_spec.rb']
#end
#
#Spec::Rake::SpecTask.new(:rcov) do |spec|
#  spec.libs << 'lib' << 'spec'
#  spec.pattern = 'spec/**/*_spec.rb'
#  spec.rcov = true
#end
#
#task :spec => :check_dependencies
#
#begin
#  require 'reek/adapters/rake_task'
#  Reek::RakeTask.new do |t|
#    t.fail_on_error = true
#    t.verbose = false
#    t.source_files = 'lib/**/*.rb'
#  end
#rescue LoadError
#  task :reek do
#    abort "Reek is not available. In order to run reek, you must: sudo gem install reek"
#  end
#end
#
#task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "easy_captcha #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
