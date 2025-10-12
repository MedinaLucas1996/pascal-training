{
30) Desarrolle un programa que permita sumar “N” números ingresados por el usuario, luego imprimir el total y el
promedio.  
}


program ejercicio30;

uses crt;

var
//Declaramos las variables
num, i, cant: integer;
suma: integer;
promedio: real;

BEGIN
clrscr;
//Inicializamos la variable  
suma := 0;

//Solicitamos al usuario
write('Ingrese la cantidad de numeros a sumar: ');
readln(cant);

//Inicializamos el contador del bucle
i := 1;
repeat
	//Solicitamos un numero al usuario
    write('Ingrese el numero ', i, ': ');
    readln(num);
	
	//Acumulamos
    suma := suma + num;
    i := i + 1;
until i > cant;

//Calculo de Promedio
promedio := suma / cant;


//Mostramos los resultados
writeln;
writeln('----------- RESULTADOS -----------');
writeln('Suma total: ', suma);
writeln('Promedio: ', promedio:0:2);

readkey;
END.


