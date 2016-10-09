require_relative 'test_helper'
require './lib/command.rb'

class TestCommand < Minitest::Test
  def setup
    @c = Command.new
    @c.guess.code = 'bgyr'
  end

  def test_for_instance_of_guesser
    assert_instance_of Guesser, @c.guess
  end

  def test_for_instance_of_timer
    assert_instance_of Timer, @c.timer
  end

  def test_won_works_if_first_guess_is_correct
    @c.input = 'bgyr'
    @c.start
    assert @c.won?
  end

  def test_play_continues_until_you_win
    @c.input = 'ygbr'
    @c.start
    refute @c.guess.correct_code?
    assert_equal 2, @c.guess.correct_position
    @c.input = 'ygyr'
    @c.start
    refute @c.guess.correct_code?
    assert_equal 3, @c.guess.correct_position
    @c.input = 'bgyr'
    @c.start
    assert @c.guess.correct_code?
  end

  def test_play_starts_timer_and_returns_elapsed_time
    @c.input = 'ygbr'
    @c.start
    @c.input = 'ygyr'
    @c.start
    @c.input = 'bgyr'
    @c.start

    assert @c.won?

    refute_equal @c.timer.time, @c.timer.elapsed_time
    refute_equal nil, @c.timer.elapsed_time
    assert_kind_of String, @c.timer.elapsed_time
  end


end
