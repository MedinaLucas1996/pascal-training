program juego_ahorcado;
uses crt;

const
  MAX_FALLAS = 6;
  CANT_PALABRAS = 20;

type
  TUsadas = array[1..26] of boolean;

var
  DICC: array[1..CANT_PALABRAS] of string = (
    'PROGRAMACION','ALGORITMO','VARIABLE','FUNCION','PROCEDIMIENTO',
    'VECTOR','MATRIZ','COMPILADOR','PASCAL','RECURSIVIDAD',
    'CONSTANTE','ENTERO','CARACTER','CADENA','REGISTRO',
    'MODULO','BIBLIOTECA','PUNTERO','CONDICIONAL','ITERACION'
  );

{-------------------------------- UTILIDADES --------------------------------}
function EsLetra(c: char): boolean;
begin
  c := upcase(c);
  EsLetra := (c >= 'A') and (c <= 'Z');
end;

function Idx(c: char): integer;  { Convierte 'A'..'Z' -> 1..26 }
begin
  Idx := ord(upcase(c)) - ord('A') + 1;
end;

procedure InicializarUsadas(var u: TUsadas);
var i: integer;
begin
  for i := 1 to 26 do u[i] := false;
end;

function LetraEnPalabra(letra: char; const palabra: string): boolean;
var i: integer; L: char;
begin
  letra := upcase(letra);
  LetraEnPalabra := false;
  for i := 1 to length(palabra) do
  begin
    L := upcase(palabra[i]);
    if (L = letra) then
    begin
      LetraEnPalabra := true;
      exit;
    end;
  end;
end;

function PalabraAdivinada(const palabra: string; const usadas: TUsadas): boolean;
var i: integer; L: char;
begin
  for i := 1 to length(palabra) do
  begin
    L := upcase(palabra[i]);
    if (L >= 'A') and (L <= 'Z') then
      if not usadas[Idx(L)] then
      begin
        PalabraAdivinada := false;
        exit;
      end;
  end;
  PalabraAdivinada := true;
end;

procedure ImprimirPalabra(const palabra: string; const usadas: TUsadas);
var i: integer; L: char;
begin
  textcolor(white);
  for i := 1 to length(palabra) do
  begin
    L := upcase(palabra[i]);
    if (L >= 'A') and (L <= 'Z') then
    begin
      if usadas[Idx(L)] then write(L, ' ')
      else write('_', ' ');
    end
    else
      write(palabra[i], ' '); { por si hubiera guiones, espacios, etc. }
  end;
  writeln;
end;

procedure ImprimirUsadas(const usadas: TUsadas);
var i, cnt: integer;
begin
  write('Letras usadas: ');
  cnt := 0;
  for i := 1 to 26 do
    if usadas[i] then
    begin
      write(chr(ord('A') + i - 1), ' ');
      inc(cnt);
    end;
  if cnt = 0 then write('(ninguna)');
  writeln;
end;

procedure DibujarAhorcado(fallas: integer);
begin
  { Gallows + etapas (0..6) }
  textcolor(lightgray);
  writeln('  _______');
  writeln(' |/      |');
  case fallas of
    0: begin
         writeln(' |'); writeln(' |'); writeln(' |'); writeln(' |');
       end;
    1: begin
         writeln(' |      ( )');
         writeln(' |');
         writeln(' |');
         writeln(' |');
       end;
    2: begin
         writeln(' |      ( )');
         writeln(' |       |');
         writeln(' |');
         writeln(' |');
       end;
    3: begin
         writeln(' |      ( )');
         writeln(' |      /|');
         writeln(' |');
         writeln(' |');
       end;
    4: begin
         writeln(' |      ( )');
         writeln(' |      /|\');
         writeln(' |');
         writeln(' |');
       end;
    5: begin
         writeln(' |      ( )');
         writeln(' |      /|\');
         writeln(' |      /');
         writeln(' |');
       end;
    6: begin
         writeln(' |      ( )');
         writeln(' |      /|\');
         writeln(' |      / \');
         writeln(' |');
       end;
  end;
  writeln(' |');
  writeln('_|___');
end;

function PedirLetra: char;
var linea: string;
begin
  repeat
    write('Ingrese una letra: ');
    readln(linea);
    if length(linea) = 0 then continue;
    PedirLetra := upcase(linea[1]);
    if not EsLetra(PedirLetra) then
      writeln('Debe ingresar una letra A..Z.');
  until EsLetra(PedirLetra);
end;

function ElegirPalabraAlAzar: string;
begin
  ElegirPalabraAlAzar := DICC[1 + random(CANT_PALABRAS)];
end;

{----------------------------------- JUEGO -----------------------------------}
procedure Jugar;
var
  palabra: string;
  usadas: TUsadas;
  fallas: integer;
  letra: char;
begin
  clrscr;
  randomize;
  palabra := ElegirPalabraAlAzar;
  InicializarUsadas(usadas);
  fallas := 0;

  repeat
    clrscr;
    textcolor(yellow); writeln('=== A H O R C A D O ==='); textcolor(white);
    DibujarAhorcado(fallas);
    writeln;
    ImprimirPalabra(palabra, usadas);
    ImprimirUsadas(usadas);
    writeln;

    letra := PedirLetra;

    if usadas[Idx(letra)] then
    begin
      writeln('Ya usaste la letra ', letra, '. Probá otra.');
      delay(900);
      continue;
    end;

    usadas[Idx(letra)] := true;

    if LetraEnPalabra(letra, palabra) then
    begin
      writeln('Bien! La letra ', letra, ' esta.');
      delay(700);
    end
    else
    begin
      writeln('Ups... La letra ', letra, ' no esta.');
      inc(fallas);
      delay(900);
    end;

  until (fallas >= MAX_FALLAS) or PalabraAdivinada(palabra, usadas);

  clrscr;
  textcolor(yellow); writeln('=== A H O R C A D O ==='); textcolor(white);
  DibujarAhorcado(fallas);
  writeln;

  if PalabraAdivinada(palabra, usadas) then
  begin
    textcolor(lightgreen);
    writeln('Ganaste! La palabra era: ', palabra);
  end
  else
  begin
    textcolor(lightred);
    writeln('Perdiste. La palabra era: ', palabra);
  end;

  textcolor(white);
  writeln; writeln('Presione una tecla para continuar...');
  readkey;
end;

{----------------------------------- MAIN ------------------------------------}
var
  op: char;
begin
  repeat
    Jugar;
    clrscr;
    write('¿Jugar de nuevo? (S/N): ');
    readln(op);
    op := upcase(op);
  until op <> 'S';
end.
