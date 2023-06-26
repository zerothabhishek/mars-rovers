class Direction
  attr_reader :points

  DIRECTIONS = {
    north: "N",
    east: "E",
    south: "S",
    west: "W"
  }
  
  def initialize(d)
    @points = d
  end
  
  def north?;   points == DIRECTIONS[:north];  end
  def south?;   points == DIRECTIONS[:south];  end
  def east?;    points == DIRECTIONS[:east];  end
  def west?;    points == DIRECTIONS[:west];  end
  
  def turn_left
    case @points
    when DIRECTIONS[:north]
      @points = DIRECTIONS[:west]
    when DIRECTIONS[:east]
      @points = DIRECTIONS[:north]
    when DIRECTIONS[:south]
      @points = DIRECTIONS[:east]
    when DIRECTIONS[:west]
      @points = DIRECTIONS[:south]
    end
  end
  
  def turn_right
    case @points
    when DIRECTIONS[:north]
      @points = DIRECTIONS[:east]
    when DIRECTIONS[:east]
      @points = DIRECTIONS[:south]
    when DIRECTIONS[:south]
      @points = DIRECTIONS[:west]
    when DIRECTIONS[:west]
      @points = DIRECTIONS[:north]
    end
  end
        
end