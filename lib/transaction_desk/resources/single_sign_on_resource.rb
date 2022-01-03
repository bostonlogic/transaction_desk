module TransactionDesk
  class SingleSignOnResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /view-url
      action :dashboard do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/view-url"
        handler(200) { |response| SingleSignOnMapping.extract_single(convert_response_to_valid_json(response.body), :read) }
      end

      # GET /transactions/view-url
      action :transactions do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/view-url"
        handler(200) { |response| SingleSignOnMapping.extract_single(convert_response_to_valid_json(response.body), :read) }
      end

      # GET /transactions/:transaction_id/view-url
      action :transaction do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/view-url"
        handler(200) { |response| SingleSignOnMapping.extract_single(convert_response_to_valid_json(response.body), :read) }
      end

    end

    def convert_response_to_valid_json(response_body)
      {
        link: response_body.gsub(%r(\s|{|}|"|"), '')
      }.to_json
    end

  end
end
