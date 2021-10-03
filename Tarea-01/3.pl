reverse_digits(Y,X) :-
(   integer(Y) ->
        reverse_digits(Y, 0, X)
    ;   integer(X),
        reverse_digits(X, 0, Y)
    ).

reverse_digits(0, X, X) :- !.
reverse_digits(Y, X0, X) :-
    Y > 0,
    R is Y div 10,
    X1 is X0 * 10 + Y mod 10,
    reverse_digits(R, X1, X).