require "bundler/gem_tasks"

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test" # here is the test_helper
  t.test_files = FileList['test/*_test.rb']
end

task default: :test
