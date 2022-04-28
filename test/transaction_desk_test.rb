require "test_helper"

class TransactionDeskTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil TransactionDesk::VERSION
  end

  def test_error_is_initialized
    assert TransactionDesk::Error
  end

  def test_unauthorized_error_is_initialized
    assert TransactionDesk::UnauthorizedError
  end

  def test_unauthorized_error_is_initialized
    assert TransactionDesk::UnsupportedApiVersionError
  end

  def test_unauthorized_error_is_initialized
    assert TransactionDesk::NotFoundError
  end

  def test_global_transaction_types_constant_exists
    refute_nil TransactionDesk::GLOBAL_TRANSACTION_TYPES
    assert_kind_of Hash, TransactionDesk::GLOBAL_TRANSACTION_TYPES
  end

  def test_global_transaction_types_constant_contains_residential_sale
    assert_equal '5698FAC5-5F95-47CB-B231-13507AD61855', TransactionDesk::GLOBAL_TRANSACTION_TYPES['residential_sale']
  end

  def test_global_transaction_statuses_constant_exists
    refute_nil TransactionDesk::GLOBAL_TRANSACTION_STATUSES
    assert_kind_of Hash, TransactionDesk::GLOBAL_TRANSACTION_STATUSES
  end

  def test_global_transaction_statuses_constant_contains_open
    assert_equal '6D6D2BFE-B166-4F2C-9027-629F09A35B79', TransactionDesk::GLOBAL_TRANSACTION_STATUSES['open']
  end

  def test_global_transaction_contact_types_constant_exists
    refute_nil TransactionDesk::GLOBAL_TRANSACTION_CONTACT_TYPES
    assert_kind_of Hash, TransactionDesk::GLOBAL_TRANSACTION_CONTACT_TYPES
  end

  def test_global_transaction_contact_types_constant_contains_buyer
    assert_equal '0ED89951-0FC9-46A9-9FC8-1ED2A85966B5', TransactionDesk::GLOBAL_TRANSACTION_CONTACT_TYPES['buyer']
  end

  def test_global_document_file_types_constant_exists
    refute_nil TransactionDesk::GLOBAL_DOCUMENT_FILE_TYPES
    assert_kind_of Hash, TransactionDesk::GLOBAL_DOCUMENT_FILE_TYPES
  end

  def test_global_document_file_types_constant_contains_gif
    assert_equal '933088C0-91FB-4EAA-BD57-A94EF1B3300F', TransactionDesk::GLOBAL_DOCUMENT_FILE_TYPES['gif']
  end

end
