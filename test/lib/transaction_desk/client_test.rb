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
      :metadata                  => TransactionDesk::MetadataResource,
      :single_sign_on            => TransactionDesk::SingleSignOnResource,
      :transaction_contacts      => TransactionDesk::TransactionContactResource,
      :transaction_contact_types => TransactionDesk::TransactionContactTypeResource,
      :transaction_details       => TransactionDesk::TransactionDetailResource,
      :transaction_documents     => TransactionDesk::TransactionDocumentResource,
      :transaction_statuses      => TransactionDesk::TransactionStatusResource,
      :transaction_types         => TransactionDesk::TransactionTypeResource,
      :transactions              => TransactionDesk::TransactionResource
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
        with(query: {'$skip' => 0, '$take' => 100}).
        to_return(status: 200, body: api_fixture('transactions/all'))

      transactions = @transaction_desk_client.transactions.all

      assert_instance_of TransactionDesk::PaginatedResource, transactions
      transactions.each{ |transaction| assert_instance_of TransactionDesk::Transaction, transaction }
    end

    def test_transactions_details_find_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/details').
        to_return(status: 200, body: api_fixture('transaction_details/show'))

      transaction_detail = @transaction_desk_client.transaction_details.find(transaction_id: 1234)

      assert_instance_of TransactionDesk::TransactionDetail, transaction_detail
      assert_instance_of TransactionDesk::ListingInformation, transaction_detail.listing_information
      assert_instance_of TransactionDesk::PropertyInformation, transaction_detail.property_information
      assert_instance_of TransactionDesk::SaleInformation, transaction_detail.sale_information
    end

    def test_transaction_documents_all_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/documents').
        to_return(status: 200, body: api_fixture('transaction_documents/all'))

      transaction_documents = @transaction_desk_client.transaction_documents.all(transaction_id: 1234)

      assert_instance_of Array, transaction_documents
      transaction_documents.each{ |transaction_document| assert_instance_of TransactionDesk::TransactionDocument, transaction_document }
    end

    def test_transaction_contacts_all_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/contacts').
        to_return(status: 200, body: api_fixture('transaction_contacts/all'))

      transaction_contacts = @transaction_desk_client.transaction_contacts.all(transaction_id: 1234)

      assert_instance_of Array, transaction_contacts
      transaction_contacts.each{ |transaction_contact| assert_instance_of TransactionDesk::TransactionContact, transaction_contact }
    end

    def test_transaction_contact_types_all_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/contacts/types').
        to_return(status: 200, body: api_fixture('transaction_contact_types/all'))

      transaction_contact_types = @transaction_desk_client.transaction_contact_types.all

      assert_instance_of Array, transaction_contact_types
      transaction_contact_types.each{ |transaction_contact_type| assert_instance_of TransactionDesk::TransactionContactType, transaction_contact_type }
    end

    def test_transaction_types_all_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/types').
        to_return(status: 200, body: api_fixture('transaction_types/all'))

      transaction_types = @transaction_desk_client.transaction_types.all

      assert_instance_of Array, transaction_types
      transaction_types.each{ |transaction_type| assert_instance_of TransactionDesk::TransactionType, transaction_type }
    end

    def test_transaction_statuses_all_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/statuses').
        to_return(status: 200, body: api_fixture('transaction_statuses/all'))

      transaction_statuses = @transaction_desk_client.transaction_statuses.all

      assert_instance_of Array, transaction_statuses
      transaction_statuses.each{ |transaction_status| assert_instance_of TransactionDesk::TransactionStatus, transaction_status }
    end

    def test_metadata_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/statuses/meta').
        to_return(status: 200, body: api_fixture('metadata/metadata'))

      metadata = @transaction_desk_client.metadata.fetch_metadata

      assert_instance_of TransactionDesk::Metadata, metadata
    end

    def test_sso_endpoint_works_as_expected
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/view-url').
        to_return(status: 200, body: api_fixture('single_sign_on/dashboard'))

      single_sign_on = @transaction_desk_client.single_sign_on.dashboard

      assert_instance_of TransactionDesk::SingleSignOn, single_sign_on
    end

  end

end
