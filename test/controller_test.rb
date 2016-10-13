require_relative 'test_helper'
require './lib/controller.rb'

class TestController < Minitest::Test
  def test_for_instance_of_guesser
    controller = Controller.new
    assert_instance_of Guesser, controller.guess
  end

  def test_for_instance_of_timer
    controller = Controller.new
    assert_instance_of Timer, controller.timer
  end

  def test_play_continues_until_you_win
    controller = Controller.new
    controller.guess.code = "bgry"

    controller.input = 'ygbr'
    controller.check_input

    controller.input = 'ygyr'
    controller.check_input

    refute controller.guess.correct_code?

    controller.input = 'bgry'
    controller.check_input
    assert controller.guess.correct_code?
  end

  def test_play_starts_timer_and_returns_elapsed_time
    controller = Controller.new

    controller.timer.time = Time.mktime(1969, 12, 31, 17, 41, 03)

    controller.guess.code = "bgry"

    controller.timer.elapsed_time_creation(250)

    elapsed_time = controller.timer.elapsed_time

    assert_equal"04 minutes and 10 seconds", elapsed_time
  end

  def test_winning_enters_end_game_flow
    controller = Controller.new

    controller.guess.code = "bgry"

    controller.input = "bgry"

    controller.check_input

    output = capture_io do
      controller.game_over
    end

    assert_match"\nCongratulations! You guessed the sequence 'BGRY' in 1 guess over 00 minutes and 00 seconds.\nDo you want to play again or quit? p/q ", output.join
  end


end
