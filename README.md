# Refile::Neo4j

Add Neo4j support to Refile.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'refile-neo4j'
```

And then execute:

    $ bundle

## Usage

```ruby
class User
  include Neo4j::ActiveNode
  extend Refile::Neo4j::Attachment

  attachment :profile_image
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andrewhavens/refile-neo4j.

## License

The design of this gem was influenced by [`refile-mongoid`](https://github.com/krettan/refile-mongoid).

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
