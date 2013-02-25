require "vine_app/client"
require 'vine_app/resource'
require "vine_app/version"

module VineApp
  class << self
    # Get a vine video
    # Should return an instance of Vine::Resource
    def get(id_or_url)
      id = ( match = %r(vine.co/v/([^/]+)).match(id_or_url) ) ? match[1] : id_or_url
      VineApp::Resource.new client.get(id_or_url)
    end

    def client
      @client ||= VineApp::Client.new
    end
  end
end
