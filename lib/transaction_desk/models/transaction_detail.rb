module TransactionDesk
  class TransactionDetail < BaseModel
    attribute :property, Property
    attribute :listing, Listing
    attribute :purchase, Purchase
  end
end
