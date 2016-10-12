require_relative 'test_helper'
require './lib/guesser.rb'

class TestGuesser < Minitest::Test
  def test_generates_code_from_code_generator_module
    # skip
    guess = Guesser.new("GGGG")
    assert_kind_of String, guess.code
    assert_equal 4, guess.code.length
  end

  def test_compares_user_input_with_code
    # skip
    guess = Guesser.new("bgry")
    guess.user_input = "bgry"
    guess.start
    assert guess.correct_code?
    guess.user_input = "rrrr"
    guess.start
    assert guess.correct_code?
  end

  def test_returns_number_of_elements_correct_if_guess_is_wrong
    # skip
    guess = Guesser.new("byrg")
    guess.user_input = "brry"
    guess.start
    assert_equal 3, guess.element_holder[:element]
    refute guess.correct_code?
  end

  def test_returns_number_of_elements_correct_if_guess_is_wrong_2
    # skip
    guess = Guesser.new("rrry")
    guess.user_input = "brrg"
    guess.start
    assert_equal 1, guess.element_holder[:element]
    refute guess.correct_code?
  end

  def test_returns_number_of_elements_in_correct_position
    # skip
    guess = Guesser.new("byrg")

    guess.user_input = "brry"
    guess.start
    assert_equal 2, guess.element_holder[:position]
    refute guess.correct_code?
  end

  def test_returns_number_of_elements_in_correct_position_2
    # skip
    guess = Guesser.new("byrg")

    guess.user_input = "brrg"
    guess.start
    assert_equal 3, guess.element_holder[:position]
    refute guess.correct_code?
  end

  def test_counter_returns_number_of_guesses
    # skip
    guess = Guesser.new("byrg")
    guess.user_input = "brrg"
    guess.start
    assert_equal 1, guess.counter
  end

  def test_counter_returns_greater_than_one_guess
    # skip
    guess = Guesser.new("byrg")
    guess.user_input = "gggg"
    guess.start
    guess.user_input = "rrrr"
    guess.start
    guess.user_input = "bbbb"
    guess.start
    assert_equal 3, guess.counter
  end

end
