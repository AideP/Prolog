guardian(apolo).
guardian(hecate).
guardian(ares).
guardian(hermes).

templo(fuego).
templo(agua).
templo(tierra).
templo(aire).

no_cuida(apolo,fuego).
no_cuida(apolo,tierra).
no_cuida(hecate,aire).
no_cuida(ares,agua).
no_cuida(ares,aire).
posiblemente_cuida(hermes,agua).
posiblemente_cuida(hermes,fuego). 

puede_cuidar(Guardian, Templo) :-
    guardian(Guardian),
    templo(Templo),
    \+ no_cuida(Guardian, Templo).

    asignacion(Templos) :-
        Templos = [apolo-T1, hecate-T2, ares-T3, hermes-T4],
        templo(T1), templo(T2), templo(T3), templo(T4),
        T1 \= T2, T1 \= T3, T1 \= T4, T2 \= T3, T2 \= T4, T3 \= T4,
        puede_cuidar(apolo, T1),
        puede_cuidar(hecate, T2),
        puede_cuidar(ares, T3),
        posiblemente_cuida(hermes, T4). %aun no esta completo, obtiene todas las posibles opciones de que hermes cuide agua o fuego