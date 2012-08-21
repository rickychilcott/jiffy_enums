#run with `ruby -Ilib/ test/simple_test.rb`
require 'jiffy_enum'
require 'jiffy_enums'

class YesNo < JiffyEnum
  define :Yes do
    def say
      'I say hello'
    end
  end

  define :No do
    def say
      'you say good bye'
    end
  end
  
  define :Maybe
  
  def say
    "no go"
  end
  
  def we_all_say
    'something'
  end
end

puts YesNo.No.class
puts YesNo.No.say
puts YesNo.Yes.say
puts YesNo.Yes.we_all_say
puts YesNo.Maybe.say
