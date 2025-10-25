{
56) Desarrolle un programa que llene un vector con 20 números enteros al azar. Determine cuál es el mayor, el
menor, y en qué posición está cada uno. Calcule el promedio y liste con color blanco los números superiores
al promedio y con color naranja los números inferiores al promedio.
}


program ejercicio56;
uses crt;

const
  TOTAL = 20;

type
  TVector = array[1..TOTAL] of integer;

{------------------------------------------------------------}
procedure LlenarVector(var v: TVector);
var
  i: integer;
begin
  randomize;
  for i := 1 to TOTAL do
    v[i] := random(100) + 1;  { números entre 1 y 100 }
end;
{------------------------------------------------------------}
procedure MostrarVector(const v: TVector);
var
  i: integer;
begin
  writeln('=== Numeros generados ===');
  for i := 1 to TOTAL do
    write(v[i]:4);
  writeln;
end;
{------------------------------------------------------------}
function ObtenerMayor(const v: TVector): integer;
var
  i, mayor: integer;
begin
  mayor := v[1];
  for i := 2 to TOTAL do
    if v[i] > mayor then
      mayor := v[i];
  ObtenerMayor := mayor;
end;
{------------------------------------------------------------}
function ObtenerMenor(const v: TVector): integer;
var
  i, menor: integer;
begin
  menor := v[1];
  for i := 2 to TOTAL do
    if v[i] < menor then
      menor := v[i];
  ObtenerMenor := menor;
end;
{------------------------------------------------------------}
function CalcularPromedio(const v: TVector): real;
var
  i, suma: integer;
begin
  suma := 0;
  for i := 1 to TOTAL do
    suma := suma + v[i];
  CalcularPromedio := suma / TOTAL;
end;
{------------------------------------------------------------}
function BuscarPosicion(const v: TVector; valor: integer): integer;
var
  i: integer;
begin
  BuscarPosicion := -1;
  for i := 1 to TOTAL do
    if v[i] = valor then
    begin
      BuscarPosicion := i;
      exit;
    end;
end;
{------------------------------------------------------------}
procedure MostrarResultados(const v: TVector);
var
  mayor, menor: integer;
  posMayor, posMenor: integer;
  promedio: real;
  i: integer;
begin
  clrscr;
  MostrarVector(v);

  mayor := ObtenerMayor(v);
  menor := ObtenerMenor(v);
  posMayor := BuscarPosicion(v, mayor);
  posMenor := BuscarPosicion(v, menor);
  promedio := CalcularPromedio(v);

  writeln;
  textcolor(yellow);
  writeln('Mayor valor: ', mayor, ' (posicion ', posMayor, ')');
  writeln('Menor valor: ', menor, ' (posicion ', posMenor, ')');
  writeln('Promedio: ', promedio:0:2);
  textcolor(white);

  writeln;
  writeln('=== Comparacion con el promedio ===');
  for i := 1 to TOTAL do
  begin
    if v[i] > promedio then
      textcolor(white)          { superiores al promedio → blanco }
    else
      textcolor(lightred);      { inferiores al promedio → naranja/rojo claro }

    writeln('Valor [', i:2, '] = ', v[i]:3);
  end;
  textcolor(white);
end;
{------------------------------------------------------------}

var
  numeros: TVector;

begin
  clrscr;
  LlenarVector(numeros);
  MostrarResultados(numeros);

  writeln;
  textcolor(white);
  writeln('Presione una tecla para finalizar...');
  readkey;
end.
