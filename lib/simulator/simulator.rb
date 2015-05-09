#
#   simulator.rb   - Simulator Class
#
#     Luis Esteban    16 April 2015
#       Created
#


# The Simulator class defines the simulation.
# @author   Luis Esteban M.Sc., M.Teach
class Simulator
  
  # Initializes a new Simulator.
  #
  # @param  argv    [Array<String>] Array of command line arguments (usually ARGV)
  # @return         [Simulator]     Simulation manager object
  # @example                        Typical usage
  #   Simulator.new ARGV
  # @note                           This class has been designed expecting that there
  #                                 is only object instance, but it is possible to have
  #                                 more.
  def initialize(argv = [])
    determine_usage(argv)
    setup
    start
    shutdown
  end

  # Determines the usage specified by argv.
  #
  # @param  argv    [Array<String>] Array of command line arguments (usually ARGV)
  def determine_usage(argv)
    
  end
  
  # Sets up the objects for simulation.
  def setup()
    
  end
  
  # Shuts down the objects used in the simulation.
  #
  # @note           The simulation cannot be restarted after it is shutdown.
  #                 It must be set up again.
  def shutdown
    
  end
  
  # Starts the simulation.
  def start
    
  end
  
  # Stops the simulation.
  def stop
    
  end
  
end
