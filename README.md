# SmartInsightLoggingLayout

[![Build Status](https://travis-ci.org/emartech/smart_insight_logging_layout.svg?branch=master)](https://travis-ci.org/emartech/smart_insight_logging_layout)

SmartInsight Logging layout for unifiy logging conventions between services.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smart_insight_logging_layout'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_insight_logging_layout

## How to use

```ruby
layout = SmartInsightLoggingLayout.new(context: { environment: ENV['RACK_ENV'] })
appender = Logging.appenders.stdout(layout: layout)
Logging.logger.root.appenders = [appender]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/smart_insight_logging_layout. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

