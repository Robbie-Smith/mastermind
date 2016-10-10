require_relative 'test_helper'
require './lib/guesser.rb'

class TestGuesser < Minitest::Test
  def test_generates_code_from_code_generator_module
    # skip
    guess = Guesser.new
    assert_kind_of String, guess.code
    assert_equal 4, guess.code.length
  end

  def test_checks_input_only_includes_alpha_characters
    # skip
    guess = Guesser.new
    guess.user_input = 'bg76*'
    guess.check_input_for_validity
    refute guess.valid_input
  end

  def test_input_is_correct_length_and_contains_correct_characters
    # skip
    guess = Guesser.new
    guess.user_input ='yyyy'
    guess.check_input_for_validity
    assert guess.valid_input
  end

  def test_input_contains_invalid_characters_or_improper_length
    # skip
    guess = Guesser.new
    guess.user_input ='bgr'
    guess.check_input_for_validity
    refute_equal guess.code.length, guess.user_input.length
    refute guess.valid_input

    guess.user_input = "bgryk"
    guess.check_input_for_validity
    refute_equal guess.code.length, guess.user_input.length
    refute guess.valid_input
  end

  def test_compares_user_input_with_code
    # skip
    guess = Guesser.new
    guess.stub :code, code="bgry" do
      guess.user_input = "bgry"
      guess.start
      assert guess.correct_code?
    end
    guess.stub :code, code="bgry" do
      guess.user_input = "rrrr"
      guess.start
      assert guess.correct_code?
    end
  end

  def test_returns_number_of_elements_correct_if_guess_is_wrong
    # skip
    guess = Guesser.new
    guess.stub :code, code="byrg" do
      guess.user_input = "brry"
      guess.start
      assert_equal 3, guess.element_holder[:element]
      refute guess.correct_code?
    end
    guess.stub :code, code="rrry" do
      guess.user_input = "brrg"
      guess.start
      assert_equal 1, guess.element_holder[:element]
      refute guess.correct_code?
    end
  end

  def test_returns_number_of_elements_in_correct_position
    # skip
    guess = Guesser.new
    guess.stub :code, code="byrg" do
      guess.user_input = "brry"
      guess.start
      assert_equal 2, guess.element_holder[:position]
      refute guess.correct_code?
    end
    guess.stub :code, code="byrg" do
      guess.user_input = "brrg"
      guess.start
      assert_equal 3, guess.element_holder[:position]
      refute guess.correct_code?
    end

  end
end
