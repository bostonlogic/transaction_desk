module TransactionDesk
  class Listing < BaseModel
    attribute :mls_number
    attribute :list_price
    attribute :expiration_date
    attribute :property_includes
    attribute :property_excludes
    attribute :leased_items
  end
end
