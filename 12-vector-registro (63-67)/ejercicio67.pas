{
67) * Desarrolle un programa que permita cargar la patente, la marca, el modelo y el año de 10 autos, luego listar
en forma descendente por año, con color rojo aquellos con más de 10 años, con color amarillo aquellos con
más de 5 años, y con color blanco los último modelo. Debe permitir buscar datos del auto ingresando la
patente.  
}


program ejercicio67;

uses crt;

const
  MAX = 10;

type
  TAuto = record
    patente: string[10];
    marca:   string[20];
    modelo:  string[20];
    anio:    word;
  end;

  TVector = array[1..MAX] of TAuto;

var
  A: TVector;
  L: byte;          { cantidad cargada (fija en 10 para este ejercicio) }
  AnioActual: word;

{----------------- UTILITARIOS -----------------}

function Mayus(const s: string): string;
var i: integer; r: string;
begin
  r := s;
  for i := 1 to Length(r) do r[i] := UpCase(r[i]);
  Mayus := r;
end;

function EdadAuto(anioAuto, anioAct: word): integer;
begin
  if anioAuto > anioAct then EdadAuto := 0
  else EdadAuto := anioAct - anioAuto;
end;

function ColorPorEdad(edad: integer; anioAuto, anioAct: word): byte;
begin
  if anioAuto = anioAct then
    ColorPorEdad := white                    { último modelo }
  else if edad > 10 then
    ColorPorEdad := lightred                 { >10 años }
  else if edad > 5 then
    ColorPorEdad := yellow                   { >5 años }
  else
    ColorPorEdad := lightgray;               { resto (5 años o menos, pero no último modelo) }
end;

function BuscarPorPatente(const V: TVector; n: byte; const pat: string): byte;
var i: byte; p: string;
begin
  BuscarPorPatente := 0;
  p := Mayus(pat);
  for i := 1 to n do
    if Mayus(V[i].patente) = p then
    begin
      BuscarPorPatente := i; exit;
    end;
end;

procedure Swap(var x, y: TAuto);
var t: TAuto;
begin
  t := x; x := y; y := t;
end;

{----------------- CARGA -----------------}

procedure CargarAutos(var V: TVector; var n: byte);
var i: byte;
begin
  clrscr;
  writeln('=== CARGA DE ', MAX, ' AUTOS ===');
  n := 0;
  for i := 1 to MAX do
  begin
    textcolor(white);
    writeln; writeln('Auto #', i);
    write('Patente: ');   readln(V[i].patente);
    write('Marca: ');     readln(V[i].marca);
    write('Modelo: ');    readln(V[i].modelo);
    repeat
      write('Anio (1900..2100): '); readln(V[i].anio);
      if (V[i].anio < 1900) or (V[i].anio > 2100) then
      begin
        textcolor(lightred); writeln('Anio invalido.'); textcolor(white);
      end;
    until (V[i].anio >= 1900) and (V[i].anio <= 2100);
    n := n + 1;
  end;
  textcolor(lightgreen); writeln; writeln('Carga completa de ', n, ' autos.'); textcolor(white);
  writeln('Presione una tecla para continuar...'); readkey;
end;

{----------------- ORDENAMIENTO -----------------}

procedure OrdenarPorAnioDesc(var V: TVector; n: byte);
var i, j, posMax: byte;
begin
  { Seleccion directa descendente por anio }
  for i := 1 to n-1 do
  begin
    posMax := i;
    for j := i+1 to n do
      if V[j].anio > V[posMax].anio then
        posMax := j;
    if posMax <> i then Swap(V[i], V[posMax]);
  end;
end;

{----------------- SALIDAS -----------------}

procedure MostrarAuto(const X: TAuto; anioAct: word);
var edad: integer; col: byte;
begin
  edad := EdadAuto(X.anio, anioAct);
  col := ColorPorEdad(edad, X.anio, anioAct);
  textcolor(col);
  write(X.anio:4, '  ');
  textcolor(white); write(X.patente:10, '  ');
  textcolor(col);   write(X.marca:15, '  ');
  textcolor(white); write(X.modelo:18, '  ');
  textcolor(col);   writeln('Edad: ', edad, ' anio(s)');
  textcolor(white);
end;

procedure ListarOrdenado(const V: TVector; n: byte; anioAct: word);
var i: byte;
begin
  clrscr;
  textcolor(white);
  writeln('=== LISTADO POR ANIO (DESC) ===');
  writeln('Colores: Blanco=Ultimo modelo | Amarillo=>5 anios | Rojo=>10 anios | Gris=resto');
  writeln;
  writeln('Anio  Patente     Marca           Modelo             Info');
  writeln('--------------------------------------------------------------');
  if n=0 then
  begin
    textcolor(lightred); writeln('No hay autos cargados.'); textcolor(white);
  end
  else
    for i := 1 to n do
      MostrarAuto(V[i], anioAct);

  writeln; textcolor(lightgray); writeln('Presione una tecla para volver...'); textcolor(white); readkey;
end;

procedure BuscarInteractivo(const V: TVector; n: byte; anioAct: word);
var pat: string; pos: byte; opc: char;
begin
  repeat
    clrscr;
    writeln('=== BUSCAR AUTO POR PATENTE ===');
    write('Ingrese patente (vacío para salir): ');
    readln(pat);
    if pat = '' then exit;

    pos := BuscarPorPatente(V, n, pat);
    if pos = 0 then
    begin
      textcolor(lightred); writeln('No se encontro la patente "', Mayus(pat), '".'); textcolor(white);
    end
    else
    begin
      writeln; writeln('Resultado:');
      writeln('Anio  Patente     Marca           Modelo             Info');
      writeln('--------------------------------------------------------------');
      MostrarAuto(V[pos], anioAct);
    end;

    writeln; write('¿Buscar otro? (S/N): ');
    readln(opc); opc := UpCase(opc);
  until opc <> 'S';
end;

{----------------- MENU -----------------}

procedure MenuPrincipal;
begin
  clrscr;
  textcolor(white);
  writeln('==============================');
  writeln('  AUTOS (', MAX, ' registros)');
  writeln('==============================');
  writeln('1) Cargar autos (10)');
  writeln('2) Ordenar por anio (descendente)');
  writeln('3) Listar con colores por antiguedad');
  writeln('4) Buscar por patente');
  writeln('5) Cambiar anio actual');
  writeln('6) Salir');
  write('Opcion: ');
end;

{----------------- PROGRAMA -----------------}

var
  opcion: char;
begin
  L := 0;
  clrscr;
  textcolor(white);
  write('Ingrese el ANIO ACTUAL: '); readln(AnioActual);

  repeat
    MenuPrincipal;
    readln(opcion);
    case opcion of
      '1': CargarAutos(A, L);
      '2':
        begin
          if L=0 then begin textcolor(lightred); writeln('Primero cargue los autos.'); textcolor(white); readkey; end
          else begin OrdenarPorAnioDesc(A, L); writeln('Ordenado.'); readkey; end;
        end;
      '3':
        begin
          if L=0 then begin textcolor(lightred); writeln('No hay datos para listar.'); textcolor(white); readkey; end
          else ListarOrdenado(A, L, AnioActual);
        end;
      '4':
        begin
          if L=0 then begin textcolor(lightred); writeln('No hay datos para buscar.'); textcolor(white); readkey; end
          else BuscarInteractivo(A, L, AnioActual);
        end;
      '5':
        begin
          write('Nuevo ANIO ACTUAL: '); readln(AnioActual);
        end;
    end;
  until opcion = '6';

  clrscr; writeln('Saliendo...'); delay(400);
end.
