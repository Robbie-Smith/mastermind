class Timer
  attr_accessor :start_game, :end_game, :time
  attr_reader :elapsed_time

    def initialize
      @time = Time.new
      @start_game = false
      @end_game = false
    end

    def time_convert
      if @end_game.eql?(true)
        @end_time = time_to_seconds
        time_difference_calculation
      elsif @start_game.eql?(true)
        @start_time = time_to_seconds
      end
    end

    def time_to_seconds
      (@time.min * 60) + @time.sec
    end

    def time_difference_calculation
      seconds = @end_time - @start_time
      elapsed_time_creation(seconds)
    end

    def elapsed_time_creation(seconds)
      if seconds < 3600
        @elapsed_time = Time.at(seconds).strftime("%M minutes and %S seconds")
      else
        hour = seconds / 3600
        @elapsed_time = Time.at(seconds).strftime("#{hour} hours and %M minutes and %S seconds")
      end
    end

end
