{  
  Desarrolle un programa que, de acuerdo a la cantidad de kilómetros ingresados por el usuario, calcule el valor
Acumulativo de un pasaje, si:
 Hasta 300 kmts = $ 1 x km
 Más de 300 y hasta 1000 kmts = $ 2 x km
 Más de 1000 kmts = $ 3 x km
  
}


program ejercicio15;


var
	kilometros, total: longint;
	

BEGIN
	
	{Solicito los datos al usuario}
	writeln('Ingrese la cantidad de kilometros.');
	readln(kilometros);
	
	
	
	if kilometros <= 0 then
		writeln('Ingrese KILOMETROS mayores a 0.')
	else
	case kilometros of
    1..300: 
        begin
            { 1 peso por kilometro }
            total:= 1*kilometros;
            writeln('Total a pagar: $',total,'.');
        end;
    301..1000: 
        begin
            { 2 pesos por kilometros }
            total:= 2*kilometros;
            writeln('Total a pagar: $',total,'.');
        end;
    else
        begin
            { 3 pesos por kilometros si es > 1000  }
            total:= 3*kilometros;
            writeln('Total a pagar: $',total,'.');
        end;
	end;
END.

