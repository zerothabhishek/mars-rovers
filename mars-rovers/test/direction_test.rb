require 'test_helper'
class DirectionTest < Test::Unit::TestCase
  
  def test_turn_left_changes_N_to_W
    @d = Direction.new('N')
    @d.turn_left
    assert_equal 'W', @d.points, "turn_left should change North direction to West "
  end

  def test_turn_left_changes_E_to_N
    @d = Direction.new('E')
    @d.turn_left
    assert_equal 'N', @d.points, "turn_left should change East direction to North "
  end

  def test_turn_left_changes_S_to_E
    @d = Direction.new('S')    
    @d.turn_left
    assert_equal 'E', @d.points, "turn_left should change South direction to East "
  end

  def test_turn_left_changes_W_to_S
    @d = Direction.new('W')    
    @d.turn_left
    assert_equal 'S', @d.points, "turn_left should change West direction to South"
  end
  
  def test_north?
    @d = Direction.new('N')
    assert @d.north?
  end

  def test_east?
    @d = Direction.new('E')
    assert @d.east?
  end

  def test_south?
    @d = Direction.new('S')
    assert @d.south?
  end

  def test_west?
    @d = Direction.new('W')
    assert @d.west?
  end
  
end