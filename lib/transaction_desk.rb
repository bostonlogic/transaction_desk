require 'transaction_desk/version'
require 'transaction_desk/configuration'

module TransactionDesk
  autoload :Client, 'transaction_desk/client'
  Error = Class.new(StandardError)
  UnauthorizedError = Class.new(TransactionDesk::Error)
end
