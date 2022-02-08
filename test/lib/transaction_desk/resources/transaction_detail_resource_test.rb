require 'test_helper'

class TransactionDesk::TransactionDetailResourceTest < Minitest::Test

  class Find < Minitest::Test

    def test_returns_a_transaction_detail
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/details').
        to_return(status: 200, body: api_fixture('transaction_details/show'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDetailResource.new(connection: connection)

      transaction_detail = resource.find(transaction_id: 1234)

      assert_instance_of TransactionDesk::TransactionDetail, transaction_detail
      assert_instance_of TransactionDesk::ListingInformation, transaction_detail.listing_information
      assert_instance_of TransactionDesk::PropertyInformation, transaction_detail.property_information
      assert_instance_of TransactionDesk::SaleInformation, transaction_detail.sale_information

      assert_equal '421126', transaction_detail.listing_information.mls_number
      assert_equal '200000', transaction_detail.listing_information.list_price
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.listing_information.expiration_date
      assert_equal 'Dishwasher, Stove, Fridge', transaction_detail.listing_information.property_includes
      assert_equal 'Washer, Dryer', transaction_detail.listing_information.property_excludes
      assert_equal 'Hot Water Tank', transaction_detail.listing_information.leased_items

      assert_equal 'Wellington Rd.', transaction_detail.property_information.street_name
      assert_equal '200', transaction_detail.property_information.street_number
      assert_equal 'ON', transaction_detail.property_information.state
      assert_equal 'London', transaction_detail.property_information.city
      assert_equal 'Middlesex', transaction_detail.property_information.county
      assert_equal 'N6E 38B', transaction_detail.property_information.zip_code
      assert_equal 'White Oaks', transaction_detail.property_information.sub_division
      assert_equal '8', transaction_detail.property_information.lot_number
      assert_equal '20', transaction_detail.property_information.block
      assert_equal '5', transaction_detail.property_information.page_number
      assert_equal '33', transaction_detail.property_information.plat_book
      assert_equal '1980', transaction_detail.property_information.year_built
      assert_equal 'Aquinis School District', transaction_detail.property_information.school_district
      assert_equal 'Residential', transaction_detail.property_information.zoning_class
      assert_equal '112-1231-999', transaction_detail.property_information.tax_number
      assert_equal 'Essex', transaction_detail.property_information.township
      assert_equal 'PL ; Lot ; Bl ; DL ; LD ; S ; Twn ; Rge ; M ; Lot A, Section 75, Victoria District, Plan 42316', transaction_detail.property_information.legal_description

      assert_equal '190000', transaction_detail.sale_information.purchase_price
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.offer_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.offer_expiration_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.offer_acceptance_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.application_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.approval_date
      assert_equal '50000', transaction_detail.sale_information.deposit_amount
      assert_equal '10000', transaction_detail.sale_information.additional_deposit_amount
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.additional_deposit_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.funding_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.possession_date
      assert_equal '2012-04-23T18:25:43.51', transaction_detail.sale_information.closing_date
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_detail_and_returns_true
      transaction_detail = TransactionDesk::TransactionDetail.new(
        property_information: TransactionDesk::PropertyInformation.new(school_district: 'West and Essex School District', year_built: 1979),
        listing_information:  TransactionDesk::ListingInformation.new(mls_number: '101010', listing_price: '250000'),
        sale_information: TransactionDesk::SaleInformation.new(deposit_amount: '69420', additional_deposit_amount: '1337')
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
