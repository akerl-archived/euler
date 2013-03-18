-module(e2).
-export([mathit/1]).

fibit(_, New, Max, Sum) when New > Max -> Sum;
fibit(Old, New, Max, Sum) ->
  case New rem 2 =:= 0 of
    true -> fibit(New, Old+New, Max, New+Sum);
    false -> fibit(New, Old+New, Max, Sum)
  end.

mathit(Max) -> fibit(1, 2, Max, 0).

