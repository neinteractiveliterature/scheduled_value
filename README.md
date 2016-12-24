# ScheduledValue

[![Gem Version](https://badge.fury.io/rb/scheduled_value.svg)](https://badge.fury.io/rb/scheduled_value) ![Codeship test status](https://codeship.com/projects/165d5000-ac28-0134-2a75-16abc9b20ebe/status?branch=master)

ScheduledValue provides a set of Ruby classes for representing values that change over time based on a schedule.  One way to think about this is that for a regular variable, you could reasonably ask "what is its value?"  For a ScheduledValue, you have to ask "what is its value *right now*?"  Some examples of this might be:

* an on-call rotation (who is on call *right now*?)
* pricing for an event with early bird tickets (what is the price *right now*?)

ScheduledValue also provides a `ScheduledValue::Timespan` class that represents a span of time, which may have a defined start point, a defined end point, both, or neither.  `ScheduledValue::Timespan`s are Ruby `Comparable` objects.

All classes in the ScheduledValue gem are designed to be serializable to and from dictionary-like formats, such as JSON and YAML.  This makes it easy to use them with ActiveRecord's `serialize` class method and other similar techniques for storing them in a database column.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scheduled_value'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scheduled_value

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neinteractiveliterature/scheduled_value.

