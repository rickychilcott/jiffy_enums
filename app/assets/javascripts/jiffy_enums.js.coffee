#= require jiffy_enum
#= require_self

class window.JiffyEnums
  constructor: (@hash) ->
    that = this
    _.each(@hash, (k,v) ->
      that[v] = k
    )

  # equavalent to [] in ruby
  get: (key) =>
    @hash[key]

  each: (func) =>
    _.each(@hash, func)

  all: (func) =>
    _.values(@hash)

  for_value: (value) =>
    _.find( all(), (_enum) ->
      value == _enum.value
    )

  for_ordinal: (ordinal) =>
    _.find( all(), (_enum) ->
      ordinal == _enum.ordinal
    )

  all_to_hash: () =>
    hash = {}
    each( (_enum, key) ->
      hash[key] = _enum.value
    )
    hash
