#
#   test_simulator.rb         - Run Tests for Simulator Class
#
#     Luis Esteban    11 May 2015
#       Created
#


require 'minitest/autorun'
require 'mocha/mini_test'

require File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib','robot_simulator')

#Simulator.debug


describe Simulator do
  
  describe 'Halt on input not found' do
    it 'Tries to run on no input' do
      out, err = capture_io do
        @simulator = Simulator.new ['non-existent_file.bad']
      end
      out.must_equal ''
      err.must_equal "No such file or directory - non-existent_file.bad\n"
    end
  end
  
  describe 'Processes normal input' do
    it 'Tries to run on normal input' do
      out, err = capture_io do
        @simulator = Simulator.new [File.join(ASSETS_DIR,'test1')]
      end
      out.must_equal "3,4,EAST\n"
      err.must_equal ''
    end
  end
  
end
