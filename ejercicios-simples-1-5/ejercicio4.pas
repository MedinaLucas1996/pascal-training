
program ejercicio4;

{ Consigna:  Desarrolle un programa que solicite al usuario el nombre y el precio de un producto, luego calcule e imprima el
producto con un incremento en el precio del 10%.  }


var
	nombre: string;
	precio, incremento: real;
	

BEGIN
	write('Ingrese el nombre del producto: ');
	readln(nombre);
	write('Ingrese el precio del producto: ');
	readln(precio);
	
	{ Calculo auxiliar }
	incremento:= ( precio * 1.10 );
	
	write('El incremento del 10% del producto ', nombre ,  ' quedaria en: $',incremento:0:2, '.-');
	
END.

