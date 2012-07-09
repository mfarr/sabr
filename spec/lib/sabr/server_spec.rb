require 'spec_helper'
describe Sabr::Server do

  context "Valid API Key" do
    before(:each) do
      @server = Sabr::Server.new(SabrTest::BASE_URL, SabrTest::API_KEY)
    end

    describe "version" do
      it "should return version information", :vcr do
        @server.version.has_key?("version").should be_true
      end
    end

    describe "categories" do
      it "should return a list of categories", :vcr do
        @server.categories.has_key?("categories").should be_true
      end
    end

    describe "warnings" do
      it "should return a list of warnings", :vcr do
        @server.warnings.has_key?("warnings").should be_true
      end
    end

    describe "scripts" do
      it "should return a list of scripts", :vcr do
        @server.scripts.has_key?("scripts").should be_true
      end
    end

    describe "restart", :vcr do
      it "should restart the server" do
        # @server.restart["status"].should be_true
      end
    end
  end

  context "Invalid API Key" do
    it "should fail on invalid key", :vcr do
      server = Sabr::Server.new(SabrTest::BASE_URL, SabrTest::INVALID_KEY)
      response = server.categories
      response.has_key?("categories").should_not be_true
      response["status"].should_not be_true
    end
  end
end

