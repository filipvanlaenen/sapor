# encoding: utf-8

require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end

desc 'Run Mutant'
task :mutant do
  require 'mutant'
  status = Mutant::CLI.run(['::Sapor*', '--rspec'])
  abort 'Mutant task is not successful' if status.nonzero?
end
