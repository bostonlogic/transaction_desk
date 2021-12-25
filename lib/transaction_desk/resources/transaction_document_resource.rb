module TransactionDesk
  class TransactionDocumentResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /transactions/:transaction_id/documents
      action :all do
        verb :get
        # query_keys :$orderDir
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/documents"
        handler(200) { |response| TransactionDocumentMapping.extract_collection(response.body, :read) }
      end

      # GET /transactions/:transaction_id/documents/:transaction_document_id
      action :find do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/documents/:transaction_document_id"
        handler(200) { |response| TransactionDocumentMapping.extract_single(response.body, :read) }
      end

      # POST /transactions/:transaction_id/documents
      action :create do
        verb :post
        body { |object| TransactionDocumentMapping.representation_for(:create, object) }
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/documents"
        handler(200) { |response| TransactionDocumentMapping.extract_single(response.body, :created) }
      end

      # PATCH /transactions/:transaction_id/documents/:transaction_document_id
      action :update do
        verb :patch
        body { |object| TransactionDocumentMapping.hash_for(:update, object).select{ |_, value| !value.nil? }.to_json }
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/documents/:transaction_document_id"
        handler(200) { |_| true }
      end

      # DELETE /transactions/:transaction_id/documents/:transaction_document_id
      action :destroy do
        verb :delete
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/documents/:transaction_document_id"
        handler(200) { |_| true }
      end

    end

  end
end
