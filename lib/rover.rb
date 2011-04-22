class Rover
  attr_reader :position
  attr_reader :direction
  
  def initialize(location_str, plateau)
    x,y,d = location_str.split(' ')
    @position = Position.new(x, y, plateau)
    @direction = Direction.new(d)
  end

  def final_position_and_direction
    "#{position.x} #{position.y} #{direction.points}"
  end

  def explore(command_sequence)
    command_sequence.split('').each{ |command| execute(command) }
  end
  
  def execute(command)
    case command
      when 'L'  :   @direction.turn_left 
      when 'R'  :   @direction.turn_right
      when 'M'  :   move
    end
  end
  
  def move
    @position.change_in @direction unless movement_impossible?
  end
  
  def movement_impossible?
    (@position.on_north_limit? && @direction.north?)  ||
    (@position.on_south_limit? && @direction.south?)  ||
    (@position.on_east_limit?  && @direction.east?)   ||
    (@position.on_south_limit? && @direction.south?)
  end
  
end
