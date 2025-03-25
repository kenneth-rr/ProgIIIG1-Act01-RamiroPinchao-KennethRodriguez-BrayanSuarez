progenitor_de( padre(abrahamSimpson), hijo( [ herbertPowell, homeroSimpson ] ) ).

progenitor_de( padre(clancyBouvier), hija( [ margeSimpson, pattyBouvier, selmaBouvier ] ) ).

progenitor_de( padre( homeroSimpson ), hijo( bartSimpson ) ).

progenitor_de( padre( homeroSimpson ), hija( [ lisaSimpson, maggieSimpson ] ) ).

progenitor_de( madre( monaSimpons ), hijo( [ herbertPowel, homeroSimpson ] ) ).

progenitor_de( madre( jacquelineBouvier ), hija( [ margeSimpson, pattyBouvier, selmaBouvier ] ) ).

progenitor_de( madre( margeSimpson ), hijo( bartSimpson ) ).

progenitor_de( madre( margeSimpson ), hija( [ lisaSimpson, maggieSimpson ] ) ).

progenitor_de( madre( selmaBouvier ), hija( [ lingBouvier ] ) ).

abuelo_de(X, Y):-
    padre_de(X, Hijos1), member( Z, Hijos1 ), ( padre_de(Z, Hijos2), member( Y, Hijos2 ); madre_de(Z, Hijos3), member( Y, Hijos3 ) ).

abuela_de(X, Y):-
    madre_de(X, Hijos1), member( Z, Hijos1 ), ( madre_de(Z, Hijos2), member( Y, Hijos2 ); padre_de(Z, Hijos3), member( Y, Hijos3 ) ).

hermano_de(X, Y):-
    padre_de( _, Hijos1), member( Y, Hijos1 ), member( X, Hijos1 ), X \= Y, sexo(Hombres, masculino), member( X, Hombres ) .

hermana_de(X, Y):-
    padre_de( _, Hijos1), member( Y, Hijos1 ), member( X, Hijos1 ), X \= Y, sexo(Mujeres, femenino), member( X, Mujeres ) .

tio_de(X, Y):-
    ( madre_de( Madre, Hijos1 ), member( Y, Hijos1 ), ( hermano_de(X, Madre) ; hermana_de(X, Madre) ) ) ;
    ( padre_de( Padre, Hijos2 ), member( Y, Hijos2 ), ( hermano_de(X, Padre) ; hermana_de(X, Padre) ) ).

primo_de(X, Y):-
    tio_de(Progenitor, Y),( padre_de( Progenitor, Hijos2 ), member( X, Hijos2 ) ;  madre_de( Progenitor, Hijos1 ), member( X, Hijos1 ) ), X \= Y.
