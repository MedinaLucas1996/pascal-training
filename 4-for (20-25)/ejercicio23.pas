{
	23) Desarrolle un programa que imprima los números Pares entre 100 y 200
}


program ejercicio23;


var
	i: integer;

const
	max = 200;


BEGIN
	
	{ Se realiza un contador que inicia en 100 hasta el maximo que es la constante 200. }
	for i := 100 to max do
		begin
			{ Se hace un if donde si el numero es par, se imprima }
			if i mod 2 = 0 then
				writeln(i)
		end;
	
END.

