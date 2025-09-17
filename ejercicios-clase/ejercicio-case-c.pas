{
El usuario debe ingresar una silaba de 3 letras, que indique el mes.

A) Luego el programa devuelve el nobmre del mes completo.
	Por ejemplo: 'ENE' = Enero
B) El programa devuelve el mes y la estacion   
}


program untitled;


var
	mes: string[3];
	
BEGIN
	
	

	//Solicito al usuario los datos.
	writeln('Ingrese una silaba de 3 caracteres para saber el mes y la estacion.');
	readln(mes);
	
	
	//Switch de los valores posibles.
	case mes of
    'ENE': 
        begin
            { instrucciones si expresión 1 }
            writeln('El mes es ENERO')
        end;
    'FEB': 
        begin
            { instrucciones si expresión 2 }
            writeln('El mes es FEBRERO.')
            
        end;
    'MAR': 
        begin
            { instrucciones si expresión 3 }
            writeln('El mes es MARZO.')
        end;
    'ABR': 
        begin
            { instrucciones si expresión 4 }
            writeln('El mes es ABRIL.')
        end;
    'MAY': 
        begin
            { instrucciones si expresión 5 }
            writeln('El mes es MAYO.')
        end;
    'JUN': 
        begin
            { instrucciones si expresión 6 }
            writeln('El mes es JUNIO.')
        end;
    'JUL': 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El mes es JULIO.')
        end;
    'AGO': 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El mes es AGOSTO.')
        end;
    'SEP': 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El mes es SEPTIEMBRE.')
        end;
    'OCT': 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El mes es OCTUBRE.')
        end;
    'NOV': 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El mes es NOVIEMBRE.')
        end;
    'DIC': 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El mes es DICIEMBRE.')
        end;
    else
        begin
            { instrucciones si no coincide con ningún valor anterior }
            writeln('Ingrese una silaba correspondiente a un mes')
        end;
	end;
END.

