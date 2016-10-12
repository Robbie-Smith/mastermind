require_relative "responses"
class Validator
  include Responses

  attr_reader :valid
  alias_method :valid?, :valid

  RESERVED_WORDS = ["quit","cheat","q","c"]

  def initialize
    @valid = nil
  end

  def check_start(input,code=nil)
    check_for_reserved_word(input,code=nil)
  end

  def check_for_reserved_word(input,code=nil)
    if RESERVED_WORDS.include?(input)
       @valid = false
    else
      check_input_for_correct_characters(input,code=nil)
    end
  end

  def check_input_for_correct_characters(input,code=nil)
    if !input.scan(/[1-9\W]/).empty?
      Responses.guess_response_1
      @valid = false
    else
      @valid = true
      check_input_for_correct_length(input,code)
    end
  end

  def check_input_for_correct_length(input,code)
    if input.length < code.length
      Responses.guess_response_2
      @valid = false
    elsif input.length > code.length
      Responses.guess_response_3
      @valid = false
    else
      @valid = true
    end
  end

end
