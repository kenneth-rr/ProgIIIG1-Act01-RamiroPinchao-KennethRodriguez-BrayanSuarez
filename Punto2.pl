is_from(coronelWest, estadosUnidos).
enemy_of(estadosUnidos,coreaDelSur).
sell_weapons(coronelWest, coreaDelSur).

is_hostile_nation(N) :- 
    enemy_of(estadosUnidos, N).

is_criminal(X) :- 
    is_from(X, estadosUnidos),
    sell_weapons(X, coreaDelSur),
    is_hostile_nation(coreaDelSur).
    
    
