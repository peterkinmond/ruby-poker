require "./lib/poker"
require "test/unit"

class TestPoker < Test::Unit::TestCase

  def test_sample
    assert_equal(4, 2 + 2)
  end

  def test_class_method
    assert_equal(5, Poker.foo(3,2))
  end

  def test_instance_method
    name = Poker.new
    assert_equal(6, name.bar(3,2))
  end

end
