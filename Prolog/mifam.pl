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

tio(X, Y) :- (hermano(X, Z), padrede(Z, Y)); (hermana(X, Z), padrede(Z, Y)); (hermano(X, Z), madrede(Z, Y)); (hermana(X, Z), madrede(Z, Y)).

hermanos(X, Y) :- padrede(P, X), padrede(P, Y), madrede(M, X), madrede(M, Y), X \= Y.

cunado(X, Y) :- hermanos(X, Z), (esposa(Z, Y); esposo(Z, Y)).

