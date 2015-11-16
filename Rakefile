require 'rspec/core/rake_task'
require_relative './lib/to_bar_graph'

RSpec::Core::RakeTask.new(:test) do |t|
    t.pattern = "spec/test/*_spec.rb"
end

task :default => :test