

progenitor_de( padre( abrahamSimpson ), hijo( [ herbertPowel, homeroSimpson ] ) ).

progenitor_de( padre( abrahamSimpson ), hija( [ ] ) ).

progenitor_de( padre( clancyBouvier ), hija( [ margeSimpson, pattyBouvier, selmaBouvier ] ) ).

progenitor_de( padre( clancyBouvier ), hijo( [ ] ) ).

progenitor_de( padre( homeroSimpson ), hijo( [ bartSimpson ] ) ).

progenitor_de( padre( homeroSimpson ), hija( [ lisaSimpson, maggieSimpson ] ) ).

progenitor_de( madre( monaSimpson ), hijo( [ herbertPowel, homeroSimpson ] ) ).

progenitor_de( madre( monaSimpson ), hija( [ ] ) ).

progenitor_de( madre( jacquelineBouvier ), hija( [ margeSimpson, pattyBouvier, selmaBouvier ] ) ).

progenitor_de( madre( jacquelineBouvier ), hijo( [ ] ) ).

progenitor_de( madre( margeSimpson ), hijo( [ bartSimpson ] ) ).

progenitor_de( madre( margeSimpson ), hija( [ lisaSimpson, maggieSimpson ] ) ).

progenitor_de( madre( selmaBouvier ), hija( [ lingBouvier ] ) ).

progenitor_de( madre( selmaBouvier ), hijo( [ ] ) ).


abuelo_de(X, Y):-
    progenitor_de( padre(X), hijo(Hijos) ), member( Z, Hijos ),
    ( 
    	( 
      		( progenitor_de( padre(Z), hijo( Hijos2 ) ), member( Y, Hijos2 ) ) ; ( progenitor_de( padre(Z), hija( Hijos2 ) ), member( Y, Hijos2 ) )
        )
    ;   
    	( 
      		( progenitor_de( madre(Z), hijo( Hijos2 ) ), member( Y, Hijos2 ) ) ; ( progenitor_de( madre(Z), hija( Hijos2 ) ), member( Y, Hijos2 ) )
        )
    ).

abuela_de(X, Y):-
    progenitor_de( madre(X), hijo(Hijos) ), member( Z, Hijos ),
    ( 
    	( 
      		( progenitor_de( padre(Z), hijo( Hijos2 ) ), member( Y, Hijos2 ) ) ; ( progenitor_de( padre(Z), hija( Hijos2 ) ), member( Y, Hijos2 ) )
        )
    ;   
    	( 
      		( progenitor_de( madre(Z), hijo( Hijos2 ) ), member( Y, Hijos2 ) ) ; ( progenitor_de( madre(Z), hija( Hijos2 ) ), member( Y, Hijos2 ) )
        )
    ).

hermano_de(X, Y):-
    progenitor_de( P, hijo(Hijos) ), progenitor_de( P, hija( Hijas ) ), member( X, Hijos ), 
    ( member( Y, Hijos ) ; member( Y, Hijas ) ), X \= Y.

hermana_de(X, Y):-
    progenitor_de( P, hijo(Hijos) ), progenitor_de( P, hija( Hijas ) ), member( X, Hijas ), 
    ( member( Y, Hijos ) ; member( Y, Hijas ) ), X \= Y.

tio_de(X, Y):-
    (hermano_de(X, Padre), progenitor_de(padre(Padre), hijo(Hijos)), progenitor_de(padre(Padre), hija(Hijas)), ( member( Y, Hijos ) ; member( Y, Hijas ) ) );
    (hermana_de(X, Padre), progenitor_de(padre(Padre), hijo(Hijos)), progenitor_de(padre(Padre), hija(Hijas)), ( member( Y, Hijos ) ; member( Y, Hijas ) ) );
    (hermano_de(X, Madre), progenitor_de(madre(Madre), hijo(Hijos)), progenitor_de(madre(Madre), hija(Hijas)), ( member( Y, Hijos ) ; member( Y, Hijas ) ) );
    (hermana_de(X, Madre), progenitor_de(madre(Madre), hijo(Hijos)), progenitor_de(madre(Madre), hija(Hijas)), ( member( Y, Hijos ) ; member( Y, Hijas ) ) ).

primo_de(X, Y):-
    tio_de(Progenitor, Y),( padre_de( Progenitor, Hijos2 ), member( X, Hijos2 ) ;  madre_de( Progenitor, Hijos1 ), member( X, Hijos1 ) ), X \= Y.
