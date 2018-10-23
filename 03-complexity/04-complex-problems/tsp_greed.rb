require_relative 'city'


def nearest_possible_neighbor(current_city)
    
    neighbor_cities = current_city.neighbours
    nearest_neighbour  = neighbor_cities.first
    
    for current_neighbour in neighbor_cities
      if current_neighbour.distance < nearest_neighbour.distance && current_neighbour.visted == false 
         nearest_neighbour = current_neighbour
      end
    end
    
    nearest_neighbour
end

