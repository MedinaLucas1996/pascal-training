program Ejercicio37;
uses Crt;

const
  ANCHO = 30;
  ALTO = 4;

var
  i, j: Integer;
  posX, posY: Integer;

begin
  ClrScr;

  { Calcular posición central de la pantalla }
  { La pantalla estándar es 80x25 }
  posX := (80 - ANCHO) div 2;
  posY := (25 - ALTO) div 2;

  { Dibujar el rectángulo }
  for i := 1 to ALTO do
  begin
    GotoXY(posX, posY + i - 1);

    if (i = 1) or (i = ALTO) then
    begin
      { Primera y última fila: línea completa }
      for j := 1 to ANCHO do
        Write('*');
    end
    else
    begin
      { Filas intermedias: solo los bordes }
      Write('*');
      for j := 2 to ANCHO - 1 do
        Write(' ');
      Write('*');
    end;
  end;

  { Posicionar cursor fuera del rectángulo }
  GotoXY(1, 25);

  ReadKey;
end.
