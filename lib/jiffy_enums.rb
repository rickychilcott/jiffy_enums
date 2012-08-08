require "jiffy_enums/engine"

module JiffyEnums
  def initialize(key, value, ordinal)
    @key = key
    @value = value
    @ordinal = ordinal
  end

  def key
    @key
  end

  def value
    @value
  end

  def ordinal
    @ordinal
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # ordinals start from index 1 and NOT 0
    def define(key, value = nil)
      @hash ||= {}
      @hash[key] = self.new(key, value, @hash.keys.length + 1)
    end

    def [] (key)
      @hash[key]
    end

    def find_by_ordinal(ordinal)

    end

    def const_missing(key)
      @hash[key].value
    end

    def each
      @hash.each do |key, value|
        yield key, value
      end
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

    def all
      @hash.values
    end

    def all_to_hash
      hash = {}
      each do |key, value|
        hash[key] = value.value
      end
      hash
    end
  end
end
