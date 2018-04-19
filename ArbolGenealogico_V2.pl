padrede('jennifer','oscar').
padrede('oscar jr','oscar').
padrede('oscar jr','martha').
padrede('oscar','luis').
padrede('deidy','luis').
padrede('luis oscar','deidy').
padrede('milton','luis').
padrede('luis jr','luis').
padrede('luis','raimundo').
padrede('luis','susana').
padrede('simon', 'raimundo').
padrede('luis oscar','javier').

% Version_2: suegro, cuñado, suegra, esposo, esposa, esfeliz

hijode(A,B) :- padrede(B,A).
abuelode(A,B) :- hijode(B,C),hijode(C,A).
nietode(A,B):-abuelode(B,A).
bisabuelode(A,B):-abuelode(A,C),padrede(C,B).
bisnietode(A,B):- bisabuelode(B,A).
hermanode(A,B):- padrede(A,C), padrede(B,C),A\==B.
tiode(A,B):- padrede(A,C), hermanode(C,B).
sobrinode(A,B):- tiode(B,A).
primode(A,B):- abuelode(A,C), abuelode(B,C), not(hermanode(A,B)), A\==B.
esposode(A,B):- padrede(C,A), padrede(C,B), A\==B.
suegrode(A,B):- esposode(A,C), hijode(B,C).
cuñadode(A,B):- hermanode(B,C), esposode(A,C).
esfeliz(A):- not(esposode(_,A)).
