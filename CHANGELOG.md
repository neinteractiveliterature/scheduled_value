# 1.4.0 - September 19, 2021

- Use an explicit dependency on the sorted_set gem for Ruby 3 compatibility

# 1.3.0 - March 28, 2020

- Implement #to_hash as an alias for #attributes on all objects, to make ActiveSupport serialization
  behave better

# 1.2.2 - January 17, 2019

- Fix a formatting bug where the start time could be accidentally used
  as the finish time if there is no timezone

# 1.2.1 - January 25, 2018

- Fix a major bug when formatting timespans with timezones

# 1.2.0 - YANKED - January 25, 2018

- Allow passing timezone argument to string formatting methods in Timespan

# 1.1.3 - September 27, 2017

- Don't assume 'date' and 'time' are already required by the time we require 'scheduled_value/timespan'

# 1.1.2 - May 22, 2017

- Bug fix: use setters in initializers so that custom conversions will work when deserializing ScheduledValues

# 1.1.1 - February 18, 2017

- `ScheduledValue::ScheduledValue#covers_all_time?` will no longer raise an exception if there are no timespans

# 1.1.0 - December 25, 2016

- Add `ScheduledValue::ScheduledValue#has_value_at?` method to reduce the need for exceptions-as-control-flow

# 1.0.0 - December 24, 2016

- Initial public release.
