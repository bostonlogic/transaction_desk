module TransactionDesk
  class TransactionType < BaseModel
    attribute :id
    attribute :name
    attribute :owner_id
    attribute :date_created
    attribute :last_modified
  end
end
