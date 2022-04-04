# TransactionDesk

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/transaction_desk`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'transaction_desk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install transaction_desk

## Usage

To use the gem you first need to get an access token from Transaction Desk. Instructions to do so can be found [here](https://transactiondesk.docs.apiary.io/#introduction/authorization).

With access token token in hand, the first step is to instanciate a transaction desk client:

```ruby
access_token = 'alohomora'
client = TransactionDesk::Client.new('alohomora')
```

You can now use the client to access the available endpoints 😈.

### Transaction Summary

```ruby
client.transactions.all #=> TransactionDesk::PaginatedResource
# Can also pass in filters 'name', '$take', '$skip', '$orderBy', and '$orderDir' as filters
client.transactions.all('$take' => 50, '$skip' => 50) #=> TransactionDesk::PaginatedResource
# To get an array of of TransactionDesk::Transaction objects, iterate over the TransactionDesk::PaginatedResource:
client.transactions.all.each{|transaction| manipulate transaction } #=> [TransactionDesk::Transaction, TransactionDesk::Transaction, ...]

client.transactions.find(transaction_id: '1234') #=> TransactionDesk::Transaction

transaction = TransactionDesk::Transaction.new(name: 'Happy Transaction Name', status_id: 'GUID-for-status', type_id: 'GUID-for-type')
client.transactions.create(transaction) #=> true

transaction = TransactionDesk::Transaction.new(name: 'Updated Transaction Name')
client.transactions.update(transaction, transaction_id: '5678') #=> ** currently not working **

client.transactions.destroy(transaction_id: '5678') #=> true
```

### Transaction Detail

```ruby
client.transaction_details.find(transaction_id: '1234') #=> TransactionDesk::TransactionDetail

property_information = TransactionDesk::PropertyInformation.new(street_number: 743, street_name: 'Cantebery St APT 302', city: 'Boston', State: 'MA', zip_code: '02127', year_built: 1899)
listing_information = TransactionDesk::ListingInformation.new(mls_number: '7292728', list_price: '625000', property_includes: 'parking', property_excludes: 'roofdeck access, accessibility features', leased_items: 'cable modem')
sale_information = TransactionDesk::SaleInformation.new(purchase_price: '500000', deposit_amount: '50000')
transaction_details = TransactionDesk::TransactionDetail.new(property_information: property_information, listing_information: listing_information, sale_information: sale_information)
client.transaction_details.update(transaction_details, transaction_id: '1234') #=> **currently not working**
```

### Transaction Documents

```ruby
client.transaction_documents.all(transaction_id: '1234') #=> [TransactionDesk::TransactionDocument, TransactionDesk::TransactionDocument, ...]

client.transaction_documents.find(transaction_id: '1234', transaction_document_id: '1234') #=> TransactionDesk::TransactionDocument

transaction_document = TransactionDesk::TransactionDocument.new(file_name: 'Alien Alicorns vs. Space Pirates', file_extension: 'GUID-for-file_extension', raw_text: 'Base64-encoded-file')
client.transaction_documents.create(transaction_document, transaction_id: '1234') #=> **currently not working**

transaction_document = TransactionDesk::TransactionDocument.new(file_name: 'Alien Alicorns Versus Space Pirates', file_extension: 'GUID-for-file_extension', raw_text: 'Base64-encoded-file')
client.transaction_documents.update(transaction_document, transaction_id: '1234', transaction_document_id: '5678') #=> **currently not working**
client.transaction_documents.destroy(transaction_id: '1234', transaction_document_id: '5678') #=> true (not tested yet)
```

#### Global Document File Types

A collection of globally available document file types in available in a hash that maps the camelcased status name to it's GUID.

```ruby
TransactionDesk::GLOBAL_DOCUMENT_FILE_TYPES #=> {'gif' => '933088C0-91FB-4EAA-BD57-A94EF1B3300F', ...}
```

### Transaction Contacts

```ruby
client.transaction_contacts.all(transaction_id: '1234') #=> [TransactionDesk::TransactionContact, TransactionDesk::TransactionContact, ...]

client.transaction_contacts.find(transaction_id: '1234', contact_id: '1234') #=> TransactionDesk::TransactionContact

