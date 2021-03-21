require "spec_helper"

RSpec.describe Bitly::Client::Connection do
  let(:api_token) { SecureRandom.urlsafe_base64 }
  let(:api_url) { "https://api-ssl.bitly.com/v4/shorten" }

  let(:config_token) { SecureRandom.urlsafe_base64 }
  let(:config_url) { "https://api-ssl.bitly.com/v3/shorten" }

  let(:long_url) { "https://lyconic.com/2016/11/21/tips-hiring-quality-security-guards-officers/" }
  let(:short_url) { "https://bit.ly/3d7N2vV" }

  let(:response) { double("HTTParty::Response", :[] => short_url, success?: true) }

  after(:all) do
    Bitly::Client.configuration = nil
  end

  context "#new" do
    it "initializes with optional parameters" do
      subject = described_class.new(long_url, api_token, api_url)
      expect(subject.api_token).to match api_token
      expect(subject.api_url).to match api_url
      expect(subject.long_url).to match long_url
    end

    it "initializes with default parameters" do
      Bitly::Client.configure do |config|
        config.api_token = config_token
        config.api_url = config_url
      end
      subject = described_class.new(long_url)
      expect(subject.api_token).to match config_token
      expect(subject.api_url).to match config_url
      expect(subject.long_url).to match long_url
    end
  end

  context ".shorten" do
    it "returns a shortened URL" do
      allow(HTTParty).to receive(:post).and_return(response)
      expect(described_class.new(long_url).shorten).to match short_url
    end
  end
end
