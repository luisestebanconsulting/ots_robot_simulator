#
#   test_all.rb               - Run All Tests for Robot Simulator Application
#
#     Luis Esteban    11 May 2015
#       Created
#


require 'minitest/autorun'
require 'mocha/mini_test'

require File.join(File.expand_path(File.dirname(__FILE__)),'..','lib','robot_simulator')


Dir[File.join(TEST_DIR,'**','test_*.rb')].each do |filename|
  next if File.expand_path(filename) == File.expand_path(__FILE__)
  File.open(filename) do |file|
    puts file.read.lines[0...3]
  end
  require filename
end
