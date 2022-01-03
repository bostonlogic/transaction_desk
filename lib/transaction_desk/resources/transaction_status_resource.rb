module TransactionDesk
  class TransactionStatusResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /transactions/statuses
      action :all do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/statuses"
        handler(200) { |response| TransactionStatusMapping.extract_collection(response.body, :read) }
      end

      # GET /transactions/statuses/:transaction_status_id
      action :find do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/statuses/:transaction_status_id"
        handler(200) { |response| TransactionStatusMapping.extract_single(response.body, :read) }
      end

      # POST /transactions/statuses
      action :create do
        verb :post
        body { |object| TransactionStatusMapping.representation_for(:create, object) }
        path "#{TransactionDesk.configuration.path_url}/transactions/statuses"
        handler(200) { |response| TransactionStatusMapping.extract_single(response.body, :created) }
      end

      # PATCH /transactions/statuses/:transaction_status_id
      action :update do
        verb :patch
        body { |object| TransactionStatusMapping.hash_for(:update, object).select{ |_, value| !value.nil? }.to_json }
        path "#{TransactionDesk.configuration.path_url}/transactions/statuses/:transaction_status_id"
        handler(200) { |_| true }
      end

      # DELETE /transactions/statuses/:transaction_status_id
      action :destroy do
        verb :delete
        path "#{TransactionDesk.configuration.path_url}/transactions/statuses/:transaction_status_id"
        handler(200) { |_| true }
      end

    end

  end
end
