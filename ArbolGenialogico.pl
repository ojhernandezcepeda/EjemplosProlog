padrede('jennifer','oscar').
padrede('oscar jr','oscar').
padrede('oscar','luis').
padrede('deidy','luis').
padrede('luis oscar','deidy').
padrede('milton','luis').
padrede('luis jr','luis').
padrede('luis','raimundo').
padrede('raimundo','simon').


% ! papa, hijo, nieto,abuelo, bisnieto,bisabuelo, tio, sobrino,
% hermano, primo

hijode(A,B) :- padrede(B,A).
abuelode(A,B) :- hijode(B,C),hijode(C,A).
nietode(A,B):-abuelode(B,A).
bisabuelode(A,B):-abuelode(A,C),padrede(C,B).
bisnietode(A,B):- bisabuelode(B,A).
hermanode(A,B):- padrede(A,C), padrede(B,C),A\==B.
