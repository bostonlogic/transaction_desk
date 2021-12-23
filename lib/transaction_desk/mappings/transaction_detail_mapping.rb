module TransactionDesk
  class TransactionDetailMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionDetail

      scoped :read, :update do
        property :property, include: PropertyMapping
        property :listing,  include: ListingMapping
        property :purchase, include: PurchaseMapping
      end

    end
  end
end
