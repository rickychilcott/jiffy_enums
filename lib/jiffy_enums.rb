require "jiffy_enum"

module JiffyEnums
  include Enumerable
  # ordinals start from index 1 and NOT 0
  def define(key, value = nil, &overrides)
    @hash ||= {}
    the_enum = self.new(key, value, @hash.keys.length + 1)
    @hash[key] = the_enum
    define_singleton_method(key) do
      the_enum
    end
    the_enum.instance_eval(&overrides) unless overrides.nil?
  end

  def [] (key)
    @hash[key]
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
    final_coffee
  end
end
