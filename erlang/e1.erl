-module(e1).
-export([mathit/1]).

sumit(X, Sum) when X rem 5 =:= 0; X rem 3 =:= 0 -> 
  X + Sum;
sumit(_, Sum) -> Sum.

mathit(Max) ->
  lists:foldl(fun sumit/2, 0, lists:seq(0,Max-1)).

