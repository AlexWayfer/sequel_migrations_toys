# Sequel Migrations Toys

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/sequel_migrations_toys?style=flat-square)](https://cirrus-ci.com/github/AlexWayfer/sequel_migrations_toys)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/sequel_migrations_toys/master.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/sequel_migrations_toys)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/AlexWayfer/sequel_migrations_toys.svg?style=flat-square)](https://codeclimate.com/github/AlexWayfer/sequel_migrations_toys)
[![Depfu](https://img.shields.io/depfu/AlexWayfer/sequel_migrations_toys?style=flat-square)](https://depfu.com/repos/github/AlexWayfer/sequel_migrations_toys)
[![Inline docs](https://inch-ci.org/github/AlexWayfer/sequel_migrations_toys.svg?branch=master)](https://inch-ci.org/github/AlexWayfer/sequel_migrations_toys)
[![license](https://img.shields.io/github/license/AlexWayfer/sequel_migrations_toys.svg?style=flat-square)](https://github.com/AlexWayfer/sequel_migrations_toys/blob/master/LICENSE.txt)
[![Gem](https://img.shields.io/gem/v/sequel_migrations_toys.svg?style=flat-square)](https://rubygems.org/gems/sequel_migrations_toys)

Toys template for [Sequel](https://sequel.jeremyevans.net/) migrations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sequel_migrations_toys'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install sequel_migrations_toys
```

## Usage

```ruby
require 'sequel_migrations_toys'
expand SequelMigrationsToys::Template,
  # optional, has such default
  db_migrations_dir: 'db/migrations',
  db_connection_proc: (proc do
    require "#{context_directory}/config/config"
    MyProject::Application.db_connection
  end)

# `database` namespace created
# aliases are optional, but handful
alias_tool :db, :database
```

## Development

After checking out the repo, run `bundle install` to install dependencies.

Then, run `toys rspec` to run the tests.

To install this gem onto your local machine, run `toys gem install`.

To release a new version, run `toys gem release %version%`.
See how it works [here](https://github.com/AlexWayfer/gem_toys#release).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/sequel_migrations_toys).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
