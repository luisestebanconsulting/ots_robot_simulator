#
#   robot_simulator.rb   - Toy Robot Simulator library require file
#
#     Luis Esteban    16 April 2015
#       Created
#

# Requires all libraries
# @author   Luis Esteban M.Sc., M.Teach

PROJECT_DIR = File.expand_path(File.join(File.dirname(__FILE__),'..'))    # Project root directory
BIN_DIR     = File.join(PROJECT_DIR,'bin')                                # ./bin
LIB_DIR     = File.join(PROJECT_DIR,'lib')                                # ./lib
TEST_DIR    = File.join(PROJECT_DIR,'test')                               # ./test
ASSETS_DIR  = File.join(PROJECT_DIR,'test','assets')                      # ./test/assets


Dir[File.join(LIB_DIR,'**','*.rb')].each do |file|
  require file
end
