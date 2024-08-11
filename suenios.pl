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
tieneQuimicaCon(campanita, Persona):-
    creeEn(Persona, campanita),
    suenio(Persona, Suenio),
    dificultadDeSuenio(Suenio, Dificultad),
    Dificultad < 5.
tieneQuimicaCon(Personaje, Persona):-
    creeEn(Persona, Personaje),
    not(esAmbiciosa(Persona)),
    forall(suenio(Persona, Suenio), esPuro(Suenio)).

esPuro(serFutbolista(_)).
esPuro(serCantante(Discos)):-
    Discos < 200000.
% Punto 4
esAmigo(campanita, reyesMagos).
esAmigo(campanita, conejoDePascua).
esAmigo(conejoDePascua, cavenaghi).

puedeAlegrarA(Personaje, Persona):-
    suenio(Persona, _),
    tieneQuimicaCon(Personaje, Persona),
    not(estaEnfermo(Personaje)).
puedeAlegrarA(Personaje, Persona):-
    suenio(Persona, _),
    tieneQuimicaCon(Personaje, Persona),
    esPersonajeBackUp(Personaje, PersonajeBackUp),
    not(estaEnfermo(PersonajeBackUp)).

estaEnfermo(campanita).
estaEnfermo(reyesMagos).
estaEnfermo(conejoDePascua).

esPersonajeBackUp(Personaje, PersonajeBackUp):-
    esAmigo(Personaje, PersonajeBackUp).

esPersonajeBackUp(Personaje, PersonajeBackUp):-
    esAmigo(Personaje, Otro),
    esPersonajeBackUp(Otro, PersonajeBackUp).

