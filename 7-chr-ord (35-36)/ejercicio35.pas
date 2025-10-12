{
35) Desarrolle un programa que solicite al usuario un número entre 0 y 255, y luego devuelva el caracter ASCII
correspondiente a ese código. Incluir un menú con opción de continuar o salir.
}


program ejercicio35;

uses crt;

//Declaramos las variables
var
num: integer;
opc: char;

BEGIN
clrscr;

//Iniciamos el bucle con Repeat
repeat
	//Solicitamos un numero al usuario dentro del rango
	write('Ingrese un numero entre 0 y 255: ');
	readln(num);

	//Validacion del rango de numero
	if (num >= 0) and (num <= 255) then
		//Usamos la funcion CHR para convertir
		writeln('El caracter ASCII correspondiente es: ', CHR(num))
	else
		writeln('Numero fuera del rango valido (0-255).');


	//Solicitamos al usuario si desea continuar o no
	writeln;
	write('Desea continuar? (S/N): ');
	readln(opc);
	
	
	clrscr;

//Condicion para salir del bucle
until (opc = 'N') or (opc = 'n');

writeln('Programa finalizado.');
readkey;
END.


