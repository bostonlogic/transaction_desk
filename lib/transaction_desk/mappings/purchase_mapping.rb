module TransactionDesk
  class PurchaseMapping
    include Kartograph::DSL

    kartograph do
      mapping Purchase

      scoped :read, :update do
        property :purchase_price,            key: 'purchasePrice'
        property :offer_date,                key: 'offerDate'
        property :offer_expiration_date,     key: 'offerExpirationDate'
        property :offer_acceptance_date,     key: 'offerAcceptanceDate'
        property :application_date,          key: 'applicationDate'
        property :approval_date,             key: 'approvalDate'
        property :deposit_amount,            key: 'depositAmount'
        property :additional_deposit_amount, key: 'additionalDepositAmount'
        property :additional_deposit_date,   key: 'additionalDepositDate'
        property :funding_date,              key: 'fundingDate'
        property :possession_date,           key: 'possessionDate'
        property :closing_date,              key: 'closingDate'
      end

    end
  end
end
