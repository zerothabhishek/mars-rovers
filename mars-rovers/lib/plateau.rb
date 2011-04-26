class Plateau
  attr_reader :east_limit, :west_limit, :north_limit, :south_limit

  def initialize(limit_str)
    x_limit, y_limit = limit_str.split(' ')
    @east_limit = x_limit.to_i
    @north_limit = y_limit.to_i
    @west_limit = 0
    @south_limit = 0
  end
  
    
end
