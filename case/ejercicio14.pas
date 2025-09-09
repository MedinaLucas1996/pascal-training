{
   El usuario debe ingresar un numero del 1 al 7, que indique el dia de la semana.
   A) Luego el programa devuelve el dia de la semana completo
   
   Siendo 1 = 'Lunes' y 7 = 'Domingo'  
   
   B) El programa devuelve el dia de la semana y el menu del dia
}


program untitled;


var
	numero: integer;

BEGIN
	writeln('Ingrese un numero del 1 al 7.');
	readln(numero);
	case numero of
    1: 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El numero 1 es Lunes.')
        end;
    2: 
        begin
            { instrucciones si expresión = valor3 }
            writeln('El numero 2 es Martes.')
            
        end;
    3: 
        begin
            { instrucciones si expresión = valor3 o valor4 }
            writeln('El numero 3 es Miercoles.')
        end;
    4: 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El numero 4 es Jueves.')
        end;
    5: 
        begin
            { instrucciones si expresión = valor2 }
            writeln('El numero 5 es Viernes.')
        end;
    6: 
        begin
            { instrucciones si expresión = valor3 o valor4 }
            writeln('El numero 6 es Sabado.')
        end;
    7: 
        begin
            { instrucciones si expresión = valor1 }
            writeln('El numero 7 es Domingo.')
        end;
    else
        begin
            { instrucciones si no coincide con ningún valor anterior }
            writeln('Ingrese un numero del 1 al 7')
        end;
end;

	
	
END.

