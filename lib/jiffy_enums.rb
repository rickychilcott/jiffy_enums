require "jiffy_enums/engine"
require "jiffy_enum"

module JiffyEnums
  # ordinals start from index 1 and NOT 0
  def define(key, value = nil)
    @hash ||= {}
    @hash[key] = ::JiffyEnum.new(key, value, @hash.keys.length + 1)
  end

  def [] (key)
    @hash[key]
  end

  def const_missing(key)
    @hash[key].value
  end

  def each
    @hash.each do |key, value|
      yield key, value
    end
  end

  def all
    @hash.values
  end

  def for_value (value)
    all do |enum|
      if enum.value == value
        return enum
      end
    end
  end

  def for_ordinal (ordinal)
    all do |enum|
      if enum.ordinal == ordinal
        return enum
      end
    end
  end

  def all_to_hash
    hash = {}
    each do |key, value|
      hash[key] = value.value
    end
    hash
  end

  def to_coffee
    "#{self.name}:#{
      @hash.map do |key, enum|
        "#{key}:new JiffyEnum(#{enum.key}, #{enum.value}, #{enum.ordinal})"
      end.join(", ")
    }"
  end
end
