# SphereEngine

A Ruby interface to SphereEngine API. This gem was made as an interface to the SphereEngine API. It abstract in the best way all his methods that SphereEngine give us. This gem separates the requests into two types (compilers and problems), according to the SphereEngine documentation. For more information about SphereEngine visit this [Link](http://sphere-engine.com)

## Prerequisites

You need the following tokens:

* Token for Compilers API
* Token for problems API

[SphereEngine Tokens](http://sphere-engine.com/tokens)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sphere_engine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sphere_engine

## Configuration

SphereEngine provide two services, one for compilers and another for problems. To start using a SpherEengine client do the following:

```ruby
client = SphereEngine::REST::Client.new do |config|
  config.access_token_compilers = "YOUR_ACCESS_TOKEN_COMPILERS"
  config.access_token_problems  = "YOUR_ACCESS_TOKEN_PROBLEMS"
end
```

## Usage Examples
After configuring a client, you can do the following things:

### Get compilers
```ruby
client.all_compilers
```

### Get languages
```ruby
client.all_languages
```


### Create a submission (Compilers service)

This method return a submission_id
```ruby
client.create_submission_compiler(
    language: 11, #LanguageID
    sourceCode: "#include int main(){ printf(\"Hello!\"); return 0; }" #Code
)
```

### Fetch a submission (Compilers service)
```ruby
client.fetch_submission_compilers(submission_id)
```

### Problems service
Coming soon

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/14tinchov/sphere_engine. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

