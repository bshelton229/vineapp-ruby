require 'faraday'
require 'vine_app/middleware'

module VineApp
  class Client
    DEFAULT_ENDPOINT = 'https://vine.co/v/'

    def get(resource)
      conn.get(resource).body
    end

    def conn
      @conn ||= Faraday.new(:url => DEFAULT_ENDPOINT, :ssl => { :verify => false }) do |conn|
        conn.response :vine_app_middleware
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
