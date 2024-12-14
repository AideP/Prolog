eliza :-
    writeln('Hola, soy Eliza, tu chatbot.'),
    writeln('Actualmente tengo el conocimiento sobre: 
        *   Arbol genealogico de la Familia Perez - Andrade
        *   Los juegos del hambre'),
    writeln('Por favor, ingresa tu consulta (usa solo minusculas sin punto al final):'),
    read_line_as_list(Input),
    eliza(Input), !.

% Caso de salida
eliza(Input) :-
    maplist(downcase_atom, Input, LowerInput),
    LowerInput = ['adios'],
    writeln('Adios. Espero haberte ayudado.'), !.

% Respuestas
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
%          FAMILIA     %
template([eliza, quien, es, hijo, de, s(_)], [flag_hijos], [5]).
template([eliza, quien, es, el, padre, de, s(_)], [flag_padre], [6]).
template([eliza, quien, es, la, madre, de, s(_)], [flag_madre], [6]).
template([eliza, quienes, son, los, padres, de, s(_)], [flag_padres], [6]).

template([eliza, quienes, son, los, abuelos, paternos, de, s(_)], [flag_abuelos_paternos], [7]).
template([eliza, quienes, son, los, abuelos, maternos, de, s(_)], [flag_abuelos_maternos], [7]).
template([eliza, quienes, son, los, abuelos, de, s(_)], [flag_abuelos], [6]).
template([eliza, como, se, llaman, los, abuelos, hombres, de, s(_)], [flag_abuelos_hombres], [8]).
template([eliza, como, se, llaman, las, abuelas, mujeres, de, s(_)], [flag_abuelas_mujeres], [8]).

template([eliza, quienes, son, todos, los, tios, de, s(_)], [flag_tios], [7]).
template([eliza, quienes, son, los, tios, hombres, de, s(_)], [flag_tios_hombres], [7]).
template([eliza, quienes, son, las, tias, mujeres, de, s(_)], [flag_tias_mujeres], [7]).

template([eliza, quien, es, el, cunado, de, s(_)], [flag_cunado], [6]).
template([eliza, quienes, son, los, primos, de, s(_)], [flag_primos], [6]).
template([eliza, quienes, son, los, hermanos, de, s(_)], [flag_hermanos], [6]).
%         FAMILIA     %

%       ARBOL DE DATOS         %
template([eliza, que, especialidad, tiene, el, distrito, s(_)], [flag_especialidad_distrito], [6]).
template([eliza, que, habilidad, tiene, s(_)], [flag_habilidades], [4]).
template([eliza, quienes, son, los, aliados, de, s(_)], [flag_aliados], [6]).
template([eliza, en, que, juegos, participo, s(_)], [flag_participacion], [5]).
template([eliza, que, distrito, tiene, la, especialidad, s(_)], [flag_distrito_especialidad], [6]).
template([eliza, a, que, distrito, pertenece, s(_)], [flag_distrito_personaje], [5]).
template([eliza, quienes, pertenecen, al, distrito, s(_)],[flag_residentes_distrito],[5]).
template([eliza, quienes, murieron, en, los, juegos, del, hambre], [flag_muertos], []).
template([eliza, quienes, sobrevivieron, en, los, juegos, del, hambre], [flag_vivos], []).


%       ARBOL DE DATOS         %


% Coincidencias
match([], []).
match([S|Stim], [I|Input]) :-
    atom(S), S == I,
    match(Stim, Input), !.
match([S|Stim], [_|Input]) :-
    \+atom(S),
    match(Stim, Input), !.

% Respuestas específicas según la consulta
%RESPUESTAS PADRES%

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_hijos | _],
    findall(Y, (padrede(Atom, Y); madrede(Atom, Y)), Hijos),
    ( Hijos \= [] ->
        atomic_list_concat(Hijos, ', ', HijosStr),
        format(atom(R), 'Los hijos de ~w son ~w.', [Atom, HijosStr])
    ;
        format(atom(R), ' ~w no tiene hijos.', [Atom])
    ), !.


replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_padre | _],
    findall(X, padrede(X, Atom), Padres),
    ( Padres \= [] ->
        atomic_list_concat(Padres, ', ', PadresStr),
        format(atom(R), 'El padre de ~w es ~w.', [Atom, PadresStr])
    ;
        format(atom(R), ' ~w no tiene un padre conocido.', [Atom])
    ), !.



replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_madre | _],
    findall(X, madrede(X, Atom), Madres),
    ( Madres \= [] ->
        atomic_list_concat(Madres, ', ', MadresStr),
        format(atom(R), 'La madre de ~w es: ~w.', [Atom, MadresStr])
        ;
        format(atom(R), 'Lo siento, no se encontró una madre para ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_padres | _],
    findall(X, padres(X, Atom), Results),
    format_response('padres', Atom, Results, R), !.
%RESPUESTAS PADRES%

%RESPUESTAS ABUELOS%
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos_paternos | _],
    findall(X, (abuelos_paternos(X, Atom)), Results),
    format_response('abuelos paternos', Atom, Results, R), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos_maternos | _],
    findall(X, (abuelos_maternos(X, Atom)), Results),
    format_response('abuelos maternos', Atom, Results, R), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos | _],
    findall(X, (abuelos(X, Atom)), Results),
    format_response('abuelos', Atom, Results, R), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos_hombres | _],
    findall(X, abuelo(X, Atom), Results),
    format_response('abuelos hombres', Atom, Results, R), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelas_mujeres | _],
    findall(X, abuela(X, Atom), Results),
    format_response('abuelas mujeres', Atom, Results, R), !.
 %RESPUESTAS ABUELOS%   

%RESPUESTAS TIOS%
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tios | _],
    findall(X, tios(X, Atom), Results),
    format_response('tios', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tios_hombres | _],
    findall(X, tios_hombres(X, Atom), Results),
    format_response('tios hombres', Atom, Results, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tias_mujeres | _],
    findall(X, tias_mujeres(X, Atom), Results),
    format_response('tias mujeres', Atom, Results, R), !.
%RESPUESTAS TIOS%

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

%   RESPUESTAS ARBOL DE DATOS   %
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, DistritoAtom),  
    ( atom_number(DistritoAtom, Distrito) ; DistritoAtom = Distrito ),
    Resp = [flag_especialidad_distrito | _],
    especialidad_distrito(Distrito, Especialidad), 
    format(atom(R), 'El distrito ~w se especializa en: ~w.', [Distrito, Especialidad]), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), 
    Resp = [flag_participacion | _],
    participacion(Atom, Juegos, Resultado),
    format(atom(R), '~w participo en los Juegos del Hambre numero ~w y fue ~w.', [Atom, Juegos, Resultado]), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom), 
    Resp = [flag_distrito_personaje | _],
    distrito_pertenece(PersonajeAtom, Distrito),  
    nombre(PersonajeAtom, Nombre), 
    format(atom(R), '~w pertenece al distrito ~w.', [Nombre, Distrito]), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, DistritoAtom),
    ( atom_number(DistritoAtom, Distrito) ; DistritoAtom = Distrito ),
    Resp = [flag_residentes_distrito | _],
    findall(Personaje, distrito_pertenece(Personaje, Distrito), Residentes),
    maplist(nombre, Residentes, NombresResidentes),
    atomic_list_concat(NombresResidentes, ', ', ResidentesStr),
    format(atom(R), 'En el distrito ~w estan: ~w.', [Distrito, ResidentesStr]), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Especialidad), 
    Resp = [flag_distrito_especialidad | _],
    findall(Distrito, especialidad_distrito(Distrito, Especialidad), Distritos), 
    ( Distritos \= [] ->
        atomic_list_concat(Distritos, ', ', DistritosStr),
        format(atom(R), 'La especialidad ~w pertenece a los distritos: ~w.', [Especialidad, DistritosStr])
    ;
        format(atom(R), 'No se encontraron distritos con la especialidad: ~w.', [Especialidad])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom),  
    Resp = [flag_participacion | _],
    participacion(PersonajeAtom, Juegos, Resultado), 
    nombre(PersonajeAtom, Nombre),  
    format(atom(R), '~w participo en los juegos del hambre numero ~w y fue ~w.', [Nombre, Juegos, Resultado]), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom), 
    Resp = [flag_aliados | _],
    findall(Aliado, aliado(PersonajeAtom, Aliado), Aliados),  
    nombre(PersonajeAtom, Nombre), 
    maplist(nombre, Aliados, NombresAliados),  
    ( NombresAliados \= [] ->
        atomic_list_concat(NombresAliados, ', ', AliadosStr),
        format(atom(R), 'Los aliados de ~w son: ~w.', [Nombre, AliadosStr])
    ;
        format(atom(R), '~w no tiene aliados conocidos.', [Nombre])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom), 
    Resp = [flag_habilidades | _],
    habilidad(PersonajeAtom, Habilidad),  
    nombre(PersonajeAtom, Nombre), 
    format(atom(R), '~w tiene la habilidad de: ~w.', [Nombre, Habilidad]), !.
            
