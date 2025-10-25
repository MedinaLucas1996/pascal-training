program Ejercicio42;
uses Crt;

const
  ANCHO = 80;  { ancho típico de consola }
  ALTO  = 25;  { alto típico de consola }

var
  x, y: Integer;
  topLines, midLines: Integer;
  centerX, centerY: Integer;
  leftEdge, rightEdge: Integer;
  row, widthVal: Integer;

begin
  ClrScr;

  { Dividimos en 3 franjas: celeste - blanco - celeste }
  topLines := ALTO div 3;           { 8 }
  midLines := ALTO - (2 * topLines); { 9 para completar 25 }

  { Franja superior (celeste) }
  TextBackground(LightCyan);
  for y := 1 to topLines do
  begin
    GotoXY(1, y);
    for x := 1 to ANCHO do Write(' ');
  end;

  { Franja central (blanco) }
  TextBackground(White);
  for y := topLines + 1 to topLines + midLines do
  begin
    GotoXY(1, y);
    for x := 1 to ANCHO do Write(' ');
  end;

  { Franja inferior (celeste) }
  TextBackground(LightCyan);
  for y := topLines + midLines + 1 to ALTO do
  begin
    GotoXY(1, y);
    for x := 1 to ANCHO do Write(' ');
  end;

  { Sol de Mayo (pixelart sencillo) en el centro de la franja blanca }
  centerX := (ANCHO div 2);
  centerY := topLines + (midLines div 2) + 1; { línea media de la franja blanca }

  TextBackground(Yellow);

  { Disco central (5 filas: 6,8,10,8,6) }
  for row := -2 to 2 do
  begin
    case Abs(row) of
      2: widthVal := 6;
      1: widthVal := 8;
    else
      widthVal := 10;
    end;
    leftEdge := centerX - (widthVal div 2);
    if (centerY + row >= topLines + 1) and (centerY + row <= topLines + midLines) then
    begin
      GotoXY(leftEdge, centerY + row);
      for x := 1 to widthVal do Write(' ');
    end;
  end;

  { Rayos horizontales (4 a cada lado) }
  leftEdge := centerX - (10 div 2);   { borde del disco en fila central }
  rightEdge := centerX + (10 div 2) - 1;
  for x := 1 to 4 do
  begin
    GotoXY(leftEdge - x, centerY);  Write(' ');
    GotoXY(rightEdge + x, centerY); Write(' ');
  end;

  { Rayos verticales (3 arriba y 3 abajo, limitados a franja blanca) }
  for y := 1 to 3 do
  begin
    row := centerY - (2 + y);
    if (row >= topLines + 1) and (row <= topLines + midLines) then
    begin
      GotoXY(centerX, row); Write(' ');
    end;
    row := centerY + (2 + y);
    if (row >= topLines + 1) and (row <= topLines + midLines) then
    begin
      GotoXY(centerX, row); Write(' ');
    end;
  end;

  { Rayos diagonales (2 pasos en cada diagonal) }
  if (centerY - 2 >= topLines + 1) then
  begin
    GotoXY(centerX - 6, centerY - 2); Write(' ');
    if (centerY - 3 >= topLines + 1) then GotoXY(centerX - 7, centerY - 3); Write(' ');
    GotoXY(centerX + 5, centerY - 2); Write(' ');
    if (centerY - 3 >= topLines + 1) then GotoXY(centerX + 6, centerY - 3); Write(' ');
  end;
  if (centerY + 2 <= topLines + midLines) then
  begin
    GotoXY(centerX - 6, centerY + 2); Write(' ');
    if (centerY + 3 <= topLines + midLines) then GotoXY(centerX - 7, centerY + 3); Write(' ');
    GotoXY(centerX + 5, centerY + 2); Write(' ');
    if (centerY + 3 <= topLines + midLines) then GotoXY(centerX + 6, centerY + 3); Write(' ');
  end;

  { Restaurar colores y esperar tecla sin escribir texto sobre la bandera }
  TextBackground(Black);
  TextColor(LightGray);
  GotoXY(ANCHO, ALTO);
  ReadKey;
end.
