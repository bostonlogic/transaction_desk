require 'test_helper'

class TransactionDesk::TransactionDocumentResourceTest < Minitest::Test

  class All < Minitest::Test
    def test_returns_an_array_of_transaction_documents
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/documents').
        to_return(status: 200, body: api_fixture('transaction_documents/all'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDocumentResource.new(connection: connection)

      transaction_documents = resource.all(transaction_id: 1234)

      assert_instance_of Array, transaction_documents
      transaction_documents.each{ |transaction_document| assert_instance_of TransactionDesk::TransactionDocument, transaction_document }
    end
  end

  class Find < Minitest::Test

    def test_returns_a_transaction_document
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/documents/1234').
        to_return(status: 200, body: api_fixture('transaction_documents/1234'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDocumentResource.new(connection: connection)

      transaction_document = resource.find(transaction_id: 1234, transaction_document_id: 1234)

      assert_instance_of TransactionDesk::TransactionDocument, transaction_document
      assert_equal '1234', transaction_document.id
      assert_equal '6db4d39b-d96d-4cfd-b97e-0c9cd1a176f9', transaction_document.file_type_id
      assert_equal 'JVBERi0xLjQKJeLjz9MKMSAwIG9iago8PC9U....', transaction_document.binary
      assert_equal '1916 Glenarbor Way', transaction_document.document_name
      assert_equal '2019-05-14T23:49:49.143+00:00', transaction_document.date_created
      assert_equal '2019-05-14T23:49:52.27+00:00', transaction_document.last_modified
    end
  end

  class Create < Minitest::Test
    def test_creates_and_returns_a_transaction_document
      transaction_document = TransactionDesk::TransactionDocument.new(
        document_name: 'Machine of the Decade',
        file_extension: 'jpeg',
        raw_text: Base64.encode64(api_fixture('transaction_documents/f1w12SE', 'jpeg'))
      )

      stub_request(:post, 'https://api.pre.transactiondesk.com/v2/transactions/1234/documents').
        with(body: TransactionDesk::TransactionDocumentMapping.representation_for(:create, transaction_document)).
        to_return(status: 200, body: api_fixture('transaction_documents/create'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDocumentResource.new(connection: connection)

      created_transaction_document = resource.create(transaction_document, transaction_id: 1234)

      assert_instance_of TransactionDesk::TransactionDocument, created_transaction_document
      assert_equal '805355ec-7f7d-413e-986a-c767ea0632da', created_transaction_document.id
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_document_and_returns_true
      transaction_document = TransactionDesk::TransactionDocument.new(
        id: 1234,
        file_extension: 'jpeg',
        raw_text: Base64.encode64(api_fixture('transaction_documents/f1w12SE', 'jpeg'))
      )

      stub_request(:patch, 'https://api.pre.transactiondesk.com/v2/transactions/1234/documents/1234').
        with(body: TransactionDesk::TransactionDocumentMapping.representation_for(:update, transaction_document)).
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDocumentResource.new(connection: connection)

      updated_transaction_document = resource.update(transaction_document, transaction_id: 1234, transaction_document_id: 1234)

      assert_equal true, updated_transaction_document
    end
  end

  class Destroy < Minitest::Test
    def test_returns_true_for_a_destroy_response
      stub_request(:delete, 'https://api.pre.transactiondesk.com/v2/transactions/1234/documents/1234').
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionDocumentResource.new(connection: connection)

      transaction_document = resource.destroy(transaction_id: 1234, transaction_document_id: 1234)

      assert_equal true, transaction_document
    end
  end

end
