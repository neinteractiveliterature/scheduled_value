module ScheduledValue
  class ScheduledValue
    attr_reader :timespans

    def self.timespan_with_value_class
      TimespanWithValue
    end

    def self.always(value)
      timespan = timespan_with_value_class.new(start: nil, finish: nil, value: value)
      self.new(timespans: [timespan])
    end

    def from_json(json, include_root = false)
      hash = JSON.parse(json)
      hash = hash.values.first if include_root
      self.attributes = hash
      self
    end

    def initialize(timespans: [])
      self.timespans = timespans
    end

    def attributes
      {
        timespans: timespans
      }
    end

    def attributes=(attributes)
      self.timespans = attributes.symbolize_keys[:timespans]
    end

    def timespans=(timespan_values)
      @timespans = SortedSet.new

      timespan_values.each do |timespan_value|
        timespan = case timespan_value
        when self.class.timespan_with_value_class then timespan_value
        when Hash then self.class.timespan_with_value_class.new(timespan_value)
        end

        self << timespan if timespan
      end

      @timespans
    end

    def <<(timespan_with_value)
      overlapping_timespan = timespan_overlapping(timespan_with_value)
      raise "Timespan for value #{overlapping_timespan} would overlap with #{timespan_with_value}" if overlapping_timespan

      @timespans << timespan_with_value
      @timespans_array = nil

      timespan_with_value
    end

    def set_value_for_timespan(start, finish, value)
      self << self.class.timespan_with_value_class.new(start: start, finish: finish, vaule: value)
      value
    end

    def value_at(timestamp)
      timespan = timespan_containing(timestamp)
      raise "No timespan found for #{timestamp}" unless timespan

      timespan.value
    end

    def next_value_change_after(timestamp)
      timespan = timespan_containing(timestamp)
      return nil unless timespan

      timespan.finish
    end

    def covers_all_time?
      timespans_array = timespans.to_a
      !timespans_array.first.start && !timespans_array.last.finish
    end

    private

    def timespans_array
      @timespans_array ||= timespans.to_a
    end

    def timespan_containing(timestamp)
      timespans_array.bsearch do |timespan|
        if timespan.contains? timestamp
          0
        else
          (timespan <=> timestamp) * -1
        end
      end
    end

    def timespan_overlapping(timespan)
      timespans.find { |my_timespan| my_timespan.overlaps? timespan }
    end
  end
end