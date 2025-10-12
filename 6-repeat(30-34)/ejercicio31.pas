{
31) Desarrolle un programa que permita sumar números ingresados por el usuario, hasta que ingrese cero, luego
imprimir el total y el promedio.  
}


program ejercicio31;

uses crt;

//Declaramos variables
var
  num, suma, contador: integer;
  promedio: real;

BEGIN
clrscr;
//Inicializamos las variables
suma := 0;
contador := 0;

//Iniciamos el bucle
repeat

	//Solicitamos al usuario un numero
	write('Ingrese un numero (0 para terminar): ');
	readln(num);

	//Si es distinto de 0, se acumula y se cuenta +1
	if num <> 0 then
		begin
			suma := suma + num;
			contador := contador + 1;
		end;

until num = 0;

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
end.


