{
Desarrolle un programa que determine de que tipo es un triángulo (equilátero, escaleno, isósceles) ingresando
sus lados. Corroborar que los lados ingresados formen un triángulo válido.
}


program ejercicio13;


var
	a, b, c: integer;


BEGIN
	writeln('Ingrese el primer lado: ');
	readln(a);
	writeln('Ingrese el segundo lado: ');
	readln(b);
	writeln('Ingrese el tercer lado: ');
	readln(c);


	{ Primero verificamos si es un triángulo válido }
   if (a + b > c) and (a + c > b) and (b + c > a) then
   begin
      if (a = b) and (b = c) then
         writeln('El triangulo es EQUILATERO.')
      else if (a = b) or (a = c) or (b = c) then
         writeln('El triangulo es ISOSCELES.')
      else
         writeln('El triangulo es ESCALENO.');
   end
   else
      writeln('Los lados ingresados no forman un triangulo valido.');
END.

