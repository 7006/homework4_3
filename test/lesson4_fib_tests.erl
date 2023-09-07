-module(lesson4_fib_tests).

-include_lib("eunit/include/eunit.hrl").

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
