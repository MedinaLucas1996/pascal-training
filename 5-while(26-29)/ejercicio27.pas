{
27) Desarrolle un programa que permita sumar números ingresados por el usuario, preguntando luego de cada
ingreso si “desea continuar”, luego imprimir el total y el promedio   
}


program ejercicio27;

uses crt;

var
//Declaramos las variables
num: integer;
suma, contador: integer;
promedio: real;
continuar: char;

BEGIN
clrscr;
//Inicializamos las variables
suma := 0;
contador := 0;
continuar := 'S';


//Preguntamos al usuario al comenzar cada bucle si desea continuar con la sumatoria
while (continuar = 'S') or (continuar = 's') do
	begin
		//Solicitamos numeros al usuario
		write('Ingrese un numero: ');
		readln(num);
		
		//Acumulamos y Contamos por cada bucle
		suma := suma + num;
		contador := contador + 1;

		//Solicito al usuario si desea continuar con la operatoria
		write('Desea continuar? (S/N): ');
		readln(continuar);
		writeln;
	end;

if contador > 0 then
	begin
		//Calculo de promedio donde usamos todos los numeros acumulado y lo dividimos por la cantidad de veces que se introdujo un numero
		promedio := suma / contador;
		writeln('----------------------------------');
		//Mostramos el resultado
		writeln('La suma total es: ', suma);
		writeln('El promedio es: ', promedio:0:2);
	end	
	else
	writeln('No se ingresaron numeros.');

readkey;
END.


