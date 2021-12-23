require 'test_helper'

class TransactionDesk::ClientTest < Minitest::Test

  class Initialize < Minitest::Test

    def test_initialize_requires_an_access_token
      assert_raises(ArgumentError) { TransactionDesk::Client.new }
    end

    def test_initialize_creates_a_transaction_desk_client_instance
      transaction_desk_client = TransactionDesk::Client.new('alohomora')

      assert_instance_of TransactionDesk::Client, transaction_desk_client
    end

    def test_initialize_sets_the_provided_access_token
      transaction_desk_client = TransactionDesk::Client.new('alohomora')

      assert_equal 'alohomora', transaction_desk_client.access_token
    end

  end

  class Connection < Minitest::Test

    def setup
      @transaction_desk_client = TransactionDesk::Client.new('alohomora')
    end

    def test_connection_sets_the_correct_url
      assert_equal 'https://api.pre.transactiondesk.com/', @transaction_desk_client.connection.url_prefix.to_s
    end

    def test_connection_builds_the_correct_headers
      assert_equal 'application/json', @transaction_desk_client.connection.headers[:content_type]
    end

    def test_connection_builds_the_correct_authoriation_header
      assert_equal 'Bearer alohomora', @transaction_desk_client.connection.headers[:authorization]
    end

  end

  class EndpointHandling < Minitest::Test

    def setup
      @transaction_desk_client = TransactionDesk::Client.new('alohomora')
    end

    {
      :transaction_details      => TransactionDesk::TransactionDetailResource,
      :transactions             => TransactionDesk::TransactionResource
    }.each do |method, result|
      define_method "test_#{method}_returns_#{result}" do
        assert_instance_of result, @transaction_desk_client.send(method)
      end
    end

    def test_invalid_endpoints_raise_method_missing_error
      assert_raises(NoMethodError) { @transaction_desk_client.not_a_thing }
    end

    def test_transactions_all_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions').
        to_return(status: 200, body: api_fixture('transactions/all'))

      transactions = @transaction_desk_client.transactions.all

      assert_instance_of Array, transactions
      transactions.each{ |transaction| assert_instance_of TransactionDesk::Transaction, transaction }
    end

    def test_transactions_details_fetch_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/details').
        to_return(status: 200, body: api_fixture('transaction_details/show'))

      transaction_detail = @transaction_desk_client.transaction_details.fetch(transaction_id: 1234)

      assert_instance_of TransactionDesk::TransactionDetail, transaction_detail
      assert_instance_of TransactionDesk::Listing, transaction_detail.listing
      assert_instance_of TransactionDesk::Property, transaction_detail.property
      assert_instance_of TransactionDesk::Purchase, transaction_detail.purchase
    end

  end

end
