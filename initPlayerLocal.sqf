/*
	initPlayerLocal

	Descripción:
	Script de evento que corre en la máquina de cada jugador al conectarse al servidor.

	Parámetros:
		0:
			_player 
					Objeto - representa al jugador en el motor.
		1:
			_didJIP
					Boolean - True si el jugador hizo JIP (join in progress), false en caso contrario
	Retorna:
	--
*/

params["_player", "_didJIP"];

if (!_didJIP) then
{

	[] spawn
	{
		startLoadingScreen ["Cargando sistema FAM...", ""];
		uiSleep 10;

		endLoadingScreen;
	};
	
	waitUntil 
	{
		if(missionNamespace getVariable ["BIS_fnc_startLoadingScreen_ids", []] isEqualTo [] ) then
		{
			true
		} else
		{
			diag_log "Falta por cargar...";
			diag_log str (missionNamespace getVariable["BIS_fnc_startLoadingScreen_ids", []] );
		};
	};

	player enableSimulation false;
	uiSleep 10;
	_briefing       = [] execVM "scripts\initBriefing.sqf";
	_terceraPersona = [] execVM "scripts\terceraPersona.sqf";
	["titulo1", "titulo2"] execVM "scripts\IntroFAM.sqf";
	player enableSimulation true;
};

if(_didJIP) then 
{
	[] spawn
	{
		startLoadingScreen ["Cargando sistema FAM...", ""];
		uiSleep 10;
		endLoadingScreen;
	};

	waitUntil 
	{
		if(missionNamespace getVariable ["BIS_fnc_startLoadingScreen_ids", []] isEqualTo [] ) then
		{
			true
		} else
		{
			diag_log "Falta por cargar...";
			diag_log str (missionNamespace getVariable["BIS_fnc_startLoadingScreen_ids", []] );
		};
	};
	player hideObjectGlobal false;
};

[] spawn FAM_fnc_cronometro_Display;

// Manejador de eventos para cada jugador, resta 1 puntos al morir.

_player addMPEventHandler ["MPKilled", 
{
	params ["_unit", "_killer"];
	["fallo", [format["%1  ha caído en combate", name _unit], '¡Restan: <t color="#ff0000">-1</t> pts!']] call BIS_fnc_showNotification;
	jugadoresFinal = jugadoresFinal +1;
	publicVariableServer "jugadoresFinal";
	
}];