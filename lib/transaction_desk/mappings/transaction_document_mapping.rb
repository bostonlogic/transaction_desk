module TransactionDesk
  class TransactionDocumentMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionDocument

      scoped :all do
        property :id
        property :file_type_id,  key: 'fileTypeId'
        property :document_name, key: 'documentName'
        property :date_created,  key: 'dateCreated'
        property :last_modified, key: 'lastModified'
      end

      scoped :read do
        property :id
        property :file_type_id,  key: 'fileTypeId'
        property :document_name, key: 'documentName'
        property :date_created,  key: 'dateCreated'
        property :last_modified, key: 'lastModified'
        property :binary
      end

      scoped :create do
        property :document_name, key: 'file_name'
        property :file_extension
        property :raw_text, key: 'Raw Text'
      end

      scoped :created do
        property :id
      end

      scoped :update do
        property :id
        property :file_extension
        property :raw_text, key: 'Raw Text'
      end

    end
  end
end
