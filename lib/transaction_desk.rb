require 'transaction_desk/version'
require 'transaction_desk/configuration'
require 'transaction_desk/global_type_guids'
require 'resource_kit'
require 'kartograph'

module TransactionDesk
  autoload :Client, 'transaction_desk/client'

  autoload :ListingInformationMapping, 'transaction_desk/mappings/listing_information_mapping'
  autoload :MetadataMapping, 'transaction_desk/mappings/metadata_mapping'
  autoload :PropertyInformationMapping, 'transaction_desk/mappings/property_information_mapping'
  autoload :SaleInformationMapping, 'transaction_desk/mappings/sale_information_mapping'
  autoload :SingleSignOnMapping, 'transaction_desk/mappings/single_sign_on_mapping'
  autoload :TransactionContactMapping, 'transaction_desk/mappings/transaction_contact_mapping'
  autoload :TransactionContactTypeMapping, 'transaction_desk/mappings/transaction_contact_type_mapping'
  autoload :TransactionDetailMapping, 'transaction_desk/mappings/transaction_detail_mapping'
  autoload :TransactionDocumentMapping, 'transaction_desk/mappings/transaction_document_mapping'
  autoload :TransactionStatusMapping, 'transaction_desk/mappings/transaction_status_mapping'
  autoload :TransactionTypeMapping, 'transaction_desk/mappings/transaction_type_mapping'
  autoload :TransactionMapping, 'transaction_desk/mappings/transaction_mapping'

  autoload :BaseModel, 'transaction_desk/models/base_model'
  autoload :ListingInformation, 'transaction_desk/models/listing_information'
  autoload :Metadata, 'transaction_desk/models/metadata'
  autoload :PropertyInformation, 'transaction_desk/models/property_information'
  autoload :SaleInformation, 'transaction_desk/models/sale_information'
  autoload :SingleSignOn, 'transaction_desk/models/single_sign_on'
  autoload :TransactionContact, 'transaction_desk/models/transaction_contact'
  autoload :TransactionContactType, 'transaction_desk/models/transaction_contact_type'
  autoload :TransactionDetail, 'transaction_desk/models/transaction_detail'
  autoload :TransactionDocument, 'transaction_desk/models/transaction_document'
  autoload :TransactionStatus, 'transaction_desk/models/transaction_status'
  autoload :TransactionType, 'transaction_desk/models/transaction_type'
  autoload :Transaction, 'transaction_desk/models/transaction'

  autoload :MetadataResource, 'transaction_desk/resources/metadata_resource'
  autoload :SingleSignOnResource, 'transaction_desk/resources/single_sign_on_resource'
  autoload :TransactionContactResource, 'transaction_desk/resources/transaction_contact_resource'
  autoload :TransactionContactTypeResource, 'transaction_desk/resources/transaction_contact_type_resource'
  autoload :TransactionDetailResource, 'transaction_desk/resources/transaction_detail_resource'
  autoload :TransactionDocumentResource, 'transaction_desk/resources/transaction_document_resource'
  autoload :TransactionStatusResource, 'transaction_desk/resources/transaction_status_resource'
  autoload :TransactionTypeResource, 'transaction_desk/resources/transaction_type_resource'
  autoload :TransactionResource, 'transaction_desk/resources/transaction_resource'

  autoload :ErrorHandlingResourcable, 'transaction_desk/error_handling_resourcable'
  autoload :PaginatedResource, 'transaction_desk/paginated_resource'

  autoload :ErrorMapping, 'transaction_desk/mappings/error_mapping'

  Error = Class.new(StandardError)
  UnauthorizedError = Class.new(TransactionDesk::Error)
  UnsupportedApiVersionError = Class.new(TransactionDesk::Error)
  NotFoundError = Class.new(TransactionDesk::Error)
end
