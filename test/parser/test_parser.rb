#
#   test_parser.rb            - Run Tests for Parser Class
#
#     Luis Esteban    11 May 2015
#       Created
#


require 'minitest/autorun'
require 'mocha/mini_test'

require File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib','robot_simulator')

#Simulator.debug


describe Parser do
  
  before do
    @mock_target = mock()
    @parser = Parser.new \
      target:   @mock_target
  end
  
  after do
    
  end
  
  describe '#inspect' do
    it "returns debug info of the parser" do
      @parser.inspect.must_match /^#<Parser:0x/
    end
  end
  
  describe 'Parsing simple file' do
    it 'Reads a test file' do
      @parser.input = File.join(ASSETS_DIR,'test1')
      
      @mock_target.expects(:place_command).with(Vector[3,4],:east)
      @mock_target.expects(:report_command)
      @mock_target.expects(:move_command)
      @mock_target.expects(:left_command)
      @mock_target.expects(:right_command)
      
      @parser.start
    end
  end
  
end


