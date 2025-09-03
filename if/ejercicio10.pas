{
   
   Desarrolle un programa que determine si un número ingresado por el usuario es de dos cifras.
   
}


program ejercicio10;

var
   A: integer;

BEGIN
   writeln('Ingrese un numero para saber si es de 2 cifras: ');
   readln(A);

   if ((A >= 10) and (A <= 99)) or ((A <= -10) and (A >= -99)) then
      writeln('El numero ', A, ' es de dos cifras.')
   else
      writeln('El numero ', A, ' no es de dos cifras.');
END.

