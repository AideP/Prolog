lista_aplanada :-
    write('Ingrese una lista para aplanar (ejemplo: [[a, [b, c]]): '),
    read(UserList),
    flatten(UserList, Result),
    write('La lista aplanada es: '), write(Result), nl.