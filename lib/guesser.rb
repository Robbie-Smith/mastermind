class Guesser

  attr_accessor :user_input, :counter, :code, :correct_code
  attr_reader  :element_holder
  alias_method :correct_code?,:correct_code

  def initialize
    @code = code
    @correct_code = false
    @user_input = nil
    @counter = 0
  end

  def start
    if user_input.eql?(code)
      @counter += 1
      @correct_code = true
    else
      correct_position_counter
    end
  end

  def correct_position_counter
    @counter += 1
    @element_holder = {position: 0, element: 0}
    code.chars.each_with_index do |value,index|
     if value.eql?(user_input[index])
       @element_holder[:position]+= 1
     end
    end
    correct_element_counter(element_holder)
  end

  def correct_element_counter(element_holder)
    user_input.chars.uniq.each do |value|
      @element_holder[:element] += 1 if code.chars.include?(value)
    end
  end

end
