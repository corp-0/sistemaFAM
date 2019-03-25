/*
	FAM_fnc_contador
	
	Descripción:
	Realiza un conteo preliminar y final de las condiciones de la misión, particularmente
	la cantidad de jugadores que están jugando (el servidor vuelve a contar si un jugador 
	se conecta antes del minuto 15 de misión).

	Parámetros:
		0:
			INTEGER - en caso de ser 1 => conteo inicial, en caso de ser 2 => conteo final.

	Retorna:
	--
*/


conteo = _this select 0; 

//Conteo inicial

switch conteo do 
{
	case 1: 
	{
		//jugadores total en partida
		jugadores = west countside playableUnits;
		publicVariable "jugadores";

		//Total de civiles en la misión
		civTotal = civilian countSide allUnits;
		publicVariable "civTotal";

	};

	case 2: 
	{
		//quita el control del jugador
		{_x enableSimulation false} forEach Allplayers; 

		//Objetivo primario suma cada vez que se completa uno

		//Objetivo secundario suma cada vez que se completa uno 

		//Tareas suma cada vez que se completa uno 

		//Vehículos enemigos

		vehEnemigoFinal = vehEnemigoFinal * 2;
		publicVariable "vehEnemigoFinal";

		//Bono bandera sumará si la cantidad de jugadores que habían al inicio de misión están ahora dentro del trigger 
		if (triggerBandera) then 
		{
			bonoBandera = 5;
			penaBandera = 0;
			
		} else 
		{
			penaBandera = count List banderaArea;
			penaBandera = jugadores - penaBandera;
		};
		publicVariable "penaBandera";

		//Bajas aliadas
		// jugadoresFinal = west countSide playableUnits;
		// jugadoresFinal = jugadores - jugadoresFinal;

		//Bajas civiles 
		// civilesFinal = civilian countSide allUnits;
		// civilesFInal = civTotal - civilesFinal;
		civilesFinal = civilesFinal * 2;
		publicVariable "civilesFinal";

		//Vehículos perdidos cuenta en misión
		vehAliadoFinal = vehAliadoFinal * 2;
		publicVariable "vehAliadoFinal";
		vehiculosAbandonados = 0;
		FAM_vehiculosBlufor = allVariables missionNamespace select {_x find "bluforveh" == 0};
		{if !(_x in list base_vehiculos) then 
		{
			vehiculosAbandonados = vehiculosAbandonados + 1;
		}
		}forEach FAM_vehiculosBlufor;
		vehiculosAbandonados = vehiculosAbandonados *2;
		vehAliadoFinal = vehAliadoFinal + vehiculosAbandonados;

		//Penalización de tiempo

		if (publicTimerOver) then 
		{
			penaTiempo = 10;
			publicVariable "penaTiempo"
		};
	
		//Sumatoria total de puntos
		PuntajeFinal = (objetivoPrimario + objetivoSecundario + objetivoTarea + vehEnemigoFinal + bonoBandera) - (jugadoresFinal + civilesFinal + vehAliadoFinal + penaTiempo + penaBandera);
		if (PuntajeFinal < 0) then {PuntajeFinal = 0};
		publicVariable "puntajeFinal";

		
		//Llama la pantalla de final 
		[] remoteExecCall ["FAM_fnc_pantallaFinal", 0, true];
	};
};

/* AYUDA MEMORIA

123401 = OBJETIVOS PRIMARIOS 
123402 = OBJETIVOS SECUNDARIOS 
123403 = TAREAS 
123404 = VEHICULOS NEUTRALIZADOS (+2 x cada 1)
123405 = BONO BANDERA (+5 si todos en la bandera)

123406 = BAJAS ALIADAS (-1)
123407 = BAJAS CIVILES (-2 x cada 1)
123408 = VEHICULOS PERDIDOS (-2 x cada 1)
123409 = PENALIZACIÓN TIEMPO (-10)

123410 = PUNTAJE FINAL (sumatoria bonos - penalizaciones)
*/ 


