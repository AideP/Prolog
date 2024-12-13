eliza :-
    writeln('Hola, soy Eliza, tu chatbot.'),
    writeln('Actualmente tengo el conocimiento sobre: 
        *   Arbol genealogico de la Familia Perez Andrade'),
    writeln('Por favor, ingresa tu consulta (usa solo minusculas sin punto al final):'),
    read_line_as_list(Input),
    eliza(Input), !.

% Caso de salida
eliza(Input) :-
    maplist(downcase_atom, Input, LowerInput),
    LowerInput = ['adios'],
    writeln('Adios. Espero haberte ayudado.'), !.

% Respuesta específica
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    % Si se encuentra un template, procesar la respuesta
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    read_line_as_list(Input1),
    eliza(Input1), !.

% Respuesta por defecto
eliza(_) :-
    writeln('Por favor, explica un poco mas.'),
    read_line_as_list(Input1),
    eliza(Input1), !.


% Plantillas para consultas
template([eliza, quien, es, el, hijo, de, s(_)], [flag_hijos], [6]).
template([eliza, quien, es, el, padre, de, s(_)], [flag_padre], [6]).
template([eliza, quien, es, la, madre, de, s(_)], [flag_madre], [6]).
template([eliza, quienes, son, los, padres, de, s(_)], [flag_padres], [6]).
template([eliza, quien, es, el, abuelo, de, s(_)], [flag_abuelo], [6]).
template([eliza, quien, es, el, tio, de, s(_)], [flag_tio], [6]).
template([eliza, quien, es, el, cunado, de, s(_)], [flag_cunado], [6]).
template([eliza, quienes, son, los, primos, de, s(_)], [flag_primos], [6]).
template([eliza, quienes, son, los, hermanos, de, s(_)], [flag_hermanos], [6]).

% Coincidencias
match([], []).
match([S|Stim], [I|Input]) :-
    atom(S), S == I,
    match(Stim, Input), !.
match([S|Stim], [_|Input]) :-
    \+atom(S),
    match(Stim, Input), !.

% Respuestas específicas según la consulta
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_hijos | _],
    findall(Y, (padrede(Atom, Y); madrede(Atom, Y)), Results),
    format_response('hijos', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_padre | _],
    findall(X, padrede(X, Atom), Results),
    format_response('padre', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_madre | _],
    findall(X, madrede(X, Atom), Results),
    format_response('madre', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_padres | _],
    findall(X, padres(X, Atom), Results),
    format_response('padres', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelo | _],
    findall(X, abuelos(X, Atom), Results),
    format_response('abuelos', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tio | _],
    findall(X, tio(X, Atom), Results),
    format_response('tios', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_cunado | _],
    findall(Y, cunado(Atom, Y), Results),
    format_response('cunados', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_primos | _],
    findall(Y, primos(Atom, Y), Results),
    format_response('primos', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_hermanos | _],
    findall(Y, hermanos(Atom, Y), Results),
    format_response('hermanos', Atom, Results, R), !.

% Formatear respuesta personalizada
format_response(Category, Person, Results, R) :-
    ( Results \= [] ->
        atomic_list_concat(Results, ', ', ResultsStr),
        format(atom(R), 'Claro, los ~w de ~w son: ~w.', [Category, Person, ResultsStr])
    ;
        format(atom(R), 'Lo siento, no encontre ~w para ~w.', [Category, Person])
    ).


% Lectura de línea como lista
read_line_as_list(Input) :-
    read_line_to_string(user_input, String),
    split_string(String, " ", "", InputList),
    maplist(atom_string, Input, InputList).

% Base de datos familia
padre(raul).
padre(benjamin).
padre(jorge).
padre(alejandroM).
padre(alejandro).
padre(dolores).

madre(maricruz).
madre(teresa).
madre(cristina_abuela).
madre(teresa_abuela).
madre(leticia).
madre(edithM).
madre(edith).
madre(griselda).

padrede(raul, aide).
padrede(raul, cristina).
padrede(raul, raul_hijo).
padrede(benjamin, raul).
padrede(benjamin, javier).
padrede(benjamin, jorge).
padrede(benjamin, eduardo).
padrede(benjamin, alejandro).
padrede(benjamin, edith).
padrede(benjamin, leticia).
padrede(jorge, esmeralda).
padrede(jorge, hugo).
padrede(jorge, nataly).
padrede(alejandro, alejandro_hijo).
padrede(alejandro, alejandra).
padrede(alejandroM, alejandrito).
padrede(alejandroM, eleazar).
padrede(alejandroM, kenia).
padrede(dolores, maricruz).
padrede(dolores, jose).
padrede(dolores, griselda).

madrede(maricruz, aide).
madrede(maricruz, cristina).
madrede(maricruz, raul_hijo).
madrede(cristina_abuela, raul).
madrede(cristina_abuela, edith).
madrede(cristina_abuela, jorge).
madrede(cristina_abuela, javier).
madrede(cristina_abuela, eduardo).
madrede(cristina_abuela, leticia).
madrede(cristina_abuela, alejandro).
madrede(teresa_abuela, maricruz).
madrede(teresa_abuela, jose).
madrede(teresa_abuela, griselda).
madrede(teresa, esmeralda).
madrede(teresa, hugo).
madrede(teresa, nataly).
madrede(edithM, alejandro_hijo).
madrede(edithM, alejandra).
madrede(leticia, emely).
madrede(edith, alejandrito).
madrede(edith, eleazar).
madrede(edith, kenia).
madrede(griselda, bianca).
madrede(griselda,diana).
madrede(griselda,maria_luisa).
madrede(griselda,brianna).
madrede(griselda,rafael).
madrede(griselda,nathan).

hermano(jose, maricruz).
hermano(jorge, raul).
hermano(javier, raul).
hermano(eduardo, raul).
hermano(alejandro, raul).
hermana(griselda, maricruz).
hermana(leticia, raul).
hermana(edith, raul).

esposo(alejandroM, edith).
esposo(jorge, teresa).
esposo(alejandro,edithM).
esposo(raul,maricruz).
esposa(edithM, alejandro).
esposa(maricruz,raul).
esposa(edith,alejandroM).
esposa(teresa,jorge).

abuelos(X, Y) :- (padrede(X, Z), padrede(Z, Y)); (padrede(X, Z), madrede(Z, Y)); (madrede(X, Z), padrede(Z, Y));  (madrede(X, Z), madrede(Z, Y)).  

padres(X, Y) :- (padrede(X, Y); madrede(X, Y)).

tio(X, Y) :- (hermano(X, Z), padrede(Z, Y)); (hermana(X, Z), padrede(Z, Y)); (hermano(X, Z), madrede(Z, Y)); (hermana(X, Z), madrede(Z, Y)).

hermanos(X, Y) :- padrede(P, X), padrede(P, Y), madrede(M, X), madrede(M, Y), X \= Y.

cunado(X, Y) :- hermanos(X, Z), (esposa(Z, Y); esposo(Z, Y)); esposo(X, Z), hermanos(Z, Y); esposa(X, Z), hermanos(Z, Y).                

primos(X, Y) :- padrede(P1, X), hermanos(P1, P2), padrede(P2, Y); madrede(M1, X), hermanos(M1, M2), madrede(M2, Y); padrede(P, X), madrede(M1, Y), hermanos(P, M1); madrede(M, X), padrede(P1, Y), hermanos(M, P1).
    
