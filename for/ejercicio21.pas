{
 
 21) Desarrolle un programa que sume 10 números enteros ingresados por el usuario, y luego calcule el total y el
promedio.
   
}


program ejercicio21;


var
	i,numero,acum: integer;
	prom: real;

const
	max = 10;

BEGIN
	acum:= 0;
	writeln('Ingrese 10 numeros.');

	for i:=1 to max do
		begin
			writeln('Ingrese el valor Nro: ',i);
			readln(numero);
			acum += numero;
		end;


	writeln('La suma total de los 10 numero es: ',acum);
	prom := acum / max;
	
	writeln('El promedio total es: ',prom:0:2);
		
END.

