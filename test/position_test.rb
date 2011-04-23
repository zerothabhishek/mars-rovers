require 'test_helper'
class PositionTest < Test::Unit::TestCase
  
  def setup
    @position = Position.new("2", "3", Plateau.new("5 6"))
  end

  def test_initialize
    assert_equal  [2,3], [@position.x, @position.y],
            "intialize should set the x,y co-ordinates correct"
  end
  
  def test_change_in_north
    Direction.any_instance.stubs(:north? => true, :east? => false, :south? => false, :west? => false)
    @position.change_in(Direction.new('N'))
    assert_equal 4, @position.y,
           "change_in should increament y co-ordinate by 1 if direction is north"
  end

  def test_change_in_east
    Direction.any_instance.stubs(:north? => false, :east? => true, :south? => false, :west? => false)
    @position.change_in(Direction.new('E'))
    assert_equal 3, @position.x,
           "change_in should increament x co-ordinate by 1 if direction is east"
  end

  def test_change_in_south
    Direction.any_instance.stubs(:north? => false, :east? => false, :south? => true, :west? => false)
    @position.change_in(Direction.new('S'))
    assert_equal 2, @position.y,
           "change_in should decreament y co-ordinate by 1 if direction is south"
  end

  def test_change_in_west
    Direction.any_instance.stubs(:north? => false, :east? => false, :south? => false, :west? => true)
    @position.change_in(Direction.new('W'))
    assert_equal 1, @position.x,
           "change_in should decreament x co-ordinate by 1 if direction is west"
  end
  
  def test_on_north_limit
    Plateau.any_instance.stubs(:north_limit).returns(3)
    assert  @position.on_north_limit?
            "on_north_limit? is true when position.y equals plateau north limit"
  end

  def test_on_east_limit
    Plateau.any_instance.stubs(:east_limit).returns(2)
    assert  @position.on_east_limit?
            "on_east_limit? is true when position.x equals plateau east limit"
  end

  def test_on_south_limit
    Plateau.any_instance.stubs(:south_limit).returns(3)
    assert  @position.on_south_limit?
            "on_south_limit? is true when position.y equals plateau south limit"
  end

  def test_on_west_limit
    Plateau.any_instance.stubs(:west_limit).returns(2)
    assert  @position.on_west_limit?
            "on_north_limit? is true when position.x equals plateau west limit"
  end
  
end