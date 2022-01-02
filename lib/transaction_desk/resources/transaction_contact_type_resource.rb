module TransactionDesk
  class TransactionContactTypeResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /contacts/types
      action :all do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/contacts/types"
        handler(200) { |response| TransactionContactTypeMapping.extract_collection(response.body, :read) }
      end

      # GET /contacts/types/:contact_type_id
      action :find do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/contacts/types/:contact_type_id"
        handler(200) { |response| TransactionContactTypeMapping.extract_single(response.body, :read) }
      end

      # POST /contacts/types
      action :create do
        verb :post
        body { |object| TransactionContactTypeMapping.representation_for(:create, object) }
        path "#{TransactionDesk.configuration.path_url}/transactions/contacts/types"
        handler(200) { |response| TransactionContactTypeMapping.extract_single(response.body, :created) }
      end

      # PATCH /contacts/types/:contact_type_id
      action :update do
        verb :patch
        body { |object| TransactionContactTypeMapping.hash_for(:update, object).select{ |_, value| !value.nil? }.to_json }
        path "#{TransactionDesk.configuration.path_url}/transactions/contacts/types/:contact_type_id"
        handler(200) { |_| true }
      end

      # DELETE /contacts/types/:contact_type_id
      action :destroy do
        verb :delete
        path "#{TransactionDesk.configuration.path_url}/transactions/contacts/types/:contact_type_id"
        handler(200) { |_| true }
      end

    end

  end
end
