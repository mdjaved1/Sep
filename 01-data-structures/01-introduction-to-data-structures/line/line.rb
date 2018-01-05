# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
    
  end

  def join(person)
    members << person
  end

  def leave(person)
    members.delete(person)
  end

  def front
    members.first
  end

  def middle
    median = 0
    if members.size / 2 == 1
      median = members.size / 2
    else
      median = (members.size / 2).round
    end
    answer = members.values_at(median)
     answer.join
    
  end

  def back
    members.last
  end

  def search(person)
    return person if members.include?(person)
  end

  private

  def index(person)
  end

end