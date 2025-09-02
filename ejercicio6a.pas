{
   
   Consigna: Desarrolle un programa que de dos números ingresados por el usuario determine cuál es el mayor
   
}


program ejercicio6a;

var
	A: integer;
	b: integer;


BEGIN
	{ Solicito datos al usuario }
	write('Ingrese el primer numero: ');
	readln(A);
	write('Ingrese el segundo numero: ');
	readln(B);
	
	
	if A > B then
		writeln('El numero ',A, ' es mayor a ',B,'.')
	else
		writeln('El numero ',B, ' es mayor a ',A,'.');
	
END.

