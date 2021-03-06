class Chargeback
  class Consumption
    def initialize(start_time, end_time)
      @start_time, @end_time = start_time, end_time
    end

    def hours_in_interval
      @hours_in_interval ||= (@end_time - @start_time).round / 1.hour
    end

    def hours_in_month
      # If the interval is monthly, we have use exact number of days in interval (i.e. 28, 29, 30, or 31)
      # othewise (for weekly and daily intervals) we assume month equals to 30 days
      monthly? ? hours_in_interval : (1.month / 1.hour)
    end

    private

    def monthly?
      # A heuristic. Is the interval lenght about 30 days?
      (hours_in_interval * 1.hour - 1.month).abs < 3.days
    end
  end
end
