{
54) Desarrolle un programa que permita cargar 10 nombres de países. Luego el usuario puede ingresar 1 letra y el
programa debe imprimir el listado de los países con nombre que inicien con la letra ingresada.
}

program ejercicio54;
uses crt;

const
  TOTAL = 10;

type
  TVector = array[1..TOTAL] of string[30];

{------------------------------------------------------------}
procedure CargarPaises(var v: TVector);
var
  i: integer;
begin
  writeln('=== Carga de paises ===');
  for i := 1 to TOTAL do
  begin
    write('Pais [', i, ']: ');
    readln(v[i]);
  end;
end;
{------------------------------------------------------------}
procedure MostrarPorLetra(const v: TVector; letra: char);
var
  i: integer;
  inicial: char;
  encontrado: boolean;
begin
  letra := upcase(letra);
  encontrado := false;
  writeln;
  writeln('Paises que comienzan con "', letra, '":');
  writeln('--------------------------------');
  for i := 1 to TOTAL do
  begin
    if length(v[i]) > 0 then
    begin
      inicial := upcase(v[i][1]);
      if inicial = letra then
      begin
        writeln('- ', v[i]);
        encontrado := true;
      end;
    end;
  end;

  if not encontrado then
    writeln('No se encontraron paises con esa letra.');
end;
{------------------------------------------------------------}

var
  paises: TVector;
  letra: char;

begin
  clrscr;
  CargarPaises(paises);
  clrscr;
  write('Ingrese una letra para buscar: ');
  readln(letra);

  MostrarPorLetra(paises, letra);

  readkey;
end.