transaction_contact = TransactionDesk::TransactionContact.new(preferred_name: 'Rainbow Dash', first_name: 'Rainbow', last_name: 'Dash', email: 'rainbow.dash@equestria.net', type_id: 'GUID-for-buyer', transaction_id: '1234')
client.transaction_contacts.create(transaction_contact, transaction_id: '1234') #=> true

transaction_contact = TransactionDesk::TransactionContact.new(preferred_name: 'Rainbow Sia Dash', middle_name: 'Sia')
client.transaction_contacts.update(transaction_contact, transaction_id: '1234', contact_id: '5678') #=> true

client.transaction_contacts.destroy(transaction_id: '1234', contact_id: '5678') #=> true
```

### Transaction Contact Types

```ruby
client.transaction_contact_types.all #=> [TransactionDesk::TransactionContactType, TransactionDesk::TransactionContactType, ...]

client.transaction_contact_types.find(contact_type_id: '1234') #=> TransactionDesk::TransactionContactType

contact_type = TransactionDesk::TransactionContactType.new(name: 'Frands')
client.transaction_contact_types.create(contact_type) #=> TransactionDesk::TransactionContactType

contact_type = TransactionDesk::TransactionContactType.new(name: 'Best Frands')
client.transaction_contact_types.update(contact_type, contact_type_id: '5678') #=> **currently not working**

client.transaction_contact_types.destroy(contact_type_id: '5678') #=> true
```

#### Global Transaction Contact Types

A collection of globally available transaction contact types in available in a hash that maps the camelcased status name to it's GUID.

```ruby
TransactionDesk::GLOBAL_TRANSACTION_CONTACT_TYPES #=> {'buyer' => '0ED89951-0FC9-46A9-9FC8-1ED2A85966B5', ...}
```

### Transaction Types

```ruby
client.transaction_types.all #=> [TransactionDesk::TransactionType, TransactionDesk::TransactionType, ...]

client.transaction_types.find(transaction_type_id: '1234') #=> TransactionDesk::TransactionType

transaction_type = TransactionDesk::TransactionType.new(name: "Friendship's Magic")
client.transaction_types.create(transaction_type) #=> TransactionDesk::TransactionType

transaction_type = TransactionDesk::TransactionType.new(name: 'Friendship Is Magic')
client.transaction_types.update(transaction_type, transaction_type_id: '78910') #=> true

client.transaction_types.destroy(transaction_type_id: '78910') #=> true
```

#### Global Transaction Types

A collection of globally available transaction types in available in a hash that maps the camelcased status name to it's GUID.

```ruby
TransactionDesk::GLOBAL_TRANSACTION_TYPES #=> {'residential_sale' => '5698FAC5-5F95-47CB-B231-13507AD61855', ...}
```

### Transaction Statuses

```ruby
client.transaction_statuses.all #=> [TransactionDesk::TransactionStatus, TransactionDesk::TransactionStatus, ...]

client.transaction_statuses.find(transaction_status_id: '1234') #=> TransactionDesk::TransactionStatus

transaction_status = TransactionDesk::TransactionStatus.new(name: 'Its Complicated')
client.transaction_statuses.create(transaction_status) #=> TransactionDesk::TransactionStatus

transaction_status = TransactionDesk::TransactionStatus.new(name: "It's Complicated")
client.transaction_statuses.update(transaction_status, transaction_status_id: '78910') #=> **currently not working**

client.transaction_statuses.destroy(transaction_status_id: '78910') #=> true
```

#### Global Transaction Statuses

A collection of globally available transaction statuses in available in a hash that maps the camelcased status name to it's GUID.

```ruby
TransactionDesk::GLOBAL_TRANSACTION_STATUSES #=> {'active' => 'EE349FD8-5842-420F-84A2-9B80B8D9632E', ...}
```

### Single Sign On

```ruby
client.single_sign_on.dashboard #=> Transaction::SingleSignOn

client.single_sign_on.transactions #=> Transaction::SingleSignOn

client.single_sign_on.transaction(transaction_id: '1234') #=> Transaction::SingleSignOn
```

### Metadata

```ruby
client.metadata.fetch_metadata #=> Transaction::Metadata

client.metadata.fetch_metadata_properties #=> [Transaction::Metadata, Transaction::Metadata, ...]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/transaction_desk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/transaction_desk/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TransactionDesk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/transaction_desk/blob/master/CODE_OF_CONDUCT.md).
