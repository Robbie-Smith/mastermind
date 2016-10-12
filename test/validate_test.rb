require_relative 'test_helper'
require './lib/validate.rb'

class TestValidator < Minitest::Test

  def test_input_is_correct_length_and_contains_correct_characters
    # skip
    validator = Validator.new
    validator.check_input_for_correct_characters('bgry','BRYY')

    assert validator.valid?
  end

  def test_checks_input_only_includes_alpha_characters
    # skip
    validator = Validator.new
    validator.check_input_for_correct_characters('bg76*')
    refute validator.valid?
  end

  def test_input_checks_for_improper_length
    # skip
    validator = Validator.new
    validator.check_input_for_correct_length('y','BRYY')
    refute validator.valid?
  end

  def test_input_checks_for_improper_length
    # skip
    validator = Validator.new
    validator.check_input_for_correct_length("bgrykgg",'BRYY')
    refute validator.valid?
  end


end
