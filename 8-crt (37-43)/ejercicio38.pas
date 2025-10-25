program Ejercicio38;
uses Crt;

const
  FILAS = 4;
  COLUMNAS = 6;
  ANCHO_CELDA = 8;
  ALTO_CELDA = 2;

var
  i, j, k: Integer;
  posX, posY: Integer;

begin
  ClrScr;

  { Calcular posición central }
  posX := (80 - (COLUMNAS * ANCHO_CELDA)) div 2;
  posY := (25 - (FILAS * ALTO_CELDA)) div 2;

  { Dibujar líneas horizontales }
  for i := 0 to FILAS do
  begin
    for j := 1 to COLUMNAS * ANCHO_CELDA do
    begin
      GotoXY(posX + j - 1, posY + (i * ALTO_CELDA));
      Write('-');
    end;
  end;

  { Dibujar líneas verticales }
  for i := 0 to COLUMNAS do
  begin
    for j := 0 to FILAS * ALTO_CELDA do
    begin
      GotoXY(posX + (i * ANCHO_CELDA), posY + j);
      Write('|');
    end;
  end;

  { Posicionar cursor fuera de la tabla }
  GotoXY(1, 25);

  ReadKey;
end.
