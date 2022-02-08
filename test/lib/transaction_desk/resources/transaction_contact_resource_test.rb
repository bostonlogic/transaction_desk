require 'test_helper'

class TransactionDesk::TransactionContactResourceTest < Minitest::Test

  class All < Minitest::Test
    def test_returns_an_array_of_transaction_contacts
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/contacts').
        to_return(status: 200, body: api_fixture('transaction_contacts/all'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactResource.new(connection: connection)

      transaction_contacts = resource.all(transaction_id: 1234)

      assert_instance_of Array, transaction_contacts
      transaction_contacts.each{ |transaction_contact| assert_instance_of TransactionDesk::TransactionContact, transaction_contact }
    end
  end

  class Find < Minitest::Test

    def test_returns_a_transaction_contact
      stub_request(:get, 'https://api.pre.transactiondesk.com/v2/transactions/1234/contacts/1234').
        to_return(status: 200, body: api_fixture('transaction_contacts/1234'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactResource.new(connection: connection)

      transaction_contact = resource.find(transaction_id: 1234, contact_id: 1234)

      assert_instance_of TransactionDesk::TransactionContact, transaction_contact
      assert_equal '1234', transaction_contact.id
      assert_equal 'Black Panther', transaction_contact.preferred_name
      assert_equal "T'Challa", transaction_contact.first_name
      assert_equal 'Son of', transaction_contact.middle_name
      assert_equal "T'Chaka", transaction_contact.last_name
      assert_equal '100 Government Road', transaction_contact.full_address
      assert_equal 'Birnin Zana', transaction_contact.city
      assert_equal 'BZ', transaction_contact.state
      assert_equal 'N6E B3B', transaction_contact.zip_code
      assert_equal '519-000-0000', transaction_contact.phone
      assert_equal '519-000-0001', transaction_contact.fax
      assert_equal '519-000-0002', transaction_contact.cell
      assert_equal 'tchalla@wakanda.go.wk', transaction_contact.email
      assert_equal 'Taifa Ngao', transaction_contact.company
      assert_equal '918753cd-df9d-4a8c-b9c5-2d0115835ea0', transaction_contact.type_id
      assert_equal '34bfff2a-d186-48c6-b09d-6c15232cfe26', transaction_contact.transaction_id
    end
  end

  class Create < Minitest::Test
    def test_creates_and_returns_a_transaction_contact
      transaction_desk_contact = TransactionDesk::TransactionContact.new(
        preferred_name: 'Black Panther',
        first_name: 'Shuri',
        middle_name: 'Daughter of',
        last_name: "T'Chaka",
        email: 'shuri@wakanda.go.wk',
        cell: '519-000-0010',
        transaction_id: '1234',
        type_id: 'GUID-for-buyer'
      )

      stub_request(:post, 'https://api.pre.transactiondesk.com/v2/transactions/1234/contacts').
        with(body: TransactionDesk::TransactionContactMapping.representation_for(:create, transaction_desk_contact)).
        to_return(status: 200, body: api_fixture('transaction_contacts/create'))

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactResource.new(connection: connection)

      transaction_contact = resource.create(transaction_desk_contact, transaction_id: 1234)

      assert_instance_of TransactionDesk::TransactionContact, transaction_contact
      assert_equal '97a14227-0d87-485f-af3d-6c19cc979891', transaction_contact.id
    end
  end

  class Update < Minitest::Test
    def test_updates_a_transaction_contact_and_returns_true
      transaction_desk_contact = TransactionDesk::TransactionContact.new(
        preferred_name: 'Aja-Adanna',
        company: 'Wakanda Design Group',
        fax: '519-000-0020'
      )

      stub_request(:patch, 'https://api.pre.transactiondesk.com/v2/transactions/1234/contacts/121314').
        with(body: "{\"preferredName\":\"Aja-Adanna\",\"fax\":\"519-000-0020\",\"company\":\"Wakanda Design Group\"}").
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactResource.new(connection: connection)

      transaction_contact = resource.update(transaction_desk_contact, transaction_id: 1234, contact_id: 121314)

      assert_equal true, transaction_contact
    end
  end

  class Destroy < Minitest::Test
    def test_returns_true_for_a_destroy_response
      stub_request(:delete, 'https://api.pre.transactiondesk.com/v2/transactions/1234/contacts/121314').
        to_return(status: 200, body: '')

      connection = TransactionDesk::Client.new('alohomora').connection
      resource = TransactionDesk::TransactionContactResource.new(connection: connection)

      transaction_contact = resource.destroy(transaction_id: 1234, contact_id: 121314)

      assert_equal true, transaction_contact
    end
  end

end
