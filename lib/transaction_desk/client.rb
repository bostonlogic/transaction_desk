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

    def resources
      @resources ||= {}
    end

    def self.resources
        transaction_contacts: TransactionContactResource,
        transaction_contact_types: TransactionContactTypeResource,
        transaction_details: TransactionDetailResource,
        transaction_documents: TransactionDocumentResource,
        transaction_statuses: TransactionStatusResource,
        transaction_types: TransactionTypeResource,
        transactions: TransactionResource
      }
    end

    def method_missing(name, *args, &block)
      if self.class.resources.keys.include?(name)
        resources[name] ||= self.class.resources[name].new(connection: connection)
        resources[name]
      else
        super
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
