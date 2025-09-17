{

El usuario ingresa la distancia en KM.

El programa devuelve el tipo de viaje segun:

	Hasta 20 KM = URBANO
	HASTA 50 KM = INTERURBANO
	HASTA 150 KM = MEDIA DISTANCIA
	MAS DE 150 KM = LARGA DISTANCIA
   
}


program ejercicio14b;


var 
	kilometros: integer;
	

BEGIN
	
	
	
	//Solicito al usuario los datos.
	writeln('Ingrese la distancia en KM.');
	readln(kilometros);
	
	
	if kilometros <= 0 then
		writeln('Ingrese un numero mayor a 0.')
	else
	case kilometros of
    1..20: 
        begin
            { instrucciones si expresión 1 }
            writeln('URBANO')
        end;
    21..50: 
        begin
            { instrucciones si expresión 2 }
            writeln('INTERURBANO')
            
        end;
    51..150: 
        begin
            { instrucciones si expresión 3 }
            writeln('MEDIA DISTANCIA.')
        end;
    else
        begin
            { instrucciones si no coincide con ningún valor anterior }
            writeln('LARGA DISTANCIA.')
        end;
	end;	
END.

