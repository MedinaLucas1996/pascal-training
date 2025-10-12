{
32) Desarrolle un programa que permita sumar números ingresados por el usuario, preguntando luego de cada
ingreso si “desea continuar”, luego imprimir el total y el promedio.  
}


program ejercicio32;

uses crt;

//Declaramos las variables
var
  num, suma, contador: integer;
  promedio: real;
  continuar: char;

BEGIN
clrscr;

//Inicializamos las variables
suma := 0;
contador := 0;

//Iniciamos el bucle repeat
repeat
	//Solicitamos un numero al usuario
	write('Ingrese un numero: ');
	readln(num);

	//Por cada bucle acumulamos y contamos +1
	suma := suma + num;
	contador := contador + 1;


	//Preguntamos al usuario si desea continuar
	write('Desea continuar? (S/N): ');
	readln(continuar);
	writeln;

//Condicion para salir del bucle
until (continuar = 'N') or (continuar = 'n');

//Quitar esta linea si se desea ver los datos cargados
clrscr;
  
//Mostramos los resultados
writeln('----------- RESULTADOS -----------');
  
if contador > 0 then
	begin
		promedio := suma / contador;
		writeln('Suma total: ', suma);
		writeln('Promedio: ', promedio:0:2);
	end
	else
		writeln('No se ingresaron numeros.');

readkey;
END.


