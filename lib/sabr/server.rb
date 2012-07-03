require 'httparty'
module Sabr
  class Server
    include HTTParty

    def initialize(base_url, api_key)
      @base_url = base_url
      @api_key = api_key
    end

    def version
      request(:version)
    end

    def categories
      request(:get_cats)
    end

    def warnings
      request(:warnings)
    end

    private

    def request(mode, params = {})
      query = { :apikey => @api_key, :output => "json", :mode => mode }
      query.merge!(params)
      options = { :query => query }

      self.class.get(@base_url, options)
    end
  end
end
