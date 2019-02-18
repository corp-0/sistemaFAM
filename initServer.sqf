/*
	initServer.sqf
	
	Descripción:
	Este script de evento corre en el servidor cuando éste inicializa. Lo ocupamos para inicializar variables
	y transmitiras a los clientes.

	La parte de este script que indica como "espacio para variables de misión" está dedicado para que el
	editor de la misión inicie las variables que necesite para su misión en particular y luego la transmita 
	a los jugadores del mismo modo que se transmiten las variables de sistema.

	Parámetros:
	--
	Retorna:
	--
*/
tiempoComienzoReal = nil;
tiempoFinal       = nil;
introDone = nil;

// Manejadores de eventos
addMissionEventHandler ["handleDisconnect", {
	params["_unit", "_id", "_uid", "_name"];
	_unit hideObjectGlobal true;
	_unit disableAI "ALL";

	_unit allowDamage false;

	true;
}];

[] call FAM_fnc_bandera;

// Inicializando las variables del sistema 

// Objetivo primario 
objetivoPrimario = 0;
publicVariable "objetivoPrimario";
// Objetivo secundario
objetivoSecundario = 0;
publicVariable "objetivoSecundario";
// Objetivo tarea 
objetivoTarea = 0;
publicVariable "objetivoTarea";

// vehículos enemigos neutralizados
vehEnemigoFinal = 0;
publicVariable "vehEnemigoFinal";
// Vehículos aliados perdidos
vehAliadoFinal = 0;
publicVariable "vehAliadoFinal";

//Bono bandera 
bonoBandera    = 0;
publicVariable "bonoBandera";
triggerBandera = false;
publicVariable "triggerBandera";

//Penalización de tiempo
penaTiempo = 0;
publicVariable "penaTiempo";

// Penalización de bajas aliadas 
jugadoresFinal = 0;
publicVariable "jugadoresFinal";
// Penalización de civiles muertos
civilesFinal = 0;
publicVariable "civilesFinal";

// Variable de cronómetro
detenerTiempo = false;
publicVariable "detenerTiempo";

/* ESPACIO PARA VARIABLES DE MISIÓN

	var1 = "valor";
	publicVariable "var1";

	var2 = "valor";
	publicVariable "var2";

	var3 = "valor";
	publicVariale "var3";

	var4 = "valor";
	publicVariable "var4";

*/

variablesIniciadas = true;
publicVariable "variablesIniciadas";
// Fin de inicialización
