/*
	FAM_fnc_cronometro
	
	Descripción:
	Inicia un reloj que lleva el tiempo de partida para la competencia FAM.

	Parámetros:
		0:
			INTEGER - Cantidad de tiempo
	Retorna:
	true
*/

TIEMPO_PUBLICO = _this select 0;

if (isNil "cronometro_checkrun") then
{
	cronometro_checkrun = true;

	publicTimerOver     = false;
	detenerTiempo       = false;

	while {TIEMPO_PUBLICO > 0} do 
	{
		TIEMPO_PUBLICO = TIEMPO_PUBLICO -1;
		uiSleep 1;
	};

	if(isServer && cronometro_checkrun) then 
	{
		publicTimerOver = true;
		publicVariable "publicTimerOver";

		[2] call FAM_fnc_contador;
	};
};
