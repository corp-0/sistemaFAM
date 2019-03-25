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

if (_didJIP) then {jipeado = true} else {jipeado = false};
/****************************************** Manejadores de eventos *********************************************************************** */

// Evento de terminar de cargar
["cargado", "onPreloadFinished", 
{
	player hideObjectGlobal false;
	player allowDamage true;
	
	PRIMERA_LINEA = getMissionConfigValue ["PRIMERA_LINEA", "primera_linea"];
	SEGUNDA_LINEA = getMissionConfigValue ["SEGUNDA_LINEA", "segunda_linea"];

	if (!jipeado) then {[PRIMERA_LINEA, SEGUNDA_LINEA] execVM "scripts\IntroFAM.sqf"};
	[] execVM "scripts\esEspectador.sqf";

}] call BIS_fnc_addStackedEventHandler;

// Evento de muerto, para restar puntos cada vez que un jugador muera
_player addMPEventHandler ["MPKilled", 
{
	params ["_unit", "_killer"];
	["fallo", [format["%1  ha caído en combate", name _unit], '¡Restan: <t color="#ff0000">-1</t> pts!']] call BIS_fnc_showNotification;
	jugadoresFinal = jugadoresFinal +1;
	publicVariableServer "jugadoresFinal";
	
}];

/************************************ Fin manejadores ************************************************************************************ */
missionNamespace getVariable "tiempoFinal";
missionNamespace getVariable "tiempoComienzoReal";

if (isNil "tiempoFinal") then {waitUntil {!isNil "tiempoFinal"}};
if (isNil "tiempoComienzoReal") then {waitUntil !isNil "tiempoComienzoReal"};
[tiempoFinal, tiempoComienzoReal] call FAM_fnc_cronometro;
