investigador(alonso).
investigador(beatriz).
investigador(carlos).
investigador(diana).
investigador(eduardo).
area(astronomia).
area(biologia).
area(quimica).
area(fisica).
area(geologia).
pais(mexico).
pais(espana).
pais(canada).
pais(japon).
pais(alemania).
instrumento(microscopio).
instrumento(telescopio).
instrumento(acelerador).
instrumento(sismografo).
instrumento(espectrometro).
especialidad(botanica).
especialidad(genetica).
especialidad(oceanografia).
especialidad(paleontologia).
especialidad(vulcanologia).
no_es_de(carlos, mexico).
no_es_de(carlos, canada).
no_es_de(beatriz, espana).
no_es_de(beatriz, japon).
no_es_de(biologia, alemania).
no_es_de(biologia, espana).
no_estudia(carlos, biologia).
no_estudia(diana, astronomia).
no_es(diana, telescopio).
no_es(eduardo, telescopio).
especialista_en(beatriz, botanica).
especialista_en(eduardo, vulcanologia).
especialista_en(alonso, oceanografia).
usa(telescopio, japon).        
usa(acelerador, mexico).        
usa(microscopio, biologia).    
usa(sismografo, alemania).     
usa(espectrometro, genetica).   
trabaja_en(astronomia, japon).   
trabaja_en(fisica, mexico).      
trabaja_en(geologia, canada).    

% Restricción
asignar_atributos(AlonsoArea, BeatrizArea, CarlosArea, DianaArea, EduardoArea,
                  AlonsoPais, BeatrizPais, CarlosPais, DianaPais, EduardoPais,
                  AlonsoInstrumento, BeatrizInstrumento, CarlosInstrumento, DianaInstrumento, EduardoInstrumento,
                  AlonsoEspecialidad, BeatrizEspecialidad, CarlosEspecialidad, DianaEspecialidad, EduardoEspecialidad) :-
    area(AlonsoArea), area(BeatrizArea), area(CarlosArea), area(DianaArea), area(EduardoArea),
    dif(AlonsoArea, BeatrizArea), dif(AlonsoArea, CarlosArea), dif(AlonsoArea, DianaArea), dif(AlonsoArea, EduardoArea),
    dif(BeatrizArea, CarlosArea), dif(BeatrizArea, DianaArea), dif(BeatrizArea, EduardoArea),
    dif(CarlosArea, DianaArea), dif(CarlosArea, EduardoArea), dif(DianaArea, EduardoArea),
    pais(AlonsoPais), pais(BeatrizPais), pais(CarlosPais), pais(DianaPais), pais(EduardoPais),
    dif(AlonsoPais, BeatrizPais), dif(AlonsoPais, CarlosPais), dif(AlonsoPais, DianaPais), dif(AlonsoPais, EduardoPais),
    dif(BeatrizPais, CarlosPais), dif(BeatrizPais, DianaPais), dif(BeatrizPais, EduardoPais),
    dif(CarlosPais, DianaPais), dif(CarlosPais, EduardoPais), dif(DianaPais, EduardoPais),
    instrumento(AlonsoInstrumento), instrumento(BeatrizInstrumento), instrumento(CarlosInstrumento), 
    instrumento(DianaInstrumento), instrumento(EduardoInstrumento),
    dif(AlonsoInstrumento, BeatrizInstrumento), dif(AlonsoInstrumento, CarlosInstrumento),
    dif(AlonsoInstrumento, DianaInstrumento), dif(AlonsoInstrumento, EduardoInstrumento),
    dif(BeatrizInstrumento, CarlosInstrumento), dif(BeatrizInstrumento, DianaInstrumento),
    dif(BeatrizInstrumento, EduardoInstrumento), dif(CarlosInstrumento, DianaInstrumento),
    dif(CarlosInstrumento, EduardoInstrumento), dif(DianaInstrumento, EduardoInstrumento),
    especialidad(AlonsoEspecialidad), especialidad(BeatrizEspecialidad), especialidad(CarlosEspecialidad),
    especialidad(DianaEspecialidad), especialidad(EduardoEspecialidad),
    dif(AlonsoEspecialidad, BeatrizEspecialidad), dif(AlonsoEspecialidad, CarlosEspecialidad),
    dif(AlonsoEspecialidad, DianaEspecialidad), dif(AlonsoEspecialidad, EduardoEspecialidad),
    dif(BeatrizEspecialidad, CarlosEspecialidad), dif(BeatrizEspecialidad, DianaEspecialidad),
    dif(BeatrizEspecialidad, EduardoEspecialidad), dif(CarlosEspecialidad, DianaEspecialidad),
    dif(CarlosEspecialidad, EduardoEspecialidad), dif(DianaEspecialidad, EduardoEspecialidad),
    \+ no_es_de(carlos, CarlosPais),
    \+ no_estudia(carlos, CarlosArea),
    \+ no_es(diana, DianaInstrumento),
    \+ no_estudia(diana, DianaArea),
    \+ no_es_de(beatriz, BeatrizPais),
    usa(AlonsoInstrumento).
