require_relative "responses"
module Validator
  include Responses
  extend self
  RESERVED_WORDS = ['quit','cheat','q','c',"Q"]
  def check_input_for_validity(user_input,code)
    check_input_for_correct_characters(user_input,code)
  end

  def check_input_for_correct_characters(user_input,code)
    if !user_input.scan(/[1-9\W]/).empty?
      Responses.guess_response_1
    end
    check_input_for_correct_length(user_input,code)
  end

  def check_input_for_correct_length(user_input,code)
    if user_input.length < code.length
      Responses.guess_response_2
    elsif user_input.length > code.length
      Responses.guess_response_3
    end
    check_for_reserved_word(user_input)
  end

  def check_for_reserved_word(user_input)
    return false if RESERVED_WORDS.include?(user_input)
  end

end
