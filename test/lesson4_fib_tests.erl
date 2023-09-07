-module(lesson4_fib_tests).

-include_lib("eunit/include/eunit.hrl").

-define(elapsed_time(Expr), begin
    Start = erlang:system_time(second),
    Expr,
    End = erlang:system_time(second),
    End - Start
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
        ?_assert(lesson4_fib:fib(31) =:= 2178309)
    ].

fib_tail_test_() ->
    [
        ?_assert(lesson4_fib:fib_tail(0) =:= 1),
        ?_assert(lesson4_fib:fib_tail(1) =:= 1),
        ?_assert(lesson4_fib:fib_tail(2) =:= 2),
        ?_assert(lesson4_fib:fib_tail(3) =:= 3),
        ?_assert(lesson4_fib:fib_tail(4) =:= 5),
        ?_assert(lesson4_fib:fib_tail(5) =:= 8),
        ?_assertException(error, function_clause, lesson4_fib:fib_tail(-1)),
        ?_assert(lesson4_fib:fib_tail(31) =:= 2178309)
    ].

perf_test_() ->
    [
        {
            "fib(40) completes > 1 second",
            timeout,
            10,
            ?_assert(?elapsed_time(lesson4_fib:fib(40)) >= 1)
        },
        {
            "fib_tail(40) completes < 1 second",
            ?_assert(?elapsed_time(lesson4_fib:fib_tail(40)) =< 1)
        },
        {
            "fib_tail(50) completes < 1 second",
            ?_assert(?elapsed_time(lesson4_fib:fib_tail(50)) =< 1)
        },
        {
            "fib_tail(100) completes < 1 second",
            ?_assert(?elapsed_time(lesson4_fib:fib_tail(100)) =< 1)
        },
        {
            "fib_tail(1_000) completes < 1 second",
            ?_assert(?elapsed_time(lesson4_fib:fib_tail(1_000)) =< 1)
        },
        {
            "fib_tail(10_000) completes < 1 second",
            ?_assert(?elapsed_time(lesson4_fib:fib_tail(10_000)) =< 1)
        }
    ].
