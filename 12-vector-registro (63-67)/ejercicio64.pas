{
64) Desarrolle una Agenda de contactos que incluya Nombre, Telefono, Domicilio y Edad. Debe permitir buscar un
contacto por nombre o por teléfono. 
}


program ejercicio64;

uses crt;

const
  MAX_CONTACTOS = 100;

type
  TContacto = record
    Nombre   : string[40];
    Telefono : string[20];
    Domicilio: string[60];
    Edad     : byte;
  end;

  TAgenda = array[1..MAX_CONTACTOS] of TContacto;

var
  Agenda : TAgenda;
  Cant   : integer;  { cantidad real de contactos cargados }

{----------------------------------------------------------}
{ Utilidad: pasar a MAYUS para comparación }
function Mayus(s: string): string;
var i: integer;
begin
  for i := 1 to Length(s) do s[i] := UpCase(s[i]);
  Mayus := s;
end;

{----------------------------------------------------------}
{ FUNCIÓN: Busca por NOMBRE (coincidencia exacta, case-insensitive).
  Devuelve índice (1..Cant) o 0 si no encuentra. }
function BuscarPorNombre(const A: TAgenda; Cant: integer; const nombre: string): integer;
var
  i: integer; buscado: string;
begin
  buscado := Mayus(nombre);
  for i := 1 to Cant do
    if Mayus(A[i].Nombre) = buscado then
    begin
      BuscarPorNombre := i;
      Exit;
    end;
  BuscarPorNombre := 0;
end;

{----------------------------------------------------------}
{ FUNCIÓN: Busca por TELÉFONO (coincidencia exacta).
  Devuelve índice (1..Cant) o 0 si no encuentra. }
function BuscarPorTelefono(const A: TAgenda; Cant: integer; const tel: string): integer;
var
  i: integer;
begin
  for i := 1 to Cant do
    if A[i].Telefono = tel then
    begin
      BuscarPorTelefono := i;
      Exit;
    end;
  BuscarPorTelefono := 0;
end;

{----------------------------------------------------------}
{ PROCEDIMIENTO: Muestra un contacto bonito }
procedure MostrarContacto(const C: TContacto);
begin
  textcolor(lightcyan);   write('Nombre   : '); textcolor(white); writeln(C.Nombre);
  textcolor(lightcyan);   write('Telefono : '); textcolor(white); writeln(C.Telefono);
  textcolor(lightcyan);   write('Domicilio: '); textcolor(white); writeln(C.Domicilio);
  textcolor(lightcyan);   write('Edad     : '); textcolor(white); writeln(C.Edad);
end;

{----------------------------------------------------------}
{ Alta de un contacto (si hay espacio) }
procedure AgregarContacto(var A: TAgenda; var Cant: integer);
begin
  if Cant = MAX_CONTACTOS then
  begin
    textcolor(lightred);
    writeln('La agenda esta llena (', MAX_CONTACTOS, ').');
    textcolor(white);
    readkey; Exit;
  end;

  Inc(Cant);
  clrscr;
  textcolor(white);
  writeln('ALTA DE CONTACTO #', Cant);
  writeln('-------------------');
  write('Nombre    : ');   readln(A[ Cant ].Nombre);
  write('Telefono  : ');   readln(A[ Cant ].Telefono);
  write('Domicilio : ');   readln(A[ Cant ].Domicilio);
  write('Edad      : ');   readln(A[ Cant ].Edad);

  textcolor(lightgreen);
  writeln('Contacto agregado correctamente.');
  textcolor(white);
  readkey;
end;

{----------------------------------------------------------}
{ Listado de todos los contactos }
procedure ListarAgenda(const A: TAgenda; Cant: integer);
var i: integer;
begin
  clrscr;
  textcolor(white);
  writeln('LISTADO DE CONTACTOS (', Cant, ')');
  writeln('-------------------------------');
  writeln;
  if Cant = 0 then
  begin
    textcolor(yellow); writeln('No hay contactos cargados.');
    textcolor(white); readkey; Exit;
  end;

  for i := 1 to Cant do
  begin
    textcolor(lightmagenta); writeln('#', i);
    textcolor(white);
    MostrarContacto(A[i]);
    writeln;
  end;

  textcolor(lightgray);
  writeln('Fin del listado. Presione una tecla...');
  readkey;
end;

{----------------------------------------------------------}
{ PROGRAMA PRINCIPAL: menú }
var
  op: integer;
  s: string;
  idx: integer;
begin
  Cant := 0;
  repeat
    clrscr;
    textcolor(white);
    writeln('AGENDA DE CONTACTOS');
    writeln('-------------------');
    writeln('1) Agregar contacto');
    writeln('2) Buscar por nombre');
    writeln('3) Buscar por telefono');
    writeln('4) Listar todos');
    writeln('5) Salir');
    write('Opcion: ');
    readln(op);

    case op of
      1: AgregarContacto(Agenda, Cant);

      2: begin
           clrscr;
           write('Ingrese nombre a buscar (exacto): ');
           readln(s);
           idx := BuscarPorNombre(Agenda, Cant, s);
           clrscr;
           if idx <> 0 then
           begin
             textcolor(lightgreen); writeln('Contacto encontrado:'); textcolor(white);
             writeln('--------------------');
             MostrarContacto(Agenda[idx]);
           end
           else
           begin
             textcolor(lightred); writeln('No se encontro el contacto con ese nombre.');
             textcolor(white);
           end;
           writeln; textcolor(lightgray); writeln('Presione una tecla...');
           readkey;
         end;

      3: begin
           clrscr;
           write('Ingrese telefono a buscar (exacto): ');
           readln(s);
           idx := BuscarPorTelefono(Agenda, Cant, s);
           clrscr;
           if idx <> 0 then
           begin
             textcolor(lightgreen); writeln('Contacto encontrado:'); textcolor(white);
             writeln('--------------------');
             MostrarContacto(Agenda[idx]);
           end
           else
           begin
             textcolor(lightred); writeln('No se encontro el contacto con ese telefono.');
             textcolor(white);
           end;
           writeln; textcolor(lightgray); writeln('Presione una tecla...');
           readkey;
         end;

      4: ListarAgenda(Agenda, Cant);

      5: begin
           clrscr;
           textcolor(lightgreen); writeln('Hasta luego!');
           textcolor(white);
         end;

    else
      textcolor(lightred); writeln('Opcion invalida.'); textcolor(white); readkey;
    end;

  until op = 5;
end.

