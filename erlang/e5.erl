-module(e5).
-export([doit/1, doit2/1]).

doit(Max, Mod) ->
  ThisInt = Max*Mod,
  ThisList = lists:seq(1,Max-1),
  case lists:all(fun(X) -> ThisInt rem X =:= 0 end, ThisList) of
    true -> Max*Mod;
    false -> doit(Max, Mod+1)
  end.

doit(Max) ->
  doit(Max, 1).

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).
lcm(A, B) -> (A*B) div gcd(A, B).

doit2(Max) ->
  lists:foldl(fun(A, B) -> lcm(B, A) end, 1, lists:seq(1,Max)).


