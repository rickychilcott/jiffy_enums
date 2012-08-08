#= require jiffy_enum
#= require self

class JiffyEnums
  constructor: (@hash) ->

  # equavalent to [] in ruby
  get: (key) =>
    @hash[key]

  each: (func) =>
    _.each(@hash, func)

  all: (func) =>
    _.values(@hash)

  for_value: (value) =>
    _.each( all(), (enum) ->
      return enum if value == enum.value
    )

  for_ordinal: (ordinal) =>
    _.each( all(), (enum) ->
      return enum if ordinal == enum.ordinal
    )

  all_to_hash: () =>
    hash = {}
    each( (enum, key) ->
      hash[key] = enum.value
    )
    hash
