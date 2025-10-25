{
47) Desarrolle un programa con una FUNCIÓN para calcular la potencia N de un número ingresado por el usuario
}

program ejercicio47;
uses crt;

function Potencia(base: real; exponente: integer): real;
var
  i: integer;
  resultado: real;
begin
  resultado := 1;  { cualquier número elevado a 0 da 1 }

  if exponente >= 0 then
    for i := 1 to exponente do
      resultado := resultado * base
  else
    { si el exponente es negativo, se calcula 1 / base^|exponente| }
    for i := 1 to abs(exponente) do
      resultado := resultado / base;

  Potencia := resultado;
end;

var
  num: real;
  n: integer;

begin
  clrscr;
  write('Ingrese el numero base: ');
  readln(num);
  write('Ingrese el exponente: ');
  readln(n);

  writeln;
  writeln('Resultado: ', Potencia(num, n):0:2);

  readkey;
end.
