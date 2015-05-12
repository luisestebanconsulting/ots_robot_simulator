#
#   environment.rb   - Environment Class
#
#     Luis Esteban    16 April 2015
#       Created
#


# The Environment class defines a type of container that records the location
# of each contained entity.
# @note     An environment is unbounded (see {#exists_at?}).  Environment can be subclassed to define a boundary (see example {Table}).
#
# @author   Luis Esteban M.Sc., M.Teach

class Environment < Container
  
  # Initializes a new Environment.
  #
  # @param  options     [Hash]        Options for specifying the environment
  # @return             [Environment] Environment object
  # @example                          Typical usage
  #   Environment.new 
  
  def initialize(options = {})
    super
    @contents = {}
  end
  
  
  # Returns the entities contained in the environment
  #
  # @return       [Array<Entity>]     An array of the entities
  # @note                             The locations are not included
  
  def contents
    @contents.keys
  end
  
  
  # Adds an entity to the environment
  #
  # @param    entity    [Entity]      The entity to add to the environment
  # @param    location  [Vector]      The location of the entity
  # @note                             This method overrides the Container method for compatibility
  # @see      #place
  
  def add(entity,location = nil)
    entity.container = self
    @contents[entity] = location
  end
  
  
  # Places an entity to the environment
  #
  # @param    entity    [Entity]      The entity to add to the environment
  # @param    location  [Vector]      The location of the entity
  # @note                             This method is identical to {#add} except that a location must be provided
  # @see      #add
  
  def place(entity, location)
    add(entity, location)
  end
  
  
  # Returns the location of the entity
  #
  # @return           [Vector]        The location of the entity
  
  def location_of(entity)
    @contents[entity]
  end
  
  
  # Returns whether the environment exists at the location
  #
  # @return           [Boolean]       True if the location exists in the environment
  # @note                             Because an environment is unbounded, locations always exist.
  #                                   Environment must be subclassed to implement bounded locations.
  
  def exists_at?(location)
    true
  end
  
end
