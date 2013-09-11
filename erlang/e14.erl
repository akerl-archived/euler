-module(e14).
-export([doit/1]).

spin_it(2, _, _, Winner, _) -> Winner;
spin_it(Start, 1, Count, Leader, Leader_Count) ->
    case Count > Leader_Count of
        true ->
            spin_it(Start-1, Start-1, 0, Start, Count);
        false ->
            spin_it(Start-1, Start-1, 0, Leader, Leader_Count)
    end;
spin_it(Start, Current, Count, Leader, Leader_Count) ->
    case Current rem 2 =:= 0 of
        true ->
            spin_it(Start, round(Current /2), Count+1, Leader, Leader_Count);
        false ->
            spin_it(Start, 3*Current + 1, Count+1, Leader, Leader_Count)
    end.

doit(Max) -> spin_it(Max, Max, 0, 0, 0).

