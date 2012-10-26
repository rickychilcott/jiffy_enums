require 'jiffy_enums'
require 'jiffy_enums/engine'

class JiffyEnum
  extend JiffyEnums
  extend Enumerable
  attr_reader :key, :value, :ordinal
  def initialize(key, value, ordinal)
    @key = key
    @value = value
    @ordinal = ordinal
  end
end
