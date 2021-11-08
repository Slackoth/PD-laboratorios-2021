ejercicio3(P,N):-
    open('C:/Users/Rene/Documents/parcialD/numeros.txt',read,File),
    is(P,0),
    is(N,0),
    readfile(File,P,N).

create_result_file(P,N):-
    open('C:/Users/Rene/Documents/parcialD/respuesta.txt',write,File),
    write(File,P),
    write(File,'.\n'),
    write(File,N),
    write(File,'.\n'),
    close(File).

isodd(Numero,Flujo,P,N):-
    \==(Numero,end_of_file),
    R is mod(Numero,2),
    =(R,0),
    is(Y,+(N,1)),
    readfile(Flujo,P,Y),!.

isodd(Numero,Flujo,P,N):-
    \==(Numero,end_of_file),
    R is mod(Numero,2),
    =(R,1),
    is(L,+(P,1)),
    readfile(Flujo,L,N),!.

isodd(Numero,Flujo,P,N):-
	==(Numero, end_of_file), 
	create_result_file(P,N).


readfile(Flujo,P,N):-
    read(Flujo,Numero),
    isodd(Numero,Flujo,P,N).