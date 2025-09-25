{
25) Desarrolle un programa que permita sumar “N” números ingresados por el usuario, luego imprimir el total y el
promedio
}


program ejercicio25;


var
	n, i, acu, num: integer;
	prom: real;



BEGIN
	{ Solicitamos cuantos numeros desea ingresar el usuario. }
	write('Ingresa la cantidad de numeros que desea ingresar para sacar promedio: ');
	read(n);
	
	acu := 0;
	
	for i := 1 to n do
	begin
		{ Solicitamos al usuario que ingrese los valores }
		writeln('Ingrese el valor Nro' ,i,': ');
		read(num);
		
		
		{ Acumulamos }
		acu := acu + num;
	end;
	
	
	{ Mostramos resultados }
	writeln('La suma total de los numeros es: ', acu);
	
	{ Promediamos el total }
	prom := acu / n; 
	
	writeln('El promedio de todos los numeros es de: ',prom:5:2);
	
	
END.

