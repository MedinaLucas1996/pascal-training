{
66) Desarrolle un programa que permita cargar código, descripción, rubro, stock y precio de 20 artículos. El
usuario debe poder ingresar el código y el programa le devuelve el resto de los datos, hasta que desee salir.
Con opción de imprimir el inventario completo resaltando con distintos colores el rubro de cada producto.   
}


program untitled;
uses crt;

const
  MAX = 20;

type
  TRubro = (rAlimentos, rLimpieza, rElectronica, rRopa, rOtros);

  TArticulo = record
    codigo: longint;
    descripcion: string[40];
    rubro: TRubro;
    stock: word;
    precio: real;
  end;

  TVector = array[1..MAX] of TArticulo;

var
  A: TVector;
  L: byte;  { cantidad cargada }

{----------------- UTILITARIOS -----------------}

function RubroToStr(r: TRubro): string;
begin
  case r of
    rAlimentos:    RubroToStr := 'Alimentos';
    rLimpieza:     RubroToStr := 'Limpieza';
    rElectronica:  RubroToStr := 'Electronica';
    rRopa:         RubroToStr := 'Ropa';
    rOtros:        RubroToStr := 'Otros';
  end;
end;

procedure ColorPorRubro(r: TRubro);
begin
  case r of
    rAlimentos:    textcolor(lightgreen);
    rLimpieza:     textcolor(cyan);
    rElectronica:  textcolor(yellow);
    rRopa:         textcolor(lightmagenta);
    rOtros:        textcolor(lightblue);
  end;
end;

function LeerRubro(): TRubro;
var op: byte;
begin
  repeat
    writeln('Seleccione Rubro:');
    writeln('  1) Alimentos');
    writeln('  2) Limpieza');
    writeln('  3) Electronica');
    writeln('  4) Ropa');
    writeln('  5) Otros');
    write('Opcion: '); readln(op);
    if (op<1) or (op>5) then
    begin
      textcolor(lightred); writeln('Opcion invalida.'); textcolor(white);
    end;
  until (op>=1) and (op<=5);

  case op of
    1: LeerRubro := rAlimentos;
    2: LeerRubro := rLimpieza;
    3: LeerRubro := rElectronica;
    4: LeerRubro := rRopa;
    5: LeerRubro := rOtros;
  end;
end;

function ExisteCodigo(const V: TVector; n: byte; cod: longint): boolean;
var i: byte;
begin
  ExisteCodigo := false;
  for i:=1 to n do
    if V[i].codigo = cod then begin
      ExisteCodigo := true; exit;
    end;
end;

{----------------- CORE -----------------}

procedure CargarInventario(var V: TVector; var n: byte);
var i: byte; aux: TArticulo; cod: longint;
begin
  clrscr;
  writeln('=== CARGA DE ', MAX, ' ARTICULOS ===');
  n := 0;
  for i:=1 to MAX do
  begin
    textcolor(white);
    writeln; writeln('Articulo #', i);
    repeat
      write('Codigo (entero positivo, unico): ');
      readln(cod);
      if (cod<=0) then
      begin
        textcolor(lightred); writeln('El codigo debe ser positivo.'); textcolor(white);
      end
      else if ExisteCodigo(V, n, cod) then
      begin
        textcolor(lightred); writeln('El codigo ya existe.'); textcolor(white);
        cod := -1;
      end;
    until cod>0;

    aux.codigo := cod;
    write('Descripcion: '); readln(aux.descripcion);
    aux.rubro := LeerRubro;

    repeat
      write('Stock (0..65535): '); readln(aux.stock);
      if false then; {solo para estética del repeat}
    until true;      {Word ya valida rango al leer}

    repeat
      write('Precio (>=0): '); readln(aux.precio);
      if (aux.precio < 0) then
      begin
        textcolor(lightred); writeln('El precio no puede ser negativo.'); textcolor(white);
      end;
    until aux.precio >= 0;

    V[i] := aux;
    n := n + 1;
  end;
  textcolor(lightgreen); writeln; writeln('Carga completa de ', n, ' articulos.'); textcolor(white);
  writeln('Presione una tecla para continuar...'); readkey;
end;

function BuscarPorCodigo(const V: TVector; n: byte; cod: longint): byte;
var i: byte;
begin
  BuscarPorCodigo := 0;
  for i:=1 to n do
    if V[i].codigo = cod then
    begin
      BuscarPorCodigo := i; exit;
    end;
end;

procedure MostrarArticulo(const X: TArticulo);
begin
  ColorPorRubro(X.rubro);
  write('[', RubroToStr(X.rubro), '] ');
  textcolor(white);
  writeln('Codigo: ', X.codigo, ' | Desc: ', X.descripcion,
          ' | Stock: ', X.stock, ' | Precio: $', X.precio:0:2);
end;

procedure ImprimirInventario(const V: TVector; n: byte);
var i: byte;
begin
  clrscr;
  textcolor(white);
  writeln('=== INVENTARIO COMPLETO (', n, ' items) ==='); writeln;
  if n=0 then
  begin
    textcolor(lightred); writeln('No hay articulos cargados.'); textcolor(white);
  end
  else
  begin
    textcolor(lightgray);
    writeln('Rubro (color) | Codigo | Descripcion                       | Stock | Precio');
    writeln('-------------------------------------------------------------------------------');
    for i:=1 to n do
    begin
      ColorPorRubro(V[i].rubro); write(RubroToStr(V[i].rubro):12, ' ');
      textcolor(white);
      write('| ', V[i].codigo:6, ' | ');
      write(V[i].descripcion:32, ' | ');
      write(V[i].stock:5, ' | ');
      writeln('$', V[i].precio:0:2);
    end;
  end;
  textcolor(white);
  writeln; writeln('Presione una tecla para volver al menu...'); readkey;
end;

procedure BuscarInteractivo(const V: TVector; n: byte);
var cod: longint; pos: byte; opc: char;
begin
  repeat
    clrscr;
    writeln('=== BUSCAR ARTICULO POR CODIGO ===');
    write('Ingrese codigo (0 para salir): ');
    readln(cod);
    if cod=0 then exit;

    pos := BuscarPorCodigo(V, n, cod);
    if pos=0 then
    begin
      textcolor(lightred); writeln('No se encontro el codigo ', cod, '.'); textcolor(white);
    end
    else
    begin
      writeln; writeln('Resultado:'); MostrarArticulo(V[pos]);
    end;

    writeln; write('¿Buscar otro? (S/N): ');
    readln(opc);
    opc := upcase(opc);
  until opc <> 'S';
end;

{----------------- MENU -----------------}

procedure MenuPrincipal;
begin
  clrscr;
  textcolor(white);
  writeln('==============================');
  writeln('  SISTEMA DE INVENTARIO (', MAX, ' items)');
  writeln('==============================');
  writeln('1) Cargar inventario (20 articulos)');
  writeln('2) Buscar por codigo');
  writeln('3) Imprimir inventario (colores por rubro)');
  writeln('4) Salir');
  write('Opcion: ');
end;

{----------------- PROGRAMA -----------------}

var
  opcion: char;
begin
  L := 0;
  repeat
    MenuPrincipal;
    readln(opcion);
    case opcion of
      '1':
        CargarInventario(A, L);
      '2':
        begin
          if L=0 then
          begin
            textcolor(lightred); writeln('Primero cargue el inventario (opcion 1).'); textcolor(white);
            writeln('Presione una tecla...'); readkey;
          end
          else
            BuscarInteractivo(A, L);
        end;
      '3':
        ImprimirInventario(A, L);
    end;
  until opcion = '4';

  clrscr;

end.

