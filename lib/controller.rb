require_relative "guesser"
require_relative "timer"
require_relative "code_generator"
require_relative "responses"
require_relative "validate"
require 'Colorize'
require 'terminal-table'

class Controller
  include CodeGenerator
  include Responses
  include Colorize

  attr_reader :guess, :timer, :table
  attr_accessor :input, :rows

  def initialize
    @guess = Guesser.new
    @guess.code = CodeGenerator.generate
    @timer = Timer.new
    @validate = Validator.new
    @previous_input = []
    @rows = []
  end

  def check_input
    if guess.correct_code.eql?(false)
      @previous_input << input
      guess.user_input = input
      @validate.valid = false
      @validate.check_start(guess.user_input,guess.code)
      start
    end
  end

  def start
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
    if guess.correct_code.eql?(false) && @validate.valid.eql?(true)
      element = guess.element_holder[:element]
      position = guess.element_holder[:position]
      counter = guess.counter
      Responses.guess_element_response(guess.user_input,element,position,counter)
      print_table
    elsif guess.correct_code.eql?(true)
      game_over
    end
  end

  def print_table
    if @guess.user_input.length > 1
      element = guess.element_holder[:element].to_s.cyan.bold
      position = guess.element_holder[:position].to_s.cyan.bold
      @rows << [@guess.user_input.upcase.light_green,position,element]
      table = Terminal::Table.new
      table.headings = ['Guess', 'Position', 'Element']
      table.rows = @rows
      puts table
    end
  end

  def game_over
    time_end
    elapsed_time = @timer.elapsed_time
    counter = @guess.counter
    Responses.game_end(input,counter,elapsed_time)
  end

  def time_end
    timer.start_game.eql?(true)
    timer.time = Time.new
    timer.end_game = true
    timer.time_convert
  end

end
