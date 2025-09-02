{
   
   Consigna: Un vendedor ambulante cobra una comision por cada producto que vende.
   
   Los datos que se reciben son la cantidad de productos vendidos y el importe de la comision por producto.
   
   Diseñar un algoritmo que determine ¿Cuanto cobra el vendedor ambulante?
   
   Y responder con un mensaje si no vendió nada.
   
   El vendedor recibe un bono extra de 10 dolares si logra vender mas de 10 productos.
   
   Si logra vender mas de 200 productos recibe un bono de 50 dolares.
   
   
}

program ejercicio6;

var
    cantidad: integer; 
    importe, total: real;

const
    bono1 = 10;
    bono2 = 50;

begin
    { Solicito los datos al cliente. }
    write('Ingrese la cantidad de productos vendidos: ');
    readln(cantidad);
    write('Ingrese el importe de la comision por producto: ');
    readln(importe);

    { Condicional }
    if cantidad = 0 then
        writeln('El vendedor no vendio ningun producto.')
    else
    begin
        if cantidad > 200 then
        begin
            total := cantidad * importe + bono2;
            writeln('El vendedor logro mas de 200 productos, recibe un bono de 50 usd.');
            writeln('Total: $', total:0:2);
        end
        else if cantidad > 100 then
        begin
            total := cantidad * importe + bono1;
            writeln('El vendedor logro mas de 100 productos, recibe un bono de 10 usd.');
            writeln('Total: $', total:0:2);
        end
        else
        begin
            total := cantidad * importe;
            writeln('El vendedor cobrara: $', total:0:2);
        end;
    end;
end.


