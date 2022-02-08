module TransactionDesk
  class ListingInformationMapping
    include Kartograph::DSL

    kartograph do
      mapping ListingInformation

      scoped :read, :update do
        property :mls_number,        key: 'mlsNumber'
        property :list_price,        key: 'listPrice'
        property :expiration_date,   key: 'expirationDate'
        property :property_includes, key: 'propertyIncludes'
        property :property_excludes, key: 'propertyExcludes'
        property :leased_items,      key: 'leasedItems'
      end

    end
  end
end
