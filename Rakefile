require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :default => %w[features]
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = '--format pretty'
end
# 