require 'test_helper'

class TransactionDesk::MetadataResourceTest < Minitest::Test

  class Fetch < Minitest::Test

    def test_returns_metadata
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/statuses/meta').
        to_return(status: 200, body: api_fixture('metadata/metadata'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::MetadataResource.new(connection: connection)

      metadata = resource.fetch_metadata

      assert_instance_of TransactionDesk::Metadata, metadata
      assert_equal 10, metadata.default_take
      assert_equal 100, metadata.max_take
      assert_equal 'Name', metadata.default_order
    end
  end

  class Property < Minitest::Test
    def test_returns_metadata_properties
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/statuses/meta/properties').
        to_return(status: 200, body: api_fixture('metadata/metadata_properties'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::MetadataResource.new(connection: connection)

      metadata_properties = resource.fetch_metadata_properties

      assert_instance_of TransactionDesk::Metadata, metadata_properties
      assert_equal 'Id', metadata_properties.name
      assert_equal 'Guid', metadata_properties.type
      assert_equal true, metadata_properties.can_filter
      assert_equal true, metadata_properties.can_sort
      assert_equal 'Equals', metadata_properties.filter_type
    end
  end

end
