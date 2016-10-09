require_relative 'test_helper'
require './lib/timer.rb'

class TestTimer < Minitest::Test
  def setup
    @track = Timer.new
  end

  def test_create_time_in_seconds
    refute @track.start_game
    @track.start_game = true
    assert @track.start_game
    assert_equal @track.time_to_seconds, @track.time_convert
  end

  def test_elapsed_time_in_minute_second_format
    @track.seconds_formatter(0)
    assert_equal "00 minutes and 00 seconds", @track.elapsed_time

    @track.seconds_formatter(1000)
    assert_equal "16 minutes and 40 seconds", @track.elapsed_time

    @track.seconds_formatter(10000)
    assert_equal "2 hours and 46 minutes and 40 seconds", @track.elapsed_time

    @track.seconds_formatter(12345)
    assert_equal "3 hours and 25 minutes and 45 seconds", @track.elapsed_time
  end

end
