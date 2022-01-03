require 'test_helper'

class TransactionDesk::TransactionStatusResourceTest < Minitest::Test

  class All < Minitest::Test
    def test_returns_an_array_of_transaction_types
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/statuses').
        to_return(status: 200, body: api_fixture('transaction_statuses/all'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionStatusResource.new(connection: connection)

      transaction_statuses = resource.all(transaction_id: 1234)

      assert_instance_of Array, transaction_statuses
      transaction_statuses.each{ |transaction_status| assert_instance_of TransactionDesk::TransactionStatus, transaction_status }
    end
  end

  class Find < Minitest::Test
    def test_returns_a_transaction_contact_type
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/statuses/1234').
        to_return(status: 200, body: api_fixture('transaction_statuses/1234'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionStatusResource.new(connection: connection)

      transaction_status = resource.find(transaction_status_id: 1234)

      assert_instance_of TransactionDesk::TransactionStatus, transaction_status
      assert_equal '1234', transaction_status.id
      assert_equal 'Active', transaction_status.name
      assert_equal 'edf03143-99f0-4afe-b720-682021a70c24', transaction_status.owner_id
      assert_equal '2008-03-02T04:26:50.607+00:00', transaction_status.date_created
      assert_equal '2008-03-02T04:26:50.607+00:00', transaction_status.last_modified
    end
  end

  class Create < Minitest::Test
    def test_creates_and_returns_a_transaction_contact_type
      transaction_desk_transaction_status = TransactionDesk::TransactionStatus.new(
        name: 'Hatut Zeraze'
      )

      stub_request(:post, 'https://api.pre.transactiondesk.com/v2/transactions/statuses').
        with(body: "{\"name\":\"Hatut Zeraze\"}").
        to_return(status: 200, body: api_fixture('transaction_statuses/create'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionStatusResource.new(connection: connection)

      transaction_status = resource.create(transaction_desk_transaction_status)

      assert_instance_of TransactionDesk::TransactionStatus, transaction_status
      assert_equal 'ee9d3620-9b2f-437d-b522-3c785dbbfacd', transaction_status.id
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_contact_type_and_returns_true
      transaction_desk_transaction_status = TransactionDesk::TransactionStatus.new(
        name: 'Hatut Zeraze Emerita'
      )

      stub_request(:patch, 'https://api.pre.transactiondesk.com/v2/transactions/statuses/121314').
        with(body: "{\"name\":\"Hatut Zeraze Emerita\"}").
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionStatusResource.new(connection: connection)

      transaction_status = resource.update(transaction_desk_transaction_status, transaction_status_id: 121314)

      assert_equal true, transaction_status
    end
  end

  class Destroy < Minitest::Test
    def test_returns_true_for_a_destroy_response
      stub_request(:delete, 'https://api.pre.transactiondesk.com/v2/transactions/statuses/121314').
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionStatusResource.new(connection: connection)

      transaction_status = resource.destroy(transaction_status_id: 121314)

      assert_equal true, transaction_status
    end
  end

end
