require_relative 'test_helper'
require './lib/timer.rb'

class TestTimer < Minitest::Test
  def setup
    @track = Timer.new
  end

  def test_create_time_in_seconds
    @track.start_time = Time.new
    @track.time_to_seconds
    assert_equal @track.time_to_seconds, @track.start_time_convert
  end

  def test_elapsed_time_in_minute_second_format
    @track.seconds_formatter(0)
    assert_equal "00:00", @track.elapsed_time

    @track.seconds_formatter(1000)
    assert_equal "16:40", @track.elapsed_time

    @track.seconds_formatter(10000)
    assert_equal "2:46:40", @track.elapsed_time

    @track.seconds_formatter(12345)
    assert_equal "3:25:45", @track.elapsed_time
  end

end
