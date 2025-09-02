{
   
   Desarrolle un programa que determine si un número ingresado por el usuario es de dos cifras.
   
}


program ejercicio10;

var
	A: integer;

BEGIN
	writeln('Ingrese un numero para saber si es de 2 cifras: ');
	readln(A);
	
	if A < 9
		writeln('El numero ',A, ' es de una sola cifra.');
	else
		write('El numero ', A, ' es de 2 cifras.');
END.

