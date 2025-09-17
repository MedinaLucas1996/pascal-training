{
   Desarrolle un programa que, de acuerdo al importe del sueldo ingresado por el usuario, calcule la Categoría
de un Empleado, si:
 Hasta U$S 1000 = Cadete
 Más de U$S 1000 y hasta U$S 1500 = Maestranza
 Más de U$S 1500 y hasta U$S 2500 = Vendedor
 Más de U$S 2500 y hasta U$S 4000 = Encargado
 Más de U$S 4000 = Gerente
  
}


program ejercicio16;


var
	sueldo: longint;
	

BEGIN
	{Solicito los datos al usuario}
	writeln('Ingrese el importe de su sueldo.');
	readln(sueldo);
	
	
	
	if sueldo <= 0 then
		writeln('Ingrese un importe de su sueldo mayor a 0.')
	else
	case sueldo of
    1..1000: 
        begin
            { Hasta U$S 1000 = Cadete }
            writeln('CADETE');
        end;
    1001..1500: 
        begin
            { Más de U$S 1000 y hasta U$S 1500 = Maestranza }
            writeln('MAESTRANZA');
        end;
    1501..2500: 
        begin
            { Más de U$S 1500 y hasta U$S 2500 = Vendedor }
            writeln('VENDEDOR');
        end;
    2501..4000: 
        begin
            { Más de U$S 2500 y hasta U$S 4000 = Encargado }
            writeln('ENCARGADO');
        end;
    else
        begin
            { Más de U$S 4000 = Gerente  }
            writeln('GERENTE');
        end;
	end;
END.
