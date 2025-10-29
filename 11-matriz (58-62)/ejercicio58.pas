{
58) Desarrolle un programa que permita almacenar números ingresados por el usuario en la primera fila de una
matriz de 5 columnas, y en la segunda fila almacene el cuadrado de cada número, luego imprima la matriz
diferenciando el color de los números y su respectivo cuadrado.  
}


program ejercicio58;
uses crt;

const
  FILAS = 2;
  COLUMNAS = 5;

type
  TMatriz = array[1..FILAS, 1..COLUMNAS] of integer;

var
  M: TMatriz;
  i: integer;

{----------------------------------------------------------}
{ FUNCIÓN: Calcula el cuadrado de un número }
function Cuadrado(num: integer): integer;
begin
  Cuadrado := num * num;
end;

{----------------------------------------------------------}
{ PROCEDIMIENTO: Muestra la matriz con colores diferenciados }
procedure MostrarMatriz(var mat: TMatriz);
var
  f, c: integer;
begin
  clrscr;
  writeln('Matriz de Numeros y sus Cuadrados:');
  writeln;
  for f := 1 to FILAS do
  begin
    for c := 1 to COLUMNAS do
    begin
      if f = 1 then
        textcolor(lightcyan)  { Números originales }
      else
        textcolor(yellow);    { Cuadrados }
      write(mat[f, c]:6);
    end;
    writeln;
  end;
  textcolor(white);
end;

{----------------------------------------------------------}
{ PROGRAMA PRINCIPAL }
begin
  clrscr;
  writeln('Ingrese ', COLUMNAS, ' numeros:');
  for i := 1 to COLUMNAS do
  begin
    write('Numero ', i, ': ');
    readln(M[1, i]);
    M[2, i] := Cuadrado(M[1, i]);
  end;

  MostrarMatriz(M);
  readkey;
end.


