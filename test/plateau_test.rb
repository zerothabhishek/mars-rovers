require 'test_helper'
class PlateauTest < Test::Unit::TestCase

  def test_initialize_should_set_plateau_limits_correct
    @pt = Plateau.new("5 6")
    assert_equal 6, @pt.north_limit
    assert_equal 5, @pt.east_limit
    assert_equal 0, @pt.south_limit
    assert_equal 0, @pt.west_limit
  end
    
end