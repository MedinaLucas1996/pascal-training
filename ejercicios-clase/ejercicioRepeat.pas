{
 	Ejercicio en clases REPEAT: A un grupo de personas se les consulta la edad.
		Desarrolle un programa que calcule y muestre:
			1- La mayor edad ingresada.
			2- La menor edad ingresada.
			3- El promedio de edad del grupo
}


program ejercicioRepeat;


var
	edad: integer;
	
	
BEGIN
	{Inicializazmos}
	edad := 1;
	
	
	{Usamos Repeat}
	repeat
		write('Ingrese su edad: ');
		read(edad);
	
	until edad < 0;
	
END.

