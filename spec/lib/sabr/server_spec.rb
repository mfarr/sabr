require "sabr"
describe Sabr::Server do

  before do
    @base_url = "http://localhost:8080/sabnzbd/api"
    @api_key = "7cc2325f8af0e85852ca9e9bf0ecc624"
    @invalid_key = "invalid"
  end

  context "Valid API Key" do
    before(:each) do
      @server = Sabr::Server.new(@base_url, @api_key)
    end

    describe "version" do
      it "should return version information" do
        @server.version.has_key?("version").should be_true
      end
    end

    describe "categories" do
      it "should return a list of categories" do
        @server.categories.has_key?("categories").should be_true
      end
    end

    describe "warnings" do
      it "should return a list of warnings" do
        @server.warnings.has_key?("warnings").should be_true
      end
    end

    describe "scripts" do
      it "should return a list of scripts" do
        @server.scripts.has_key?("scripts").should be_true
      end
    end

    describe "restart" do
      it "should restart the server" do
        # @server.restart["status"].should be_true
      end
    end
  end

  context "Invalid API Key" do
    it "should fail on invalid key" do
      server = Sabr::Server.new(@base_url, @invalid_key)
      response = server.categories
      response.has_key?("categories").should_not be_true
      response["status"].should_not be_true
    end
  end
end

