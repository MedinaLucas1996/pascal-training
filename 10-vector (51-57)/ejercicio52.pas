{
52) Desarrolle un programa para convertir una palabra ingresada por el usuario en mayúsculas
}

program ejercicio52;
uses crt;

function ConvertirMayuscula(palabra: string): string;
var
  i: integer;
begin
  for i := 1 to length(palabra) do
    palabra[i] := upcase(palabra[i]);
  ConvertirMayuscula := palabra;
end;

var
  texto: string;

begin
  clrscr;
  write('Ingrese una palabra: ');
  readln(texto);

  writeln;
  writeln('En mayusculas: ', ConvertirMayuscula(texto));

  readkey;
end.
