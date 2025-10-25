program ConvertirMayuscula;
{
  Ejercicio 44: Programa con una FUNCIÓN para convertir un carácter
  ingresado por el usuario en mayúscula
}

function ConvertirAMayuscula(caracter: char): char;
{
  Función que convierte un carácter a mayúscula
  Parámetro: caracter - el carácter a convertir
  Retorna: el carácter convertido a mayúscula
}
begin
  // Verificar si el carácter está en el rango de minúsculas (a-z)
  if (caracter >= 'a') and (caracter <= 'z') then
    ConvertirAMayuscula := chr(ord(caracter) - 32)  // Convertir restando 32 al código ASCII
  else
    ConvertirAMayuscula := caracter;  // Si ya es mayúscula o no es letra, devolver sin cambios
end;

var
  caracterIngresado: char;
  caracterMayuscula: char;

BEGIN
	writeln('=== CONVERTIR CARACTER A MAYUSCULA ===');
	writeln;

// Solicitar al usuario que ingrese un carácter
	write('Ingrese un caracter: ');
	readln(caracterIngresado);

// Llamar a la función para convertir a mayúscula
	caracterMayuscula := ConvertirAMayuscula(caracterIngresado);

// Mostrar el resultado
	writeln;
	writeln('Caracter original: ', caracterIngresado);
	writeln('Caracter en mayuscula: ', caracterMayuscula);

  // Verificar si hubo conversión
	if caracterIngresado <> caracterMayuscula then
		writeln('El carcter fue convertido a mayuscula.')
	else
		writeln('El caracter no requiere conversion.');

	writeln;
	write('Presione Enter para continuar...');
	readln;
END.
