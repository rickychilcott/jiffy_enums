require 'jiffy_enums'

class JiffyEnum
  extend JiffyEnums
  attr_reader :key, :value, :ordinal
  def initialize(key, value, ordinal)
    @key = key
    @value = value
    @ordinal = ordinal
  end
end
