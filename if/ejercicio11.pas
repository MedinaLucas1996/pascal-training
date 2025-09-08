{
   Desarrolle un programa que determine si un número ingresado por el usuario es de tres cifras y es par.   
}


program ejercicio11;


var
	numero: integer;

BEGIN
	writeln('Ingrese un numero:');
	readln(numero);
	
	if (numero >= 100) and (numero <=999) then
	begin
		if(numero mod 2 = 0) then
			writeln('El numero ',numero,' es de tres cifras y es par.')
		else
			writeln('El numero ',numero,' es de tres cifras pero no es par.');
	end
	else
		writeln('El numero ', numero, ' no es de tres cifras.');
END.

