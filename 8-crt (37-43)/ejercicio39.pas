program Ejercicio39;
uses Crt;

const
  FILAS = 3;
  COLUMNAS = 3;
  ANCHO_CELDA = 10;
  ALTO_CELDA = 3;

var
  i, j, x, y: Integer;
  posX, posY: Integer;
  color: Integer;

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

  { Pintar cada recuadro con un color distinto }
  color := 1;
  for i := 0 to FILAS - 1 do
  begin
    for j := 0 to COLUMNAS - 1 do
    begin
      TextBackground(color);

      { Rellenar el interior de cada celda }
      for y := 1 to ALTO_CELDA - 1 do
      begin
        for x := 1 to ANCHO_CELDA - 1 do
        begin
          GotoXY(posX + (j * ANCHO_CELDA) + x, posY + (i * ALTO_CELDA) + y);
          Write(' ');
        end;
      end;

      color := color + 1;
    end;
  end;

  { Restaurar colores normales }
  TextBackground(Black);
  TextColor(LightGray);

  { Posicionar cursor fuera de la grilla }
  GotoXY(1, 25);

  ReadKey;
end.
