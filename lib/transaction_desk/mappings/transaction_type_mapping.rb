module TransactionDesk
  class TransactionTypeMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionType

      scoped :read do
        property :id
        property :name
        property :owner_id,      key: 'ownerId'
        property :date_created,  key: 'dateCreated'
        property :last_modified, key: 'lastModified'
      end

      scoped :create, :update do
        property :name
      end

      scoped :created do
        property :id
      end

    end

  end
end
