module TransactionDesk
  class TransactionMapping
    include Kartograph::DSL

    kartograph do
      mapping Transaction

      scoped :read do
        property :id
        property :name
        property :status_id, key: 'statusId'
        property :type_id,   key: 'typeId'
        property :owner_id,  key: 'ownerId'
        property :date_created, key: 'dateCreated'
        property :last_modified, key: 'lastModified'
      end

      scoped :create, :update do
        property :name
        property :status_id, key: 'statusId'
        property :type_id,   key: 'typeId'
      end

      scoped :created do      
        property :id
      end

    end
  end
end
