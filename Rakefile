# require 'rake'
# require 'rake/testtask'
# require 'rake/rdoctask'
# 
# desc 'Default: run unit tests.'
# task :default => :test
# 
# desc 'Test the easycaptcha plugin.'
# Rake::TestTask.new(:test) do |t|
#   t.libs << 'lib'
#   t.libs << 'test'
#   t.pattern = 'test/**/*_test.rb'
#   t.verbose = true
# end
# 
# desc 'Generate documentation for the easycaptcha plugin.'
# Rake::RDocTask.new(:rdoc) do |rdoc|
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title    = 'Easycaptcha'
#   rdoc.options << '--line-numbers' << '--inline-source'
#   rdoc.rdoc_files.include('README')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end
require 'rubygems'  
require 'rake'  
  
begin  
  require 'jeweler'  
  Jeweler::Tasks.new do |gemspec|  
    gemspec.name = "easycaptcha"  
    gemspec.summary = "Captcha for Rails"  
    gemspec.description = "A Captcha Implementation for Rails by RMagick"  
    gemspec.email = "develop@marco-scholl.de"  
    gemspec.homepage = "http://github.com/traxanos/easycaptcha"  
    gemspec.authors = ["Marco Scholl"]  
  end  
  Jeweler::GemcutterTasks.new
rescue LoadError  
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"  
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }