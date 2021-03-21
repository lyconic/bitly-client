require "spec_helper"
require "securerandom"

RSpec.describe Bitly::Client::Config do
  let(:api_token) { SecureRandom.urlsafe_base64 }
  let(:api_url) { "https://api-ssl.bitly.com/v4/shorten" }

  before(:each) do
    Bitly::Client.configure do |config|
      config.api_token = api_token
      config.api_url = api_url
    end
  end

  after(:each) do
    Bitly::Client.configuration = nil
  end

  it "sets/gets an API token and URL" do
    expect(Bitly::Client.configuration.api_token).to match api_token
    expect(Bitly::Client.configuration.api_url).to match api_url
  end
end