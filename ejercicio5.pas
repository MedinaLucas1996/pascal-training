{
   
   Consigna: Desarrolle un programa para Sumar, Restar, Multiplicar y Dividir 2 números ingresados por el usuario.
   
}


program ejercicio5;


var
	a, b, suma, resta, multiplicar, dividir: real;
	


BEGIN
	writeln('Ingrese 2 numeros para realizar los calculos solicitados.');
	
	write('Ingrese el primer numero: ');
	readln(a);
	
	write('Ingrese el segundo numero: ');
	readln(b);
	
	writeln('');
	writeln('---------------------------');
	writeln('');
	
	{ Calculos }
	suma:= a + b;
	resta:= a - b;
	multiplicar:= a * b;
	dividir:= a / b;
	
	writeln('El total de la suma es: ',suma:0:2);
	writeln('El total de la resta es: ', resta:0:2);
	writeln('El total de la multiplicacion es: ', multiplicar:0:2);
	writeln('El total de la division es: ',dividir:0:2);
	
	
END.

