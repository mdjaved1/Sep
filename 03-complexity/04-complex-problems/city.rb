class City 
    attr_accessor :name
    attr_accessor :neighbours
    attr_accessor :visited
    attr_accessor :distance
    
    def initialize(name , distance)
       @name = name
       @distance = distance
       @visited = false
       @neighbours = Array.new()
    end
end


