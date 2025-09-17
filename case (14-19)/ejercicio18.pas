{
Desarrolle un programa que, de acuerdo a la nota ingresada por el usuario, determine la nota literal de un
alumno, de acuerdo a la siguiente escala de puntuación:
 90 – 100 = A
 80 – 89 = B
 70 – 79 = C
 60 – 69 = D
 0 – 59 = E 
}


program ejercicio18;


var
	nota: integer;
	aux: string;


BEGIN

	{Solicito al usuario a que ingrese las notas mayores a 0.}
	writeln('Ingrese una nota mayor a 0: ');
	read(nota);


	{Se solicita al usuario que ingrese una nota mayor a 0 y menor a 100.}
    if (nota < 0) or (nota > 100) then
		{Si no esta en el rango, arroja un msj de errror}
        writeln('Ingrese una nota entre 0 y 100.')
    else
    begin
        case nota of
            0..59:
				aux := 'E';
            60..69:
				aux := 'D';
            70..79:
				aux := 'C';
            80..89:
				aux := 'B';
            90..100:
				aux := 'A';
        end;
        {Si esta dentro del rango, arroja el mensaje junto con la nota segun el caso}
        writeln('La nota literal del alumno es: ', aux);
    end;
END.

