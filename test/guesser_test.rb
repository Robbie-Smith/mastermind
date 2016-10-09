require_relative 'test_helper'
require './lib/guesser.rb'

class TestGuesser < Minitest::Test
  def setup
    @guess = Guesser.new
    @guess.user_input = 'bgry'
    @guess.code = 'bgry'
  end

  def test_generates_code_from_code_generator_module
    assert_kind_of String, @guess.code
    assert_equal 4, @guess.code.length
  end

  def test_checks_input_only_includes_alpha_characters
    @guess.user_input = 'bg76*'
    expected = "No special characters or numbers."
    assert_equal expected, @guess.check_input_for_validity
  end

  def test_returns_incorrect_input_length
    @guess.user_input ='bgr'
    refute_equal @guess.code.length, @guess.user_input.length
    assert_equal "Your input is to short.", @guess.check_input_for_validity
    @guess.user_input = "bgryk"
    assert_equal "Your input is to long.", @guess.check_input_for_validity
  end

  def test_compares_user_input_with_code
    # skip
    @guess.user_input = "bgry"
    @guess.check_input_against_code
    assert @guess.correct_code?
  end

  def test_returns_number_of_elements_correct_if_guess_is_wrong
    # skip
    @guess.user_input = 'brry'
    @guess.check_input_against_code
    refute @guess.correct_code?
    @guess.user_input = "brrg"
    assert_equal 3, @guess.correct_elements
    @guess.check_input_against_code
    refute @guess.correct_code?
    assert_equal 3, @guess.correct_elements
  end

  def test_returns_number_of_elements_in_correct_position
    # skip
    @guess.user_input = "brry"
    @guess.check_input_against_code
    refute @guess.correct_code?
    assert_equal 3, @guess.correct_position
    @guess.user_input = "brrg"
    @guess.check_input_against_code
    refute @guess.correct_code?
    assert_equal 2, @guess.correct_position
  end
end
