{
48) Desarrolle un programa con una FUNCIÓN para calcular el porcentaje X de un número ingresado por el
usuario.
}

program ejercicio48;
uses crt;

function Porcentaje(numero, x: real): real;
begin
  Porcentaje := (numero * x) / 100;
end;

var
  num, porc: real;

begin
  clrscr;
  write('Ingrese un numero: ');
  readln(num);
  write('Ingrese el porcentaje que desea calcular: ');
  readln(porc);

  writeln;
  writeln(porc:0:2, '% de ', num:0:2, ' es: ', Porcentaje(num, porc):0:2);

  readkey;
end.
