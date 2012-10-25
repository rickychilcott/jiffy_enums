require "jiffy_enum"

module JiffyEnums
  # ordinals start from index 1 and NOT 0
  def define(key, value = nil, &overrides)
    @size = (@size || 0) + 1
    @hash ||= {}
    @array ||= []
    the_enum = self.new(key, value, @size )
    @hash[key]      = the_enum
    @hash[key.to_s] = the_enum
    @array << the_enum
    define_singleton_method(key) do
      the_enum
    end
    the_enum.instance_eval(&overrides) unless overrides.nil?
  end

  def [] (key)
    @hash[key]
  end

  def each
    @array.each do |value|
      yield value
    end
  end

  def all
    @array.map{|x|x}
  end

  def for_value (value)
    all.select do |enum|
      enum.value == value
    end.first
  end

  def for_ordinal (ordinal)
    @array[ordinal - 1]
  end

  def all_to_hash
    hash = {}
    each do | value|
      hash[value.key] = value.value
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
      @array.map do |enum|
        "#{enum.key}:new JiffyEnum(\"#{enum.key}\", \"#{enum.value}\", #{enum.ordinal})"
      end.join(", ")
    }\n"
    final_coffee
  end
end
