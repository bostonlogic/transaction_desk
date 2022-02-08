module TransactionDesk
  class TransactionDetail < BaseModel
    attribute :property_information, PropertyInformation
    attribute :listing_information, ListingInformation
    attribute :sale_information, SaleInformation
  end
end
