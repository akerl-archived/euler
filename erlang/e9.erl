-module(e9).
-export([doit/2, threadit/6]).

threadit(_, _, C, CMax, _, _) when C > CMax -> ok;
threadit(A, B, C, CMax, Sum, Parent) when B > Sum -> threadit(A, 1, C+1, CMax, Sum, Parent);
threadit(A, B, C, CMax, Sum, Parent) when A > Sum -> 
  threadit(1, B+1, C, CMax, Sum, Parent);
threadit(A, B, C, CMax, Sum, Parent) when A + B + C =:= Sum -> 
  case math:pow(A,2) + math:pow(B,2) =:= math:pow(C,2) of
    true -> Parent ! {A, B, C};
    false -> threadit(A+1, B, C, CMax, Sum, Parent)
  end;
threadit(A, B, C, CMax, Sum, Parent) -> threadit(A+1, B, C, CMax, Sum, Parent).

spawnit( [CStart | Stack], Sum, Split) ->
  { _, Remainder } = lists:split(Split,Stack),
  io:format("Spawning a child to handle ~p to ~p~n", [CStart, CStart+Split]),
  spawn(?MODULE, threadit, [1,1,CStart, CStart+Split, Sum, self()]),
  spawnit(Remainder, Sum, Split);
spawnit([], _, _) -> ok.

doit(Sum, Split) ->
  spawnit(lists:seq(1,Sum), Sum, Split),
  receive
    {A, B, C} -> io:format("Correct answer is ~p from ~p, ~p, and ~p~n", [A*B*C, A, B, C])
  end.

