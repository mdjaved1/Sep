require_relative 'node'

class Kevin
    
    def initialize(node)
       @movies = []
       @actors = []
       @person  = node 
    end
    
    def find_kevin_bacon(start)
       @actors << start.name
       @person.film_actor_hash.each do |title , actor|
           actor.each do |actor|
              if actor.name === start.name 
                  @movies << title 
              end
           end
       end
       if @movies.length >= 6 || start.film_actor_hash == nil 
          return nil  
       end
       start.film_actor_hash.each do |title , actor|
          @movies << title 
          actor.each do |actor|
             if @actors.include? actor.name 
                 return nil
             elsif actor.name === @person.name
               return "#{@movies}"
             else
               find_kevin_bacon(actor)
             end
          end
       end
    end
end