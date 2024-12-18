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
% ELIZA ORGINAL DADA POR EL PROFE%
template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).
%ELIZA ORIGINAL DADA POR EL PROFE%

%PRUEBAS CON ELIZA%
template([mi, jugador, favorito, de, los, chiefs, es, s(_), '.'], ['Increible!', 0, es, un, gran, jugador, '!'], [7]).
template([mi, cancion, favorita, de, taylor, swift, es, s(_), '.'], ['Wow!', 0, es, una, gran, cancion, '!'], [7]).
template([me, encanta, el, album, s(_), de, taylor, swift], [0, es, un, gran, album, tiene, canciones, increibles, '!'], [4]).
template([s(_), es, mi, cancion, favorita, '.'], [esa, cancion, 0, tambien, es, mi, favorita, siempre, me, emociona, '!'], [0]).
template([s(_), tiene, las, mejores, letras, en, sus, canciones, '!'], [estoy, de, acuerdo, 0, es, una, gran, compositora, '!'], [0]).
template([s(_), tiene, las, mejores, frases, en, modern, family, '.'], ['Jajaja!', 0, siempre, dice, cosas, epicas, '!'], [0]).
template([mi, personaje, favorito, de, greys, anatomy, es, s(_), '.'], ['Genial!', 0, es, un, gran, personaje, '¿', por, que, te, gusta, '?'], [7]).
template([s(_), es, el, mejor, doctor, en, greys, anatomy, '!'], [estoy, de, acuerdo, 0, salva, muchas, vidas, '!'], [0]).
template([mi, pareja, favorita, de, greys, anatomy, es, s(_), y, s(_), '.'], [amo, a, 0, y, a, 1, '¿', cual, es, tu, capitulo, favorito, con, ellos, '?'], [7, 9]).
template([s(_), tuvo, un, gran, desarrollo, en, greys, anatomy, '.'], [es, verdad, 0, tuvo, momentos, increibles, '.'], [0]).
template([extrano, a, s(_), en, greys, anatomy, '.'], [si, 0, fue, un, gran, personaje, y, nos, dejo, buenos, momentos, '.'], [2]).



%PRUEBAS CON ELIZA%
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

template([eliza, dime, si, s(_), es, esposo, de, s(_)], [flag_esposo_de], [3, 7]).
template([eliza, dime,si, s(_), es, esposa, de, s(_)], [flag_esposa_de], [3, 7]).

%         FAMILIA     %
%       MEDICOS         %
template([resuelve, el, problema, de, los, medicos], [flagResolveProblem], [5]).
template([cual, es, la, especialidad, de, s(_)], [flagFindEspecialidadMedico], [5]).
template([cual, es, el, hospital, de, s(_)], [flagFindHospitalMedico], [5]).
template([cual, es, el, equipo, medico, de, s(_)], [flagFindEquipoMedico], [6]).
template([cual, es, el, interes, de, investigacion, de, s(_)], [flagFindInteresInvestigacion], [7]).
%       MEDICOS         %

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
template([eliza, quienes, son, los, enemigos, de, s(_)], [flag_enemigos], [6]).
template([eliza, quienes, ganaron, los, juegos, del, hambre], [flag_ganadores], []).
template([eliza, quienes, son, del, mismo, distrito, que, s(_)], [flag_mismo_distrito], [7]).
template([eliza, quienes, tienen, habilidades, similares, a, s(_)], [flag_habilidades_similares], [6]).
template([eliza, quienes, sobrevivieron, en, los, juegos, numero, s(_)], [flag_sobrevivientes_juegos], [7]).
template([eliza, quien, fue, mentor, de, s(_)], [flag_mentor], [5]).
template([eliza, quienes, sobrevivieron, en, los, juegos, numero, s(_)], [flag_sobrevivientes_juegos], [7]).
template([eliza, s(_), vive, '?'], [flag_vive], [1]).

template([eliza, s(_), y, s(_), son, del, mismo, distrito, '?'], [flag_mismo_distrito_dos], [1, 3]).
template([eliza, s(_), y, s(_), son, aliados, '?'], [flag_son_aliados], [1, 3]).
template([eliza, s(_), y, s(_), son, enemigos, '?'], [flag_son_enemigos], [1, 3]).

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

%RESPUESTAS DADAS POR EL PROFE%
% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
%RESPUESTAS DADAS POR EL PROFE%

%RESPUESTAS PADRES%

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_hijos | _],
    findall(Y, (padrede(Atom, Y); madrede(Atom, Y)), Hijos),
    ( Hijos \= [] ->
        atomic_list_concat(Hijos, ', ', HijosStr),
        format(atom(R), 'Los hijos de ~w son ~w.', [Atom, HijosStr])
    ;
        format(atom(R), '~w no tiene hijos.', [Atom])
    ), !.


replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_padre | _],
    findall(X, padrede(X, Atom), Padres),
    ( Padres \= [] ->
        atomic_list_concat(Padres, ', ', PadresStr),
        format(atom(R), 'El padre de ~w es ~w.', [Atom, PadresStr])
    ;
        format(atom(R), '~w no tiene un padre conocido.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_madre | _],
    findall(X, madrede(X, Atom), Madres),
    ( Madres \= [] ->
        atomic_list_concat(Madres, ', ', MadresStr),
        format(atom(R), 'La madre de ~w es ~w.', [Atom, MadresStr])
        ;
        format(atom(R), '~w no tiene una madre conocida.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_padres | _],
    findall(X, padres(X, Atom), Papas),
    (Papas \= [] ->
        atomic_list_concat(Papas,', ', PapasStr),
        format(atom(R), 'Los padres de ~w son ~w', [Atom, PapasStr])
        ;
        format(atom(R), '~w no tiene padres conocidos.',[Atom])
        
        ), !.
%RESPUESTAS PADRES%

%RESPUESTAS ABUELOS%
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos_paternos | _],
    findall(X, (abuelos_paternos(X, Atom)), AbueloP),
    (AbueloP \= [] ->
        atomic_list_concat(AbueloP,', ', AbueloPStr),
        format(atom(R), 'Los abuelos paternos de ~w son ~w', [Atom, AbueloPStr])
        ;
        format(atom(R), '~w no tiene abuelos paternos conocidos.',[Atom])
        
    ), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos_maternos | _],
    findall(X, (abuelos_maternos(X, Atom)), AbueloM),
    (AbueloM \= [] ->
        atomic_list_concat(AbueloM,', ', AbueloMStr),
        format(atom(R), 'Los abuelos maternos de ~w son ~w', [Atom, AbueloMStr])
        ;
        format(atom(R), '~w no tiene abuelos maternos conocidos.',[Atom])
        
    ), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos | _],
    findall(X, (abuelos(X, Atom)), Abuelos),
    (Abuelos \= [] ->
        atomic_list_concat(Abuelos,', ', AbuelosStr),
        format(atom(R), 'Los abuelos de ~w son ~w', [Atom, AbuelosStr])
        ;
        format(atom(R), '~w no tiene abuelos registrados.',[Atom])
        
    ), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelos_hombres | _],
    findall(Y, abuelo(Y, Atom), AbuelosH),
    (AbuelosH \= [] ->
        atomic_list_concat(AbuelosH,', ', AbuelosHStr),
        format(atom(R), 'Los abuelos hombres de ~w son ~w', [Atom, AbuelosHStr])
        ;
        format(atom(R), '~w no tiene abuelos hombres conocidos.',[Atom])
        
    ), !.
    
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_abuelas_mujeres | _],
    findall(X, abuela(X, Atom), Results),
    (Results \= [] ->
        atomic_list_concat(Results,', ', ResultsStr),
        format(atom(R), 'Las abuelas mujeres de ~w son ~w', [Atom, ResultsStr])
        ;
        format(atom(R), '~w no tiene abuelas mujeres conocidas.',[Atom])
        
    ), !.
 %RESPUESTAS ABUELOS%   

%RESPUESTAS TIOS%
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tios | _],
    findall(X, tios(X, Atom), Results),
    (Results \= [] ->
        atomic_list_concat(Results,', ', ResultsStr),
        format(atom(R), 'Los tios de ~w son ~w', [Atom, ResultsStr])
        ;
        format(atom(R), '~w no tiene tios conocidos.',[Atom])
        
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tios_hombres | _],
    findall(X, tios_hombres(X, Atom), Results),
    (Results \= [] ->
        atomic_list_concat(Results,', ', ResultsStr),
        format(atom(R), 'Los tios hombres de ~w son ~w', [Atom, ResultsStr])
        ;
        format(atom(R), '~w no tiene tios hombres.',[Atom])
        
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_tias_mujeres | _],
    findall(X, tias_mujeres(X, Atom), Results),
    (Results \= [] ->
        atomic_list_concat(Results,', ', ResultsStr),
        format(atom(R), 'Las tias mujeres de ~w son ~w', [Atom, ResultsStr])
        ;
        format(atom(R), '~w no tiene tias mujeres.',[Atom])
        
    ), !.
