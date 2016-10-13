require_relative 'test_helper'
require './lib/guesser.rb'

class TestGuesser < Minitest::Test
  def test_returns_number_of_elements_correct_if_guess_is_wrong
    guess = Guesser.new
    guess.code = "byrg"
    guess.user_input = "brry"
    guess.start

    assert_equal 3, guess.element_holder[:element]

    refute guess.correct_code?
  end

  def test_returns_number_of_elements_correct_if_guess_is_wrong_2
    guess = Guesser.new
    guess.code = "byrg"
    guess.user_input = "brrg"
    guess.start

    assert_equal 3, guess.element_holder[:element]
  end

  def test_returns_number_of_elements_in_correct_position
    guess = Guesser.new
    guess.code = "byrg"
    guess.user_input = "brry"
    guess.start

    assert_equal 2, guess.element_holder[:position]
  end

  def test_returns_number_of_elements_in_correct_position_2
    guess = Guesser.new
    guess.code = "byrg"
    guess.user_input = "brrg"
    guess.start

    assert_equal 3, guess.element_holder[:position]
  end

  def test_counter_returns_number_of_guesses
    guess = Guesser.new
    guess.code = "byrg"
    guess.user_input = "brrg"
    guess.start

    assert_equal 1, guess.counter
  end

  def test_counter_returns_greater_than_one_guess
    guess = Guesser.new
    guess.code = "byrg"

    guess.user_input = "gggg"
    guess.start

    guess.user_input = "rrrr"
    guess.start

    guess.user_input = "bbbb"
    guess.start

    assert_equal 3, guess.counter
  end

  def test_correct_code_returns_true_if_there_is_a_match
    guess = Guesser.new
    guess.code = "byrg"
    guess.user_input = "byrg"
    guess.start
    assert guess.correct_code?
  end

  def test_correct_code_returns_false_if_there_is_not_a_match
    guess = Guesser.new
    guess.code = "byrg"
    guess.user_input = "gggg"
    guess.start
    refute guess.correct_code?
  end


end