replace0(_, _, _, [flag_muertos | _], R) :-
    findall(Nombre, (estado(Personaje, Estado), 
    (Estado = muerto ; Estado = muerta), 
    nombre(Personaje, Nombre)), 
    Muertos),
    ( Muertos \= [] ->
        atomic_list_concat(Muertos, ', ', MuertosStr),
        format(atom(R), 'Los personajes que murieron son: ~w.', [MuertosStr])
    ;
        format(atom(R), 'No se encontraron personajes que hayan muerto.')
    ), !.
                
replace0(_, _, _, [flag_vivos | _], R) :-
    findall(Nombre, (estado(Personaje, Estado), 
    (Estado = viva ; Estado = vivo), 
     nombre(Personaje, Nombre)), 
    Vivos),
    ( Vivos \= [] ->
        atomic_list_concat(Vivos, ', ', VivosStr),
        format(atom(R), 'Los personajes que sobrevivieron son: ~w.', [VivosStr])
    ;
        format(atom(R), 'No se encontraron personajes que hayan sobrevivido.')
    ), !.
                                          
    
        
 
    
%   RESPUESTAS ARBOL DE DATOS   %


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

%ARBOL DE DATOS%
personaje(katniss).
personaje(peeta).
personaje(finnick).
personaje(johanna).
personaje(snow).
personaje(lucy_gray).
personaje(haymitch).
personaje(rue).
personaje(cinna).
personaje(effie).
personaje(beetee).
personaje(mags).
personaje(coin).
personaje(prim).
personaje(coriolanus_snow).
personaje(sejanus).
personaje(tigris).
personaje(caesar_flickerman).
personaje(foxface).
personaje(clove).
personaje(cato).
personaje(gale).
personaje(glimmer).


distrito(1).
distrito(2).
distrito(3).
distrito(4).
distrito(5).
distrito(6).
distrito(7).
distrito(8).
distrito(9).
distrito(10).
distrito(11).
distrito(12).
distrito(capitolio).

nombre(katniss, 'Katniss Everdeen').
nombre(peeta, 'Peeta Mellark').
nombre(finnick, 'Finnick Odair').
nombre(johanna, 'Johanna Mason').
nombre(snow, 'Presidente Snow/ Coriolanus Snow').
nombre(lucy_gray, 'Lucy Gray Baird').
nombre(haymitch, 'Haymitch Abernathy').
nombre(rue, 'Rue').
nombre(cinna, 'Cinna').
nombre(effie, 'Effie Trinket').
nombre(beetee, 'Beetee Latier').
nombre(mags, 'Mags').
nombre(coin, 'Alma Coin').
nombre(prim, 'Primrose Everdeen').
nombre(sejanus, 'Sejanus Plinth').
nombre(tigris, 'Tigris').
nombre(caesar_flickerman, 'Caesar Flickerman').
nombre(foxface, 'Foxface').
nombre(clove,'Clove').
nombre(cato,'Cato').
nombre(gale,'Gale').
nombre(glimmer,'Glimmer').

