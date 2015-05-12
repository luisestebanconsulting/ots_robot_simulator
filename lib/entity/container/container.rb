#
#   container.rb   - Container Class
#
#     Luis Esteban    16 April 2015
#       Created
#


# The Container class defines a type of entity that can contain other entities.
#
# @author   Luis Esteban M.Sc., M.Teach

class Container < Entity
  
  # Initializes a new Container.
  #
  # @param  options     [Hash]        Options for specifying the container
  # @return             [Container]   Container object
  # @example                          Typical usage
  #   Container.new 
  
  def initialize(options = {})
    @contents = []
  end
  
  
  # Returns the entities contained in the container
  #
  # @return       [Array<Entity>]     An array of the entities
  
  def contents
    @contents
  end
  
  
  # Returns whether an entity is contained by the container
  #
  # @param    entity    [Entity]      The entity
  # @return             [Boolean]     True if the entity is contained by the container
  
  def contains?(entity)
    self.contents.include?(entity)
  end
  
  
  # Adds an entity to the container
  #
  # @param    entity    [Entity]      The entity to add to the container
  # @note                             Entities can only exist in the container once (i.e. no duplicates)
  
  def add(entity)
    entity.container = self
    self.contents << entity
    self.contents.uniq!
  end
  
  
  # Removes an entity from the container
  #
  # @param    entity    [Entity]      The entity to remove from the container
  
  def remove(entity)
    entity.container = nil
    @contents.delete(entity)
  end
  
  
  # Returns the number of entities contained by the container
  #
  # @return             [Integer]     The number of entities contained by the container
  
  def size
    self.contents.size
  end
  
end
