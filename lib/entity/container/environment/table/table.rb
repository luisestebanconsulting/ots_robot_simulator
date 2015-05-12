#
#   table.rb   - Table Class
#
#     Luis Esteban    16 April 2015
#       Created
#


# The Table class defines a table for simulation.
#
# @author   Luis Esteban M.Sc., M.Teach

class Table < Environment
  
  # Default size of dimensions of a table
  DEFAULT_SIZE = 5
  
  
  # Initializes a new Table.
  #
  # @param  options     [Hash]        Options for specifying the table
  # @return             [Table]       Table object
  # @example                          Typical usage
  #   Table.new 
  
  def initialize(options = {})
    super
    
    @x_size, @y_size = determine_size(options[:size])
    
    @x_dimension ||= 0...@x_size
    @y_dimension ||= 0...@y_size
  end
  
  
  # Returns whether the table exists at the location
  #
  # @param    location    [Vector]    The location to check the existence of
  # @return               [Boolean]   True if the location exists
  
  def exists_at?(location)
    x,y = location.to_a
    @x_dimension === x and
    @y_dimension === y
  end
  
  
  # Returns the dimensions of the table
  # 
  # @return               [Array<Range>]    The dimensions of the table
  
  def size
    [@x_dimension.dup,@y_dimension.dup]
  end

private

  # Internal method to decode the size specifications
  #
  # @param    size    [NilClass,String,Integer,Array]   The specifications of the size of the table
  
  def determine_size(size)
    case size
      when NilClass
        x_size = y_size = DEFAULT_SIZE
        
      when String
        case size
          #(w,h)
          #[w,h]
          # w,h
          # w*h
          # wxh
          # w h
          when /^\s*[\[\(]?\s*(-?\d+)\s*[ ,\*x]\s*(-?\d+)\s*[\]\)]?\s*$/
            x_size = $1.to_i
            y_size = $2.to_i
          
          when /^(-?\d+)$/
            x_size = y_size = $1.to_i
          
          when /^(\.+)$/
            x_size = y_size = $1.length
          
          else
            x_size = y_size = DEFAULT_SIZE
        end
        
      when Integer
        x_size = y_size = size
        
      when Array
        x_size, y_size = size
        
      else
        x_size = y_size = DEFAULT_SIZE
    end
    
    x_size = 0    if x_size < 0
    y_size = 0    if y_size < 0
    
    x_size ||= DEFAULT_SIZE
    y_size ||= DEFAULT_SIZE
    
    [x_size, y_size]
  end
  
end
