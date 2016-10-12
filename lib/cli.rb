require_relative "command"
require_relative "responses"
require 'pry'
require 'Kimble'
class Repl
  include Responses

  def initialize
    @command = Command.new
    @game_on = false
    welcome
  end

  def welcome
    Responses.welcome
    start_sequence(correct_response)
  end

  def start_sequence(input=nil)
    input = @command.input
    if input.eql?("quit") || input.eql?("q")
      quit(input)
    elsif input.eql?("instructions") || input.eql?("i")
      Responses.instructions
      @game_on = false
      welcome
    elsif input.eql?("cheat") || input.eql?("c")
      puts (@command.guess.code).upcase
      play(input=nil)
    elsif @game_on.eql?(true)
      play(input=nil)
    elsif input.eql?("play") || input.eql?("p")
      play(input=nil)
    else
      welcome
    end
  end

  def play(input=nil)
    if @game_on.eql?(false)
      @game_on = true
      Responses.game_start
      correct_response
      @command.check_input
    elsif @game_on.eql?(true)
      correct_response
      @command.check_input
    elsif @command.guess.correct_code.eql?(true)
      end_flow(input)
    end
    code_check
  end

  def code_check
    if @command.guess.correct_code.eql?(true)
      end_flow
    elsif @command.guess.correct_code.eql?(false)
      start_sequence
    end
  end

  def correct_response
    if @game_on.eql?(true)
      Responses.guess
      input = input_setter
    elsif @game_on.eql?(false)
      Responses.command
      input = input_setter
    end
  end

  def input_setter
    @command.input = gets.chomp.downcase
  end

  def end_flow
    @game_on = false
    response = correct_response
    if response.eql?('p') || response.eql?('p')
      reset_variables
    elsif response.eql?('q') || response.eql?('quit')
      quit(response)
    end
  end

  def reset_variables
    @command.guess.counter = 0
    @command.guess.correct_code = false
    @command.timer.start_game = false
    @command.timer.end_game = false
    @command.guess.code = CodeGenerator.generate
    start_sequence
  end

  def quit(input)
    if input.eql?('q') || input.eql?('quit')
      @game_on = false
      puts Kimble.quote.light_cyan
    end
  end

end

Repl.new
