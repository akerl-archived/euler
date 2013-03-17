-module(e15).
-export([doit/1]).

factorial(For, For, Acc) -> For*Acc;
factorial(For, Now, Acc) -> factorial(For, Now+1, Acc*Now).
factorial(For) -> factorial(For, 1, 1).

doit(Size) -> round(factorial(2 * Size) / math:pow(factorial(Size),2)).

