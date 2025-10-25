program ejercicio50;
uses crt;

{---------------------------------------------------------------}
{ FUNCIONES para las 4 operaciones básicas }
function Sumar(a, b: real): real;
begin
  Sumar := a + b;
end;

function Restar(a, b: real): real;
begin
  Restar := a - b;
end;

function Multiplicar(a, b: real): real;
begin
  Multiplicar := a * b;
end;

function Dividir(a, b: real): real;
begin
  if b = 0 then
  begin
    writeln('Error: No se puede dividir por cero.');
    Dividir := 0;
  end
  else
    Dividir := a / b;
end;
{---------------------------------------------------------------}

{ PROCEDIMIENTO para solicitar los números y elegir la operación }
procedure Calcular;
var
  n1, n2, resultado: real;
  opcion: char;
begin
  clrscr;
  writeln('=== Calculadora basica ===');
  writeln;

  { Solicito el primer número }
  repeat
    write('Ingrese el primer numero: ');
    readln(n1);
  until true; { se puede agregar validación extra si se desea }

  { Solicito el segundo número }
  repeat
    write('Ingrese el segundo numero: ');
    readln(n2);
  until true;

  writeln;
  writeln('Seleccione la operacion a realizar:');
  writeln('A - Suma');
  writeln('B - Resta');
  writeln('C - Multiplicacion');
  writeln('D - Division');
  write('Opcion: ');
  readln(opcion);

  opcion := upcase(opcion);

  writeln;

  case opcion of
    'A': resultado := Sumar(n1, n2);
    'B': resultado := Restar(n1, n2);
    'C': resultado := Multiplicar(n1, n2);
    'D': resultado := Dividir(n1, n2);
  else
    begin
      writeln('Opcion invalida.');
      exit;
    end;
  end;

  writeln('Resultado: ', resultado:0:2);
end;
{---------------------------------------------------------------}

BEGIN
  Calcular;
  readkey;
END.
