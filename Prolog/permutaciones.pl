permutacion :-
    write('Ingrese una lista para obtener sus permutaciones (ejemplo: [a, b, c]): '),
    read(UserList),
    permutar(List, P),
    write('Las permutaciones son: '), nl,
    write(Permutations), nl

permutacion([], []).
permutacion([H|T], P) :-
    permutacion(T, R),
    insertar(H, R, P).

insertar(X, L, [X|L]).
insertar(X, [H|T], [H|R]) :- insertar(X, T, R).