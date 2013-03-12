-module(e6).
-export([doit/1]).

doit(Max, Max, SquareSum, Sum) -> round( math:pow(Sum + Max,2) - (SquareSum + math:pow(Max,2) ) );
doit(Int, Max, SquareSum, Sum) -> doit(Int+1, Max, SquareSum + math:pow(Int,2), Sum + Int).
doit(Max) -> doit(1, Max, 0, 0).

