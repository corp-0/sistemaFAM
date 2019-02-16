/*
	onPlayerKilled.sqf
	
	Descripción:
	Este script de evento corre en la máquina local del jugador que acaba de morir.
	Manda al jugador a espectar hasta que termine.

	Parámetros:
	--
	Retorna:
	--
*/

sleep 1;
//Mostrar mensaje de muerte
titleText ["Has muerto. Entrando en modo espectador...", "BLACK", 3];

//Esperar unos segundos para que no sea tan brusco
sleep 5;
titleText ["", "BLACK IN"];

//Empezar el modo espectador
["Initialize", [player, 
[blufor], //bando espectable
false, //puede el jugador espectar IA?
false, //Cámara libre?
false, //tercera persona?
false, //Mostrar info?
false, //mostrar los botones para cambiar cámara?
false, //mostrar la ayuda de teclas?
false,  //mostrar el header?
true] //mostrar ubicaciones de entidades?
] call BIS_fnc_EGSpectator;