require 'init.rb'

class RoverTest < Test::Unit::TestCase
  
  def setup
    @pl = Plateau.new("5","6")
  end
  
  def test_initialize_should_set_correct_position_and_direction
    r = Rover.new("2 3 N", @pl)
    assert_equal [2,3,'N'] , [r.position.x, r.position.y, r.direction.points], "rover postion not set correct"
  end
  
  def test_explore_should_change_direction_to_left_on_L_command
    r = Rover.new("2 3 N", @pl)
    r.explore('L')
    assert_equal 'W', r.direction.points, "rover direction not changing correct on L command"
  end
  
  def test_explore_should_change_direction_to_right_on_R_command
    r = Rover.new("2 2 S", @pl)
    r.explore('R')
    assert_equal 'W', r.direction.points, "rover direction not changing correct on L command"
  end
  
  def test_explore_should_change_position_on_M_command
    r = Rover.new("2 2 S", @pl)
    r.explore('M')
    assert_equal 1, r.position.y, "rover direction not changing correct on L command"
  end
  
  def test_explore_should_not_change_positions_on_M_command_when_movement_is_not_possible
    r = Rover.new("0 2 E", @pl)
    r.explore('M')
    assert_equal [0, 2, 'E'], [r.position.x, r.position.y, r.direction.points], "rover moving when movement is not possible"
  end

    
end