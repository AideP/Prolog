start :-
    write('Ingrese una lista para aplanar (ejemplo: [[a, [b, c]]): '),
    read(UserList),
    write(UserList).
%flatten([1, [2, [3, 4], 5], [6]], R).