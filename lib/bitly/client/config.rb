module Bitly
  module Client
    class << self
      attr_accessor :configuration

      def configure
        self.configuration ||= Config.new
        yield(configuration)
      end
    end

    class Config
      attr_accessor :api_token
      attr_accessor :api_url

      def initialize
        @api_url = "https://api-ssl.bitly.com/v4/shorten"
      end
    end
  end
end