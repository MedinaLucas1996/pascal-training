{
60) Desarrolle un programa que llene con números enteros una matriz de 6f x 3c, luego sume cada columna y
almacene los totales en una fila adicional, luego imprima la matriz diferenciando el color de los totales.  
}


program ejercicio60;

uses crt;

const
  FILAS = 6;
  COLUMNAS = 3;

type
  TMatriz = array[1..FILAS + 1, 1..COLUMNAS] of integer; 
  { +1 porque la última fila guarda los totales }

var
  M: TMatriz;

{----------------------------------------------------------}
{ FUNCIÓN: Suma los elementos de una columna }
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
{ PROCEDIMIENTO: Muestra la matriz con color para los totales }
procedure MostrarMatriz(var mat: TMatriz);
var
  f, c: integer;
begin
  clrscr;
  writeln('Matriz con Totales por Columna:');
  writeln;
  for f := 1 to FILAS + 1 do
  begin
    for c := 1 to COLUMNAS do
    begin
      if f = FILAS + 1 then
        textcolor(yellow)   { Color distinto para totales }
      else
        textcolor(lightcyan);
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
begin
  clrscr;
  writeln('Cargar matriz de ', FILAS, ' filas x ', COLUMNAS, ' columnas:');
  writeln;

  { Cargar matriz con números ingresados por el usuario }
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

  { Calcular totales de cada columna usando la función }
  for c := 1 to COLUMNAS do
    M[FILAS + 1, c] := SumarColumna(M, c);

  MostrarMatriz(M);
  readkey;
end.

