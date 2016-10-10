require_relative 'test_helper'
require './lib/code_generator.rb'

class TestCodeGenerator < Minitest::Test
  def setup
    @code = CodeGenerator
  end

  def test
    assert_kind_of CodeGenerator, @code
  end

  def test_can_it_generate_random_4_element_sequence
    # skip
    refute_equal "bgry", @code.generate
    assert_equal 4, @code.generate.length
  end

  def test_can_it_generate_random_5_element_sequence
    # skip
    refute_equal "bgryb", @code.generate(5)
    assert_equal 5, @code.generate(5).length
  end

  def test_can_it_generate_random_6_element_sequence
    # skip
    refute_equal "bgrybg", @code.generate(6)
    assert_equal 6, @code.generate(6).length
  end

end
