#
#   entity.rb   - Entity Class
#
#     Luis Esteban    12 May 2015
#       Created
#


# The Entity class defines an entity to be used in a simulation.
#
# @author   Luis Esteban M.Sc., M.Teach
#
# @note     Entities can be contained by other entities (see {Container})

class Entity
  
  # Initializes a new Entity.
  #
  # @param  options     [Hash]        Options for specifying the entity
  # @return             [Entity]      Entity object
  # @example                          Typical usage
  #   Entity.new 
  
  def initialize(options = {})
    @container = nil
  end
  
  
  # Returns the container of the entity
  # @return             [Container]   The container of the entity or nil
  
  def container
    @container
  end
  
protected

  # Puts the entity into a new container
  # 
  # @param  new_container [Container] The new container
  # @note                             This should only be called by the container
  
  def container=(new_container)
    @container = new_container
  end
  
public

  # Returns whether the entity is contained
  # @return             [Boolean]     True if contained
  
  def contained?
    !!@container
  end
  
  
  # Returns the location of the entity if the entity is contained in an environment
  # @return             [Vector]      The location of the entity in the environment or nil
  
  def location
    @container                    &&
    @container.is_a?(Environment) &&
    @container.location_of(self)  || nil
  end
  
end
