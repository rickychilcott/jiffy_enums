#= require jiffy_enum
#= require_self

class window.JiffyEnums
  constructor: (@hash) ->

  # equavalent to [] in ruby
  get: (key) =>
    @hash[key]

  each: (func) =>
    _.each(@hash, func)

  all: (func) =>
    _.values(@hash)

  for_value: (value) =>
    _.each( all(), (_enum) ->
      return _enum if value == _enum.value
    )

  for_ordinal: (ordinal) =>
    _.each( all(), (_enum) ->
      return _enum if ordinal == _enum.ordinal
    )

  all_to_hash: () =>
    hash = {}
    each( (_enum, key) ->
      hash[key] = _enum.value
    )
    hash
