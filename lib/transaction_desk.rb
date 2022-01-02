require 'transaction_desk/version'
require 'transaction_desk/configuration'
require 'resource_kit'
require 'kartograph'

module TransactionDesk
  autoload :Client, 'transaction_desk/client'

  autoload :ListingMapping, 'transaction_desk/mappings/listing_mapping'
  autoload :PropertyMapping, 'transaction_desk/mappings/property_mapping'
  autoload :PurchaseMapping, 'transaction_desk/mappings/purchase_mapping'
  autoload :TransactionContactMapping, 'transaction_desk/mappings/transaction_contact_mapping'
  autoload :TransactionDetailMapping, 'transaction_desk/mappings/transaction_detail_mapping'
  autoload :TransactionDocumentMapping, 'transaction_desk/mappings/transaction_document_mapping'
  autoload :TransactionMapping, 'transaction_desk/mappings/transaction_mapping'

  autoload :BaseModel, 'transaction_desk/models/base_model'
  autoload :Listing, 'transaction_desk/models/listing'
  autoload :Property, 'transaction_desk/models/property'
  autoload :Purchase, 'transaction_desk/models/purchase'
  autoload :TransactionContact, 'transaction_desk/models/transaction_contact'
  autoload :TransactionDetail, 'transaction_desk/models/transaction_detail'
  autoload :TransactionDocument, 'transaction_desk/models/transaction_document'
  autoload :Transaction, 'transaction_desk/models/transaction'

  autoload :TransactionContactResource, 'transaction_desk/resources/transaction_contact_resource'
  autoload :TransactionDetailResource, 'transaction_desk/resources/transaction_detail_resource'
  autoload :TransactionDocumentResource, 'transaction_desk/resources/transaction_document_resource'
  autoload :TransactionResource, 'transaction_desk/resources/transaction_resource'

  autoload :ErrorHandlingResourcable, 'transaction_desk/error_handling_resourcable'

  autoload :ErrorMapping, 'transaction_desk/mappings/error_mapping'

  Error = Class.new(StandardError)
  UnauthorizedError = Class.new(TransactionDesk::Error)
end
