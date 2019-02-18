/*
	FAM_fnc_initCronometro
	
	Descripción:
	Inicializa el conteo de tiempo sincronizado utilizando serverTime como referencia.
	
	tiempoComienzoMision = momento exacto en que el primer jugador dejó de cargar y está en control de su personaje.
	tiempoFinal    = el momento en que la misión debería quedar sin tiempo.

	Parámetros:
	--
	Retorna:
	--
*/

tiempoMision = ["tiempoMision"] call BIS_fnc_getParamValue;
switch tiempoMision do 
{
	case 0: 
	{
		tiempoMision = 7200;
	};
	case 1:
	{
		tiempoMision = 15;
	};
};

if(isServer) then 
{
	comienzoMision = serverTime;
	waitUntil {!isNil "introDone"};

	tiempoComienzoReal = serverTime;
	publicVariable "tiempoComienzoReal";
	tiempoFinal = tiempoComienzoReal + tiempoMision;
	publicVariable "tiempoFinal";
	[tiempoFinal, tiempoComienzoReal] spawn FAM_fnc_cronometro;
};
