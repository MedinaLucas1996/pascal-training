program Ejercicio41;
uses Crt;

const
  ROWS = 24;        { filas visibles para datos (usamos líneas 2..25) }
  COLS = 11;        { 11 columnas x 24 filas = 264 casillas, alcanzan para 256 }
  COL_WIDTH = 7;    { ancho fijo por casilla: "ddd: c" ocupa 6, dejamos 1 espacio }

var
  i, rowIdx, colIdx: Integer;
  startX, startY: Integer;
  ch: Char;

begin
  ClrScr;

  { Título }
  GotoXY(24, 1);
  Write('TABLA ASCII COMPLETA (0..255)');

  { Calcular origen para centrar horizontalmente }
  startX := ((80 - (COLS * COL_WIDTH)) div 2) + 1;  { 80 columnas, 1-based }
  startY := 2;                                       { debajo del título }

  { Imprimir la tabla ASCII en columnas (izq->der) y filas (arriba->abajo) }
  for i := 0 to 255 do
  begin
    rowIdx := i mod ROWS;      { 0..23 }
    colIdx := i div ROWS;      { 0..10 }

    { Evitar que los caracteres de control muevan el cursor }
    if (i < 32) or (i = 127) then
      ch := '.'
    else
      ch := Chr(i);

    GotoXY(startX + (colIdx * COL_WIDTH), startY + rowIdx);
    Write(i:3, ': ', ch);
  end;

  { Esperar una tecla sin sobreescribir la tabla }
  GotoXY(80, 25);
  ReadKey;
end.
