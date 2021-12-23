require 'transaction_desk/version'
require 'transaction_desk/configuration'

module TransactionDesk
  Error = Class.new(StandardError)
  UnauthorizedError = Class.new(TransactionDesk::Error)
end
