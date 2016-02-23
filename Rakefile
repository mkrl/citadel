# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
Rails.application.load_tasks

# Load test tasks
begin
  require 'rspec/core/rake_task'
  require 'haml_lint/rake_task'
  require 'rubocop/rake_task'

  RSpec::Core::RakeTask.new(:rspec)
  HamlLint::RakeTask.new
  RuboCop::RakeTask.new

  task :rbp do
    require 'rails_best_practices'

    app_root = Rake.application.original_dir
    analyzer = RailsBestPractices::Analyzer.new(app_root)
    analyzer.analyze
    analyzer.output
  end

  task test: %w(rspec rubocop haml_lint rbp)
rescue LoadError
end
