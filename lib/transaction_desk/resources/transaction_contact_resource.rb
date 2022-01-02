module TransactionDesk
  class TransactionContactResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /transactions/:transaction_id/contacts
      action :all do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/contacts"
        handler(200) { |response| TransactionContactMapping.extract_collection(response.body, :read) }
      end

      # GET /transactions/:transaction_id/contacts/:contact_id
      action :find do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/contacts/:contact_id"
        handler(200) { |response| TransactionContactMapping.extract_single(response.body, :read) }
      end

      # POST /transactions/:transaction_id/contacts
      action :create do
        verb :post
        body { |object| TransactionContactMapping.representation_for(:create, object) }
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/contacts"
        handler(200) { |response| TransactionContactMapping.extract_single(response.body, :created) }
      end

      # PATCH /transactions/:transaction_id/contacts/:contact_id
      action :update do
        verb :patch
        body { |object| TransactionContactMapping.hash_for(:update, object).select{ |_, value| !value.nil? }.to_json }
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/contacts/:contact_id"
        handler(200) { |_| true }
      end

      # DELETE /transactions/:transaction_id/contacts/:contact_id
      action :destroy do
        verb :delete
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/contacts/:contact_id"
        handler(200) { |_| true }
      end

    end

  end
end
