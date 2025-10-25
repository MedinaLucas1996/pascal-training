program ejercicio51;
uses crt;

const
  TOTAL = 10;

type
  TVector = array[1..TOTAL] of integer;

{----------------------------------------------------------}
procedure GenerarSorteo(var v: TVector);
var
  i: integer;
begin
  randomize;  { inicializa el generador aleatorio }
  for i := 1 to TOTAL do
    v[i] := random(1000);  { genera números entre 0 y 999 }
end;
{----------------------------------------------------------}
procedure MostrarSorteo(v: TVector);
var
  i: integer;
begin
  writeln('=== Numeros sorteados ===');
  for i := 1 to TOTAL do
    writeln(i:2, ') ', v[i]:3);  { <-- aquí estaba el error: usar :3 (entero) }
end;
{----------------------------------------------------------}
function BuscarNumero(v: TVector; buscado: integer): boolean;
var
  i: integer;
  encontrado: boolean;
begin
  encontrado := false;
  for i := 1 to TOTAL do
    if v[i] = buscado then
      encontrado := true;
  BuscarNumero := encontrado;
end;
{----------------------------------------------------------}

var
  sorteo: TVector;
  num: integer;

begin
  clrscr;
  GenerarSorteo(sorteo);
  MostrarSorteo(sorteo);

  writeln;
  write('Ingrese un numero para buscar (0-999): ');
  readln(num);

  if BuscarNumero(sorteo, num) then
    writeln('El numero ', num, ' salio en el sorteo ')
  else
    writeln('El numero ', num, ' no salio en el sorteo ');

  readkey;
end.
