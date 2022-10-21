// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Un solo prisionero ha cambiado el destino de cientos.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Pero lo pagó caro...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Derrotó al Durmiente, destruyó la barrera...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //… pero, mientras los demás prisioneros huían, se quedó entre los escombros.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Yo fui quien le envió a que se enfrentase al Durmiente.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //Ahora soy yo quien le trae de vuelta.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Está débil y ha olvidado casi todo.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Pero está vivo...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //¡Ha vuelto!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(En la hoguera) Claro que sigue vivo. ¿Qué te creías?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Esperemos que sea así...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(El suelo tiembla) ¿Has sentido eso?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //¿Qué?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //El suelo...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(Asombrado) ¡Xardas! ¿Qué...?
	AI_Output (other, self, "Extro_Tempel_14_02"); //(Se queja) Ahora no...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(Con fanatismo) Estoy preparado... ¡elígeme! Sí...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(Para sí) ¿Dónde está?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(Citando) Y el hombre mató a la bestia y entró en el reino de Beliar...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //¡Xardas! ¿Qué pasó en el templo de Irdorath?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //Con la ayuda de Innos, has derrotado al avatar del mal.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //Y me he hecho con su poder...
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Desde que dejé el Círculo del Fuego, ése ha sido mi único objetivo.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Para alcanzarlo, te he ayudado a cumplir tu propósito.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Lo que me fue negado en el templo del Durmiente por fin ha sucedido.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar me ha elegido.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //¿Ahora obedecer al dios de las tinieblas?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //No. ¡No obedezco a Beliar más de lo que tú obedeces a Innos!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Ni siquiera los dioses saben lo que nos depara el destino...
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //Y apenas empiezo a vislumbrar las opciones que se me presentan...
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Pero está claro que volveremos a vernos...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(Ordena) ¡Soltad amarras!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(Mira a lo lejos y ve algo) ¿Eh?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(Murmura) ¡Oh, mierda!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(Toses ásperas, ruidos de asfixia) - (varias)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //¡Aaaay! (varios)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(Largo grito de agonía, 4 segundos)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //¡¡¡Cerrad la puerta!!! (varios)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //¡¡¡Detenedlos!!! (varios)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //¡Aaaay! (varios)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Vamos con exceso de carga. Tenemos que tirar por la borda parte del oro.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //¡Aparta las manos del oro!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Escucha, sería mejor que...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //No quiero saber nada del tema...
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //He oído que la guerra con los orcos va mal...
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //¿Y?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Probablemente no podamos gastarnos el oro en ningún lugar...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //¡El oro se queda a bordo!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //¿De qué sirve el oro si zozobramos en la tormenta más insignificante?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Pero no veo ninguna tormenta...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Aún...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //¡Tranquilízate! ¡Todo va a salir bien!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(sorprendido)... ¿Humanos?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(con desdén) Los humanos son débiles.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(con desdén) Sucumben muy fácilmente a las tentaciones del mal.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //Y así, se mezclan con poderes que no comprenden y que, por supuesto, no saben controlar.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Los que son firmes en su fe han comenzado una batalla contra el enemigo.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //¡Tras la caída de la Barrera y el destierro del Durmiente, la ira de Beliar ha crecido más que nunca!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Un poderoso artefacto, según cuentan las antiguas escrituras, volverá a este mundo.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(citando) 'Cuando el Dios de la Oscuridad envíe a sus secuaces en su busca'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //Y es lo que acaba de ocurrir. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //La búsqueda… ¡ha comenzado hace tiempo!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //En su búsqueda, los secuaces de Beliar están profanando los santuarios de dioses más antiguos.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Los secuaces de Beliar están profanando los santuarios de dioses más antiguos.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //Los guardianes de estos santos lugares se han despertado. ¡Y su ira hace temblar la tierra!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Todo mago poderoso de esta isla puede sentir su ira. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //Y algunos de ellos han empezado a afrontar la amenaza.
};
