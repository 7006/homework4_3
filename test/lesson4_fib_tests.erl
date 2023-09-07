-module(lesson4_fib_tests).

-include_lib("eunit/include/eunit.hrl").

-define(_assertWithinTimespan(Expr, N, TimeUnit), begin
    Start = erlang:system_time(TimeUnit),
    Expr,
    End = erlang:system_time(TimeUnit),
    ?_assert(End - Start =< 1)
end).

fib_test_() ->
    [
        ?_assert(lesson4_fib:fib(0) =:= 1),
        ?_assert(lesson4_fib:fib(1) =:= 1),
        ?_assert(lesson4_fib:fib(2) =:= 2),
        ?_assert(lesson4_fib:fib(3) =:= 3),
        ?_assert(lesson4_fib:fib(4) =:= 5),
        ?_assert(lesson4_fib:fib(5) =:= 8),
        ?_assertException(error, function_clause, lesson4_fib:fib(-1)),
        ?_assert(lesson4_fib:fib(31) =:= 2178309),
        ?_assertWithinTimespan(lesson4_fib:fib(31), 1, second)
    ].
