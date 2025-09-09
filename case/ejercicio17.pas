{
 Desarrolle un programa que solicite al usuario una fecha en formato “05 10 24” y devuelva la fecha en formato
“05 de Octubre del 2024  
}


program ejercicio17;


var
	dia, mes, anio: integer;


BEGIN

writeln('Ingrese una fecha formato "dd mm yy"');
readln(dia, mes, anio);

write(dia,' de ');


  case mes of
    1: write('Enero');
    2: write('Febrero');
    3: write('Marzo');
    4: write('Abril');
    5: write('Mayo');
    6: write('Junio');
    7: write('Julio');
    8: write('Agosto');
    9: write('Septiembre');
    10: write('Octubre');
    11: write('Noviembre');
    12: write('Diciembre');
  else
    write('Mes invalido');
  end;

write(' del 20', anio);


	
	
END.

