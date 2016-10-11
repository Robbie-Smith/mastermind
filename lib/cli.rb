require_relative "command"
require_relative "responses"
require 'pry'

class Repl
  include Responses

  def initialize
    @command = Command.new
    welcome
  end

  def welcome
    Responses.welcome
    game_started = false
    start_sequence(game_started=false)
  end

  def start_sequence(input=nil,game_started)
    # binding.pry
    correct_command(game_started)
    input_setter
    input = @command.input
    if input.eql?("play") || input.eql?("p")
      play(input=nil,game_started)
    elsif input.eql?("quit") || input.eql?("q")
      quit(input)
    elsif input.eql?("instructions") || input.eql?("i")
      Responses.instructions
      start_sequence(input=nil,game_started)
    elsif input.eql?("cheat") || input.eql?("c")
      puts @command.guess.code.upcase
      play(input=nil,game_started)
    elsif @command.guess.correct_code.eql?(false)
      play(input,game_started)
    elsif @command.guess.correct_code.eql?(true)
      end_flow
    else
      welcome
    end
  end

  def correct_command(game_started)
    if game_started.eql?(false)
      Responses.command
    else
      Responses.guess
    end
  end

  def input_setter
    @command.input = gets.chomp.downcase
  end

  def play(input=nil,game_started)
    # binding.pry
    quit(input)
    if game_started.eql?(false)
      game_started = true
      Responses.game_start
      Responses.guess
      input_setter
      @command.check_input
    elsif game_started.eql?(true)
      @command.check_input
    elsif @command.guess.correct_code.eql?(true)
      end_flow
    end
    start_sequence(input,game_started)
  end

  def end_flow
    Responses.game_end
    start_sequence
  end

  def quit(input)
    if input.eql?('q') || input.eql?('quit')
      puts "Goodbye."
    end
  end

end

Repl.new
