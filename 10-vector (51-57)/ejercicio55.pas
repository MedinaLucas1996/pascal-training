{
55) Desarrolle un programa que solicite el ingreso de 15 notas numéricas de alumnos, considerando que se
aprueba con nota 6, liste con color verde las notas aprobadas y con color rojo las notas reprobadas.
}

program ejercicio55;
uses crt;

const
  TOTAL = 15;
  NOTA_APROBADA = 6;

type
  TVector = array[1..TOTAL] of integer;

{------------------------------------------------------------}
procedure CargarNotas(var v: TVector);
var
  i: integer;
begin
  writeln('=== Carga de notas de alumnos ===');
  for i := 1 to TOTAL do
  begin
    repeat
      write('Nota del alumno [', i, ']: ');
      readln(v[i]);
      if (v[i] < 1) or (v[i] > 10) then
      begin
        textcolor(lightred);
        writeln('Error: la nota debe estar entre 1 y 10.');
        textcolor(white);
      end;
    until (v[i] >= 1) and (v[i] <= 10);
  end;
end;
{------------------------------------------------------------}
procedure MostrarNotas(const v: TVector);
var
  i: integer;
begin
  clrscr;
  writeln('=== Listado de Notas ===');
  for i := 1 to TOTAL do
  begin
    gotoxy(10, i + 3);
    if v[i] >= NOTA_APROBADA then
      textcolor(lightgreen)
    else
      textcolor(lightred);
    writeln('Alumno ', i:2, ' -> Nota: ', v[i]:2);
  end;
  textcolor(white);
end;
{------------------------------------------------------------}

var
  notas: TVector;

begin
  clrscr;
  CargarNotas(notas);
  MostrarNotas(notas);

  writeln;
  textcolor(white);
  writeln('Presione una tecla para finalizar...');
  readkey;
end.
