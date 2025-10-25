{
57) Desarrolle un programa que solicite el ingreso del sueldo de 10 empleados (valores entre 100 y 2000). Calcule
el promedio de los sueldos y liste con color azul los sueldos superiores al promedio y con color amarillo los
sueldos inferiores al promedio. Permita buscar un sueldo e indique su posición en la lista
}

program ejercicio57;
uses crt;

const
  TOTAL = 10;
  SUELDO_MIN = 100;
  SUELDO_MAX = 2000;

type
  TVector = array[1..TOTAL] of real;

{------------------------------------------------------------}
procedure CargarSueldos(var v: TVector);
var
  i: integer;
begin
  writeln('=== Carga de sueldos de empleados ===');
  for i := 1 to TOTAL do
  begin
    repeat
      write('Sueldo del empleado [', i, ']: ');
      readln(v[i]);
      if (v[i] < SUELDO_MIN) or (v[i] > SUELDO_MAX) then
      begin
        textcolor(lightred);
        writeln('Error: el sueldo debe estar entre ', SUELDO_MIN, ' y ', SUELDO_MAX, '.');
        textcolor(white);
      end;
    until (v[i] >= SUELDO_MIN) and (v[i] <= SUELDO_MAX);
  end;
end;
{------------------------------------------------------------}
function CalcularPromedio(const v: TVector): real;
var
  i: integer;
  suma: real;
begin
  suma := 0;
  for i := 1 to TOTAL do
    suma := suma + v[i];
  CalcularPromedio := suma / TOTAL;
end;
{------------------------------------------------------------}
procedure MostrarSueldos(const v: TVector; promedio: real);
var
  i: integer;
begin
  clrscr;
  writeln('=== Listado de Sueldos ===');
  writeln('Promedio: ', promedio:0:2);
  writeln;

  for i := 1 to TOTAL do
  begin
    gotoxy(10, i + 5);

    if v[i] > promedio then
      textcolor(lightblue)      { azul para los que superan el promedio }
    else
      textcolor(yellow);        { amarillo para los que están por debajo o igual }

    writeln('Empleado ', i:2, ' -> Sueldo: $', v[i]:0:2);
  end;
  textcolor(white);
end;
{------------------------------------------------------------}
function BuscarSueldo(const v: TVector; valor: real): integer;
var
  i: integer;
begin
  BuscarSueldo := -1;
  for i := 1 to TOTAL do
    if abs(v[i] - valor) < 0.01 then   { tolerancia por decimales }
    begin
      BuscarSueldo := i;
      exit;
    end;
end;
{------------------------------------------------------------}

var
  sueldos: TVector;
  prom, buscado: real;
  pos: integer;

begin
  clrscr;
  CargarSueldos(sueldos);
  prom := CalcularPromedio(sueldos);
  MostrarSueldos(sueldos, prom);

  writeln;
  textcolor(white);
  write('Ingrese un sueldo para buscar: ');
  readln(buscado);

  pos := BuscarSueldo(sueldos, buscado);

  if pos <> -1 then
  begin
    textcolor(lightgreen);
    writeln('El sueldo $', buscado:0:2, ' se encuentra en la posicion ', pos, '.');
  end
  else
  begin
    textcolor(lightred);
    writeln('El sueldo $', buscado:0:2, ' no se encuentra en la lista.');
  end;

  textcolor(white);
  writeln;
  writeln('Presione una tecla para finalizar...');
  readkey;
end.
