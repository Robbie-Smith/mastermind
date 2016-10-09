require_relative "code_generator"

class Guesser
  include CodeGenerator

  attr_accessor :code
  attr_reader :correct_code, :correct_elements, :correct_position
  alias_method :correct_code?, :correct_code

  def initialize
    @code = CodeGenerator.generate
    @correct_code = false
  end

  def check_input_for_validity(user_input)
    if user_input.scan(/[1-9\W]/).empty? == (false)
      "No special characters or numbers."
    elsif user_input.length < code.length
      "Your input is to short."
    elsif user_input.length > code.length
      "Your input is to long."
    end
  end

  def check_input_against_code(user_input)
      if user_input.eql?(code)
        @correct_code = true
      else
        correct_position_counter(user_input)
      end
  end


  def correct_position_counter(user_input)
    @correct_position = 0
    @code.chars.each_with_index do |value,index|
        if value.eql?(user_input[index])
          @correct_position += 1
        else
          correct_element_counter(user_input)
        end
    end
  end

  def correct_element_counter(user_input)
    @correct_elements = 0
    user_input.chars.uniq.each do |value|
      @correct_elements += 1 if @code.chars.include?(value)
    end
  end

end
