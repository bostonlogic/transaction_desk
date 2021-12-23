require 'faraday'

module TransactionDesk

  class Client

    attr_reader :access_token

    def initialize(access_token)
      @access_token = access_token
    end

    def connection
      @faraday ||= Faraday.new connection_options do |req|
        req.adapter :net_http
      end
    end

    private

    def connection_options
      {
        url: TransactionDesk.configuration.api_url,
        headers: {
          content_type:  'application/json',
          authorization: "Bearer #{access_token}"
        }
      }
    end

  end

end
