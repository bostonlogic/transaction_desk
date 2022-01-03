require 'test_helper'

class TransactionDesk::SingleSignOnResourceTest < Minitest::Test

  class Dashboard < Minitest::Test

    def test_returns_dashboard_link
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/view-url').
        to_return(status: 200, body: api_fixture('single_sign_on/dashboard'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::SingleSignOnResource.new(connection: connection)

      single_sign_on = resource.dashboard

      assert_instance_of TransactionDesk::SingleSignOn, single_sign_on
      assert_equal 'https://td2.transactiondesk.com/external/entry.ashx?i=28403062-47a4-4a7a-ae3d-b3f64decd32e', single_sign_on.link
    end
  end

  class Transactions < Minitest::Test
    def test_returns_transactions_link
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/view-url').
        to_return(status: 200, body: api_fixture('single_sign_on/transactions'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::SingleSignOnResource.new(connection: connection)

      single_sign_on = resource.transactions

      assert_instance_of TransactionDesk::SingleSignOn, single_sign_on
      assert_equal 'https://td2.transactiondesk.com/external/entry.ashx?i=28403062-47a4-4a7a-ae3d-b3f64decd32e', single_sign_on.link
    end
  end

  class Transaction < Minitest::Test
    def test_returns_transaction_link
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/view-url').
        to_return(status: 200, body: api_fixture('single_sign_on/transaction'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::SingleSignOnResource.new(connection: connection)

      single_sign_on = resource.transaction(transaction_id: 1234)

      assert_instance_of TransactionDesk::SingleSignOn, single_sign_on
      assert_equal 'https://td2.transactiondesk.com/external/entry.ashx?i=28403062-47a4-4a7a-ae3d-b3f64decd32e', single_sign_on.link
    end
  end

  class ResponseMassaging < Minitest::Test
    def test_convert_response_to_valid_json
      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::SingleSignOnResource.new(connection: connection)

      no_key_json_object = "\n  {\"https::/birnin-zana.wakanda.go.wk\"\n}"

      assert_equal '{"link":"https::/birnin-zana.wakanda.go.wk"}', resource.convert_response_to_valid_json(no_key_json_object)
    end
  end

end
