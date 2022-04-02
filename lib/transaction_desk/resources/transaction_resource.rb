module TransactionDesk
  class TransactionResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /transactions
      action :all do
        verb :get
        query_keys :name, :'$take', :'$skip', :'$orderBy', :'$orderDir'
        path "#{TransactionDesk.configuration.path_url}/transactions"
        handler(200) { |response| TransactionMapping.extract_collection(response.body, :read) }
      end

      # GET /transactions/:transaction_id
      action :find do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id"
        handler(200) { |response| TransactionMapping.extract_single(response.body, :read) }
      end

      # POST /transactions
      action :create do
        verb :post
        body { |object| TransactionMapping.representation_for(:create, object) }
        path "#{TransactionDesk.configuration.path_url}/transactions"
        handler(200) { |response| TransactionMapping.extract_single(convert_response_to_valid_json(response.body), :created) }
      end

      # PATCH /transactions/:transaction_id
      action :update do
        verb :patch
        body { |object| TransactionMapping.hash_for(:update, object).select{ |_, value| !value.nil? }.to_json }
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id"
        handler(200) { |_| true }
      end

      # DELETE /transactions/:transaction_id
      action :destroy do
        verb :delete
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id"
        handler(200) { |_| true }
      end

    end

    def convert_response_to_valid_json(response_body)
      {
        id: response_body.gsub(%r(\s|{|}|"|"), '')
      }.to_json
    end

    def all(*args)
      PaginatedResource.new(action(:all), self, *args)
    end

  end
end
