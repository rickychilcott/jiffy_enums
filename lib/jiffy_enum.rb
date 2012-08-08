class JiffyEnum
  attr_reader :key, :value, :ordinal
  def initialize(key, value, ordinal)
    @key = key
    @value = value
    @ordinal = ordinal
  end
end