especialidad_distrito(1, 'productos de lujo').
especialidad_distrito(2, 'armamento y fuerzas militares').
especialidad_distrito(3, 'tecnologia y electricidad').
especialidad_distrito(4, 'pesca').
especialidad_distrito(5, 'energia').
especialidad_distrito(6, 'transporte').
especialidad_distrito(7, 'madera y papel').
especialidad_distrito(8, 'textiles').
especialidad_distrito(9, 'granos y agricultura').
especialidad_distrito(10, 'ganaderia').
especialidad_distrito(11, 'agricultura').
especialidad_distrito(12, 'mineria de carbon').
especialidad_distrito(13, 'armamento nuclear y gobierno subterraneo').
especialidad_distrito(capitolio, 'entretenimiento').

distrito_pertenece(katniss, 12).
distrito_pertenece(peeta, 12).
distrito_pertenece(finnick, 4).
distrito_pertenece(johanna, 7).
distrito_pertenece(snow, capitolio).
distrito_pertenece(lucy_gray, 12).
distrito_pertenece(haymitch, 12).
distrito_pertenece(rue, 11).
distrito_pertenece(cinna, capitolio).
distrito_pertenece(effie, capitolio).
distrito_pertenece(beetee, 3).
distrito_pertenece(mags, 4).
distrito_pertenece(coin, 13).
distrito_pertenece(prim, 12).
distrito_pertenece(sejanus, capitolio).
distrito_pertenece(tigris, capitolio).
distrito_pertenece(caesar_flickerman, capitolio).
distrito_pertenece(foxface,5).
distrito_pertenece(clove,2).
distrito_pertenece(cato,2).
distrito_pertenece(glimmer,1).

habilidad(katniss, 'arco y flecha').
habilidad(peeta, camuflaje).
habilidad(finnick, tridente).
habilidad(johanna, sigilo).
habilidad(haymitch, estrategia).
habilidad(rue, sigilo).
habilidad(beetee, 'ingenieria electrica').
habilidad(mags, pesca).
habilidad(coriolanus_snow, manipulacion).
habilidad(coin,manipulacion).
habilidad(gale, caza).
habilidad(prim, medicina).
habilidad(foxface, sigilo).
habilidad(clove, cuchillos).
habilidad(cato, combate).
habilidad(glimmer, carisma).


estado(katniss, viva).
estado(peeta, vivo).
estado(finnick, muerto).
estado(johanna, viva).
estado(rue, muerta).
estado(haymitch, vivo).
estado(mags, muerta).
estado(coriolanus_snow, muerto).
estado(lucy_gray, desconocido).
estado(gale, vivo).
estado(prim, muerta).
estado(foxface, muerta).
estado(clove, muerta).
estado(cato, muerto).
estado(glimmer, muerta).
estado(beetee,vivo).
estado()

personaje(katniss,viva).
personaje(peeta,vivo).
personaje(finnick,vivo).
personaje(johanna,viva).
personaje(snow,muerto).
personaje(lucy_gray,desconocido).
personaje(haymitch,vivo).
personaje(rue,muerta).
personaje(cinna,desconocido).
personaje(effie,viva).
personaje(beetee,vivo).
personaje(mags,muerta).
personaje(coin,muerta).
personaje(prim,muerta).
personaje(sejanus,muerto).
personaje(tigris,viva).
personaje(caesar_flickerman,desconocido).
personaje(foxface,muerta).
personaje(clove,muerta).
personaje(cato,muerto).
personaje(gale,vivo).
personaje(glimmer,muerta).

