% Inicio del chatbot
eliza :-
    writeln('Hola, soy Eliza, tu chatbot familiar.'),
    writeln('Por favor, ingresa tu consulta (usa solo minusculas sin punto al final):'),
    read_line_as_list(Input),
    eliza(Input), !.

% Caso de salida
eliza(Input) :-
    maplist(downcase_atom, Input, LowerInput),
    LowerInput = ['adios'],
    writeln('Adios. Espero haberte ayudado.'), !.

% Respuesta por defecto
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    read_line_as_list(Input1),
    eliza(Input1), !.

% Plantillas para consultas
template([quien, es, el, hijo, de, s(_)], [flag_hijos], [5]).
template([quien, es, el, padre, de, s(_)], [flag_padre], [5]).
template([quien, es, la, madre, de, s(_)], [flag_madre], [5]).
template([quien, es, el, abuelo, de, s(_)], [flag_abuelo], [5]).
template([quien, es, el, tio, de, s(_)], [flag_tio], [5]).
template([quienes, son, los, hermanos, de, s(_)], [flag_hermanos], [5]).
template([quien, es, el, cunado, de, s(_)], [flag_cunado], [5]).
template(_, ['Por favor, explica un poco mas.'], []).

% Base de datos
padre(raul).
padre(benjamin).
padre(jorge).
padre(alejandroM).
padre(alejandro).
madre(maricruz).
madre(teresa).
madre(cristina_abuela).
madre(teresa_abuela).
madre(leticia).

padrede(raul, aide).
padrede(raul, cristina).
padrede(raul, raul_hijo).
padrede(benjamin, raul).
padrede(jorge, esmeralda).
padrede(jorge, hugo).
padrede(jorge, nataly).
padrede(alejandro, alejandro_hijo).
padrede(alejandro, alejandra).
padrede(alejandroM, alejandrito).
padrede(alejandroM, eleazar).
padrede(alejandroM, kenia).

madrede(maricruz, aide).
madrede(maricruz, cristina).
madrede(maricruz, raul_hijo).
madrede(cristina_abuela, raul).
madrede(teresa_abuela, maricruz).
madrede(teresa, esmeralda).
madrede(teresa, hugo).
madrede(teresa, nataly).
madrede(edithM, alejandro_hijo).
madrede(edithM, alejandra).
madrede(leticia, emely).
madrede(edith, alejandrito).
madrede(edith, eleazar).
madrede(edith, kenia).

hermano(jose, maricruz).
hermana(edith, raul).
hermano(jorge, raul).
hermano(javier, raul).
hermano(eduardo, raul).
hermana(griselda, maricruz).
hermana(leticia, raul).

esposo(alejandroM, edith).
esposo(jorge, teresa).
esposa(edithM, alejandro).

abuelos(X, Y) :- (padrede(X, Z), padrede(Z, Y)); (madrede(X, Z), madrede(Z, Y)).
tio(X, Y) :- (hermano(X, Z), padrede(Z, Y)); (hermana(X, Z), madrede(Z, Y)).
hermanos(X, Y) :-
    padrede(P, X), padrede(P, Y),
    madrede(M, X), madrede(M, Y),
    X \= Y.
cunado(X, Y) :-
    (hermano(X, Z), esposo(Y, Z));
    (hermana(X, Z), esposa(Y, Z)).

% Coincidencias
match([], []).
match([S|Stim], [I|Input]) :-
    atom(S), S == I,
    match(Stim, Input), !.
match([S|Stim], [_|Input]) :-
    \+atom(S),
    match(Stim, Input), !.

% Respuestas específicas según la consulta
replace0([], _, _, Resp, Resp).
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_hijos | _],
    findall(Y, padrede(Atom, Y), R), !.
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_padre | _],
    findall(X, padrede(X, Atom), R), !.
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_madre | _],
    findall(X, madrede(X, Atom), R), !.
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelo | _],
    findall(X, abuelos(X, Atom), R), !.
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tio | _],
    findall(X, tio(X, Atom), R), !.
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_hermanos | _],
    findall(X, hermanos(X, Atom), R), !.
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_cunado | _],
    findall(X, cunado(X, Atom), R), !.

% Lectura de línea como lista
read_line_as_list(Input) :-
    read_line_to_string(user_input, String),
    split_string(String, " ", "", InputList),
    maplist(atom_string, Input, InputList).
