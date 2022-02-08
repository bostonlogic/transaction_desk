module TransactionDesk
  class MetadataResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /transactions/statuses/meta
      action :fetch_metadata do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/statuses/meta"
        handler(200) { |response| MetadataMapping.extract_single(response.body, :metadata) }
      end

      # GET /transactions/statuses/meta/properties
      action :fetch_metadata_properties do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/statuses/meta/properties"
        handler(200) { |response| MetadataMapping.extract_collection(response.body, :properties) }
      end

    end

  end
end
