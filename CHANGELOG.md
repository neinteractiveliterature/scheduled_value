# 1.1.3 - September 27, 2017

* Don't assume 'date' and 'time' are already required by the time we require 'scheduled_value/timespan'

# 1.1.2 - May 22, 2017

* Bug fix: use setters in initializers so that custom conversions will work when deserializing ScheduledValues

# 1.1.1 - February 18, 2017

* `ScheduledValue::ScheduledValue#covers_all_time?` will no longer raise an exception if there are no timespans

# 1.1.0 - December 25, 2016

* Add `ScheduledValue::ScheduledValue#has_value_at?` method to reduce the need for exceptions-as-control-flow

# 1.0.0 - December 24, 2016

* Initial public release.
