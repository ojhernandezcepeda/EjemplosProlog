horas('TC',160).
horas('MT',80).
valorHora(4500).
categoria('uno',1).
categoria('dos',2).
categoria('tres',3).
salud(0.92).
pension(0.88).

empleado('Alejandro', 'dos', 'TC').
empleado('Maria', 'tres', 10).
empleado('Juan', 'uno', 'MT').


sueldo(X,S):-empleado(X,C,T),categoria(C,V),horas(T,H),valorHora(VH), salud(VS), pension(VP), S is V*H*VH*VS*VP.
sueldo(X,S):-empleado(X,C,H),categoria(C,V),valorHora(VH),H \= 'TC', H\= 'MT', salud(VS), pension(VP), S is V*H*VH*VS*VP.

listarXCategoria(E,C):- empleado(E,C,_).

listaSueldos(L):- findall(S, sueldo(_,S), L).

nominaTotal([], 0).
nominaTotal([X|Y], Z):- nominaTotal(Y, Z2), Z is Z2+X.

valorNomina(V):- listaSueldos(L), nominaTotal(L, V).
