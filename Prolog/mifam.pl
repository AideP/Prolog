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

abuelos(X,Y):- (padrede(X,Z), padrede(Z,Y));(madrede(X,Z), madrede(Z,Y)).
tio(X,Y):- (hermano(X,Z), padrede(Z,Y));(hermana(X,Z), madrede(Z,Y)).
hermanos(X,Y):- 
    padrede(P,X), padrede(P,Y), 
    madrede(M,X), madrede(M,Y), 
    X \= Y.
cunado(X,Y):- 
    (hermano(X,Z), esposo(Y,Z));
    (hermana(X,Z), esposa(Y,Z)).


