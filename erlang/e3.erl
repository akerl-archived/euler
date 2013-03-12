-module(e3).
-export([factor/1]).

factor(Number,Counter) when Counter =< Number ->
  case Number rem Counter == 0 of
    true -> [Counter|factor((Number div Counter),Counter)]; 
    false -> factor(Number,Counter+1)
  end;
factor(_,_) -> [].

factor(Number) -> 
  io:format("The largest prime factor of ~p is ~p~n", [ Number, lists:last( factor(Number,2) ) ] ).

