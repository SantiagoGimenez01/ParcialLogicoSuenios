% Punto 1
% Queremos reflejar que
% Gabriel cree en Campanita, el Mago de Oz y Cavenaghi
% Juan cree en el Conejo de Pascua
% Macarena cree en los Reyes Magos, el Mago Capria y Campanita
% Diego no cree en nadie
creeEn(gabriel, campanita).
creeEn(gabriel, magoDeOz).
creeEn(gabriel, cavenaghi).
creeEn(juan, conejoDePascua).
creeEn(macarena, reyesMagos).
creeEn(macarena, magoCapria).
creeEn(macarena, campanita).

% Tipos De sueños
% serFutbolista(Club). 
% ganarLoteria(NumerosApostados). 
% serCantante(DiscosAVender).
suenio(gabriel, serFutbolista(arsenal)).
suenio(gabriel, ganarLoteria([5, 9])).
suenio(juan, serCantante(100000)).
suenio(macarena, serCantante(10000)).

% Punto 2
esAmbiciosa(Persona):-
    suenio(Persona, _),
    sumaDeDificultades(Persona, Suma),
    Suma > 20.

sumaDeDificultades(Persona, Suma):-
    findall(Dificultad, (suenio(Persona, Suenio), dificultadDeSuenio(Suenio, Dificultad)), Dificultades),
    sumlist(Dificultades, Suma).

dificultadDeSuenio(serCantante(Discos), 6):-
    Discos > 500000.
dificultadDeSuenio(serCantante(Discos), 4):-
    Discos =< 500000.
dificultadDeSuenio(ganarLoteria(NumerosApostados), Dificultad):-
    length(NumerosApostados, Cantidad),
    Dificultad is (Cantidad * 10).
dificultadDeSuenio(serFutbolista(Club), 16):-
    not(clubChico(Club)).
dificultadDeSuenio(serFutbolista(Club), 3):-
    clubChico(Club).
clubChico(aldosivi).
clubChico(arsenal).
    
% Punto 3
% Punto 4
