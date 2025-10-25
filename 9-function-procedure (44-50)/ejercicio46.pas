{
46) Desarrolle un programa con una FUNCIÓN que determine si un caracter ingresado por el usuario es un
número, una letra minúscula o mayúscula, u otro caracter
}

program ejercicio46;
uses crt;

function TipoCaracter(car: char): string;
begin
    if (car >= '0') and (car <= '9') then
        TipoCaracter := 'Numero'
    else if (car >= 'A') and (car <= 'Z') then
        TipoCaracter := 'Letra mayuscula'
    else if (car >= 'a') and (car <= 'z') then
        TipoCaracter := 'Letra minuscula'
    else
        TipoCaracter := 'Otro caracter';
end;

var
    c: char;

begin
    clrscr;
    write('Ingrese un caracter: ');
    readln(c);

    writeln;
    writeln('El caracter "', c, '" es: ', TipoCaracter(c));

    readkey;
end.
