require_relative 'test_helper'
require './lib/command.rb'
require './lib/responses.rb'
class TestCommand < Minitest::Test
  def test_for_instance_of_guesser
    # skip
    command = Command.new
    assert_instance_of Guesser, command.guess
  end

  def test_for_instance_of_timer
    # skip
    command = Command.new()
    assert_instance_of Timer, command.timer
  end

  def test_won_returns_true_if_first_guess_is_correct
    # skip
    command = Command.new("bgry")
    command.input = 'bgry'
    command.start
    assert command.won?
  end

  def test_play_continues_until_you_win
    # skip
    command = Command.new("bgry")
    command.input = 'ygbr'
    command.start
    command.input = 'ygyr'
    command.start
    refute command.won?
    command.input = 'bgry'
    command.start
    assert command.won?
  end

  def test_play_starts_timer_and_returns_elapsed_time
    # skip
    command = Command.new("bgry")
    command.timer.time = Time.mktime(1969, 12, 31, 17, 41, 03)
    command.input = 'bgry'
    command.timer.elapsed_time_creation(250)
    elapsed_time = command.timer.elapsed_time
    assert_equal"04 minutes and 10 seconds", elapsed_time
    # binding.pry
  end

  def test_winning_enters_end_game_flow
    command = Command.new("bgry")
    command.input = 'bgry'
    command.start
    assert command.won?
    input = command.input
    counter = command.guess.counter
    elapsed_time = command.timer.elapsed_time
    expected = Responses.game_end(input,counter,elapsed_time)
    assert_equal expected, command.game_over
  end


end
