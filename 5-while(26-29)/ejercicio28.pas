{
28) Desarrolle un programa que permita agrupar personas ingresadas por el usuario por Género, hasta que
ingrese “X”, luego imprimir el total y el porcentaje de cada Género.
}


program ejercicio28;

uses crt;

var
//Declaramos las variables
genero: char;
total, masc, fem: integer;
porcMasc, porcFem: real;

BEGIN
clrscr;
//Inicializamos las variables
total := 0;
masc := 0;
fem := 0;

//Solicitamos que ingrese M o F
writeln('Ingrese el genero de la persona:');
writeln('M = Masculino | F = Femenino | X = Terminar');
writeln;
write('Genero: ');
readln(genero);

while (genero <> 'X') and (genero <> 'x') do
	begin
		//Usamos case para acumular cuantos masc y fem hay
		case genero of
			'M', 'm': masc := masc + 1;
			'F', 'f': fem := fem + 1;
		else
			writeln('Genero no valido. Ingrese M o F.');
    end;
	
	//Para sacar el total de personas
    if (genero = 'M') or (genero = 'm') or (genero = 'F') or (genero = 'f') then
		total := total + 1;

		write('Ingrese otro genero (X para terminar): ');
		readln(genero);
	end;

//Resultados
writeln('----------- RESULTADOS -----------');
writeln('Total de personas: ', total);
	
	//Mostramos los datos
	if total > 0 then
	begin
		//Calculo de porcentage
		porcMasc := masc * 100 / total;
		porcFem := fem * 100 / total;

		//Mostramos los resultados
		writeln('Masculino: ', masc, ' (', porcMasc:0:2, '%)');
		writeln('Femenino:  ', fem, ' (', porcFem:0:2, '%)');
	end
	else
		writeln('No se ingresaron datos.');

  readkey;
END.


