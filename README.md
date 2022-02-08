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

### Transaction Documents

```ruby
client.transaction_documents.all(transaction_id: '1234')
client.transaction_documents.find(transaction_id: '1234', transaction_document_id: '1234')
transaction_document = TransactionDesk::TransactionDocument.new(file_name: 'Alien Alicorns vs. Space Pirates', file_extension: 'GUID-for-file_extension', raw_text: 'Base64-encoded-file')
client.transaction_documents.create(transaction_document, transaction_id: '1234') **currently not working**
transaction_document = TransactionDesk::TransactionDocument.new(file_name: 'Alien Alicorns Versus Space Pirates', file_extension: 'GUID-for-file_extension', raw_text: 'Base64-encoded-file')
client.transaction_documents.update(transaction_document, transaction_id: '1234', transaction_document_id: '5678') **currently not working**
client.transaction_documents.destroy(transaction_id: '1234', transaction_document_id: '5678')
```

### Transaction Contacts

```ruby
client.transaction_contacts.all(transaction_id: '1234')
client.transaction_contacts.find(transaction_id: '1234', contact_id: '1234')
transaction_contact = TransactionDesk::TransactionContact.new(preferred_name: 'Rainbow Dash', first_name: 'Rainbow', last_name: 'Dash', email: 'rainbow.dash@equestria.net', type_id: 'GUID-for-buyer', transaction_id: '1234')
client.transaction_contacts.create(transaction_contact, transaction_id: '1234')
transaction_contact = TransactionDesk::TransactionContact.new(preferred_name: 'Rainbow Sia Dash', middle_name: 'Sia')
client.transaction_contacts.update(transaction_contact, transaction_id: '1234', contact_id: '5678')
client.transaction_contacts.destroy(transaction_id: '1234', contact_id: '5678')
```

### Transaction Contact Types

```ruby
client.transaction_contact_types.all
client.transaction_contact_types.find(contact_type_id: '1234')
contact_type = TransactionDesk::TransactionContactType.new(name: 'Frands')
client.transaction_contact_types.create(contact_type)
contact_type = TransactionDesk::TransactionContactType.new(name: 'Best Frands')
client.transaction_contact_types.update(contact_type, contact_type_id: '5678') **currently not working**
client.transaction_contact_types.destroy(contact_type_id: '5678')
```

### Transaction Types

```ruby
client.transaction_types.all
client.transaction_types.find(transaction_type_id: '1234')
transaction_type = TransactionDesk::TransactionType.new(name: "Friendship's Magic")
client.transaction_types.create(transaction_type)
transaction_type = TransactionDesk::TransactionType.new(name: 'Friendship Is Magic')
client.transaction_types.update(transaction_type, transaction_type_id: '78910')
client.transaction_types.destroy(transaction_type_id: '78910')
```

### Transaction Statuses

```ruby
client.transaction_statuses.all
client.transaction_statuses.find(transaction_status_id: '1234')
transaction_status = TransactionDesk::TransactionStatus.new(name: 'Its Complicated')
client.transaction_statuses.create(transaction_status)
transaction_status = TransactionDesk::TransactionStatus.new(name: "It's Complicated")
client.transaction_statuses.update(transaction_status, transaction_status_id: '78910') **currently not working**
client.transaction_statuses.destroy(transaction_status_id: '78910')
```

### Single Sign On

```ruby
client.single_sign_on.dashboard
client.single_sign_on.transactions
client.single_sign_on.transaction(transaction_id: '1234')
```

### Metadata

```ruby
client.metadata.fetch_metadata
client.metadata.fetch_metadata_properties
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
