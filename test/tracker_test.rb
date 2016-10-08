require_relative 'test_helper'
require './lib/tracker.rb'

class TestTracker < Minitest::Test
  def setup
    @track = Tracker.new
  end

  def test_create_start_time_in_seconds
    @track.time_in_seconds
    assert_equal @track.time_in_seconds, @track.start_time
  end

  def test_create_end_time_in_seconds
    @track.time_in_seconds
    assert_equal @track.time_in_seconds, @track.end_time
  end

  def test_elapsed_time_in_minute_second_format
    assert_equal "00:00", @track.elapsed_time(0)
    assert_equal "16:40", @track.elapsed_time(1000)
    assert_equal "2:46:40", @track.elapsed_time(10000)
    assert_equal "3:25:45", @track.elapsed_time(12345)
  end

end
