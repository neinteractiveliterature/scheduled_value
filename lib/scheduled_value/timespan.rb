module ScheduledValue
  class Timespan
    include Comparable
    attr_accessor :start, :finish

    def initialize(start: nil, finish: nil)
      self.start = start
      self.finish = finish

      raise "Finish must be after start" if start && finish && start >= finish
    end

    def attributes
      {
        start: start,
        finish: finish
      }
    end

    def start=(value)
      @start = convert_time_value(value)
    end

    def finish=(value)
      @finish = convert_time_value(value)
    end

    def contains?(timestamp)
      return false if start && timestamp < start
      return false if finish && timestamp >= finish

      true
    end

    def overlaps?(other)
      return false if finish && other.start && other.start >= finish
      return false if start && other.finish && start >= other.finish

      true
    end

    def <=>(other)
      case other
      when Timespan then compare_timespan(other)
      when Date, Time, DateTime then compare_datetime(other)
      end
    end

    def inspect
      "#<#{self.class.name}: #{self}>"
    end

    def to_s(format = nil)
      "#{start_description(format)} #{finish_description(format)}"
    end

    def start_description(format = nil)
      if start
        "from #{start.to_s(format)}"
      else
        'anytime'
      end
    end

    def finish_description(format = nil)
      if finish
        "up to #{finish.to_s(format)}"
      elsif start
        "indefinitely"
      end
    end

    private
    def compare_timespan(other)
      return 0 if other.start == start && other.finish == finish
      return nil if other.overlaps?(self)
      return -1 if finish && other.start && other.start >= finish
      return 1 if start && other.finish && other.finish <= start
    end

    def compare_datetime(other)
      return nil if contains?(other)
      return -1 if finish && other >= finish
      return 1 if start && other < start
      0
    end

    def convert_time_value(value)
      case value
      when String then Time.iso8601(value)
      else value
      end
    end
  end
end