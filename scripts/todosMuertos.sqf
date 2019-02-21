todosMuertos = true;
publicVariable "todosMuertos";

detenerTiempo = true; 
publicVariable "detenerTiempo";
[2] remoteExecCall ["FAM_fnc_contador", 2];
sleep 20;

["todoMuertos"] remoteExecCall ["BIS_fnc_endMissionServer"];