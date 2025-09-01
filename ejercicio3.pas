


program ejercicio3;


var 
	a, b, c, suma: integer;
	promedio: real; { usar real para decimales }
	


BEGIN
	writeln('Ingrese 3 notas para sacar el promedio.');
	write('Ingrese la primer nota: ');
	readln(a);
	write('Ingrese la segunda nota: ');
	readln(b);
	write('Ingrese la tercera nota: ');
	readln(c);
	
	suma:= a + b + c;
	promedio := suma / 3;
	
	writeln('La suma de las 3 notas es: ', suma);
	writeln('El promedio es: ', promedio:0:2);  { con 2 decimales }
END.

