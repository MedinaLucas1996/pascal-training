{
	24) Desarrolle un programa que imprima los números múltiplos de 5 entre 200 y 400.
}


program ejercicio24;


var
	i: integer;

const
	max = 400;

BEGIN
	
	for i := 200 to max do
	begin
		if i mod 5 = 0 then
			writeln(i);
	end;
	
END.

