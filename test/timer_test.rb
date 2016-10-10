require_relative 'test_helper'
require './lib/timer.rb'

class TestTimer < Minitest::Test
  def test_start_time_and_end_time_begins_as_nil
    # skip
    track = Timer.new
    assert_nil track.start_time
    assert_nil track.end_time
  end

  def test_create_time_in_seconds
    # skip
    track = Timer.new
    track.start_game = true
    assert_instance_of Time, track.time

    assert_equal track.time_to_seconds, track.time_convert
    refute_equal track.time, track.time_to_seconds
  end

  def test_start_time_and_end_time_sets_as_fixnum
    # skip
    track = Timer.new
    track.start_game = true
    track.time_convert
    refute_nil track.start_time
    assert_instance_of Fixnum, track.start_time

    track.end_game = true
    track.time_convert
    refute_nil track.end_time
    assert_instance_of Fixnum, track.end_time
  end

  def test_elapsed_time_in_minute_second_format
    # skip
    track = Timer.new
    track.seconds_formatter(0)
    assert_equal "00 minutes and 00 seconds", track.elapsed_time

    track.seconds_formatter(1000)
    assert_equal "16 minutes and 40 seconds", track.elapsed_time

    track.seconds_formatter(10000)
    assert_equal "2 hours and 46 minutes and 40 seconds", track.elapsed_time

    track.seconds_formatter(12345)
    assert_equal "3 hours and 25 minutes and 45 seconds", track.elapsed_time
  end

end
