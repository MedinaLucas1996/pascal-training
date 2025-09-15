{
   Se deben obtener las temperaturas promedio de una semana tipo.
   Para ello se registraran las temperaturas promedio de cada dia.
   
   - Desarroll un programa que calcule y muestre el promedio de temperaturas de la semana.
}


program untitled;


var 
	dia: integer;
	promedio, temperatura, acum: real;
	


BEGIN
	{Inicializo la variable del contador}
	acum:= 0;
	
	for dia := 1 to 7 do
	begin
	
		{Ingresamos la temperatura del dia}
		writeln('Ingrese la temperatura del dia de la semana Nro: ',dia);
		readln(temperatura);
	
	
		{Acumulamos las temperaturas de los 7 dias}
		acum:= acum + temperatura;
	end;

	{Divido el acumulado por 7 y guardo en la variable promedio}
	promedio:= acum / 7;
	
	
	{Se muestra por pantalla el promedio}
	writeln('El promedio de las temperaturas es: ',promedio:0:2);
END.

