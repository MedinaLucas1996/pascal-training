{
59) Desarrolle un programa que llene con números enteros una matriz de 3f x 8c, luego sume cada fila y almacene
los totales en una columna adicional, luego imprima la matriz diferenciando el color de los totales.
}


program ejercicio59;

uses crt;

const
  FILAS = 3;
  COLUMNAS = 8;

type
  TMatriz = array[1..FILAS, 1..COLUMNAS + 1] of integer; 
  { +1 porque la última columna guarda el total }

var
  M: TMatriz;

{----------------------------------------------------------}
{ FUNCIÓN: Suma los elementos de una fila }
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
{ PROCEDIMIENTO: Muestra la matriz con color para los totales }
procedure MostrarMatriz(var mat: TMatriz);
var
  f, c: integer;
begin
  clrscr;
  writeln('Matriz con Totales por Fila:');
  writeln;
  for f := 1 to FILAS do
  begin
    for c := 1 to COLUMNAS + 1 do
    begin
      if c = COLUMNAS + 1 then
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
    { Calcular total de la fila usando la función }
    M[f, COLUMNAS + 1] := SumarFila(M, f);
    writeln;
  end;

  MostrarMatriz(M);
  readkey;
end.
