{
29) Desarrolle un programa que permita agrupar personas ingresadas por el usuario por su Edad, hasta que
ingrese cero, luego imprimir el total y el porcentaje por grupo, si:
	- Hasta 10 años = Niño
	- Hasta 18 años = Adolescente
	- Hasta 40 años = Adulto
	- Hasta 60 años = Mayor
	- Más de 60 años = Anciano
}


program ejercicio29;

uses crt;

var
  edad: integer;
  total, nino, adolescente, adulto, mayor, anciano: integer;
  porcN, porcAdo, porcAdul, porcMay, porcAnc: real;

BEGIN
clrscr;
//Inicializamos las variables
total := 0;
nino := 0;
adolescente := 0;
adulto := 0;
mayor := 0;
anciano := 0;

// Solicitamos al usuario las edades
writeln('Ingrese edades (0 para terminar): ');
readln(edad);


//Bucle donde se cuenta +1 dependiendo el rango de edad
while edad <> 0 do
	begin
		if edad > 0 then
			begin
			if edad <= 10 then
				nino := nino + 1
			else if edad <= 18 then
				adolescente := adolescente + 1
			else if edad <= 40 then
				adulto := adulto + 1
			else if edad <= 60 then
				mayor := mayor + 1
			else
				anciano := anciano + 1;

		total := total + 1;
	end
	else
		writeln('Edad invalida. Debe ser mayor o igual a 0.');

		write('Ingrese otra edad (0 para terminar): ');
		readln(edad);
end;

//Quitar esta linea si se desea ver los datos cargados
clrscr;

//Muestra de Resultados
writeln('----------- RESULTADOS -----------');
writeln('Total de personas: ', total);

if total > 0 then
	begin
		porcN := nino * 100 / total;
		porcAdo := adolescente * 100 / total;
		porcAdul := adulto * 100 / total;
		porcMay := mayor * 100 / total;
		porcAnc := anciano * 100 / total;

		writeln('Ninios:        ', nino, ' (', porcN:0:2, '%)');
		writeln('Adolescentes: ', adolescente, ' (', porcAdo:0:2, '%)');
		writeln('Adultos:      ', adulto, ' (', porcAdul:0:2, '%)');
		writeln('Mayores:      ', mayor, ' (', porcMay:0:2, '%)');
		writeln('Ancianos:     ', anciano, ' (', porcAnc:0:2, '%)');
	end
	else
		writeln('No se ingresaron edades.');

readkey;
END.


