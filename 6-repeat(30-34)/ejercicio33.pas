{
33) Desarrolle un programa que permita agrupar personas ingresadas por el usuario por Género, hasta que
ingrese “X”, luego imprimir el total y el porcentaje de cada Género.   
}


program ejercicio33;

uses crt;

//Declaramos las variableess
var
	genero: char;
	total, masc, fem: integer;
	porcMasc, porcFem: real;

BEGIN
clrscr;

//Inicializamos las variables  
total := 0;
masc := 0;
fem := 0;

//Inicio del bucle Repeat
repeat
    writeln('Ingrese el genero de la persona:');
    writeln('M = Masculino | F = Femenino | X = Terminar');
    write('Genero: ');
    readln(genero);
    writeln;

    case genero of
        'M', 'm': begin
                  masc := masc + 1;
                  total := total + 1;
                end;
        'F', 'f': begin
                  fem := fem + 1;
                  total := total + 1;
                end;
        'X', 'x': ;  //No cumple funcion, pero siver para salir
		else
			writeln('Genero no valido. Ingrese M, F o X.');
    end;

//Condicion para salir del bucle
until (genero = 'X') or (genero = 'x');

//Quitar esta linea si se desea ver los datos cargados
clrscr;
  
//Mostramos los resultados  
writeln('----------- RESULTADOS -----------');
writeln('Total de personas: ', total);

if total > 0 then
	begin
		porcMasc := masc * 100 / total;
		porcFem := fem * 100 / total;

		writeln('Masculino: ', masc, ' (', porcMasc:0:2, '%)');
		writeln('Femenino:  ', fem, ' (', porcFem:0:2, '%)');
	end
	else
		writeln('No se ingresaron datos.');

readkey;
END.
