require "spec_helper"

RSpec.describe Bitly::Client do
  it "has a version number" do
    expect(described_class::VERSION).not_to be nil
  end

  context "#shorten" do
    it "raises an exception if no API token available" do
      expect { described_class.shorten("http://lyconic.com") }.to raise_error(Bitly::Client::ConfigError)
    end
  end
end
