require_relative 'tests/testpush'
require_relative 'tests/testempty'
require_relative 'tests/testmerge'
require_relative 'tests/testpull'
require_relative 'tests/testassign'
require_relative 'tests/testtop'
require_relative 'tests/testsize'

require 'test/unit/ui/console/testrunner'

classes_to_test = [TestPush, TestEmpty, TestMerge, TestPull, TestAssign, TestTop, TestSize]
total_runs = 0
total_passes = 0
output_level = ARGV[0] == '-v' ? 7 : 0

classes_to_test.each_with_index do |class_name, i|
  task_num = i + 1
  test_suite = Test::Unit::TestSuite.new("Task #{task_num} Test Suite")
  class_name.instance_methods(false).each do |method|
    test_suite << class_name.new(method)
  end
  puts "Running Task #{task_num}..."
  score = Test::Unit::UI::Console::TestRunner.run(test_suite, { output_level: output_level })
  puts "You have #{score.pass_count} out of #{score.run_count} tests passed in Task #{task_num}"
  total_passes += score.pass_count
  total_runs += score.run_count
end

if total_runs == total_passes
  puts 'Tests passed!'
end