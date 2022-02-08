module TransactionDesk
  class TransactionDetailMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionDetail

      scoped :read, :update do
        property :property_information, include: PropertyInformationMapping, key: 'property'
        property :listing_information,  include: ListingInformationMapping, key: 'listing'
        property :sale_information, include: SaleInformationMapping, key: 'purchase'
      end

    end
  end
end
