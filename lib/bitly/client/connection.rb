require "httparty"
require "json"

module Bitly
  module Client
    class Connection
      attr_accessor :api_token
      attr_accessor :api_url
      attr_accessor :long_url

      def initialize(long_url, api_token = nil, api_url = nil)
        @api_token = api_token || Bitly::Client.configuration.api_token
        @api_url = api_url || Bitly::Client.configuration.api_url
        @long_url = long_url
      end

      def shorten
        @response = HTTParty.post(api_url, headers: headers, body: body)
        if !@response.nil? && @response.success?
          @response["link"]
        end
      end

      private

      def body
        {
          long_url: long_url
        }.to_json
      end

      def headers
        {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{api_token}"
        }
      end
    end
  end
end