{
26) Desarrolle un programa que permita sumar números ingresados por el usuario, hasta que ingrese cero, luego
imprimir el total y el promedio.
}


program ejercicio26;

uses crt;

var
//Declaramos las variables
num: integer;
suma, contador: integer;
promedio: real;

BEGIN

clrscr;
//Inicializamos las variables
suma := 0;
contador := 0;

//Solicitamos al usuario un numero
writeln('Ingrese numeros para sumar (0 para terminar): ');
readln(num);

while num <> 0 do
	begin
		//Acumulamos la variable suma y aplicamos el contador por cada bucle que se realice
		suma := suma + num;
		contador := contador + 1;
		//Solicitamos mas numeros para seguir sumando
		writeln('Ingrese otro numero (0 para terminar): ');
		readln(num);
	end;

if contador > 0 then
	begin
		//Calculo de promedio donde usamos todos los numeros acumulado y lo dividimos por la cantidad de veces que se introdujo un numero
		promedio := suma / contador;
		writeln;
		//Mostramos resultados
		writeln('La suma total es: ', suma);
		writeln('El promedio es: ', promedio:0:2);
	end
	else
		writeln('No se ingresaron numeros para calcular.');
//Permite mostrar los resultados en pantalla hasta apretar un boton
readkey;
END.
