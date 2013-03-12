-module(e7).
-export([doit/1, doitslow/1]).

isPrime(_, []) -> true;
isPrime(This, [Factor | _]) when This rem Factor =:= 0 -> false;
isPrime(This, [_ | Stack]) -> isPrime(This, Stack).

doit(This, Index, Index, _) -> This-1;
doit(This, Index, Count, Stack) ->
  case isPrime(This, Stack) of
    true -> doit(This+1, Index, Count+1, [This|Stack]);
    false -> doit(This+1, Index, Count, Stack)
  end.

doit(Index) -> doit(2, Index, 0, []).

isPrimeSlow(This, This) -> true;
isPrimeSlow(This, Factor) when This rem Factor =:= 0 -> false;
isPrimeSlow(This, Factor) -> isPrimeSlow(This, Factor+1).

doitslow(This, Index, Index) -> This-1;
doitslow(This, Index, Count) ->
  case isPrimeSlow(This, 2) of
    true -> doitslow(This+1, Index, Count+1);
    false -> doitslow(This+1, Index, Count)
  end.

doitslow(Index) -> doitslow(2, Index, 0).

