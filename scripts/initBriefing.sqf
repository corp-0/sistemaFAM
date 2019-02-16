/*
	initBriefing.sqf
	
	Descripción:
	Este script agrega los datos del briefing de la misión a cada uno de los jugadores. 

	El editor debe tomar nota y llenar su briefing desde el último hasta el primero, porque la forma en que se agregan
	las entradas al diario está invertida.

	Parámetros:
	--

	Retorna:
	--
*/

//Objetivos secundarios
player createDiaryRecord["Diary", ["Objetivos Secundarios", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Secundarios: </font>
<br/>
a - Capturar y extraer a la familia de al-Shad como medida de presión (Sólo es útil en caso de que no tengamos en nuestro poder a al-Shad) <font color='#ffcc00'>(3pts)</font><br/>
b - Lograr la rendición de la guardia y seguidores de al-Shad (5 necesarios) <font color='#ffcc00'>(5pts)</font>
<br/><br/>
<font size='18' color='#29a329'>Tareas:</font>
<br/>
a - No ser detectado hasta entrar en el área de operación (La detección puede llevar a al-Shad a intentar huir) <font color='#ffcc00'>(3pts)</font><br/>
b - Destruir el vehículo de huída de Sadi al-Shad <font color='#ffcc00'>(3pts)</font><br/>
<br/><br/>
<font size='18' color='#29a329'>Final:</font>
<br/>
Replegar a base de inicio y dar por finalizada la misión con la escuadra completa <font color='#ffcc00'>(5pts)</font>
<br/><br/>
<font size='15' color='#ff0000'>NOTA:</font>Todos deben llegar a base, de lo contrario restará -1 por cada miembro que no haya llegado a base al momento de finalizar misión.

</p>"]];

// Objetivos
player createDiaryRecord["Diary", ["Objetivos", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Principal:</font>
<br/>
<font size='14' color='#ffffff'>A - Capturar y extraer con vida a Sadi al-Shad</font> <font size='18' color='#ffcc00'>(13pts)</font>
<br/><br/></font>
<font size='14' color='#ffffff'>B - Neutralizar a Sadi al-Shad</font> <font size='18' color='#ffcc00'>(7pts)</font>
<br/><br/></font>
<img image='1.jpg' align='center' width='367' height='407' />

</p>"]];

// Situación
player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", 
"<p align='justify'><font size='25' color='#ff0000'>MALDITA RUTINA</font><br/><br/>
Luego de los eventos recientes en que el grupo separatista de Takistán haya ejecutado uno de los más cruentos ataques terroristas en el Aeropuerto de Altis, en oposición a la intervención y presencia de la OTAN en Takistán, se ha dado orden de captura inmediata a Sadi al-Shad, cara visible del grupo extremista y quién se adjudicó el ataque por video
<br/><br/>
Nuestra inteligencia no sólo logró dar con el paradero de al-Shad, sino que también descubrió dos posible brechas en su defensa:
<br/><br/>
1- Todos los días sábados por la mañana, Sadi al-Shad gusta de visitar el mercado persa de Zargabad, dejando atrás la mayoría de su guardia personal. El contra de esta opción es que el operativo sería a pleno día, siendo más fácil que nos descubran y al-Naderi intente huír, además la presencia civil es alta y el fuego cruzado puede resultar en una masacre.
<br/>
2-  Durante la noche, Sadi se oculta con su familia en una pequeña casa en Zargabad. Si bien la guardia de al-Naderi se concentra en la casa que ha elegido como refugio, el manto de la noche puede ocultar nuestros movimientos hasta que sea demasiado tarde para intentar huir, además la presencia civil es prácticamente nula.
<br/><br/>
La misión consiste en capturar a al-Shad y hacerle pagar frente a la justicia por sus crímenes, por eso la prioridad es tomarle con vida, sin embargo si el riesgo de huída es muy grande, neutralizarlo en el acto también es una posibilidad.
<br/><br/>
</p>"]];
	
enableSentences false;

