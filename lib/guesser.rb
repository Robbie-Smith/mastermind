class Guesser

  attr_accessor :code, :user_input
  attr_reader :correct_code, :correct_elements, :correct_position
  alias_method :correct_code?, :correct_code

  def initialize
    @code = code
    @correct_code = false
    @user_input = user_input
    @valid_input = nil
  end

  def start
    if @valid_input.nil?
      check_input_for_validity
    elsif @valid_input.eql?(true)
      check_input_against_code
    end
  end

  def check_input_for_validity
    if @user_input.scan(/[1-9\W]/).empty? == false
      @valid_input = false
      "No special characters or numbers."
    elsif @user_input.length < code.length
      @valid_input = false
      "Your input is to short."
    elsif @user_input.length > code.length
      @valid_input = false
      "Your input is to long."
    else
      @valid_input = true
      start
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
    @correct_position = 0
    @elements_counted = false
    @code.chars.each_with_index do |value,index|
      if value.eql?(@user_input[index])
        @correct_position += 1
      elsif @elements_counted.eql?(false)
        correct_element_counter
      end
    end
  end

  def correct_element_counter
    @correct_elements = 0
    if @elements_counted.eql?(false)
      @user_input.chars.uniq.each do |value|
        @correct_elements += 1 if @code.chars.include?(value)
      end
      @elements_counted = true
    end
  end

end
