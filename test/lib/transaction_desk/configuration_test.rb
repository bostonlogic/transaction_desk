require 'test_helper'

module TransactionDesk
  class ConfigurationTest < Minitest::Test

    class ModifiedSettings < Minitest::Test

      def test_the_api_url_can_be_set
        assert_equal 'https://api.pre.transactiondesk.com', TransactionDesk.configuration.api_url

        TransactionDesk.configure { |config| config.api_url = 'https://api.mylittlepony.com'}

        assert_equal 'https://api.mylittlepony.com', TransactionDesk.configuration.api_url
      end

      def test_the_path_url_can_be_set
        assert_equal 'v2', TransactionDesk.configuration.path_url

        TransactionDesk.configure { |config| config.path_url = 'w16'}

        assert_equal 'w16', TransactionDesk.configuration.path_url
      end

    end

  end
end