%RESPUESTAS TIOS%

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_cunado | _],
    findall(Y, cunado(Atom, Y), Results),
    (Results \= [] ->
        atomic_list_concat(Results,', ', ResultsStr),
        format(atom(R), 'Los cunados de ~w son ~w', [Atom, ResultsStr])
        ;
        format(atom(R), '~w no tiene cunados.',[Atom])
        
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_primos | _],
    findall(Y, primos(Atom, Y), Results),
    (Results \= [] ->
        atomic_list_concat(Results,', ', ResultsStr),
        format(atom(R), 'Los primos de ~w son ~w', [Atom, ResultsStr])
        ;
        format(atom(R), '~w no tiene primos.',[Atom])
        
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flag_hermanos | _],
    findall(Y, hermanos(Atom, Y), Results),
    (Results \= [] ->
        atomic_list_concat(Results,', ', ResultsStr),
        format(atom(R), 'Los hermanos de ~w son ~w', [Atom, ResultsStr])
        ;
        format(atom(R), '~w no tiene hermanos.',[Atom])
        
    ), !.

% Esposos %
replace0([I, J | _], Input, _, Resp, R) :-
    nth0(I, Input, Persona1),  
    nth0(J, Input, Persona2),  
    Resp = [flag_esposo_de | _],
    ( esposo(Persona1, Persona2) ->
        format(atom(R), 'Si, ~w es esposo de ~w.', [Persona1, Persona2])
    ;
        format(atom(R), 'No, ~w no es esposo de ~w.', [Persona1, Persona2])
    ), !.

replace0([I, J | _], Input, _, Resp, R) :-
    nth0(I, Input, Persona1),
    nth0(J, Input, Persona2),
    Resp = [flag_esposa_de | _],
    ( esposa(Persona1, Persona2) ->
        format(atom(R), 'Si, ~w es esposa de ~w.', [Persona1, Persona2])
    ;
        format(atom(R), 'No, ~w no es esposa de ~w.', [Persona1, Persona2])
    ), !.

% Esposos %         
%   RESPUESTAS MEDICOS          %
replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Atom),
    nth0(0, Resp, X),   
    X == flagResolveProblem,
    elizaResolveProblem(R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagFindHospitalMedico,  
    resolver(Resultado),          
    (member([Nombre, _, Hospital, _, _], Resultado) -> 
        R = ['El hospital de', Nombre, 'es', Hospital]
    ;
        R = ['Lo siento, no encontre informacion para el medico llamado', Nombre]).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagFindEspecialidadMedico,  
    resolver(Resultado),             
    (member([Nombre, Especialidad, _, _, _], Resultado) -> 
        R = ['La especialidad de', Nombre, 'es', Especialidad]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),
    nth0(0, Resp, X),
    X == flagFindHospitalMedico, 
    resolver(Resultado),              
    (member([Nombre, _, Hospital, _, _], Resultado) -> 
        R = ['El hospital de', Nombre, 'es', Hospital]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).

% Encuentra el equipo medico del medico         

%   RESPUESTAS ARBOL DE DATOS   %
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, DistritoAtom),  
    ( atom_number(DistritoAtom, Distrito) ; DistritoAtom = Distrito ),
    Resp = [flag_especialidad_distrito | _],
    especialidad_distrito(Distrito, Especialidad), 
    format(atom(R), 'El distrito ~w se especializa en ~w.', [Distrito, Especialidad]), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom),  
    Resp = [flag_participacion | _],
    findall([Juegos, Resultado], participacion(PersonajeAtom, Juegos, Resultado), Participaciones),
    nombre(PersonajeAtom, Nombre),  
    (Participaciones \= [] ->
        format_participaciones(Participaciones, ParticipacionesStr),
        format(atom(R), '~w participo en los Juegos del Hambre ~w.', [Nombre, ParticipacionesStr])
    ;
        format(atom(R), '~w no participo en la arena de los juegos.', [Nombre])
    ), !.

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
    format(atom(R), 'En el distrito ~w viven ~w.', [Distrito, ResidentesStr]), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Especialidad), 
    Resp = [flag_distrito_especialidad | _],
    findall(Distrito, especialidad_distrito(Distrito, Especialidad), Distritos), 
    ( Distritos \= [] ->
        atomic_list_concat(Distritos, ', ', DistritosStr),
        format(atom(R), 'La especialidad ~w pertenece al distrito ~w.', [Especialidad, DistritosStr])
    ;
        format(atom(R), 'No existen distritos con ~w como especialidad.', [Especialidad])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom),  
    Resp = [flag_vive | _],        
    estado(PersonajeAtom, Estado),  
    nombre(PersonajeAtom, Nombre),  
    (Estado == vivo ->
        format(atom(R), 'Si, ~w esta vivo y feliz despues de la derrota del presidente Snow.', [Nombre])
    ; Estado == viva ->
        format(atom(R), 'Si, ~w esta viva y feliz despues de la derrota del presidente Snow.', [Nombre])
    ; Estado == muerto ->
        format(atom(R), 'No, ~w fue asesinado cruelmente, tenia mas por vivir (en este chat no queremos al presidente Snow).', [Nombre])
    ; Estado == muerta ->
        format(atom(R), 'No, ~w fue asesinada cruelmente, tenia mas por vivir (en este chat no queremos al presidente Snow).', [Nombre])
    ; Estado == desconocido ->
        format(atom(R), 'El estado de ~w es desconocido, esperemos el siguiente libro por pistas.', [Nombre])
    ;  
        format(atom(R), 'Lo siento, no tengo informacion sobre el estado de ~w, tendre que leer los libros de nuevo.', [Nombre])
    ), !.
    

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom), 
    Resp = [flag_aliados | _],
    findall(Aliado, aliado(PersonajeAtom, Aliado), Aliados),  
    nombre(PersonajeAtom, Nombre), 
    maplist(nombre, Aliados, NombresAliados),  
    ( NombresAliados \= [] ->
        atomic_list_concat(NombresAliados, ', ', AliadosStr),
        format(atom(R), 'Los aliados de ~w son ~w, ¿dream team? .', [Nombre, AliadosStr])
    ;
        format(atom(R), '~w no tiene aliados.', [Nombre])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, PersonajeAtom), 
    Resp = [flag_habilidades | _],
    habilidad(PersonajeAtom, Habilidad),  
    nombre(PersonajeAtom, Nombre), 
    format(atom(R), '~w tiene la habilidad de ~w.', [Nombre, Habilidad]), !.
            
