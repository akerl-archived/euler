-module(e4).
-export([doit/1]).

checkit(Number, Stack) -> 
  case list_to_integer(lists:reverse(integer_to_list(Number))) =:= Number of
    true -> [Number|Stack];
    false -> Stack
  end.

doit(_, B, Upper, _, Stack) when B > Upper -> Stack;
doit(A, B, Upper, Lower, Stack) when A > Upper -> doit(Lower, B+1, Upper, Lower, Stack);
doit(A, B, Upper, Lower, Stack) -> doit(A+1, B, Upper, Lower, checkit(A*B, Stack)).

doit(Digits) ->
  Lower = round(math:pow(10,Digits-1)),
  Upper = round(math:pow(10,Digits)-1),
  lists:max(doit(Lower, Lower, Upper, Lower, [])).

