# MonerisSimulator

MonerisSimulator is an engine that acts like the Moneris Hosted Tokenization service.

This allows us to test payment pages that use Moneris Hosted Tokenization in a way that is consistent with how the forms would work in a staging or production environment.

The engine will automatically mount itself in whichever environments the gem is included in, and will add its assets to the precompile list in those environments as well.

```moneris_simulator.new_credit_card_path``` (/moneris/credit_cards/new) will return a credit card input with CSS styles applied, and javascript that will handle a postMessage event in a way that is consistent with Moneris' behaviour.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'moneris_simulator'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moneris_simulator

## Usage

Moneris Hosted Tokenization requires a payment form to include the tokenization page in an iframe, and render that as the credit card number input.
When the payment form is submitted, the click event is intercepted and a postMessage is sent to the iframe. A postMessage handler is included on the form, and waits for Moneris to post back to the parent page after it has validated the card and generated a token. It posts back with a stringified JSON object that contains dataKey (the credit card token), bin (the first 6 digits of the credit card), and responseCode (1 is a success, 50+ is a failure).

To use the MonerisSimulator, make the iframe URL variable like so:

```
<iframe id="monerisFrame" class="moneris" src="<%= Rails.configuration.moneris_hosted_tokenization_url" frameborder="0" scrolling="no" height="37px"></iframe>
```

in config/environments/test.rb:

```
config.moneris_hosted_tokenization_url = "/moneris/credit_cards/new"
```

in your feature spec:

```
within_frame "monerisFrame" do
  fill_in "monerisDataInput", with: credit_card_number
end
```

where ```credit_card_number``` can be changed depending on the test context; a valid test credit card number from MonerisSimulator.CreditCard.validCreditCards, or an invalid test credit card number.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/moneris_simulator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

