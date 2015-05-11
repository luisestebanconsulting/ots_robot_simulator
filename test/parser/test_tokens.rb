#
#   test_tokens.rb            - Run Tests for Tokenizer class
#
#     Luis Esteban    11 May 2015
#       Created
#


require 'minitest/autorun'
require 'mocha/mini_test'

require File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib','robot_simulator')

#Simulator.debug


describe Tokenizer do
  
  before do
    @tokenizer = Tokenizer.new
  end
  
  after do
    
  end
  
  describe '#inspect' do
    it "returns debug info of the tokenizer" do
      @tokenizer.inspect.must_match /^#<Tokenizer:0x/
    end
  end
  
  describe 'Parsing simple file' do
    it 'Reads a test file' do
      @tokenizer.scan_setup(File.read(File.join(ASSETS_DIR,'test1')))
      @tokenizer.tokenize.must_equal [
        [:PLACE, "PLACE"  ], [:NUMBER, 3], [",", ","], [:NUMBER, 4], [",", ","], [:EAST, :east], [:EOL, "\n"],
        [:REPORT, "REPORT"], [:EOL, "\n"],
        [:MOVE,   "MOVE"  ], [:EOL, "\n"],
        [:LEFT,   "LEFT"  ], [:EOL, "\n"],
        [:RIGHT,  "RIGHT" ], [:EOL, "\n"]
      ]
    end
  end
  
end

