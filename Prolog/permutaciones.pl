permutacion :-
    write('Ingrese una lista para obtener sus permutaciones (ejemplo: [a, b, c]): '),
    read(UserList), 
    findall(P, permutar(UserList, P), Permutations), %findall para encontrar todas las permutaciones posibles
    write('Las permutaciones son: '), nl,
    write(Permutations), nl.

permutar([], []). 
permutar([H|T], P) :- permutar(T, R), insertar(H, R, P). 
insertar(X, L, [X|L]). 
insertar(X, [H|T], [H|R]) :- insertar(X, T, R). 
