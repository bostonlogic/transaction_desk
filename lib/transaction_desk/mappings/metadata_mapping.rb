module TransactionDesk
  class MetadataMapping
    include Kartograph::DSL

    kartograph do
      mapping Metadata

      scoped :metadata do
        property :default_take,  key: 'defaultTake'
        property :max_take,      key: 'maxTake'
        property :default_order, key: 'defaultOrder'
      end

      scoped :properties do
        property :name
        property :type
        property :can_filter,  key: 'canFilter'
        property :can_sort,    key: 'canSort'
        property :filter_type, key: 'filterType'
      end

    end
  end
end
