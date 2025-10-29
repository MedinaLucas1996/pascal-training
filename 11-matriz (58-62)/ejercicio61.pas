{
61) Desarrolle un programa que llene con números enteros una matriz de 4f x 5c, luego sume cada fila y columna,
y la suma total de la matriz, luego imprima la matriz diferenciando el color de los totales
}


program ejercicio62;

uses crt;

const
  FILAS = 4;
  COLUMNAS = 5;

type
  TMatriz = array[1..FILAS + 1, 1..COLUMNAS + 1] of integer;

var
  M: TMatriz;

{----------------------------------------------------------}
{ FUNCIÓN: Calcula la suma de una fila }
function SumarFila(var mat: TMatriz; fila: integer): integer;
var
  c, suma: integer;
begin
  suma := 0;
  for c := 1 to COLUMNAS do
    suma := suma + mat[fila, c];
  SumarFila := suma;
end;

{----------------------------------------------------------}
{ FUNCIÓN: Calcula la suma de una columna }
function SumarColumna(var mat: TMatriz; col: integer): integer;
var
  f, suma: integer;
begin
  suma := 0;
  for f := 1 to FILAS do
    suma := suma + mat[f, col];
  SumarColumna := suma;
end;

{----------------------------------------------------------}
{ PROCEDIMIENTO: Muestra la matriz con colores diferenciados }
procedure MostrarMatriz(var mat: TMatriz);
var
  f, c: integer;
begin
  clrscr;
  writeln('Matriz con Totales de Filas, Columnas y General:');
  writeln;
  for f := 1 to FILAS + 1 do
  begin
    for c := 1 to COLUMNAS + 1 do
    begin
      { Color para totales }
      if (f = FILAS + 1) and (c = COLUMNAS + 1) then
        textcolor(lightred)        { Total general }
      else if (f = FILAS + 1) or (c = COLUMNAS + 1) then
        textcolor(yellow)          { Totales de fila o columna }
      else
        textcolor(lightcyan);      { Valores normales }

      write(mat[f, c]:6);
    end;
    writeln;
  end;
  textcolor(white);
end;

{----------------------------------------------------------}
{ PROGRAMA PRINCIPAL }
var
  f, c: integer;
  totalGeneral: integer;
begin
  clrscr;
  writeln('Cargar matriz de ', FILAS, ' filas x ', COLUMNAS, ' columnas:');
  writeln;

  { Cargar la matriz }
  for f := 1 to FILAS do
  begin
    writeln('Fila ', f, ':');
    for c := 1 to COLUMNAS do
    begin
      write('Elemento [', f, ',', c, ']: ');
      readln(M[f, c]);
    end;
    writeln;
  end;

  { Calcular totales de cada fila }
  for f := 1 to FILAS do
    M[f, COLUMNAS + 1] := SumarFila(M, f);

  { Calcular totales de cada columna }
  for c := 1 to COLUMNAS do
    M[FILAS + 1, c] := SumarColumna(M, c);

  { Calcular total general }
  totalGeneral := 0;
  for f := 1 to FILAS do
    totalGeneral := totalGeneral + M[f, COLUMNAS + 1];
  M[FILAS + 1, COLUMNAS + 1] := totalGeneral;

  { Mostrar matriz final }
  MostrarMatriz(M);
  readkey;
end.

