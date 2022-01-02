module TransactionDesk
  class TransactionContactType < BaseModel
    attribute :id
    attribute :name
    attribute :owner_id
    attribute :date_created
    attribute :last_modified
  end
end
