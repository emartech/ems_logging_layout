require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
Rake::Task['release'].clear

task :default => :spec
