-module(e12).
-export([doit/1]).

checkit(_, Sum, _, _, Divisors, Goal) when Divisors > Goal -> Sum;
checkit(N, Sum, Midway, Factor, Divisors, Goal) when Factor > Midway ->
  io:format("Midpoint pass detected for ~p with ~p, ~p divisors found~n", [Sum, Factor, Divisors]),
  checkit(N+1, Sum+N+1, round(math:sqrt(Sum+N+1)), 1, 0, Goal);
checkit(N, Sum, Midway, Factor, Divisors, Goal) ->
  case Sum rem Factor =:= 0 of
    true -> checkit(N, Sum, Midway, Factor+1, Divisors+2, Goal);
    false -> checkit(N, Sum, Midway, Factor+1, Divisors, Goal)
  end.

doit(Goal) -> checkit(1, 1, 1, 1, 0, Goal).

