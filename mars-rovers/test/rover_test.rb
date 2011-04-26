require 'test_helper'
class RoverTest < Test::Unit::TestCase
  
  def setup
    @pl = Plateau.new("5 6")
    @r = Rover.new("2 3 S", @pl) 
  end
  
  def test_initialize
    assert_equal  [2,3,'S'], [@r.position.x, @r.position.y, @r.direction.points], 
                  "intialize should set position and direction correct"
  end
  
  def test_position_and_direction
    assert_equal "2 3 S", @r.position_and_direction,
                  "position_and_direction should give a string of position.x position.y direcion.points"
  end
  
  def test_explore 
    @r.stubs(:execute).returns(true)
    @r.expects(:execute).times(3)
    @r.explore("LRM")
  end
    
  def test_execute_left
    @r.direction.expects(:turn_left).once
    @r.send(:execute, "L")
  end  
  
  def test_execute_right
    @r.direction.expects(:turn_right).once
    @r.send(:execute, "R")
  end
  
  def test_execute_move
    Rover.any_instance.stubs(:movement_impossible?).returns(false)
    @r.position.expects(:change_in).with(@r.direction).once
    @r.send(:move)
  end
  
  def test_execute_move_when_movement_is_impossible
    Rover.any_instance.stubs(:movement_impossible?).returns(true)
    @r.position.expects(:change_in).never
    @r.send(:move)
  end
  
  def test_movement_impossible?
    Position.any_instance.stubs(:on_north_limit?).returns(true)
    Direction.any_instance.stubs(:north?).returns(true)
    assert @r.send(:movement_impossible?)
  end
  
  def test_movement_impossible2?
    Position.any_instance.stubs(:on_north_limit?).returns(false)
    Position.any_instance.stubs(:on_east_limit?).returns(false)
    Position.any_instance.stubs(:on_south_limit?).returns(false)
    Position.any_instance.stubs(:on_west_limit?).returns(false)
    Direction.any_instance.stubs(:north?).returns(false)
    Direction.any_instance.stubs(:east?).returns(false)
    Direction.any_instance.stubs(:south?).returns(false)
    Direction.any_instance.stubs(:west?).returns(false)
    assert !@r.send(:movement_impossible?)
  end
end