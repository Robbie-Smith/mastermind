require_relative "guesser"
require_relative "timer"
require_relative "code_generator"
require_relative "responses"
require_relative "validate"

class Command
  include CodeGenerator
  include Responses

  attr_reader :guess, :timer
  attr_accessor :input

  def initialize(override_code = nil)
    code = override_code || CodeGenerator.generate
    @guess = Guesser.new(code)
    @timer = Timer.new
    @validate = Validator.new
    @previous_input = []
  end

  def check_input
    # binding.pry
    if guess.correct_code.eql?(false)
      @previous_input << input
      guess.user_input = input
      @validate.check_start(guess.user_input,guess.code)
      start
    end
  end

  def start
    # binding.pry
    check_input unless @previous_input.include?(input)
    if @validate.valid.eql?(true)
      time_start
      guess.start
      print_guess
    end
  end

  def time_start
    if timer.start_game.eql?(false)
      timer.start_game = true
      timer.time_convert
    end
  end

  def print_guess
    element = guess.element_holder[:element]
    position = guess.element_holder[:position]
    counter = guess.counter
    if guess.correct_code.eql?(false)
      Responses.guess_element_response(guess.user_input,element,position,counter)
    elsif guess.correct_code.eql?(true)
      game_over
    end
  end

  def game_over
    if guess.correct_code.eql?(true)
      time_end
      elapsed_time = @timer.elapsed_time
      counter = @guess.counter
      Responses.game_end(input,counter,elapsed_time)
    end
  end

  def time_end
    if timer.start_game.eql?(true)
      timer.time = Time.new
      timer.end_game = true
      timer.time_convert
    end
  end

end
