require "test_helper"

class TransactionDeskTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::TransactionDesk::VERSION
  end

  def test_error_is_initialized
    assert TransactionDesk::Error
  end

  def test_unauthorized_error_is_initialized
    assert TransactionDesk::UnauthorizedError
  end

end
