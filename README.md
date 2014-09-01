# IapVerifier

In-App Purchase receipt verification.

## Installation

Add this line to your application's Gemfile:

    gem 'iap_verifier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iap_verifier

## Usage

```ruby
receipt = IAPVerifier.verify_receipt(receipt: 'base64_encoded_receipt_string')
receipt.original_application_version # 1234
receipt.original_purchase_date_pst # 2014-08-31 11:24:13 America/Los_Angeles
```

## Contributing

1. Fork it ( https://github.com/linjunpop/iap_verifier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
