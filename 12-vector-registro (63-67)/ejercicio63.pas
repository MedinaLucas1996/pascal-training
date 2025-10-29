{
63) Desarrolle un programa que permita cargar un menú de desayuno, almuerzo y cena de lunes a viernes. El
usuario ingresa un día y el programa devuelve el menú correspondiente a ese día, hasta que desee salir. Con
opción de imprimir el menú completo diferenciando con colores cada comida. 
}


program ejercicio63;

uses crt;

type
  TMenuDia = record
    desayuno: string[50];
    almuerzo: string[50];
    cena:     string[50];
  end;

  TSemana = array[1..5] of TMenuDia; { Lunes..Viernes }

const
  NOMBRES_DIAS: array[1..5] of string =
    ('LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES');

{----------------------------------------------------------}
{ FUNCION: Convierte el texto ingresado a indice de dia (1..5). 
  Acepta nombre (Lunes..Viernes) o numero (1..5). Devuelve 0 si es invalido. }
function DiaAIndice(s: string): integer;
var
  i: integer;
begin
  { normalizo a mayusculas }
  for i := 1 to Length(s) do s[i] := UpCase(s[i]);

  { si viene numero }
  if (Length(s) = 1) and (s[1] in ['1'..'5']) then
  begin
    DiaAIndice := Ord(s[1]) - Ord('0');
    Exit;
  end;

  { si viene nombre }
  for i := 1 to 5 do
    if s = NOMBRES_DIAS[i] then
    begin
      DiaAIndice := i;
      Exit;
    end;

  DiaAIndice := 0; { invalido }
end;

{----------------------------------------------------------}
{ PROCEDIMIENTO: Imprime el menu de un dia con colores }
procedure ImprimirMenuDia(const semana: TSemana; idx: integer);
begin
  clrscr;
  textcolor(white);
  writeln('MENU DEL ', NOMBRES_DIAS[idx]);
  writeln('----------------------------------------');

  textcolor(lightgreen);
  write('Desayuno: '); textcolor(white); writeln(semana[idx].desayuno);

  textcolor(yellow);
  write('Almuerzo: '); textcolor(white); writeln(semana[idx].almuerzo);

  textcolor(lightmagenta);
  write('Cena    : '); textcolor(white); writeln(semana[idx].cena);

  writeln;
  textcolor(lightgray);
  writeln('Presione una tecla para continuar...');
  readkey;
end;

{----------------------------------------------------------}
{ PROCEDIMIENTO: Imprime el menu completo con colores por comida }
procedure ImprimirMenuCompleto(const semana: TSemana);
var
  d: integer;
begin
  clrscr;
  textcolor(white);
  writeln('MENU SEMANAL (Lunes a Viernes)');
  writeln('================================');
  writeln;

  for d := 1 to 5 do
  begin
    textcolor(lightcyan);
    writeln(NOMBRES_DIAS[d], ':');
    textcolor(lightgreen);
    write('  Desayuno: '); textcolor(white); writeln(semana[d].desayuno);

    textcolor(yellow);
    write('  Almuerzo: '); textcolor(white); writeln(semana[d].almuerzo);

    textcolor(lightmagenta);
    write('  Cena    : '); textcolor(white); writeln(semana[d].cena);

    writeln;
  end;

  textcolor(lightgray);
  writeln('Presione una tecla para continuar...');
  readkey;
end;

{----------------------------------------------------------}
{ PROGRAMA PRINCIPAL }
var
  semana: TSemana;
  d, op: integer;
  entrada: string;
begin
  clrscr;
  textcolor(white);
  writeln('CARGA DEL MENU SEMANAL (Lunes a Viernes)');
  writeln('----------------------------------------');

  { Carga de datos }
  for d := 1 to 5 do
  begin
    textcolor(lightcyan);
    writeln;
    writeln('> ', NOMBRES_DIAS[d]);
    textcolor(white);
    write('  Desayuno: '); readln(semana[d].desayuno);
    write('  Almuerzo: '); readln(semana[d].almuerzo);
    write('  Cena    : '); readln(semana[d].cena);
  end;

  { Menu de opciones }
  repeat
    clrscr;
    textcolor(white);
    writeln('CONSULTA DE MENU');
    writeln('----------------');
    writeln('1) Ver menu por dia');
    writeln('2) Imprimir menu completo (colores)');
    writeln('3) Salir');
    write('Elija una opcion: ');
    readln(op);

    case op of
      1: begin
           clrscr;
           textcolor(white);
           writeln('Ingrese un dia (1..5 o nombre: Lunes..Viernes): ');
           readln(entrada);
           d := DiaAIndice(entrada);
           if (d >= 1) and (d <= 5) then
             ImprimirMenuDia(semana, d)
           else
           begin
             textcolor(lightred);
             writeln('Dia invalido. Use 1..5 o Lunes..Viernes.');
             readkey;
           end;
         end;
      2: ImprimirMenuCompleto(semana);
      3: begin
           clrscr;
           textcolor(lightgreen);
           writeln('Hasta luego!');
           textcolor(white);
         end;
    else
      textcolor(lightred);
      writeln('Opcion invalida.');
      readkey;
    end;
  until op = 3;
end.

