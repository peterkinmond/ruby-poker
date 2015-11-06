require "./lib/poker/player.rb"
require "test/unit"

class TestPlayer < Test::Unit::TestCase
  def test_initial_state
    player1 = Player.new("Peter")
    assert_equal("Peter", player1.name)
    assert_equal([], player1.cards)
    assert_equal(100, player1.money)
    assert_equal("Hopeful", player1.mood)
  end

end