replace0(_, _, _, [flag_muertos | _], R) :-
    findall(Nombre, (estado(Personaje, Estado), 
    (Estado = muerto ; Estado = muerta), 
    nombre(Personaje, Nombre)), 
    Muertos),
    ( Muertos \= [] ->
        atomic_list_concat(Muertos, ', ', MuertosStr),
        format(atom(R), 'Los personajes que murieron son ~w, siempre viviran en nuestros corazones *Are you....Are you*.', [MuertosStr])
    ;
        format(atom(R), 'No hay personajes muertos, todos vivieron felices :).')
    ), !.
                
replace0(_, _, _, [flag_vivos | _], R) :-
    findall(Nombre, (estado(Personaje, Estado), 
    (Estado = viva ; Estado = vivo), 
     nombre(Personaje, Nombre)), 
    Vivos),
    ( Vivos \= [] ->
        atomic_list_concat(Vivos, ', ', VivosStr),
        format(atom(R), 'Los personajes que sobrevivieron son ~w, mis guerreros y uno que otro colado.', [VivosStr])
    ;
        format(atom(R), 'No existieron sobrevivientes.')
    ), !.
                                          
replace0([I|_], Input, _, [flag_enemigos | _], R) :-
    nth0(I, Input, Personaje),
    findall(EnemigoNombre, (enemigo(Personaje, Enemigo), nombre(Enemigo, EnemigoNombre)), Enemigos),
    nombre(Personaje, NombrePersonaje),
    (Enemigos \= [] ->
        atomic_list_concat(Enemigos, ', ', EnemigosStr),
        format(atom(R), 'Los enemigos de ~w son ~w.', [NombrePersonaje, EnemigosStr])
    ;
        format(atom(R), '~w no tiene enemigos, aun.', [NombrePersonaje])
    ), !.
    
replace0(_, _, _, [flag_ganadores | _], R) :-
    findall(Nombre, (participacion(Personaje, _, vencedor), nombre(Personaje, Nombre)), GanadoresMasculinos),
    findall(Nombre, (participacion(Personaje, _, vencedora), nombre(Personaje, Nombre)), GanadoresFemeninos),
    append(GanadoresMasculinos, GanadoresFemeninos, Ganadores),
    (Ganadores \= [] ->
        atomic_list_concat(Ganadores, ', ', GanadoresStr),
        format(atom(R), 'Los vencedores de los Juegos del Hambre son ~w.', [GanadoresStr])
    ;
        format(atom(R), 'No hay vencedores en estos juegos, Suzanne aun no nos da nombres.')
    ), !.
  
replace0([I|_], Input, _, [flag_mismo_distrito | _], R) :-
    nth0(I, Input, Personaje),
    distrito_pertenece(Personaje, Distrito),
    findall(OtroNombre, (distrito_pertenece(Otro, Distrito), Otro \= Personaje, nombre(Otro, OtroNombre)), Resultados),
    nombre(Personaje, NombrePersonaje),
    (Resultados \= [] ->
        atomic_list_concat(Resultados, ', ', ResultadosStr),
        format(atom(R), 'Los personajes del mismo distrito que ~w son ~w.', [NombrePersonaje, ResultadosStr])
    ;
        format(atom(R), 'No hay otros personajes en el mismo distrito que ~w.', [NombrePersonaje])
    ), !.
        
