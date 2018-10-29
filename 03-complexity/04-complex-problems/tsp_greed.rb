require_relative 'city'



def distance(current_city, next_city )
    return current_city.long_lat - next_city.long_lat 
end

def nearest_possible_neighbour(cities, current_city)
  nearest_order = [current_city.name]
    until cities[0] == nil
      next_city = cities[0]
      cities.each do |ele|
        if distance(current_city, next_city) > distance(current_city, ele)
          next_city = ele
        end
      end
      current_city = next_city
      cities.delete(next_city)
      nearest_order << current_city.name
    end
  nearest_order.uniq
end

city1 = City.new("to" , 10 )
city2 = City.new("bramp" , 20)
city3 = City.new("miss", 9)
city4 = City.new("mark" ,15 )
cities = [city1 , city2, city3, city4]

p nearest_possible_neighbour(cities , city2)