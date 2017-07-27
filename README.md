# Rewards API

This is Ruby client for [Rewards API](https://github.com/fs/rewards-api)

## Usage

Add to `Gemfile`

```ruby
gem "rewards-ruby"
```

Perform requests:

```ruby
Rewards.base_uri("http://rewards-staging.flts.tk/api/v1")
token = Rewards.new.bot_create_token("birthday", "123456")["data"]["attributes"]["token"]

Rewards.new(token: token).bot_users
Rewards.new(token: token).bot_create_bonus("Testing bots +100 @ramil.gabdrakhmanov #be-curious-never-stop-learning")
```

## Quality tools

* `bin/quality` based on [RuboCop](https://github.com/bbatsov/rubocop)
* `.rubocop.yml` describes active checks

## Develop

`bin/build` checks your specs and runs quality tools

## Credits

Ruby Base is maintained by [Timur Vafin](http://github.com/timurvafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/ruby-base/contributors).


[<img src="http://www.flatstack.com/logo.svg" width="100"/>](http://www.flatstack.com)
