require_relative 'test_helper'
require './lib/timer.rb'

class TestTimer < Minitest::Test
  def test_start_time_and_end_time_begins_as_nil
    track = Timer.new
    refute track.start_game
    refute track.end_game
  end

  def test_convert_time
    track = Timer.new
    track.start_game = true
    track.time = Time.mktime(1969, 12, 31, 17, 41, 03)
    assert_instance_of Time, track.time

    assert_equal 2463, track.time_convert
  end

  def test_elapsed_time_in_minute_second_format
    track = Timer.new

    assert_equal "00 minutes and 00 seconds", track.elapsed_time_creation(0)

    assert_equal "16 minutes and 40 seconds", track.elapsed_time_creation(1000)

    assert_equal "2 hours and 46 minutes and 40 seconds", track.elapsed_time_creation(10000)

    assert_equal "3 hours and 25 minutes and 45 seconds", track.elapsed_time_creation(12345)
  end

end
