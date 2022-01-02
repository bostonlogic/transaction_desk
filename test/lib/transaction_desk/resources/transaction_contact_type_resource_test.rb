require 'test_helper'

class TransactionDesk::TransactionContactTypeResourceTest < Minitest::Test

  class All < Minitest::Test
    def test_returns_an_array_of_transaction_contact_types
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/contacts/types').
        to_return(status: 200, body: api_fixture('transaction_contact_types/all'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactTypeResource.new(connection: connection)

      transaction_contact_types = resource.all(transaction_id: 1234)

      assert_instance_of Array, transaction_contact_types
      transaction_contact_types.each{ |transaction_contact_type| assert_instance_of TransactionDesk::TransactionContactType, transaction_contact_type }
    end
  end

  class Find < Minitest::Test
    def test_returns_a_transaction_contact_type
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/contacts/types/1234').
        to_return(status: 200, body: api_fixture('transaction_contact_types/1234'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactTypeResource.new(connection: connection)

      transaction_contact_type = resource.find(contact_type_id: 1234)

      assert_instance_of TransactionDesk::TransactionContactType, transaction_contact_type
      assert_equal '1234', transaction_contact_type.id
      assert_equal 'Listing Agent', transaction_contact_type.name
      assert_equal '5ec37bc1-9f55-4fe2-b9c4-1072f9954312', transaction_contact_type.owner_id
      assert_equal '2020-04-14T15:54:53.207', transaction_contact_type.date_created
      assert_equal '2020-04-14T15:54:53.207', transaction_contact_type.last_modified
    end
  end

  class Create < Minitest::Test
    def test_creates_and_returns_a_transaction_contact_type
      transaction_desk_contact_type = TransactionDesk::TransactionContactType.new(
        name: 'Taifa Ngao Elder'
      )

      stub_request(:post, 'https://api.pre.transactiondesk.com/v2/transactions/contacts/types').
        with(body: "{\"name\":\"Taifa Ngao Elder\"}").
        to_return(status: 200, body: api_fixture('transaction_contacts/create'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactTypeResource.new(connection: connection)

      transaction_contact_type = resource.create(transaction_desk_contact_type)

      assert_instance_of TransactionDesk::TransactionContactType, transaction_contact_type
      assert_equal '121314', transaction_contact_type.id
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_contact_type_and_returns_true
      transaction_desk_contact_type = TransactionDesk::TransactionContactType.new(
        name: 'Taifa Ngao Elder Emeritus'
      )

      stub_request(:patch, 'https://api.pre.transactiondesk.com/v2/transactions/contacts/types/121314').
        with(body: "{\"name\":\"Taifa Ngao Elder Emeritus\"}").
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactTypeResource.new(connection: connection)

      transaction_contact_type = resource.update(transaction_desk_contact_type, contact_type_id: 121314)

      assert_equal true, transaction_contact_type
    end
  end

  class Destroy < Minitest::Test
    def test_returns_true_for_a_destroy_response
      stub_request(:delete, 'https://api.pre.transactiondesk.com/v2/transactions/contacts/types/121314').
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactTypeResource.new(connection: connection)

      transaction_contact_type = resource.destroy(contact_type_id: 121314)

      assert_equal true, transaction_contact_type
    end
  end

end
