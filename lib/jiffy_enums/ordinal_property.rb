module JiffyEnums
  module OrdinalProperty
    def self.jiffy_enum_property(name, jiffy_enum)
      ordinal_name = "#{name}_ordinal".to_sym
      #define the accessor
      define_method name do
        ordinal = [:ordinal_name]
        if nil == ordinal
          nil
        else
          jiffy_enum.for_ordinal(ordinal)
        end
      end
      getter_name = "#{name}="
      define_method getter_name do |value|
        raise ArgumentError, "expected enum class #{jiffy_enum}" unless value.class == jiffy_enum.class
        [:ordinal_name] = value.ordinal
      end
    end
  end
end
