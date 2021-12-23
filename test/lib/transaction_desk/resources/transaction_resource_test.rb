require 'test_helper'

class TransactionDesk::TransactionResourceTest < Minitest::Test

  class All < Minitest::Test
    def test_returns_an_array_of_transactions
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions').
        to_return(status: 200, body: api_fixture('transactions/all'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionResource.new(connection: connection)

      transactions = resource.all

      assert_instance_of Array, transactions
      transactions.each{ |transaction| assert_instance_of TransactionDesk::Transaction, transaction }
    end
  end

  class Find < Minitest::Test

    def test_returns_a_transaction
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234').
        to_return(status: 200, body: api_fixture('transactions/1234'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionResource.new(connection: connection)

      transaction = resource.find(transaction_id: 1234)

      assert_instance_of TransactionDesk::Transaction, transaction
      assert_equal '1234', transaction.id
      assert_equal '1916 Glenarbor Way', transaction.name
      assert_equal '6d6d2bfe-b166-4f2c-9027-629f09a35b79', transaction.status_id
      assert_equal '2d9d021d-beb7-456d-9cae-6ce5486ac3f5', transaction.type_id
      assert_equal '5ec37bc1-9f55-4fe2-b9c4-1072f9954312', transaction.owner_id
      assert_equal '2019-05-14T23:49:49.143+00:00', transaction.date_created
      assert_equal '2019-05-14T23:49:52.27+00:00', transaction.last_modified
    end
  end

  class Create < Minitest::Test
    def test_creates_and_returns_a_transaction
      transaction_desk_transaction = TransactionDesk::Transaction.new(
        name: 'Testy McTestFace',
        status_id: 'GUID-for-Active',
        type_id: 'GUID-for-Residential-Lease'
      )

      stub_request(:post, 'https://api.pre.transactiondesk.com/v2/transactions').
        with(body: TransactionDesk::TransactionMapping.representation_for(:create, transaction_desk_transaction)).
        to_return(status: 200, body: api_fixture('transactions/create'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionResource.new(connection: connection)

      transaction = resource.create(transaction_desk_transaction)

      assert_instance_of TransactionDesk::Transaction, transaction
      assert_equal '1234', transaction.id
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_and_returns_true
      transaction_desk_transaction = TransactionDesk::Transaction.new(
        id: '1234',
        name: 'Testy McTestFace',
        status_id: 'GUID-for-Active',
        type_id: 'GUID-for-Residential-Lease'
      )

      stub_request(:patch, 'https://api.pre.transactiondesk.com/v2/transactions/1234').
        with(body: "{\"name\":\"Testy McTestFace\",\"statusId\":\"GUID-for-Active\",\"typeId\":\"GUID-for-Residential-Lease\"}").
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionResource.new(connection: connection)

      transaction = resource.update(transaction_desk_transaction, transaction_id: 1234)

      assert_equal true, transaction
    end
  end

  class Destroy < Minitest::Test
    def test_returns_true_for_a_destroy_response
      stub_request(:delete, 'https://api.pre.transactiondesk.com/v2/transactions/1234').
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionResource.new(connection: connection)

      transaction = resource.destroy(transaction_id: 1234)

      assert_equal true, transaction
    end
  end

end
