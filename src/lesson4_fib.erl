-module(lesson4_fib).

-export([fib/1, fib_tail/1]).

fib(0) ->
    1;
fib(1) ->
    1;
fib(N) when N > 1 ->
    fib(N - 1) + fib(N - 2).

fib_tail(N) when N >= 0 ->
    fib_tail(N, -1, 0, 1).

fib_tail(N, N, X, _) ->
    X;
fib_tail(N, I, X, Y) ->
    fib_tail(N, I + 1, X + Y, X).
