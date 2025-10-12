{
36) Desarrolle un programa que solicite al usuario ingrese un caracter, y luego devuelva el código ASCII
correspondiente. Incluir un menú con opción de continuar o salir.
}


program ejercicio36;

uses crt;

//Declaramos las variables
var
caracter: char;
opcion: char;

BEGIN
clrscr;

//Iniciamos el bucle Repeat
repeat
	//Solicitamos al usuario un caracter
	write('Ingrese un caracter: ');
    readln(caracter);

	//Usamos la funcion ORD para convertir
    writeln('El codigo ASCII correspondiente es: ', ORD(caracter));
    writeln;
    
    //Solicitamos al usuario si desea continuar o no
    write('Desea continuar? (S/N): ');
    readln(opcion);
    
    
    clrscr;

//Condicion para salir del bucle Repeat
until (opcion = 'N') or (opcion = 'n');



writeln('Programa finalizado.');
readkey;
END.


