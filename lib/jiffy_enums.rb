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
    all.select do |enum|
      enum.value == value
    end.first
  end

  def for_ordinal (ordinal)
    all.select do |enum|
      enum.ordinal == ordinal
    end.first
  end

  def all_to_hash
    hash = {}
    each do |key, value|
      hash[key] = value.value
    end
    hash
  end

  def to_coffee(baseHashStr)
    final_coffee = ""
    final_variable = self.name.split("::").inject(baseHashStr) do |result,part|
      final_coffee += "#{result}.#{part} ||= {}\n"
      "#{result}.#{part}"
    end

    final_coffee = final_coffee + "#{final_variable} = new JiffyEnums #{
      @hash.map do |key, enum|
        "#{key}:new JiffyEnum(\"#{enum.key}\", \"#{enum.value}\", #{enum.ordinal})"
      end.join(", ")
    }\n"
    puts final_coffee
    final_coffee
  end
end
