require 'nokogiri'

module VineApp
  class Middleware < Faraday::Middleware
    # Register the adapter
    Faraday.register_middleware :response, :vine_app_middleware => VineApp::Middleware

    def call(env)
      @app.call(env).on_complete do |e|
        e[:body] = parse(e[:body])
      end
    end

    def parse(body)
      out = {}
      Nokogiri::HTML(body).xpath("//meta[starts-with(@property, 'twitter')]").each do |el|
        out[el['property'].gsub(/twitter:/, '').gsub(/:/,'_')] = el['content']
      end
      out
    end
  end
end
