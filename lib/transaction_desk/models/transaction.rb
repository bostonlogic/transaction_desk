module TransactionDesk
  class Transaction < BaseModel
    attribute :id
    attribute :name
    attribute :status_id
    attribute :type_id
    attribute :owner_id
    attribute :date_created
    attribute :last_modified
  end
end
