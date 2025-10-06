{
19) * Desarrolle un programa que calcule la Edad exacta de una persona en Años, Meses y Días.
}

program ejercicio19;

var
	{Variables Fecha de Nacimiento}
	dn, mn, an: integer;
	
	{Variables Fecha de Actual}
	da, ma, aa: integer;

	anios, meses, dias: integer;

BEGIN
	{Solicito al usuario los datos de nacimiento}
	write('Ingrese su fecha de nacimiento (DD MM AAAA): ');
	readln(dn, mn, an);
	
	{Solicito al usuario los datos actuales}
	write('Ingrese la fehca actual (DD MM AAAA):');
	readln(da, ma, aa);
	
	
	{Ajuste de días}
	if da < dn then
	begin
		da := da + 30;  { suponemos 30 días por mes para simplificar }
		ma := ma - 1;
    end;
    
	dias := da - dn;

	{Ajuste de meses}
	if ma < mn then
	begin
		ma := ma + 12;
		aa := aa - 1;
	end;
	
	meses := ma - mn;

	{Años}
	anios := aa - an;

  writeln;
  writeln('Edad exacta: ', anios, ' anios, ', meses, ' meses y ', dias, ' dias.');
end.
	
END.

