///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_EXIT   (C_INFO)
{
	npc         = KDW_1400_Addon_Saturas_NW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Saturas_EXIT_Info()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Como no hay forma de que  dejes a los otros Magos hacer su trabajo, podrías llevarle un mensaje de mi parte a uno de ellos.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Dile a Riordian que quiero verle aquí.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Está en la parte trasera de la cámara. Lo encontrarás allí.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas quiere que le envíe al Mago de Agua Riordian. Debería estar en la parte trasera de las bóvedas de la excavación."); 
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nefarius
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Nefarius		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Nefarius_Condition;
	information	 = 	DIA_Addon_Saturas_Nefarius_Info;
 
 	description	 = 	"Se supone que debo buscar las piezas perdidas del ornamento para Nefarius.";
};

func int DIA_Addon_Saturas_Nefarius_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Nefarius_Info ()
{
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Se supone que debo buscar las piezas perdidas del ornamento para Nefarius.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //¿Qué? ¡Esto es increíble! ¿Otra vez tú?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //No te preocupes. Traeré todo aquí.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(suspira) ¿Al menos sabes lo que andas buscando?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius me dio este mapa
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //¡Enséñamelo!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmmm. El bosque es un lugar peligroso. No deberías ir solo.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Busca a alguien que te acompañe en Khorinis.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //No quiero que los monstruos te devoren, ni a ti ni al ornamento.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Aquí tienes tu mapa

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas dice que no vaya solo cuando busque uno de los fragmentos del ornamento en los grandes bosques. Debo ir a Khorinis y buscar a alguien que me acompañe."); 
	};
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Hallo		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Hallo_Condition;
	information	 = 	DIA_Addon_Saturas_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition ()
{
	Npc_PerceiveAll (self);
	if (Wld_DetectNpc (self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Hallo_weißtdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_00"); //¿Tienes la menor idea de lo que has hecho?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_01"); //Has confundido tanto la estructura de la magia, que podía oírse desde Khorinis.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_02"); //Tienes suerte de que la Barrera simplemente se viniera abajo ese día.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_weißtdu_15_03"); //¿De qué te quejas? Todo ha funcionado muy bien.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_04"); //(despotricando) ¡Cuidado con lo que dices!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_05"); //(subiendo el tono) ¿A qué demonios has venido aquí?
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //¿Estás loco? Lárgate de aquí.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Estas cámaras son muy peligrosas para aventureros de pacotilla.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(molesto) ¿Oye, no te conozco? Claro que sí. Bastardo
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(molesto) ¿No creerás que me he olvidado de cómo nos traicionaste en el Campamento Nuevo?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(Avergonzado) Yo...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(molesto) ¡Te llevaste todo el poder mágico de nuestro montón de mineral y luego desapareciste sin más!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(molesto) ¿Qué creías que estabas haciendo?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Lo siento. No sabía lo que hacía.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "De todos modos, tu plan no iba a funcionar.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Era necesario.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Era necesario. Sin el poder del mineral, nunca hubiera podido vencer al Durmiente.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(enfadado) ¿Qué estupidez es esa? ¿Durmiente? ¿Vencer?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Tu plan no hubiera funcionado de ninguna forma. Volar la Barrera con el montón de mineral es la mayor tontería que he oído.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Tendríais que haberos volado vosotros mismos.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(enfadado) ¡Esto es el colmo! ¿Quién te ha dado permiso para juzgarnos a nosotros y nuestras intenciones?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Si no fuera tan pacífico, haría caer sobre ti la ira de Adanos, amigo.
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Lo siento. No sabía lo que hacía.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //¿Oh? ¿Y crees que así se soluciona todo?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};



///////////////////////////////////////////////////////////////////////
//	Info keineAhnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_keineAhnung		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_keineAhnung_Condition;
	information	 = 	DIA_Addon_Saturas_keineAhnung_Info;

	description	 = 	"No tengo ni idea.";
};

func int DIA_Addon_Saturas_keineAhnung_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_keineAhnung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //No sé, simplemente, se me ocurrió pasarme.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Están malgastando mi tiempo. Vete de aquí.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(para sí) Ya me ocuparé de ti.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"He encontrado a los Magos de Agua en la excavación. Primero, tengo que averiguar lo que hacen aquí. Saturas no estaba preparado para contármelo. Aún se pone tenso con las viejas historias de la colonia penal."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info raus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_raus		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_raus_Condition;
	information	 = 	DIA_Addon_Saturas_raus_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Saturas_raus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_keineAhnung))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Saturas_raus_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Vete de aquí antes de que te pase algo.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lares
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Lares		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Lares_Condition;
	information	 = 	DIA_Addon_Saturas_Lares_Info;

	description	 = 	"He venido con Lares.";
};

