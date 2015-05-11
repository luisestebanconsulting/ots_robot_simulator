#
#   test_grammar.rb           - Run Tests for Grammar class
#
#     Luis Esteban    11 May 2015
#       Created
#


require 'minitest/autorun'
require 'mocha/mini_test'

require File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib','robot_simulator')

#Simulator.debug

class DummyTokenizer
  
  def initialize(tokens)
    @tokens = tokens
  end
  
  def next_token
    @tokens.shift
  end
  
end


describe Tokenizer do
  
  before do
    @mock_target    = mock()
    @grammar        = Grammar.new 
    @grammar.target = @mock_target
  end
  
  after do
    
  end
  
  describe '#inspect' do
    it "returns debug info of the grammar" do
      @grammar.inspect.must_match /^#<Grammar:0x/
    end
  end
  
  describe 'Parsing simple token array' do
    it 'Reads a test token array' do
      tokenizer = DummyTokenizer.new [
        [:PLACE,  "PLACE" ], [:NUMBER, 3], [",", ","], [:NUMBER, 4], [",", ","], [:EAST, :east], [:EOL, "\n"],
        [:REPORT, "REPORT"], [:EOL, "\n"],
        [:MOVE,   "MOVE"  ], [:EOL, "\n"],
        [:LEFT,   "LEFT"  ], [:EOL, "\n"],
        [:RIGHT,  "RIGHT" ], [:EOL, "\n"]
      ]
      
      @mock_target.expects(:place_command).with([3,4],:east)
      @mock_target.expects(:report_command)
      @mock_target.expects(:move_command)
      @mock_target.expects(:left_command)
      @mock_target.expects(:right_command)
      
      @grammar.parse(tokenizer)
    end
  end
  
end

