module TransactionDesk
  class Purchase < BaseModel
    attribute :purchase_price
    attribute :offer_date
    attribute :offer_expiration_date
    attribute :offer_acceptance_date
    attribute :application_date
    attribute :approval_date
    attribute :deposit_amount
    attribute :additional_deposit_amount
    attribute :additional_deposit_date
    attribute :funding_date
    attribute :possession_date
    attribute :closing_date
  end
end
