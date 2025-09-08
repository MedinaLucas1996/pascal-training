{
  Desarrolle un programa que de tres números ingresados por el usuario determine cuál es el mayor
}


program ejercicio12;


var 
	a, b, c, mayor: integer;


BEGIN
	writeln('Ingrese el primer numero: ');
	readln(a);
	writeln('Ingrese el segundo numero: ');
	readln(b);
	writeln('Ingrese el tercer numero: ');
	readln(c);
	
	{Logica}
	mayor:= a;
	
	if b > mayor then
		mayor := b;
		
	if c > mayor then
		mayor := c;
		
	writeln('El numero mayor es: ',mayor,'.')
	
END.

