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

// Evento de muerto, para restar puntos cada vez que un jugador muera

// Evento de terminar de cargar
["cargado", "onPreloadFinished", 
{
	player hideObjectGlobal false;
	player allowDamage true;
	if (!jipeado) then {["primeralinea", "segundalinea"] execVM "scripts\IntroFAM.sqf"};
	cargado = true;

}] call BIS_fnc_addStackedEventHandler;

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

esperando = true;
if (isNil "tiempoFinal") then {waitUntil {!isNil "tiempoFinal"}};
if (isNil "tiempoComienzoReal") then {waitUntil !isNil "tiempoComienzoReal"};
esperando = false;
[tiempoFinal, tiempoComienzoReal] call FAM_fnc_cronometro;