{
   Se deben obtener las temperaturas promedio de una semana tipo.
   Para ello se registraran 3 temperaturas promedio de cada dia.
   
   - Desarroll un programa que calcule y muestre el promedio de temperaturas de la semana.
}


program ejercicio20;


var 
	dia, temp_dia, temperatura: integer;
	prom_total, prom_parcial, acum_a, acum_b: real;
	


BEGIN
	{Inicializo la variable del contador}
	acum_a:= 0;
	
	
	
	{Bucle de los 7 dias de la semana}
	for dia := 1 to 7 do
	begin
		acum_b:= 0;
		writeln('Ingrese la temperatura del dia de la semana Nro: ',dia);
		
		{Bucle de las 3 temperaturas por dia}
		for temp_dia := 1 to 3 do
		begin
		
			writeln('Ingrese la temperatura Nro: ', temp_dia,' del dia ',dia);
			readln(temperatura);
			
			{Acumulamos las 3 temperaturas por dia}
			acum_b += temperatura;
			
		end;
			
		{Promedio por dia}
		prom_parcial:= acum_b / 3;
		
		writeln('El promedio de temperatura del dia ', dia,' es: ', prom_parcial:0:2);

		acum_a += prom_parcial;

	end;

	prom_total:= acum_a / 7;
	writeln('El promedio de todas las temperaturas es: ',prom_total:0:2);

END.

