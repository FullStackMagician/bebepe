# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

if %w[development test].include? Rails.env
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task :brakeman, :output_files do |_t, args|
    require 'brakeman'

    files = args[:output_files].split if args[:output_files]
    result = Brakeman.run app_path: '.', output_files: files, print_report: true, parallel_checks: true
    exit(1) if result.filtered_warnings.any?
  end

  task lint: %i[rubocop brakeman]

  task(:default).clear
  task default: %i[lint spec]
end
