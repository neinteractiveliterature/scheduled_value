require 'test_helper'

describe ScheduledValue::ScheduledValue do
  let(:scheduled_value) do
    timespans = (1..10).map do |month|
      {
        start: Date.new(2015, month, 1),
        finish: Date.new(2015, month + 1, 1),
        value: month
      }
    end

    ScheduledValue::ScheduledValue.new(timespans: timespans)
  end

  it "initializes from attributes" do
    ScheduledValue::ScheduledValue.new(
      timespans: [
        {
          start: Date.new(2015, 4, 1),
          finish: Date.new(2015, 6, 1),
          value: 2
        },
        {
          start: Date.new(2015, 6, 1),
          finish: Date.new(2015, 7, 1),
          value: 3
        }
      ]
    )
  end

  it "won't initialize from overlapping timespans" do
    assert_raises do
      ScheduledValue::ScheduledValue.new(
        timespans: [
          {
            start: Date.new(2015, 4, 1),
            finish: Date.new(2015, 6, 4),
            value: 2
          },
          {
            start: Date.new(2015, 6, 1),
            finish: Date.new(2015, 7, 1),
            value: 3
          }
        ]
      )
    end
  end

  it "returns the correct value for each timespan" do
    (1..10).each do |month|
      assert_equal month, scheduled_value.value_at(Date.new(2015, month, 1))
      assert_equal month, scheduled_value.value_at(Date.new(2015, month, 2))
      assert_equal month, scheduled_value.value_at(Date.new(2015, month, 28))
    end
  end

  it "determines when it does and doesn't have a value" do
    assert_equal false, scheduled_value.has_value_at?(Date.new(2014, 12, 1))
    assert_equal true, scheduled_value.has_value_at?(Date.new(2015, 1, 1))
  end
end
