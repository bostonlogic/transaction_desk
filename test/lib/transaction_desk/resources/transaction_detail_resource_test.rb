require 'test_helper'

class TransactionDesk::TransactionDetailResourceTest < Minitest::Test

  class Fetch < Minitest::Test

    def test_returns_a_transaction_detail
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/details').
        to_return(status: 200, body: api_fixture('transaction_details/show'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDetailResource.new(connection: connection)

      transaction_detail = resource.fetch(transaction_id: 1234)

      assert_instance_of TransactionDesk::TransactionDetail, transaction_detail
      assert_instance_of TransactionDesk::Listing, transaction_detail.listing
      assert_instance_of TransactionDesk::Property, transaction_detail.property
      assert_instance_of TransactionDesk::Purchase, transaction_detail.purchase

      assert_equal '421126', transaction_detail.listing.mls_number
      assert_equal '200000', transaction_detail.listing.list_price
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.listing.expiration_date
      assert_equal 'Dishwasher, Stove, Fridge', transaction_detail.listing.property_includes
      assert_equal 'Washer, Dryer', transaction_detail.listing.property_excludes
      assert_equal 'Hot Water Tank', transaction_detail.listing.leased_items

      assert_equal 'Wellington Rd.', transaction_detail.property.street_name
      assert_equal '200', transaction_detail.property.street_number
      assert_equal 'ON', transaction_detail.property.state
      assert_equal 'London', transaction_detail.property.city
      assert_equal 'Middlesex', transaction_detail.property.county
      assert_equal 'N6E 38B', transaction_detail.property.zip_code
      assert_equal 'White Oaks', transaction_detail.property.sub_division
      assert_equal '8', transaction_detail.property.lot_number
      assert_equal '20', transaction_detail.property.block
      assert_equal '5', transaction_detail.property.page_number
      assert_equal '33', transaction_detail.property.plat_book
      assert_equal '1980', transaction_detail.property.year_built
      assert_equal 'Aquinis School District', transaction_detail.property.school_district
      assert_equal 'Residential', transaction_detail.property.zoning_class
      assert_equal '112-1231-999', transaction_detail.property.tax_number
      assert_equal 'Essex', transaction_detail.property.township
      assert_equal 'PL ; Lot ; Bl ; DL ; LD ; S ; Twn ; Rge ; M ; Lot A, Section 75, Victoria District, Plan 42316', transaction_detail.property.legal_description

      assert_equal '190000', transaction_detail.purchase.purchase_price
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.offer_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.offer_expiration_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.offer_acceptance_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.application_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.approval_date
      assert_equal '50000', transaction_detail.purchase.deposit_amount
      assert_equal '10000', transaction_detail.purchase.additional_deposit_amount
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.additional_deposit_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.funding_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.possession_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.purchase.closing_date
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_detail_and_returns_true
      transaction_detail = TransactionDesk::TransactionDetail.new(
        property: TransactionDesk::Property.new(school_district: 'West and Essex School District', year_built: 1979),
        listing:  TransactionDesk::Listing.new(mls_number: '101010', listing_price: '250000'),
        purchase: TransactionDesk::Purchase.new(deposit_amount: '69420', additional_deposit_amount: '1337')
      )

      stub_request(:patch, 'https://api.pre.transactiondesk.com/v2/transactions/1234/details').
        with(body: "{\"property\":{\"yearBuilt\":1979,\"schoolDistrict\":\"West and Essex School District\"},\"listing\":{\"mlsNumber\":\"101010\"},\"purchase\":{\"depositAmount\":\"69420\",\"additionalDepositAmount\":\"1337\"}}").
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDetailResource.new(connection: connection)

      transaction_detail = resource.update(transaction_detail, transaction_id: 1234)

      assert_equal true, transaction_detail
    end
  end

end
