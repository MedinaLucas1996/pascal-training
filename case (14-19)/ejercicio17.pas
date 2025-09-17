{
 Desarrolle un programa que solicite al usuario una fecha en formato “05 10 24” y devuelva la fecha en formato
“05 de Octubre del 2024  
}


program ejercicio17;


var
	dia, mes, anio: integer;
	aux: string;

BEGIN
	
	
	{ Solicitamos al usuario que ingrese la fecha. }
	writeln('Ingrese una fecha formato "dd mm yy"');
	readln(dia, mes, anio);

	{ Dependiendo de que se ingresa en el valor del mes, se asigna a una variable }
  case mes of
    1: aux:= 'Enero';
    2: aux:= 'Febrero';
    3: aux:= 'Marzo';
    4: aux:= 'Abril';
    5: aux:= 'Mayo';
    6: aux:= 'Junio';
    7: aux:= 'Julio';
    8: aux:= 'Agosto';
    9: aux:= 'Septiembre';
    10: aux:= 'Octubre';
    11: aux:= 'Noviembre';
    12: aux:= 'Diciembre';
  else
    writeln('Mes invalido');
  end;

	
	{ Se muestra el resultado }
	writeln(dia,' de ',aux,' del 20',anio);

END.

