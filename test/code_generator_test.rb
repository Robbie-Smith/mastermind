require_relative 'test_helper'
require './lib/code_generator.rb'

class TestCodeGenerator < Minitest::Test

  def test_can_it_generate_random_4_element_sequence
    code = CodeGenerator
    refute_equal "bgry", code.generate

    assert_equal 4, code.generate.length
  end

  def test_can_it_generate_random_5_element_sequence
    code = CodeGenerator
    refute_equal "bgryb", code.generate(level=5)
    assert_equal 5, code.generate(level=5).length
  end

  def test_can_it_generate_random_6_element_sequence
    code = CodeGenerator
    refute_equal "bgrybg", code.generate(level=6)
    assert_equal 6, code.generate(level=6).length
  end

end
