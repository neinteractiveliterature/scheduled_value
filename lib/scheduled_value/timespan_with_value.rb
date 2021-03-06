module ScheduledValue
  class TimespanWithValue < Timespan
    attr_accessor :value

    def initialize(start: nil, finish: nil, value: nil)
      super(start: start, finish: finish)
      self.value = value
    end

    def attributes
      super.merge(value: value)
    end

    def to_hash(*)
      attributes
    end

    def to_s(format = nil, timezone = nil)
      "#{value} #{super}"
    end
  end
end
