module TransactionDesk
  class TransactionDocument < BaseModel
    attribute :id
    attribute :file_type_id
    attribute :document_name
    attribute :binary
    attribute :raw_text
    attribute :date_created
    attribute :last_modified

    attribute :file_extension
  end
end