participacion(katniss, 74, vencedora).
participacion(peeta, 74, vencedor).
participacion(finnick, 65, vencedor).
participacion(johanna, 71, vencedora).
participacion(rue, 74, asesinada).
participacion(haymitch, 50, vencedor).
participacion(mags, 11, vencedora).
participacion(lucy_gray, 10, vencedora).
participacion(clove, 74, muerta).
participacion(cato, 74, finalista).
participacion(foxface, 74, muerta).
participacion(glimmer, 74, muerta).


aliado(katniss, peeta).
aliado(katniss, rue).
aliado(katniss,finnick).
aliado(katniss,johanna).
aliado(katniss, haymitch).
aliado(katniss,mags).
aliado(katniss,effie).
aliado(katniss,cinna).
aliado(katniss,beetee).
aliado(beetee, finnick).
aliado(beetee, johanna).
aliado(peeta, katniss).
aliado(peeta, haymitch).
aliado(peeta, finnick).
aliado(peeta,johanna).
aliado(peeta,haymitch).
aliado(peeta,effie).
aliado(peeta,beetee).
aliado(haymitch, effie).
aliado(glimmer, cato).
aliado(clove, cato).
aliado(finnick, katniss).
aliado(finnick, peeta).
aliado(finnick, mags).
aliado(finnick, johanna).
aliado(finnick, haymitch).
aliado(finnick,beetee).
aliado(johanna, beetee).
aliado(johanna, katniss).
aliado(johanna,peeta).
aliado(johanna,finnick).
aliado(lucy_gray, snow).

%ARBOL DE DATOS%

% REGLAS FAMILIA%
abuelos_paternos(X, Y) :- padrede(P, Y), padrede(X, P); (padrede(P, Y), madrede(X, P)). 

abuelos_maternos(X, Y) :- madrede(M, Y), padrede(X, M); (madrede(M, Y), madrede(X, M)).

abuelo(X, Y) :- abuelo_paterno(X, Y); abuelo_materno(X, Y).

abuela(X, Y) :- abuela_paterna(X, Y); abuela_materna(X, Y).

abuelos(X, Y) :- (padrede(X, Z), padrede(Z, Y)); (padrede(X, Z), madrede(Z, Y)); (madrede(X, Z), padrede(Z, Y));  (madrede(X, Z), madrede(Z, Y)).  

padres(X, Y) :- (padrede(X, Y); madrede(X, Y)).

tios_hombres(X,Y) :- (hermano(X, Z), padrede(Z, Y)); (hermano(X, Z), madrede(Z, Y)).
tias_mujeres(X,Y) :- (hermana(X, Z), padrede(Z, Y)); (hermana(X, Z), madrede(Z, Y)).
tios(X, Y) :- (hermano(X, Z), padrede(Z, Y)); (hermana(X, Z), padrede(Z, Y)); (hermano(X, Z), madrede(Z, Y)); (hermana(X, Z), madrede(Z, Y)).

hermanos(X, Y) :- padrede(P, X), padrede(P, Y), madrede(M, X), madrede(M, Y), X \= Y.

cunado(X, Y) :- hermanos(X, Z), (esposa(Z, Y); esposo(Z, Y)); esposo(X, Z), hermanos(Z, Y); esposa(X, Z), hermanos(Z, Y).                

primos(X, Y) :- padrede(P1, X), hermanos(P1, P2), padrede(P2, Y); madrede(M1, X), hermanos(M1, M2), madrede(M2, Y); padrede(P, X), madrede(M1, Y), hermanos(P, M1); madrede(M, X), padrede(P1, Y), hermanos(M, P1).

% REGLAS FAMILIA%   

% REGLAS ARBOL DE DATOS%

personajes_muertos(Lista) :- findall(Personaje, (estado(Personaje, muerto)), Lista).
