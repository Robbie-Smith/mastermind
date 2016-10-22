require "./lib/responses"
class Validator
  include Responses

  attr_accessor :valid
  alias_method :valid?, :valid

  RESERVED_WORDS = ["quit","cheat","q","c","p",
                    "play","i","instuctions"]
  def initialize
    @valid = false
  end

  def check_start(input,code)
    check_for_reserved_word(input,code)
  end

  def check_for_reserved_word(input,code)
    if RESERVED_WORDS.include?(input)
      @valid = false
    else
      check_input_for_correct_characters(input,code)
    end
  end

  def check_input_for_correct_characters(input,code)
    if !input.scan(/[1-9\W]/).empty?
      Responses.guess_response_1
    else
      check_input_for_correct_length(input,code)
    end
  end

  def check_input_for_correct_length(input,code)
    if input.length < code.length
      @valid = false
      Responses.guess_response_2
    elsif input.length > code.length
      Responses.guess_response_3
    else
      @valid = true
    end
  end

end
