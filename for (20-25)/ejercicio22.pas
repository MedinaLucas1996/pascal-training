{
 22) Desarrolle un programa que imprima los números del 1 al 100 con una pausa cada 20 números.  
}


program ejercicio22;


var
  i: integer;

BEGIN
  for i := 1 to 100 do
  begin
    writeln(i);
    
    case i of
		20,40,60,80,100:
        begin
			writeln('Presione ENTER para continuar.');
			readln;
        end;
    end;
  end;
  
  
END.

