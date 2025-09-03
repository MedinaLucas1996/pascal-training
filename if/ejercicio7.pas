{

Desarrolle un programa que determine si un número ingresado por el usuario es Positivo, Negativo o Neutro.   
   
}


program ejercicio7;

var
	A: integer;




BEGIN
	writeln('Ingrese un numero para saber si es Positivo, Negativo o Neutro.');
	readln(A);
	
	if A < 0 then
		write('El numero ', A,' es NEGATIVO.')
	else if A > 0 then
		write('El numero ', A, ' es POSITIVO.')
		else
		write('El numero ',A, ' es NEUTRO.');
END.

