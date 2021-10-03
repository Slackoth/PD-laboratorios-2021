% Integrantes
% Luis Manuel Calderón Perla # 00082318
% Diego René Meléndez ALvarado # 00174118
% Luis Eduardo Chávez García # 00132718

% Ejercicio 1
contar_ocurrencias(Numero,  Digito, Ocurrencias) :-
	numero_a_lista(Numero, 0, Lista),
	borrar_cabeza(Lista, Digitos),
	is(Contador, 0),
	contar_digitos(Digitos, Digito, Contador, Ocurrencias), ! .

numero_a_lista(0, 1, [1]) :- ! .

numero_a_lista(Numero, Residuo, [Residuo | ListaAux]) :-
	>(Numero, 0),
	is(ResiduoNuevo, mod(Numero, 10)),
	is(NumeroNuevo, //(Numero, 10)),
	numero_a_lista(NumeroNuevo, ResiduoNuevo, ListaAux).

borrar_cabeza([_ | Cola], Cola).

contar_digitos([], _, Contador, Ocurrencias) :- is(Ocurrencias, Contador), ! .

contar_digitos([Cabeza | Cola], Digito, Contador, Ocurrencias) :-
	=:=(Cabeza, Digito),
	is(NuevoContador, +(Contador, 1)),
	contar_digitos(Cola, Digito, NuevoContador, Ocurrencias).

contar_digitos([Cabeza | Cola], Digito, Contador, Ocurrencias) :-
	=\=(Cabeza, Digito),
	contar_digitos(Cola, Digito, Contador, Ocurrencias).

% EJercicio 2

% EJercicio 3
	
