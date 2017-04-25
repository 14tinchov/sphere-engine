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

### Compilers Service

#### Get languages
```ruby
client.all_languages
```

#### Get compilers
```ruby
client.all_compilers
```

#### Create a submission

This method return a submission_id
```ruby
client.create_submission_compiler(
    language: 11, #LanguageID
    sourceCode: "#include <iostream>\n using namespace std;\n int main()\n {\n cout << \"Hello World\" << endl;\n return 0;\n }" #Code example
)
```

*Other params: input [string]*

#### Fetch a submission
```ruby
client.fetch_submission_compilers(submission_id)
```

### Problems service

#### Create a problem

This method return a "code" is like a problem_id
```ruby
client.create_problem(
    code: "RUBY_001", # Unique problem code. consist of 3 up to 16 capital letters. numbers and underscore
    name: "Problem_Name", #String
    body: "Write the fibonacci sequence" #String
)
```

#### Fetch a problem
```ruby
client.get_problem(problem_id)
```

#### Update a problem

```ruby
client.update_problem("PROBLEM_ID", name: "NEW_NAME")
```

*Other params: type [string], interactive [boolean], masterjudgeId [integer], activeTestcases [array]*

#### Create testcase to problem

```ruby
client.create_problem_testcase(
    "PROBLEM_ID",
    input: "input content",
    timelimit: 10,
    output: "output content"
)
```

#### Update a testcase

```ruby
client.update_problem_testcase(
  "PROBLEM_ID",
  "TESTCASE_ID",
  name: "NEW_NAME"
  input: "new input content",
  output: "new output content"
)
```

#### Get a list testcases of a problem

```ruby
client.list_testcases("PROBLEM_ID")
```

#### Get a testcase of a problem

```ruby
client.get_testcase("PROBLEM_ID", "TESTCASE_ID")
```

#### Get a file testcases of a problem
```ruby
client.get_testcase_file("PROBLEM_ID", "TESTCASE_ID", "FILENAME")
```

*Filename is obtained from get_testcase request in uri params*

#### Get judge list

```ruby
client.all_judges()
```

*Other params: limit [Integer], offset [Integer], type [String]*

#### Create judge

```ruby
client.create_judge(
  name: "NameJudge",
  source: "<source code>"
)
```

*Other params: type [String], compilerId [Integer]*

#### Get judge details

```ruby
client..get_judge("JUDGE_ID")
```

#### Update judge

```ruby
client.update_judge(
  "JUDGE_ID",
  name: "NewNameJudge",
)
```

*Other params: source [String], compilerId [Integer]*

#### Create a submission

```ruby
client.create_submission_problem(
  problemCode: "RUBY_001", #problem_id
  compilerId: 1, # get of all_request
  source: "#include <iostream>\n using namespace std;\n int main()\n {\n cout << \"Hello World\" << endl;\n return 0;\n }" #Example
)
```

*Other params: userId [Integer]*

#### Fetch a submission

```ruby
client.fetch_submission_problems("SUBMISSION_ID")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/14tinchov/sphere_engine. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

    