require_relative 'test_helper'
require './lib/guesser.rb'

class TestGuesser < Minitest::Test
  def setup
    @guess = Guesser.new
    @guess.code = 'bgry'
  end

  def test_generates_code_from_code_generator_module
    assert_kind_of String, @guess.code
    assert_equal 4, @guess.code.length
  end

  def test_checks_input_only_includes_alpha_characters
    user_input = 'bg76*'
    assert_equal "No special characters or numbers.", @guess.check_input_for_validity(user_input)
  end

  def test_returns_incorrect_input_length
    user_input ='bgr'
    refute_equal @guess.code.length, user_input.length
    assert_equal "Your input is to short.", @guess.check_input_for_validity(user_input)
    user_input = "bgryk"
    assert_equal "Your input is to long.", @guess.check_input_for_validity(user_input)
  end

  def test_compares_user_input_with_code
    # skip
    @guess.code = 'bgry'
    @guess.check_input_against_code('bgry')
    assert @guess.correct_code?
  end

  def test_returns_number_of_elements_correct_if_guess_is_wrong
    # skip
    @guess.check_input_against_code('brry')
    refute @guess.correct_code?
    assert_equal 3, @guess.correct_elements
    @guess.check_input_against_code('brrg')
    refute @guess.correct_code?
    assert_equal 3, @guess.correct_elements
  end

  def test_returns_number_of_elements_in_correct_position
    # skip
    @guess.check_input_against_code('brry')
    refute @guess.correct_code?
    assert_equal 3, @guess.correct_position
    @guess.check_input_against_code('brrg')
    refute @guess.correct_code?
    assert_equal 2, @guess.correct_position
  end
end
