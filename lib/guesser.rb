require_relative "code_generator"
require_relative "responses"
class Guesser
  include Responses
  include CodeGenerator

  attr_accessor :user_input
  attr_reader :correct_code, :valid_input, :code, :element_holder
  alias_method :correct_code?,:correct_code

  def initialize(input_code)
    @code = input_code
    @correct_code = false
    @valid_input = nil
    @user_input = nil
  end

  def start
    if valid_input.nil?
      check_input_for_validity
    elsif valid_input.eql?(true)
      check_input_against_code
    end
  end

  def check_input_for_validity
    # binding.pry
    check_input_for_correct_characters
    check_input_for_correct_length
    if valid_input.nil?
      @valid_input = true
      start
    end
  end

  def check_input_for_correct_characters
    if !user_input.scan(/[1-9\W]/).empty?
      Responses.guess_response_1
      @valid_input = false
    end
  end

  def check_input_for_correct_length
    if user_input.length < code.length
      Responses.guess_response_2
      @valid_input = false
    elsif user_input.length > code.length
      Responses.guess_response_3
      @valid_input = false
    end
  end

  def check_input_against_code
    if user_input.eql?(code)
      @correct_code = true
    else
      correct_position_counter
    end
  end

  def correct_position_counter
    @element_holder = {position: 0, element: 0}
    code.chars.each_with_index do |value,index|
     if value.eql?(user_input[index])
       @element_holder[:position]+= 1
     end
    end
    correct_element_counter(element_holder)
  end

  def correct_element_counter(correct_position)
    user_input.chars.uniq.each do |value|
      @element_holder[:element] += 1 if code.chars.include?(value)
    end
  end

end
