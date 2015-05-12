#
#   test_robot_simulator.rb   - Run Tests for Robot Simulator Application
#
#     Luis Esteban    11 May 2015
#       Created
#


require 'minitest/autorun'
require 'mocha/mini_test'

require File.join(File.expand_path(File.dirname(__FILE__)),'..','lib','robot_simulator')

PROGRAMS_DIR = File.join(ASSETS_DIR,'programs')
$generated = false

#Simulator.debug


# @todo       Determine response to syntax errors (currently they are ignored)

describe Simulator do
  
  before do
    system("ruby #{File.join(PROGRAMS_DIR,'gen_test_programs.rb')}")    unless $generated
    $generated = true
  end
  
  describe "Generated command file testing" do
    Dir[File.join(PROGRAMS_DIR,'test_program_*')].sort.each do |filename|
      it "reads test program #{filename.inspect}" do
        lambda{
          puts(%x{ruby \"#{File.join(BIN_DIR,'robot_simulator')}\" \"#{filename}\" 2> /dev/null})
        }.
          must_output(File.read(filename.sub(/test_program_/,'test_report_')))
        
        # @todo         Need to determine exact format for programs with no output
        # @todo         Also, consider adding expected error messages
        
        #out,err = capture_io do
        #  puts `ruby \"#{File.join(BIN_DIR,'robot_simulator')}\" \"#{filename}\"`
        #end
        #out.must_equal File.read(filename.sub(/test_program_/,'test_report_'))
        #err.must_equal ""
      end
    end
  end
  
end
