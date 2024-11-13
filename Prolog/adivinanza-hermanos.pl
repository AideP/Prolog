hermano(ana).
hermano(bruno).
hermano(carla).
hermano(daniel).

mascota(perro).
mascota(gato).
mascota(loro).
mascota(pez).

% Reglas
no_tiene(ana, perro).
no_tiene(ana, pez).
no_tiene(bruno, gato).
no_tiene(carla, pez).
puede_tener(daniel, loro).
puede_tener(daniel, pez).

% Restricción
asignar_mascotas(AnaMascota, BrunoMascota, CarlaMascota, DanielMascota) :-
    mascota(AnaMascota), mascota(BrunoMascota), mascota(CarlaMascota), mascota(DanielMascota),
    dif(AnaMascota, BrunoMascota), dif(AnaMascota, CarlaMascota), dif(AnaMascota, DanielMascota),
    dif(BrunoMascota, CarlaMascota), dif(BrunoMascota, DanielMascota), dif(CarlaMascota, DanielMascota),
    \+ no_tiene(ana, AnaMascota),
    \+ no_tiene(bruno, BrunoMascota),
    \+ no_tiene(carla, CarlaMascota),
    puede_tener(daniel, DanielMascota).


