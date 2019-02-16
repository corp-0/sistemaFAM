/*
	FAM_fnc_cronometro_Display

	Descripción:
	Visualiza el reloj en pantalla.

	Parámetros:
		--
	Retorna:
	true
*/
if(isNil "TIEMPO_PUBLICO") then {waitUntil {!isNil "TIEMPO_PUBLICO"}};

if(isNil "display_checkrun") then 
{
	// Impide que el script corra más de una vez
	display_checkrun = true;

	while {TIEMPO_PUBLICO > 10 } do
	{
		_timeStamp = TIEMPO_PUBLICO/3600;
		if (detenerTiempo) exitWith 
		{
		while {true} do 
			{
			
				["<t font = 'PuristaMedium'><t size = '1'><t color = '#00ffd8'>" + timedisplay + "</t>",-1,0.10,10,0,0,789] spawn BIS_fnc_dynamicText;
				uiSleep 10;
			};
		};
		timedisplay = [_timestamp, "HH:MM:SS"] call BIS_fnc_timeToString;
		["<t font = 'PuristaMedium'><t size = '1'>" + timedisplay + "</t>",1,-0.15,1,0] spawn BIS_fnc_dynamicText;
	};
	while{TIEMPO_PUBLICO <=10 && TIEMPO_PUBLICO > 1} do 
	{
		_timeStamp = TIEMPO_PUBLICO/3600;
		timedisplay = [_timestamp, "HH:MM:SS"] call BIS_fnc_timeToString;
		["<t font = 'PuristaMedium'><t size = '1'><t color = '#FF0000'>" + timedisplay + "</t>",-1,-1,1,0] spawn BIS_fnc_dynamicText;
		playSound "time";
	};

	if(TIEMPO_PUBLICO <= 0) exitWith
	{
		_timestamp = TIEMPO_PUBLICO/3600;
		_fin = [_timestamp, "HH:MM:SS"] call BIS_fnc_timeToString;
		["<t font = 'PuristaMedium'><t size = '1'><t color = '#FF0000'>" + "00:00:00" + "</t>",-1,0.10,10,1,0,789] spawn BIS_fnc_dynamicText;	
	};

	display_checkrun = false;
};


