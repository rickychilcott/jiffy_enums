#JiffyEnums

* **master:** [![Build Status master](https://travis-ci.org/Identified/jiffy_enums.png?branch=master)](https://travis-ci.org/Identified/jiffy_enums)
* **development:** [![Build Status development](https://travis-ci.org/Identified/jiffy_enums.png?branch=development)](https://travis-ci.org/Identified/jiffy_enums)


This project rocks and uses MIT-LICENSE.

* **master:** [![Build Status master](https://travis-ci.org/Identified/jiffy_enums.png?branch=master)](https://travis-ci.org/Identified/jiffy_enums)
* **development:** [![Build Status development](https://travis-ci.org/Identified/jiffy_enums.png?branch=development)](https://travis-ci.org/Identified/jiffy_enums)

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
Enums = {}
<%= MyEnums.to_coffee("Enums") %>

Enums.MyEnums.get("ENUM1").key
=> "ENUM1"
Enums.MyEnums.get("ENUM1").value
=> "enum 1"
Enums.MyEnums.get("ENUM1").ordinal
=> 1
=>
```
