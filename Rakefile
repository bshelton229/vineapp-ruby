require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc 'Pull up a shell'
task :shell do
  exec 'bundle exec irb -r vine_app'
end

task :default => :spec
