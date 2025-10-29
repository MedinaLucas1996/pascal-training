{
65) Desarrolle un programa que permita cargar un horario de clases: con día (de Lun a Vie), materia, horario inicio
y horario fin. El usuario ingresa el nombre de la materia y el programa devuelve días y horarios de clases,
hasta que desee salir. Con opción de imprimir el horario semanal diferenciando cada materia con colores  
}


program ejercicio65;

uses crt;

const
  MAX_CLASES = 100;

  NOMBRES_DIAS: array[1..5] of string =
    ('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES');

type
  TClase = record
    dia   : integer;     { 1..5 }
    materia: string[40];
    inicio: string[5];   { formato sugerido HH:MM }
    fin   : string[5];   { formato sugerido HH:MM }
  end;

  TVectorClases = array[1..MAX_CLASES] of TClase;

var
  Clases: TVectorClases;
  Cant  : integer;  { cantidad real de clases cargadas }

{----------------------------------------------------------}
{ Utilidad: pasar a MAYUS para comparación }
function Mayus(s: string): string;
var i: integer;
begin
  for i := 1 to Length(s) do s[i] := UpCase(s[i]);
  Mayus := s;
end;

{----------------------------------------------------------}
{ FUNCIÓN: Convierte "1..5" o nombre de día a índice 1..5; 0 si inválido }
function DiaAIndice(s: string): integer;
var i: integer; w: string;
begin
  w := Mayus(s);
  if (Length(w)=1) and (w[1] in ['1'..'5']) then
  begin
    DiaAIndice := Ord(w[1]) - Ord('0');
    Exit;
  end;
  for i := 1 to 5 do
    if w = NOMBRES_DIAS[i] then
    begin DiaAIndice := i; Exit; end;
  DiaAIndice := 0;
end;

{----------------------------------------------------------}
{ FUNCIÓN: Asigna un color a una materia (estable) }
function ColorMateria(const mat: string): integer;
const
  PALETA: array[1..6] of integer =
    (lightcyan, yellow, lightmagenta, lightgreen, lightblue, lightred);
var
  i, suma, idx: integer; u: string;
begin
  u := Mayus(mat); suma := 0;
  for i := 1 to Length(u) do inc(suma, Ord(u[i]));
  idx := (suma mod Length(PALETA)) + 1;
  ColorMateria := PALETA[idx];
end;

{----------------------------------------------------------}
{ PROCEDIMIENTO: Imprime todas las clases de una materia }
procedure MostrarClasesDeMateria(const V: TVectorClases; Cant: integer; const matBuscada: string);
var
  i: integer; enc: boolean; col: integer;
begin
  clrscr;
  textcolor(white);
  writeln('BUSQUEDA POR MATERIA: ', matBuscada);
  writeln('------------------------------------');
  enc := false;
  col := ColorMateria(matBuscada);

  for i := 1 to Cant do
    if Mayus(V[i].materia) = Mayus(matBuscada) then
    begin
      enc := true;
      textcolor(col);
      write(' - ');
      textcolor(white);
      write(NOMBRES_DIAS[V[i].dia], '  ');
      textcolor(col);
      write(V[i].materia, '  ');
      textcolor(white);
      writeln(V[i].inicio, ' - ', V[i].fin);
    end;

  if not enc then
  begin
    textcolor(lightred);
    writeln('No hay coincidencias para esa materia.');
  end;

  textcolor(lightgray);
  writeln; writeln('Presione una tecla para continuar...');
  readkey;
end;

{----------------------------------------------------------}
{ PROCEDIMIENTO: Imprime el horario semanal con colores por materia }
procedure ImprimirHorarioSemanal(const V: TVectorClases; Cant: integer);
var
  d, i: integer;
begin
  clrscr;
  textcolor(white);
  writeln('HORARIO SEMANAL (Lun a Vie)');
  writeln('===========================');
  writeln;

  for d := 1 to 5 do
  begin
    textcolor(lightcyan);
    writeln(NOMBRES_DIAS[d], ':');
    textcolor(white);

    { listar todas las clases de ese día }
    for i := 1 to Cant do
      if V[i].dia = d then
      begin
        textcolor(ColorMateria(V[i].materia));
        write('  ', V[i].materia:15);
        textcolor(white);
        writeln('  ', V[i].inicio, ' - ', V[i].fin);
      end;

    writeln;
  end;

  textcolor(lightgray);
  writeln('Presione una tecla para continuar...');
  readkey;
end;

{----------------------------------------------------------}
{ CARGA: Agrega N clases (pide día, materia, inicio, fin) }
procedure CargarClases(var V: TVectorClases; var Cant: integer);
var
  n, i, d: integer;
  s: string;
begin
  clrscr;
  textcolor(white);
  writeln('CARGA DE CLASES');
  writeln('---------------');
  write('¿Cuantas clases desea cargar? ');
  readln(n);

  if n < 1 then begin writeln('Nada que cargar.'); readkey; Exit; end;
  if Cant + n > MAX_CLASES then n := MAX_CLASES - Cant;

  for i := 1 to n do
  begin
    inc(Cant);
    writeln; textcolor(lightcyan); writeln('> Clase #', Cant); textcolor(white);

    repeat
      write('Dia (1..5 o nombre): ');
      readln(s);
      d := DiaAIndice(s);
      if d = 0 then
      begin textcolor(lightred); writeln('Dia invalido.'); textcolor(white); end;
    until d <> 0;
    V[Cant].dia := d;

    write('Materia          : '); readln(V[Cant].materia);
    write('Horario inicio   : '); readln(V[Cant].inicio);
    write('Horario fin      : '); readln(V[Cant].fin);
  end;

  textcolor(lightgreen);
  writeln; writeln('Carga completa.');
  textcolor(white);
  readkey;
end;

{----------------------------------------------------------}
{ PROGRAMA PRINCIPAL }
var
  op: integer;
  materiaBuscada: string;
begin
  Cant := 0;

  repeat
    clrscr;
    textcolor(white);
    writeln('HORARIO DE CLASES');
    writeln('-----------------');
    writeln('1) Cargar clases');
    writeln('2) Buscar por materia');
    writeln('3) Imprimir horario semanal (colores)');
    writeln('4) Salir');
    write('Opcion: ');
    readln(op);

    case op of
      1: CargarClases(Clases, Cant);
      2: begin
           clrscr;
           if Cant = 0 then
           begin textcolor(yellow); writeln('No hay clases cargadas.'); readkey; end
           else begin
             write('Ingrese el nombre exacto de la materia: ');
             readln(materiaBuscada);
             MostrarClasesDeMateria(Clases, Cant, materiaBuscada);
           end;
         end;
      3: begin
           if Cant = 0 then
           begin clrscr; textcolor(yellow); writeln('No hay clases cargadas.'); readkey; end
           else ImprimirHorarioSemanal(Clases, Cant);
         end;
      4: begin
           clrscr; textcolor(lightgreen); writeln('Hasta luego!'); textcolor(white);
         end;
    else
      textcolor(lightred); writeln('Opcion invalida.'); textcolor(white); readkey;
    end;

  until op = 4;
end.

