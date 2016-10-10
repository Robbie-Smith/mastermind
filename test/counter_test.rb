require_relative 'test_helper.rb'
require './lib/counter.rb'

class TestCounter < Minitest::Test
  def test_counter_contains_a_counter
    count = Counter.new
    assert_equal 0, count.guess_counter
  end
end
