# JiffyEnums

[![Gem Version](https://badge.fury.io/rb/jiffy_enums.png)](http://badge.fury.io/rb/jiffy_enums)
[![Build Status](https://api.travis-ci.org/Identified/jiffy_enums.png?branch=master)](https://travis-ci.org/Identified/jiffy_enums)
[![Code Climate](https://codeclimate.com/github/Identified/jiffy_enums.png)](https://codeclimate.com/github/Identified/jiffy_enums)

Java-style enums brought over to Ruby and CoffeeScript

## Installation

Add this line to your application's Gemfile:

    gem 'jiffy_enums'

And then execute:

    $ bundle

## Usage

### In Ruby

```ruby
Class MyEnums < JiffyEnums
  define :ENUM1, 'enum 1'
  define :ENUM2, 'enum 2'
  define :ENUM3, 'enum 3'
end

MyEnums[:ENUM1].key
=> :ENUM1
MyEnums[:ENUM1].value
=> "enum 1"
MyEnums[:ENUM1].ordinal
=> 1

MyEnums::ENUM2
=> "enum 2"
```

### In CoffeeScript (e.g. in a Rails View)

```coffeescript
Enums = {}
<%= MyEnums.to_coffee('Enums') %>

Enums.MyEnums.get('ENUM1').key
=> "ENUM1"
Enums.MyEnums.get('ENUM1').value
=> "enum 1"
Enums.MyEnums.get('ENUM1').ordinal
=> 1
=>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
