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

      assert_instance_of Array, metadata_properties
      metadata_properties.each{ |metadata_property| assert_instance_of TransactionDesk::Metadata, metadata_property }
      
      assert_equal 'Id', metadata_properties.first.name
      assert_equal 'Guid', metadata_properties.first.type
      assert_equal true, metadata_properties.first.can_filter
      assert_equal true, metadata_properties.first.can_sort
      assert_equal 'Equals', metadata_properties.first.filter_type

      assert_equal 'LastModified', metadata_properties.last.name
      assert_equal 'DateTimeOffset', metadata_properties.last.type
      assert_equal false, metadata_properties.last.can_filter
      assert_equal false, metadata_properties.last.can_sort
      assert_equal nil, metadata_properties.last.filter_type
    end
  end

end
