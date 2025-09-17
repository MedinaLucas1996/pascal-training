{
   Desarrolle un programa que determine si un número ingresado por el usuario es Par o Impar.
}


program ejercicio8;


var
	A: integer;

BEGIN
	
	writeln('Ingrese un numero para saber si es PAR o IMPAR.');
	readln(A);
	
	if A mod 2 = 0 then
		writeln('El numero ', A,' es PAR.')
	else
		writeln('El numero ', A,' es IMPAR.');
END.

