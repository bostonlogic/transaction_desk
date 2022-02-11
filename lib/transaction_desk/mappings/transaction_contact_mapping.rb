module TransactionDesk
  class TransactionContactMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionContact

      scoped :read do
        property :id
        property :preferred_name, key: 'preferredName'
        property :first_name,     key: 'firstName'
        property :middle_name,    key: 'middleName'
        property :last_name,      key: 'lastName'
        property :full_address,   key: 'fullAddress'
        property :city
        property :state
        property :zip_code,       key: 'zipCode'
        property :phone
        property :fax
        property :cell
        property :email
        property :company
        property :type_id,        key: 'typeId'
        property :transaction_id, key: 'transactionId'
      end

      scoped :create do
        property :preferred_name, key: 'preferredName'
        property :first_name,     key: 'firstName'
        property :middle_name,    key: 'middleName'
        property :last_name,      key: 'lastName'
        property :full_address,   key: 'fullAddress'
        property :city
        property :state
        property :zip_code,       key: 'zipCode'
        property :phone
        property :fax
        property :cell
        property :email
        property :company
        property :type_id,        key: 'typeId'
      end

      scoped :created do
        property :id
      end

      scoped :update do
        property :preferred_name, key: 'preferredName'
        property :first_name,     key: 'firstName'
        property :middle_name,    key: 'middleName'
        property :last_name,      key: 'lastName'
        property :full_address,   key: 'fullAddress'
        property :city
        property :state
        property :zip_code,       key: 'zipCode'
        property :phone
        property :fax
        property :cell
        property :email
        property :company
        property :type_id,        key: 'typeId'
      end

    end
  end
end
