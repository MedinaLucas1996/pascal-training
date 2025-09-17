{
   Desarrolle un programa que imprima el número de docena («primera», «segunda» o «tercera») dado el
resultado de una jugada de ruleta (del 0 al 36).
   
}


program ejercicio14guia;

var
	numero: integer;
	

BEGIN
	{Solicito los datos al usuario}
	writeln('Ingrese un numero del 0 al 36.');
	readln(numero);
	
	
	
	if numero < 0 then
		writeln('Ingrese un numero mayor a 0.')
	else
	{Estructura case}
	case numero of
	0..12: 
        begin
            { instrucciones si expresión 1 }
            writeln('PRIMERA DOCENA.')
        end;
    13..24: 
        begin
            { instrucciones si expresión 2 }
            writeln('SEGUNDA DOCENA.')
            
        end;
    25..36: 
        begin
            { instrucciones si expresión 3 }
            writeln('TERCERA DOCENA.')
        end;
    else
		begin
			writeln('Ingrese un numero dentro del rango.')
		end;
	end;
END.

