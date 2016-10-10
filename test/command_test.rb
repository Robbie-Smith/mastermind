require_relative 'test_helper'
require './lib/command.rb'

class TestCommand < Minitest::Test
  def test_for_instance_of_guesser
    # skip
    command = Command.new
    assert_instance_of Guesser, command.guess
  end

  def test_for_instance_of_timer
    # skip
    command = Command.new
    assert_instance_of Timer, command.timer
  end

  def test_won_returns_true_if_first_guess_is_correct
    # skip
    command = Command.new
    command.guess.stub :code, code="bgry" do
      command.input = 'bgry'
      command.start
      assert command.won?
    end
  end

  def test_play_continues_until_you_win
    # skip
    command = Command.new
    command.guess.stub :code, code="bgry" do
      command.input = 'ygbr'
      command.start
      refute command.won?
    end
    command.guess.stub :code, code="bgry" do
      command.input = 'ygyr'
      command.start
      refute command.won?
    end
    command.guess.stub :code, code="bgry" do
      command.input = 'bgry'
      command.start
      assert command.won?
    end
  end

  def test_play_starts_timer_and_returns_elapsed_time
    # skip
    command = Command.new
    command.guess.stub :code, code="bgry" do
      command.input = 'ygbr'
      command.start
      command.input = 'ygyr'
      command.start
      command.input = 'bgry'
      command.start
      assert command.won?
      refute_equal command.timer.time, command.timer.elapsed_time
      refute_equal nil, command.timer.elapsed_time
      assert_kind_of String, command.timer.elapsed_time
    end
  end


end
