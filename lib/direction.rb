class Direction
  attr_reader :points
  
  def initialize(d)
    @points = d
  end
  
  def north?;   points == 'N';  end
  def south?;   points == 'S';  end
  def east?;    points == 'E';  end
  def west?;    points == 'W';  end
  
  def turn_left
    case @points
      when 'N'  :   @points = 'W'
      when 'E'  :   @points = 'N'
      when 'S'  :   @points = 'E'
      when 'W'  :   @points = 'S'
    end
  end
  
  def turn_right
    case @points
      when 'N'  :   @points = 'E'
      when 'E'  :   @points = 'S'
      when 'S'  :   @points = 'W'
      when 'W'  :   @points = 'N'
    end
  end
        
end