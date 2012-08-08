#JiffyEnums

This project rocks and uses MIT-LICENSE.

##Ruby Usage
```ruby
Class MyEnums
  extend JiffyEnums
  define :ENUM1, "enum 1"
  define :ENUM2, "enum 2"
  define :ENUM3, "enum 3"
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

##Coffee Usage
```coffeescript
class Enums
  <%= MyEnums.to_coffee %>

Enums.MyEnums.get("ENUM1").key
=> "ENUM1"
Enums.MyEnums.get("ENUM1").value
=> "enum 1"
Enums.MyEnums.get("ENUM1").ordinal
=> 1
=>
```
