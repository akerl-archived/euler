-module(e10).
-export([doit/1]).

isPrime(_, SqrtThis, Factor) when Factor > SqrtThis -> true;
isPrime(This, _, Factor) when This rem Factor =:= 0 -> false;
isPrime(This, SqrtThis, Factor) -> isPrime(This, SqrtThis, Factor+2).

crunchit(Int, Max, Sum) when Int > Max -> Sum;
crunchit(Int, Max, Sum) ->
  case isPrime(Int, math:sqrt(Int), 3) of
    true -> 
      io:format("~p is prime~n", [Int]),
      crunchit(Int+2, Max, Sum+Int);
    false -> crunchit(Int+2, Max, Sum)
  end.

doit(Max) -> crunchit(3, Max, 2).
 
