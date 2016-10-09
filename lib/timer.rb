class Timer
  attr_accessor :end, :start_time
  attr_reader :elapsed_time

    def initialize
      @time = Time.new
      @elapsed_time = nil
      @start_time = start_time
      @end_time = time_to_seconds
    end

    def start_time_convert
      @start_time = time_to_seconds
    end

    def time_to_seconds
      (@time.min * 60) + @time.sec
    end

    def end_of_game
      time_difference_calculation(end_time,start_time)
    end

    def time_difference_calculation(end_time,start_time)
      seconds_formatter(end_time - start_time)
    end

    def seconds_formatter(seconds)
      if seconds < 3600
        @elapsed_time = Time.at(seconds).strftime("%M:%S")
      else
        hour = seconds / 3600
        @elapsed_time = "#{hour}:#{Time.at(seconds).strftime("%M:%S")}"
      end
    end

end
