require 'test_helper'

class TransactionDesk::TransactionTypeResourceTest < Minitest::Test

  class All < Minitest::Test
    def test_returns_an_array_of_transaction_types
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/types').
        to_return(status: 200, body: api_fixture('transaction_types/all'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionTypeResource.new(connection: connection)

      transaction_types = resource.all(transaction_id: 1234)

      assert_instance_of Array, transaction_types
      transaction_types.each{ |transaction_type| assert_instance_of TransactionDesk::TransactionType, transaction_type }
    end
  end

  class Find < Minitest::Test
    def test_returns_a_transaction_contact_type
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/types/1234').
        to_return(status: 200, body: api_fixture('transaction_types/1234'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionTypeResource.new(connection: connection)

      transaction_type = resource.find(transaction_type_id: 1234)

      assert_instance_of TransactionDesk::TransactionType, transaction_type
      assert_equal '1234', transaction_type.id
      assert_equal 'Commercial Lease', transaction_type.name
      assert_equal '476ba212-d96d-49e5-82df-3f474d9e9188', transaction_type.owner_id
      assert_equal '2012-01-18T20:42:38.737', transaction_type.date_created
      assert_equal '2012-01-18T20:42:38.737', transaction_type.last_modified
    end
  end

  class Create < Minitest::Test
    def test_creates_and_returns_a_transaction_contact_type
      transaction_desk_contact_type = TransactionDesk::TransactionType.new(
        name: 'Taifa Ngao Elder'
      )

      stub_request(:post, 'https://api.pre.transactiondesk.com/v2/transactions/types').
        with(body: "{\"name\":\"Taifa Ngao Elder\"}").
        to_return(status: 200, body: api_fixture('transaction_types/create'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionTypeResource.new(connection: connection)

      transaction_type = resource.create(transaction_desk_contact_type)

      assert_instance_of TransactionDesk::TransactionType, transaction_type
      assert_equal 'ee9d3620-9b2f-437d-b522-3c785dbbfacd', transaction_type.id
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_contact_type_and_returns_true
      transaction_desk_contact_type = TransactionDesk::TransactionType.new(
        name: 'Taifa Ngao Elder Emeritus'
      )

      stub_request(:patch, 'https://api.pre.transactiondesk.com/v2/transactions/types/121314').
        with(body: "{\"name\":\"Taifa Ngao Elder Emeritus\"}").
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionTypeResource.new(connection: connection)

      transaction_contact_type = resource.update(transaction_desk_contact_type, transaction_type_id: 121314)

      assert_equal true, transaction_contact_type
    end
  end

  class Destroy < Minitest::Test
    def test_returns_true_for_a_destroy_response
      stub_request(:delete, 'https://api.pre.transactiondesk.com/v2/transactions/types/121314').
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionTypeResource.new(connection: connection)

      transaction_contact_type = resource.destroy(transaction_type_id: 121314)

      assert_equal true, transaction_contact_type
    end
  end

end
