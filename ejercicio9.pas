{
   Desarrolle un programa que de dos números ingresados por el usuario determine si uno de ellos es múltiplo
del otro.
}


program ejercicio9;

var
	A, B: integer;

BEGIN
	writeln('Ingrese el primer numero: ');
	readln(A);
	writeln('ingrese el segundo numero: ');
	readln(B);
	
	if A mod B = 0 then
		writeln('Es multiplo.')
	else
		writeln('No es multiplo.');
END.

