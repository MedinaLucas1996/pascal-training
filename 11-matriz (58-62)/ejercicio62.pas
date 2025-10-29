{
62) Desarrolle un programa que permita ingresar las ventas de 5 días de 10 vendedores. Calcule las ventas
totales por día y por vendedor, y las ventas totales de la semana. Luego busque los valores mínimo y máximo. 
}


program ejercicio62;

uses crt;

const
  VENDEDORES = 10;
  DIAS = 5;

type
  TMatriz = array[1..VENDEDORES, 1..DIAS] of real;

var
  VENTAS: TMatriz;

{------------------------------------------------------------}
{ FUNCIÓN: Devuelve la suma de una fila (ventas de un vendedor) }
function SumarFila(var mat: TMatriz; fila: integer): real;
var
  c: integer;
  suma: real;
begin
  suma := 0;
  for c := 1 to DIAS do
    suma := suma + mat[fila, c];
  SumarFila := suma;
end;

{------------------------------------------------------------}
{ PROCEDIMIENTO: Muestra la matriz con totales y colores }
procedure MostrarDatos(var mat: TMatriz);
var
  f, c: integer;
  totalDia: array[1..DIAS] of real;
  totalVendedor, totalGeneral, minimo, maximo: real;
  primera: boolean;
begin
  clrscr;
  textcolor(white);
  writeln('REGISTRO DE VENTAS (10 vendedores x 5 dias)');
  writeln('---------------------------------------------');

  { Inicializar totales por día }
  for c := 1 to DIAS do
    totalDia[c] := 0;

  { Inicializar mínimos y máximos }
  minimo := 999999;
  maximo := -999999;
  primera := true;

  { Calcular totales y mostrar matriz }
  for f := 1 to VENDEDORES do
  begin
    write('Vendedor ', f:2, ': ');
    totalVendedor := 0;
    for c := 1 to DIAS do
    begin
      textcolor(lightcyan);
      write(mat[f, c]:8:2);
      totalVendedor := totalVendedor + mat[f, c];
      totalDia[c] := totalDia[c] + mat[f, c];

      { Buscar mínimo y máximo }
      if mat[f, c] < minimo then minimo := mat[f, c];
      if mat[f, c] > maximo then maximo := mat[f, c];
    end;
    textcolor(yellow);
    write(' | Total: ', totalVendedor:8:2);
    writeln;
  end;

  { Calcular total general }
  totalGeneral := 0;
  for c := 1 to DIAS do
    totalGeneral := totalGeneral + totalDia[c];

  { Mostrar totales por día }
  writeln('---------------------------------------------');
  write('Totales x Dia: ');
  for c := 1 to DIAS do
  begin
    textcolor(yellow);
    write(totalDia[c]:8:2);
  end;
  textcolor(lightred);
  write(' | Total Gral: ', totalGeneral:8:2);
  writeln;

  { Mostrar máximo y mínimo }
  writeln('---------------------------------------------');
  textcolor(lightgreen);
  writeln('Venta maxima: ', maximo:8:2);
  textcolor(lightred);
  writeln('Venta minima: ', minimo:8:2);
  textcolor(white);
end;

{------------------------------------------------------------}
{ PROGRAMA PRINCIPAL }
var
  f, c: integer;
begin
  clrscr;
  writeln('Ingrese las ventas de 10 vendedores por 5 dias:');
  writeln;

  for f := 1 to VENDEDORES do
  begin
    writeln('Vendedor ', f, ':');
    for c := 1 to DIAS do
    begin
      write('Dia ', c, ': ');
      readln(VENTAS[f, c]);
    end;
    writeln;
  end;

  MostrarDatos(VENTAS);
  readkey;
end.

