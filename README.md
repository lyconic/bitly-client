# Bitly::Client

A super simple, one-way client for using Bitly's API for shortening long URLs. This was created to support a legacy app on Ruby 1.9.3 and Rails 3.1 because many other shortening clients require Ruby 2.0+.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitly-client-legacy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitly-client-legacy

## Usage

```ruby
Bitly::Client.new("https://lyconic.com/2016/11/21/tips-hiring-quality-security-guards-officers/").shorten
```

## Config

_your_app/config/initializers/bitly_client.rb_

```ruby
require "bitly/client"

Bitly::Client.configure do |config|
  config.api_token = YOUR_GENERIC_OATH_ACCESS_TOKEN
  config.api_url = BITLY_API_SHORTEN_URL # e.g. https://api-ssl.bitly.com/v4/shorten
end
```

> [Get a Bitly generic access token](https://dev.bitly.com/docs/getting-started/authentication)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lyconic/bitly-client-legacy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

