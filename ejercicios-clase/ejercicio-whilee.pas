{
	Ejercicio en clases WHILE: A un grupo de personas se les consulta la edad.
		Desarrolle un programa que calcule y muestre:
			1- La mayor edad ingresada.
			2- La menor edad ingresada.
			3- El promedio de edad del grupo
}


program ejercicioWhile;


var
	edad, acum, mayor, menor, cont: integer;
	prom: real;


BEGIN

	while edad > 0 do
	begin
		{ instrucciones que se ejecutan }
		write('Ingrese su edad: ');
		readln(edad);
		
		{Verificamos si es mayor}
		if edad > mayor then
		mayor := edad;
		
		
		{Verificamos si es menor}
		if edad > menor then
		menor := edad;
		
		{Acumulamos para mostrar promedio al finalizar el bucle}
		acum := acum + edad;
		cont := cont + 1;
		
	end;
	
	{Calculamos el promedio}
	prom := acum / cont;
	
	
	
	{Mostramos al mayor}
	writeln('El mayor es: ', mayor);
	{Mostramos al menor}
	writeln('El menor es: ', menor);
	{Mostramos el promedio}
	writeln('El promedio es: ', prom);
	
	
END.