replace0([I|_], Input, _, [flag_habilidades_similares | _], R) :-
    nth0(I, Input, Personaje),
    habilidad(Personaje, Habilidad),
    findall(OtroNombre, (habilidad(Otro, Habilidad), Otro \= Personaje, nombre(Otro, OtroNombre)), Similares),
    nombre(Personaje, NombrePersonaje),
    (Similares \= [] ->
        atomic_list_concat(Similares, ', ', SimilaresStr),
        format(atom(R), 'Los personajes con habilidades similares a ~w son ~w.', [NombrePersonaje, SimilaresStr])
    ;
        format(atom(R), 'No hay personajes con habilidades similares a ~w.', [NombrePersonaje])
    ), !.

replace0([I|_], Input, _, [flag_sobrevivientes_juegos | _], R) :-
    nth0(I, Input, JuegosAtom),
    atom_number(JuegosAtom, NumeroJuegos),
    findall(Nombre, (participacion(Personaje, NumeroJuegos, Resultado), (Resultado = vencedor; Resultado = vencedora; Resultado = sobreviviente), nombre(Personaje, Nombre)), Sobrevivientes),
    (Sobrevivientes \= [] ->
        atomic_list_concat(Sobrevivientes, ', ', SobrevivientesStr),
        format(atom(R), 'Los sobrevivientes de los Juegos del Hambre numero ~w son ~w.', [NumeroJuegos, SobrevivientesStr])
    ;
        format(atom(R), 'No se encontraron sobrevivientes en los Juegos numero ~w.', [NumeroJuegos])
    ), !.
          
replace0([I1, I2 | _], Input, _, Resp, R) :-
    Resp = [flag_mismo_distrito_dos | _],  
    nth0(I1, Input, Personaje1Atom),       
    nth0(I2, Input, Personaje2Atom),       
    distrito_pertenece(Personaje1Atom, Distrito1),  
    distrito_pertenece(Personaje2Atom, Distrito2),  
    nombre(Personaje1Atom, Nombre1),
    nombre(Personaje2Atom, Nombre2), 
    (Distrito1 == Distrito2 ->
        format(atom(R), 'Si, ~w y ~w pertenecen al Distrito ~w.', [Nombre1, Nombre2, Distrito1])
    ;
        format(atom(R), 'No, ~w y ~w no pertenecen al mismo distrito. ~w es del Distrito ~w y ~w es del Distrito ~w.', 
            [Nombre1, Nombre2, Nombre1, Distrito1, Nombre2, Distrito2])
    ), !.

replace0([I1, I2 | _], Input, _, Resp, R) :-
    Resp = [flag_son_aliados | _],        
    nth0(I1, Input, Personaje1Atom),      
    nth0(I2, Input, Personaje2Atom),      
    nombre(Personaje1Atom, Nombre1),      
    nombre(Personaje2Atom, Nombre2),      
    (aliado(Personaje1Atom, Personaje2Atom) ; aliado(Personaje2Atom, Personaje1Atom) ->
        format(atom(R), 'Si, ~w y ~w son aliados.', [Nombre1, Nombre2])
    ;
        format(atom(R), 'No, ~w y ~w no son aliados.', [Nombre1, Nombre2])
    ), !.
        
        
replace0([I1, I2 | _], Input, _, Resp, R) :-
    Resp = [flag_son_enemigos | _],       
    nth0(I1, Input, Personaje1Atom),       
    nth0(I2, Input, Personaje2Atom),       
    nombre(Personaje1Atom, Nombre1),       
    nombre(Personaje2Atom, Nombre2),      
    (enemigo(Personaje1Atom, Personaje2Atom) ; enemigo(Personaje2Atom, Personaje1Atom) ->
        format(atom(R), 'Si, ~w y ~w son enemigos.', [Nombre1, Nombre2])
    ;
        format(atom(R), 'No, ~w y ~w no son enemigos.', [Nombre1, Nombre2])
), !.
            
replace0([I|_], Input, _, [flag_mentor | _], R) :-
    nth0(I, Input, Personaje),
    mentor(Mentor, Personaje),
    nombre(Personaje, NombrePersonaje),
    nombre(Mentor, NombreMentor),
    format(atom(R), 'El mentor de ~w es ~w.', [NombrePersonaje, NombreMentor]), !.
    
replace0([I|_], Input, _, [flag_mentor | _], R) :-
    nth0(I, Input, Personaje),
    nombre(Personaje, NombrePersonaje),
    format(atom(R), ' ~w no tiene un mentor conocido.', [NombrePersonaje]), !.

%   RESPUESTAS ARBOL DE DATOS   %

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),
    nth0(0, Resp, X), 
    X == flagFindEquipoMedico, 
    resolver(Resultado),              
    (member([Nombre, _, _, Equipo, _], Resultado) -> 
        R = ['El equipo medico de', Nombre, 'es', Equipo]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),
    nth0(0, Resp, X), 
    X == flagFindInteresInvestigacion, 
    resolver(Resultado),              
    (member([Nombre, _, _, _, Interes], Resultado) -> 
        R = ['El interes de investigacion de', Nombre, 'es', Interes]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).
