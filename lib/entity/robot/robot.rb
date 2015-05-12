#
#   robot.rb   - Robot Class
#
#     Luis Esteban    12 May 2015
#       Created
#


require 'mathn'


# The Robot class defines a robot for simulation.
#
# @author   Luis Esteban M.Sc., M.Teach

class Robot < Entity
  
  # Available directions in clockwise (turn right) order; treat as a circular list
  DIRECTIONS = [:north, :east, :south, :west]
  
  # Vectors specifying the movement in each direction
  MOVES = {
    north:  Vector[ 0, 1],
    south:  Vector[ 0,-1],
    east:   Vector[ 1, 0],
    west:   Vector[-1, 0]
  }
  
  
  # Initializes a new Robot.
  #
  # @param  options     [Hash]        Options for specifying the robot
  # @return             [Robot]       Robot object
  # @example                          Typical usage
  #   Robot.new 
  
  def initialize(options = {})
    @facing = nil
    
    debug
  end
  
  
  # When a robot is placed, the direction it is facing is set.
  #
  # @param  f           [Symbol]      The direction to face
  # @see    DIRECTIONS
  # @note                             The robot must be placed in an evironment before its direction can be set
  
  def place(f)
    debug
    return unless self.location and DIRECTIONS.include?(f)
    
    @facing = f
    
    debug
  end
  
  
  # Moves the robot forward.
  #
  # @param  distance    [Integer]     The distance to move forward
  
  def move(distance = 1)
    debug
    return unless valid?
    
    destination = self.location + MOVES[@facing] * distance
    
    return unless self.container.exists_at?(destination)
    
    self.container.place(self,destination)
    
    debug
  end
  
  
  # Turns the robot left.
  #
  # @param  turns       [Integer]     The number of directions to turn left
  # @see    #turn
  
  def left(turns = -1)
    turn(turns)
  end
  
  # Turns the robot right.
  #
  # @param  turns       [Integer]     The number of directions to turn right
  # @see    #turn
  
  def right(turns = 1)
    turn(turns)
  end
  
  
  # Reports on the robots location and direction.
  #
  # @return             [NilClass]    Returns nil
  # @note                             The report is sent to stdout.
  #                                   Nothing is sent if the robot is not valid.
  
  def report
    return unless valid?
    
    puts "%d,%d,%s" % [*self.location,@facing.to_s.upcase]
  end

private

  # Turns the robot right.
  #
  # @param  n           [Integer]     The number of directions to turn right
  
  def turn(n = 1)
    debug
    
    return unless valid?
    
    @facing = DIRECTIONS[
      (DIRECTIONS.index(@facing) + n) % DIRECTIONS.size
    ]
    
    debug
  end
  
  
  # Whether the robot is valid.
  #
  # @return             [Boolean]     True if the robot has a location and a valid direction
  
  def valid?
    self.location and DIRECTIONS.include?(@facing)
  end
  
  
  # Shows internal debugging information
  
  def debug
    Simulator.log "ROBOT DEBUG: #{self.location.inspect},#{@facing.inspect}", :debug
  end
  
end
