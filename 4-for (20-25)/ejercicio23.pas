{
	23) Desarrolle un programa que imprima los números Pares entre 100 y 200
}


program ejercicio23;


var
	i: integer;

const
	max = 200;


BEGIN
	
	for i := 100 to max do
		begin
			if i mod 2 = 0 then
				writeln(i)
		end;
	
END.

