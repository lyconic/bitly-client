require "bitly/client/connection"
require "bitly/client/config"
require "bitly/client/config_error"
require "bitly/client/version"

module Bitly
  module Client
    extend self

    def shorten(long_url, api_token = nil)
      if api_token.nil? && (configuration.nil? || configuration.api_token.nil?)
        raise ConfigError.new "Please add Bitly::Client configuration to your app initializer"
      end
      Connection.new(long_url, api_token).shorten
    end
  end
end
