program Ejercicio40;
uses Crt;

const
  FILAS = 10;
  ANCHO_CELDA = 20;
  ALTO_CELDA = 2;

var
  numero, i, j: Integer;
  opcion: Char;
  posX, posY: Integer;
  continuar: Boolean;

begin
  continuar := True;

  while continuar do
  begin
    ClrScr;

    { Solicitar número al usuario }
    Write('Ingrese un numero para ver su tabla de multiplicar: ');
    ReadLn(numero);

    ClrScr;

    { Calcular posición central }
    posX := (80 - ANCHO_CELDA) div 2;
    posY := (25 - (FILAS * ALTO_CELDA)) div 2;

    { Dibujar líneas horizontales de la grilla }
    for i := 0 to FILAS do
    begin
      for j := 1 to ANCHO_CELDA do
      begin
        GotoXY(posX + j - 1, posY + (i * ALTO_CELDA));
        Write('-');
      end;
    end;

    { Dibujar líneas verticales de la grilla }
    for i := 0 to FILAS * ALTO_CELDA do
    begin
      GotoXY(posX, posY + i);
      Write('|');
      GotoXY(posX + ANCHO_CELDA - 1, posY + i);
      Write('|');
    end;

    { Imprimir la tabla de multiplicar dentro de la grilla }
    for i := 1 to FILAS do
    begin
      GotoXY(posX + 3, posY + ((i - 1) * ALTO_CELDA) + 1);
      Write(numero, ' x ', i, ' = ', numero * i);
    end;

    { Mostrar menú }
    GotoXY(1, 24);
    Write('Desea continuar? (S/N): ');
    opcion := UpCase(ReadKey);

    if opcion <> 'S' then
      continuar := False;
  end;

  ClrScr;
end.
