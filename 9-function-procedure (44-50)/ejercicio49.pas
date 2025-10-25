{
49) Desarrolle un programa con un PROCEDIMIENTO para generar N números al azar, y una FUNCIÓN para
calcular su valor promedio.
}

program ejercicio49;
uses crt;

const
  MAX = 100;   { cantidad máxima posible de números }

var
  numeros: array[1..MAX] of real;
  n: integer;

{---------------------------------------------------------------}
procedure GenerarNumerosAleatorios(var v: array of real; cantidad: integer);
var
  i: integer;
begin
  randomize;  { inicializa la secuencia aleatoria }
  for i := 1 to cantidad do
    v[i] := random(100);   { genera valores entre 0 y 99 }
end;
{---------------------------------------------------------------}

function CalcularPromedio(var v: array of real; cantidad: integer): real;
var
  i: integer;
  suma: real;
begin
  suma := 0;
  for i := 1 to cantidad do
    suma := suma + v[i];
  CalcularPromedio := suma / cantidad;
end;
{---------------------------------------------------------------}

var
  i: integer;

begin
  clrscr;
  write('Cuantos numeros desea generar?: ');
  readln(n);

  if (n < 1) or (n > MAX) then
  begin
    writeln('Cantidad invalida.');
    readkey;
    halt;
  end;

  GenerarNumerosAleatorios(numeros, n);

  writeln;
  writeln('Numeros generados:');
  for i := 1 to n do
    write(numeros[i]:5:2, ' ');
  writeln;
  writeln;
  writeln('Promedio: ', CalcularPromedio(numeros, n):0:2);

  readkey;
end.
