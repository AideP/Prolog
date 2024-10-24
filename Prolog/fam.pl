padre(juan).
padre(jose).
padre(julio).
madre(maria).
madre(julia).
madre(rosa).
madre(antonia).
padrede(juan, jose).
padrede(jose, elpepe).
padrede(pedro, ramon).
padrede(pedro, maria).
padrede(josefo, josefa).
padrede(pedro, luisa).
padrede(pedro, catalina).
padrede(pedro, lea).
padrede(pedro, josefino).
madrede(filomena, pedro).
abuelos(X,Y):-padrede(X,Z),padrede(Z,Y); madrede(X,Z),padrede(Z,Y).
hermano(X,Y):- padrede(P,X), padrede(P,Y); madrede(M,X), madrede(M,Y).
