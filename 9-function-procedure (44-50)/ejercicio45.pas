{
  45) Desarrolle un programa con una FUNCIÓN que determine si un caracter ingresado por el usuario es un
número.
}

program ejercicio45;
uses crt;

function EsNumero(car: char): boolean;
var
  valor, codigo: integer;
  texto: string[1];
begin
  texto := car;                 { convierto el caracter en string[1] }
  val(texto, valor, codigo);    { intento convertirlo a número }
  EsNumero := (codigo = 0);     { si codigo=0, es un número válido }
end;

var
  c: char;

begin
  clrscr;
  write('Ingrese un caracter: ');
  readln(c);

  if EsNumero(c) then
    writeln('El caracter "', c, '" es un numero.')
  else
    writeln('El caracter "', c, '" NO es un numero.');

  readkey;
end.