func int DIA_Addon_Saturas_Lares_Condition ()
{
	if (Lares_Angekommen == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Lares_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //He venido con Lares.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(preocupado) ¿Lares? ¿De verdad? ¿Dónde está?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Estoy solo. Lares ha vuelto a la ciudad.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //¿Qué? ¿Y te ha enviado aquí solo? ¿En qué estaba pensando?
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Ornament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Ornament_Condition;
	information	 = 	DIA_Addon_Saturas_Ornament_Info;

	description	 = 	"Te he traído tu ornamento.";
};

func int DIA_Addon_Saturas_Ornament_Condition ()
{
	//if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Lares))
	//&& (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	if ( Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE) )
	|| ( (Lares_Angekommen == TRUE) && Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares) && Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Te he traído tu ornamento.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //¿Y eso qué narices significa? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //¿Quién te lo ha dado? No me digas que Lares te lo dio sin más.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Déjalo ya. Te lo he traído. Lo quieres, ¿no?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Claro. Pero me preocupa que TÚ vuelvas a estar metido en esto.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //¿Por qué haces una montaña de ese viejo asunto del montón de mineral?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Después de todo, yo ya había trabajado contigo por aquel entonces, y no puedes decir que no era de confianza.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(suspira) ¿Y qué acabé recibiendo? Mpfh, no te pienses que confío en ti.
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auffüllen, die bei Lares gestört haben
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc 	(Giant_Bug, 	"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
  	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITY_TO_FARM2_02"); //auf Treppe
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
};

///////////////////////////////////////////////////////////////////////
//	Info geheimbund
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_geheimbund		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_geheimbund_Condition;
	information	 = 	DIA_Addon_Saturas_geheimbund_Info;

	description	 = 	"Quiero unirme al 'Anillo de Agua'.";
};

func int DIA_Addon_Saturas_geheimbund_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_geheimbund_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Quiero unirme al 'Anillo de Agua'.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(furioso) ¿QUÉ? ¿Cómo sabes eso? ¿Quién…? LARES… ¡Lo mataré!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Ha incumplido la primera norma. No hablar a nadie del 'Anillo de Agua'.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(rendido) No sé ni qué decir. Sólo me fío de ti mientras pueda vigilarte.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //Fue Vatras quien me habló del Anillo.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(resignado) ¿Qué? ¿Vatras? (sarcásticamente) ¡Maravilloso! De todos los Magos de Agua de la isla, vas a dar con el único que NO te conoce.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Te lo advierto, esta vez no cometas ninguna estupidez.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(seco) Me esforzaré.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas no está listo para dejarme entrar en el 'Anillo de Agua'. Dejará que Vatras decida."); 

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_wasmachstdu		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_wasmachstdu_Condition;
	information	 = 	DIA_Addon_Saturas_wasmachstdu_Info;

	description	 = 	"¿Qué estás haciendo aquí abajo?";
};

func int DIA_Addon_Saturas_wasmachstdu_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_wasmachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //¿Qué estás haciendo por aquí?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(reverentemente) Estas salas esconden antiguos secretos. Secretos misteriosos.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Las inscripciones y los murales provienen de una cultura muy antigua.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Todo lo que ves aquí está escrito en un idioma totalmente desconocido para nosotros.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Apenas estamos empezando a aprenderla y a captar su significado.
};

///////////////////////////////////////////////////////////////////////
//	Info Erdbeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Erdbeben		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	6;
	condition	 = 	DIA_Addon_Saturas_Erdbeben_Condition;
	information	 = 	DIA_Addon_Saturas_Erdbeben_Info;

	description	 = 	"¿Qué clase de extraños terremotos son esos?";
};

