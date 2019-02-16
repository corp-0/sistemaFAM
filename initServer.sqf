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

// Manejadores de eventos
addMissionEventHandler ["handleDisconnect", {
	params["_unit", "_id", "_uid", "_name"];
	_unit hideObjectGlobal true;
	_unit disableAI "ALL";

	_unit allowDamage true;

	true;
}];

[] call FAM_fnc_bandera;

/*
El manejador de eventos extendido de CBA permite contar civiles generador dinámicamente.
// Contando civiles muertos SÓLO FUNCIONA CON CIVILES PUESTOS EN EL EDITOR
{if (side _x == Civilian && _x iskindof "Man") then {
    _x addEventHandler ["killed", 
    {
		params["_unit"];
		["fallo", [format["¡%1 ha muerto en el fuego cruzado!", _unit]], 'Cada baja civil resta: <t color="#ff0000">-2</t> pts'] remoteExecCall ["BIS_fnc_showNotification", 0, false];
		civilesFinal = civilesFinal + 1;
		publicVariable "civilesFinal";
      
    }];
  };   

} foreach allunits;  
*/

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