%   RESPUESTAS MEDICOS          %

format_participaciones([], '').
format_participaciones([[Juegos, Resultado] | Resto], Str) :- 
    format(atom(Primera), ' numero ~w donde fue ~w', [Juegos, Resultado]),
    format_participaciones(Resto, RestoStr),
    (RestoStr = '' ->
        Str = Primera
    ;
        atom_concat(Primera, ', ', Temp),
        atom_concat(Temp, RestoStr, Str)
    ).    


    find_specialty(Nombre, R) :-
        resolver(Resultado),
        (member([Nombre, Especialidad, _, _, _], Resultado) ->
            format(atom(R), 'La especialidad del doctor ~w es ~w.', [Nombre, Especialidad])
        ;
            format(atom(R), 'No encontre informacion sobre el doctor ~w.', [Nombre])
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
personaje(annie_cresta).
personaje(thresh).
personaje(madge).
personaje(delly).
personaje(brutus).
personaje(enobaria).

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
distrito(13).
distrito(capitolio).

nombre(katniss, 'Katniss Everdeen').
nombre(peeta, 'Peeta Mellark').
nombre(finnick, 'Finnick Odair').
nombre(johanna, 'Johanna Mason').
nombre(snow, 'Presidente Snow').
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
nombre(clove, 'Clove').
nombre(cato, 'Cato').
nombre(gale, 'Gale Hawthorne').
nombre(glimmer, 'Glimmer').
nombre(annie_cresta, 'Annie Cresta').
nombre(thresh, 'Thresh').
nombre(madge, 'Madge Undersee').
nombre(delly, 'Delly Cartwright').
nombre(brutus, 'Brutus').
nombre(enobaria, 'Enobaria').

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
especialidad_distrito(13, 'armamento nuclear').
especialidad_distrito(capitolio, 'politica y entretenimiento').

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
distrito_pertenece(foxface, 5).
distrito_pertenece(clove, 2).
distrito_pertenece(cato, 2).
distrito_pertenece(glimmer, 1).
distrito_pertenece(gale, 12).
distrito_pertenece(annie_cresta, 4).
distrito_pertenece(thresh, 11).
distrito_pertenece(madge, 12).
distrito_pertenece(delly, 12).
distrito_pertenece(brutus, 2).
distrito_pertenece(enobaria, 2).

habilidad(katniss, 'arco').
habilidad(peeta, 'camuflaje').
habilidad(finnick, 'tridente').
habilidad(johanna, 'sigilo').
habilidad(haymitch, 'estrategia').
habilidad(rue, 'sigilo').
habilidad(beetee, 'ingenieria electrica').
habilidad(mags, 'supervivencia').
habilidad(coin, 'manipulacion').
habilidad(gale, 'caza').
habilidad(prim, 'medicina').
habilidad(foxface, 'Sigilo').
habilidad(clove, 'lanzamiento de cuchillos').
habilidad(cato, 'Combate').
habilidad(glimmer, 'arco').
habilidad(annie_cresta, 'supervivencia').
habilidad(thresh, 'Combate').
habilidad(madge, 'observacion').
habilidad(delly, 'lealtad').
habilidad(brutus, 'combate').
habilidad(enobaria, 'combate').

estado(katniss, viva).
estado(peeta, vivo).
estado(finnick, muerto).
estado(johanna, viva).
estado(snow, muerto).
estado(lucy_gray, desconocido).
estado(haymitch, vivo).
estado(rue, muerta).
estado(cinna, desconocido).
estado(effie, viva).
estado(beetee, vivo).
estado(mags, muerta).
estado(coin, muerta).
estado(prim, muerta).
estado(coriolanus_snow, muerto).
estado(sejanus, muerto).
estado(tigris, viva).
estado(caesar_flickerman, desconocido).
estado(foxface, muerta).
estado(clove, muerta).
estado(cato, muerto).
estado(gale, vivo).
estado(glimmer, muerta).
estado(annie_cresta, viva).
estado(thresh, muerto).
estado(madge, muerta).
estado(delly, viva).
estado(brutus, muerto).
estado(enobaria, viva).

participacion(katniss, 74, vencedora).
participacion(katniss, 75, sobreviviente).
participacion(peeta, 74, vencedor).
participacion(peeta, 75, sobreviviente).
participacion(finnick, 65, vencedor).
participacion(finnick, 75, sobreviviente).
participacion(johanna, 71, vencedora).
participacion(johanna, 75, sobreviviente).
participacion(rue, 74, asesinada).
participacion(haymitch, 50, vencedor).
participacion(mags, 11, vencedora).
participacion(mags, 75, asesinada).
participacion(lucy_gray, 10, vencedora).
participacion(clove, 74, muerta).
participacion(cato, 74, muerto).
participacion(foxface, 74, muerta).
participacion(glimmer, 74, muerta).
participacion(annie_cresta, 70, vencedora).
participacion(thresh, 74, muerto).
participacion(brutus, 75, muerto).
participacion(enobaria, 62, vencedora).
participacion(enobaria, 75, sobreviviente).
participacion(beete, 75, sobreviviente).

aliado(katniss, peeta).
aliado(katniss, rue).
aliado(katniss, finnick).
aliado(katniss, johanna).
aliado(katniss, haymitch).
aliado(katniss, mags).
aliado(katniss, effie).
aliado(katniss, cinna).
aliado(katniss, beetee).
aliado(katniss, gale).
aliado(katniss, prim).
aliado(katniss, annie_cresta).
aliado(peeta, katniss).
aliado(peeta, haymitch).
aliado(peeta, finnick).
aliado(peeta, johanna).
aliado(peeta, effie).
aliado(peeta, beetee).
aliado(finnick, katniss).
aliado(finnick, peeta).
aliado(finnick, mags).
aliado(finnick, johanna).
aliado(finnick, haymitch).
aliado(finnick, beetee).
aliado(finnick, annie_cresta).
aliado(johanna, katniss).
aliado(johanna, peeta).
aliado(johanna, finnick).
aliado(johanna, beetee).
aliado(beetee, finnick).
aliado(beetee, johanna).
aliado(beetee, katniss).
aliado(beetee, peeta).
aliado(haymitch, effie).
aliado(haymitch, katniss).
aliado(haymitch, peeta).
aliado(annie_cresta, finnick).
aliado(annie_cresta, katniss).
aliado(rue,thresh).
aliado(rue, katniss).
aliado(thresh, rue).
aliado(glimmer, cato).
aliado(clove, cato).

enemigo(katniss, snow).
enemigo(katniss, coin).
enemigo(katniss, cato).
enemigo(katniss, clove).
enemigo(katniss, glimmer).
enemigo(peeta, cato).
enemigo(peeta, clove).
enemigo(finnick, snow).
enemigo(haymitch, snow).
enemigo(johanna, snow).

mentor(haymitch, katniss).
mentor(haymitch, peeta).
mentor(mags, finnick).
mentor(finnick, annie_cresta).
%ARBOL DE DATOS%

%   MEDICOS    %
doctores([ana, bruno, carla, diego, elena]).
especialidades([cardiologia, neurologia, oncologia, pediatria, dermatologia]).
hospitales([general, regional, universitario, privado, militar]).
equipos([ecografo, resonancia, tomografo, dermatoscopio, electrocardiografo]).
intereses([genetica, farmacologia, inmunologia, bioetica, microbiologia]).

permutacion([], []).
permutacion(Lista, [Elemento|PermutacionResto]) :-
    select(Elemento, Lista, ListaSinElemento),
    permutacion(ListaSinElemento, PermutacionResto).

% Solución del problema
resolver(Resultado) :-
    Resultado = [
        [ana, EspecialidadAna, HospitalAna, EquipoAna, InteresAna],
        [bruno, EspecialidadBruno, HospitalBruno, EquipoBruno, InteresBruno],
        [carla, EspecialidadCarla, HospitalCarla, EquipoCarla, InteresCarla],
        [diego, EspecialidadDiego, HospitalDiego, EquipoDiego, InteresDiego],
        [elena, EspecialidadElena, HospitalElena, EquipoElena, InteresElena]
    ],

    % Restricciones básicas
    especialidades(Especialidades), permutacion(Especialidades, [EspecialidadAna, EspecialidadBruno, EspecialidadCarla, EspecialidadDiego, EspecialidadElena]),
    hospitales(Hospitales), permutacion(Hospitales, [HospitalAna, HospitalBruno, HospitalCarla, HospitalDiego, HospitalElena]),
    equipos(Equipos), permutacion(Equipos, [EquipoAna, EquipoBruno, EquipoCarla, EquipoDiego, EquipoElena]),
    intereses(Intereses), permutacion(Intereses, [InteresAna, InteresBruno, InteresCarla, InteresDiego, InteresElena]),


    % 1. Carla no trabaja en el Hospital General ni en el Privado, y no estudia neurología.
    HospitalCarla \= general, HospitalCarla \= privado, EspecialidadCarla \= neurologia,

    % 2. La persona que utiliza el electrocardiógrafo trabaja en cardiología en el Hospital Militar, pero no es Diego.
    member([_, cardiologia, militar, electrocardiografo, _], Resultado),
    not(member([diego, cardiologia, militar, electrocardiografo, _], Resultado)),

    % 3. Bruno está interesado en farmacología, pero no trabaja en el Hospital Regional ni en el Militar.
    InteresBruno = farmacologia, HospitalBruno \= regional, HospitalBruno \= militar,

    % 4. La persona que utiliza el ecógrafo trabaja en pediatría y no es del Hospital Universitario ni del Militar.
    member([_, pediatria, HospitalPediatria, ecografo, _], Resultado), HospitalPediatria \= universitario, HospitalPediatria \= militar,

    % 5. El especialista en oncología trabaja en el Hospital General y utiliza un tomógrafo.
    member([_, oncologia, general, tomografo, _], Resultado),

    % 6. El médico interesado en inmunología usa el resonador magnético, pero no es Elena.
    member([_, _, _, resonancia, inmunologia], Resultado), not(member([elena, _, _, resonancia, inmunologia], Resultado)),

    % 7. El médico del Hospital Regional se dedica a dermatología.
    member([_, dermatologia, regional, _, _], Resultado),

    % 8. Elena está interesada en bioética y no utiliza el electrocardiógrafo.
    InteresElena = bioetica, EquipoElena \= electrocardiografo,

    % 9. Diego es el experto en microbiología.
    InteresDiego = microbiologia,

    % 10. El médico del Hospital Universitario utiliza un dermatoscopio.
    member([_, _, universitario, dermatoscopio, _], Resultado).
%   MEDICOS    %

% REGLAS FAMILIA%
abuelos_paternos(X, Y) :- padrede(P, Y), padrede(X, P); (padrede(P, Y), madrede(X, P)). 

abuelos_maternos(X, Y) :- madrede(M, Y), padrede(X, M); (madrede(M, Y), madrede(X, M)).

abuelo(X, Y) :- (padrede(P, Y), padrede(X, P)); (madrede(M, Y), padrede(X, M)).

abuela(X, Y) :- (madrede(M, Y), padrede(X, M)); (madrede(M, Y), madrede(X, M)).

abuelos(X, Y) :- (padrede(X, Z), padrede(Z, Y)); (padrede(X, Z), madrede(Z, Y)); (madrede(X, Z), padrede(Z, Y));  (madrede(X, Z), madrede(Z, Y)).  

padres(X, Y) :- (padrede(X, Y); madrede(X, Y)).

tios_hombres(X,Y) :- (hermano(X, Z), padrede(Z, Y)); (hermano(X, Z), madrede(Z, Y)).
tias_mujeres(X,Y) :- (hermana(X, Z), padrede(Z, Y)); (hermana(X, Z), madrede(Z, Y)).
tios(X, Y) :- (hermano(X, Z), padrede(Z, Y)); (hermana(X, Z), padrede(Z, Y)); (hermano(X, Z), madrede(Z, Y)); (hermana(X, Z), madrede(Z, Y)).

hermanos(X, Y) :- padrede(P, X), padrede(P, Y), madrede(M, X), madrede(M, Y), X \= Y.

cunado(X, Y) :- hermanos(X, Z), (esposa(Z, Y); esposo(Z, Y)); esposo(X, Z), hermanos(Z, Y); esposa(X, Z), hermanos(Z, Y).                

primos(X, Y) :- padrede(P1, X), hermanos(P1, P2), padrede(P2, Y); madrede(M1, X), hermanos(M1, M2), madrede(M2, Y); padrede(P, X), madrede(M1, Y), hermanos(P, M1); madrede(M, X), padrede(P1, Y), hermanos(M, P1).

% REGLAS FAMILIA%   

%   MEDICOS       %
permute([], []).
permute(Lista, [Elemento | RestoPerm]) :-
    select(Elemento, Lista, NuevaLista),
    permute(NuevaLista, RestoPerm).

resolver(Resultado) :-
        Resultado = [
            [ana, EspecialidadAna, HospitalAna, EquipoAna, InteresAna],
            [bruno, EspecialidadBruno, HospitalBruno, EquipoBruno, InteresBruno],
            [carla, EspecialidadCarla, HospitalCarla, EquipoCarla, InteresCarla],
            [diego, EspecialidadDiego, HospitalDiego, EquipoDiego, InteresDiego],
            [elena, EspecialidadElena, HospitalElena, EquipoElena, InteresElena]
        ],

  % combinaciones
  especialidades(Esp), permute(Esp, [EspecialidadAna, EspecialidadBruno, EspecialidadCarla, EspecialidadDiego, EspecialidadElena]),
  hospitales(Hosp), permute(Hosp, [HospitalAna, HospitalBruno, HospitalCarla, HospitalDiego, HospitalElena]),
  equipos(Eqp), permute(Eqp, [EquipoAna, EquipoBruno, EquipoCarla, EquipoDiego, EquipoElena]),
  intereses(Int), permute(Int, [InteresAna, InteresBruno, InteresCarla, InteresDiego, InteresElena]),

%   MEDICOS       %

%DATOS DADOS POR EL PROFE%
% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).



% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).
%DATOS DADOS POR EL PROFE%