func int DIA_Addon_Saturas_Erdbeben_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_wasmachstdu))
	&& (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Bedrohung))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Erdbeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //¿Qué clase de extraños terremotos son esos?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //Ese es uno de los enigmas que trato de resolver.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Algo tras estas montañas está afectando a la estructura de la magia.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Es obvio que alguien trata de quebrar una poderosa magia con todo su poder.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Me temo que esos temblores pronto afectarán a toda la isla.
};
///////////////////////////////////////////////////////////////////////
//	Info WhatsOrnament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_WhatsOrnament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_WhatsOrnament_Condition;
	information	 = 	DIA_Addon_Saturas_WhatsOrnament_Info;

	description	 = 	"¿Por qué es tan importante para ti ese ornamento?";
};

func int DIA_Addon_Saturas_WhatsOrnament_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsOrnament == FALSE)
	&& (RitualRingRuns == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //¿Por qué es tan importante para ti ese ornamento?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(molesto) Es la llave de un portal.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //No te diré más.
};
///////////////////////////////////////////////////////////////////////
//	Info ScRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ScRanger		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_ScRanger_Condition;
	information	 = 	DIA_Addon_Saturas_ScRanger_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ahora pertenezco al 'Anillo de Agua'.";
};

func int DIA_Addon_Saturas_ScRanger_Condition ()
{
	if (SaturasKnows_SC_IsRanger == FALSE)
	&& (SC_IsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ScRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Ahora pertenezco al 'Anillo de Agua'.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC trägt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese Rüstung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Veo que llevas la armadura de los nuestros.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Veo que portas nuestro símbolo secreto. El anillo de aguamarina.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //Y veo en tu mirada que dices la verdad.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(murmurando) Muy bien. Permitiré que te integres en nuestras filas.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Pero no olvides que eso implica una gran responsabilidad.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //Y espero por tu bien que sepas hacer honor a ella.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas ha aceptado que me una al 'Anillo de Agua'."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //¿Y cómo puedo yo saber que ahora eres de los nuestros?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //El anillo de aguamarina que llevas pertenece a Lares. Lo reconozco.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Intentas engañarme, ¿verdad? No esperaba menos.
			AI_StopProcessInfos (self);		
		};
};

///////////////////////////////////////////////////////////////////////
//	Info OpenPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_OpenPortal		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_OpenPortal_Condition;
	information	 = 	DIA_Addon_Saturas_OpenPortal_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dame el anillo. Abriré el portal.";
};
var int DIA_Addon_Saturas_OpenPortal_NoPerm;
func int DIA_Addon_Saturas_OpenPortal_Condition ()
{
	if (RitualRingRuns == LOG_SUCCESS)
	&& (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_OpenPortal_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Dame el anillo. Abriré el portal.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(con astucia) ¡Bien! Como nuevo miembro, te concederé el honor.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Sin embargo, aún espero un mensaje de Vatras. Hasta que no lo reciba, no podemos irnos.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //TENGO un mensaje de Vatras para ti.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(molesto) Comprendo. Y, claro está, no podías contenerte y tuviste que abrirlo, ¿verdad?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //Pues, ehh
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(amenazante) Espero por tu bien que no hagas tambalearse mi ya delicado sentido de la confianza.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(sorprendido) Muy interesante. Perfecto.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Toma, el anillo. Nos reuniremos en el portal y te esperaremos allí.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Si Nefarius está en lo cierto, el portal se abrirá en cuanto introduzcas el anillo.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas me ha dado el anillo ornamental. Se supone que debo insertarlo en el mecanismo del portal para atravesarlo."); 

			AI_StopProcessInfos (self);		
			Npc_ExchangeRoutine	(self,"OpenPortal");
			B_StartOtherRoutine	(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos (self);		
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Mientras Vatras no me dé una señal de que eres de confianza, yo guardaré el anillo.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas no quiere darme el anillo hasta que Vatras no le de una muestra de que puede confiar en mi."); 
		AI_StopProcessInfos (self);		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PERM		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Saturas_PERM_Condition;
	information	 = 	DIA_Addon_Saturas_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Puedes enseñarme algo sobre magia?";
};

func int DIA_Addon_Saturas_PERM_Condition ()
{
	if (MIS_Addon_Saturas_BringRiordian2Me != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //¿Puedes enseñarme algo de magia?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //¿Para que puedas volver a interferir en la estructura mágica?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //No. No tengo tiempo para juegos.
};
