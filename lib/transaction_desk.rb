require 'transaction_desk/version'
require 'transaction_desk/configuration'
require 'resource_kit'
require 'kartograph'

module TransactionDesk
  autoload :Client, 'transaction_desk/client'

  autoload :TransactionMapping, 'transaction_desk/mappings/transaction_mapping'

  autoload :BaseModel, 'transaction_desk/models/base_model'
  autoload :Transaction, 'transaction_desk/models/transaction'

  autoload :TransactionResource, 'transaction_desk/resources/transaction_resource'

  autoload :ErrorHandlingResourcable, 'transaction_desk/error_handling_resourcable'

  autoload :ErrorMapping, 'transaction_desk/mappings/error_mapping'

  Error = Class.new(StandardError)
  UnauthorizedError = Class.new(TransactionDesk::Error)
end
