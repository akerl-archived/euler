-module(e16).
-export([doit/1]).

doit(Power) -> 
  lists:foldl(
    fun(X, Acc) -> X+Acc end, 0, 
    lists:map(
      fun(X) -> { Int, _ } = string:to_integer([X]), Int end, 
      integer_to_list(round(math:pow(2,Power)))
    )
  ).

