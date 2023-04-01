-module(purerlAlias_moduleUtilities@foreign).

-export([lowerCaseLetter/1, wildcard/1]).

lowerCaseLetter(C) ->
  'Elixir.String':downcase(<<C/utf8>>).

wildcard(WildcardPath) ->
  fun () -> 'Elixir.Path':wildcard(WildcardPath) end.
