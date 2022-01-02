module TransactionDesk
  class TransactionContact < BaseModel
    attribute :id
    attribute :preferred_name
    attribute :first_name
    attribute :middle_name
    attribute :last_name
    attribute :full_address
    attribute :city
    attribute :state
    attribute :zip_code
    attribute :phone
    attribute :fax
    attribute :cell
    attribute :email
    attribute :company
    attribute :type_id
    attribute :transaction_id
  end
end
