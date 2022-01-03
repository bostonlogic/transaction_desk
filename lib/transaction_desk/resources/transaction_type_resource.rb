module TransactionDesk
  class TransactionTypeResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /transactions/types
      action :all do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/types"
        handler(200) { |response| TransactionTypeMapping.extract_collection(response.body, :read) }
      end

      # GET /transactions/types/:transaction_type_id
      action :find do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/types/:transaction_type_id"
        handler(200) { |response| TransactionTypeMapping.extract_single(response.body, :read) }
      end

      # POST /transactions/types
      action :create do
        verb :post
        body { |object| TransactionTypeMapping.representation_for(:create, object) }
        path "#{TransactionDesk.configuration.path_url}/transactions/types"
        handler(200) { |response| TransactionTypeMapping.extract_single(response.body, :created) }
      end

      # PATCH /transactions/types/:transaction_type_id
      action :update do
        verb :patch
        body { |object| TransactionTypeMapping.hash_for(:update, object).select{ |_, value| !value.nil? }.to_json }
        path "#{TransactionDesk.configuration.path_url}/transactions/types/:transaction_type_id"
        handler(200) { |_| true }
      end

      # DELETE /transactions/types/:transaction_type_id
      action :destroy do
        verb :delete
        path "#{TransactionDesk.configuration.path_url}/transactions/types/:transaction_type_id"
        handler(200) { |_| true }
      end

    end

  end
end
