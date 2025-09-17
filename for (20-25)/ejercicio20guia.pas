{
20) Desarrolle un programa que imprima los números del 1 al 10 y luego del 10 al 1.
}


program ejercicio20guia;


var
	i,j: integer;

const
	max = 10;
	min = 1;

BEGIN
	for i:= 1 to max do
	writeln(i);
		
writeln('************************');
	
	for j:= 10 downto min do
	writeln(j);
	
END.

