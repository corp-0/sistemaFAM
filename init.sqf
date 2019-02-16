/*
	init.sqf
	
	Descripción:
	Este script de evento corre en todas las máquinas al momento de entrar a la pantalla de briefing.

	Parámetros:
	--

	Retorna:
	--
*/

// Primera llamada a contar de parte del servidor.
if(isServer) then 
{
	[1] call FAM_fnc_contador;
};

sleep 10;

if(isServer && isNil "_init_done") then 
{
	[7200] remoteExec ["FAM_fnc_cronometro", 0, false];
	_skillsUnits = [] call FAM_fnc_IAskill;
	_init_done = true;
	
};

