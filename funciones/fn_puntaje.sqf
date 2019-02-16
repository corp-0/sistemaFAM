/*
	FAM_fnc_puntaje
	
	Descripción:
	Maneja y transmite el puntaje cada vez que se logra un objetivo. La idea es que el editor cree su 
	activador para detectar cuándo su objetivo se cumplió para llamar a esta función.

	Parámetros:
		0:
			INTEGER - cantidad de puntos a otorgar.
		1:
			INTEGER - Tipo de objetivo, 1 para primarios, 2 para secundarios y 3 para tareas.

	Retorna:
	--
*/

puntos = _this select 0; 
tipo   = _this select 1; 

//Separa el caso para cada tipo

switch tipo do 
{
  case 1: 
  {
	objetivoPrimario = objetivoPrimario + puntos;
	publicVariable "objetivoPrimario";
	["objetivoCumplido","¡Objetivo Primario cumplido!", [format ["sumas %1 puntos", puntos],5]] remoteExecCall ["bis_fnc_showNotification", player, true];
  };
  case 2: 
  {
	objetivoSecundario = objetivoSecundario + puntos;
	publicVariable "objetivoSecundario";
	["objetivoCumplido", "¡Objetivo Secundario cumplido!", [format ["sumas %1 puntos", puntos],5]] remoteExecCall ["bis_fnc_showNotification", player, true];
  };
  case 3:
  {
	objetivoTarea = objetivoTarea + puntos;
	publicVariable "objetivoTarea";
	["objetivoCumplido", "¡Tarea cumplida!", [format ["sumas %1 puntos", puntos],5]] remoteExecCall ["bis_fnc_showNotification", player, true];
  };
};
