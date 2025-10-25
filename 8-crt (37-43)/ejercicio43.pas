program Ejercicio43;
uses Crt;

function IntToStr64(x: Int64): string;
var s: string;
begin
  Str(x:0, s);
  IntToStr64 := s;
end;

var
  N, r, k: Integer;
  rowStr: string;
  val: Int64;
  startX, startY: Integer;
  lineLen: Integer;

begin
  ClrScr;
  Write('Ingrese la dimension (cantidad de filas) del Triangulo de Pascal: ');
  ReadLn(N);

  if N < 1 then N := 1;
  if N > 24 then N := 24; { Por altura de pantalla }

  ClrScr;
  GotoXY(24, 1);
  Write('TRIANGULO DE PASCAL (N=', N, ')');

  { Centrado vertical: usamos lineas 2..25 (24 lineas disponibles) }
  startY := 2 + ((24 - N) div 2);

  for r := 0 to N - 1 do
  begin
    { Construir la cadena de la fila r centrable }
    rowStr := '';
    val := 1; { C(r,0) = 1 }
    rowStr := IntToStr64(val);
    for k := 1 to r do
    begin
      { siguiente coeficiente: C(r,k) = C(r,k-1) * (r-k+1) div k }
      val := (val * (r - k + 1)) div k;
      rowStr := rowStr + ' ' + IntToStr64(val);
    end;

    lineLen := Length(rowStr);
    if lineLen > 80 then
      startX := 1
    else
      startX := ((80 - lineLen) div 2) + 1;

    GotoXY(startX, startY + r);
    Write(rowStr);
  end;

  GotoXY(80, 25);
  ReadKey;
end.
