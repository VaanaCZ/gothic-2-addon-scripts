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
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Como no hay forma de que  dejes a los otros Magos hacer su trabajo, podr�as llevarle un mensaje de mi parte a uno de ellos.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Dile a Riordian que quiero verle aqu�.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Est� en la parte trasera de la c�mara. Lo encontrar�s all�.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas quiere que le env�e al Mago de Agua Riordian. Deber�a estar en la parte trasera de las b�vedas de la excavaci�n."); 
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
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //�Qu�? �Esto es incre�ble! �Otra vez t�?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //No te preocupes. Traer� todo aqu�.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(suspira) �Al menos sabes lo que andas buscando?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius me dio este mapa
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //�Ens��amelo!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmmm. El bosque es un lugar peligroso. No deber�as ir solo.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Busca a alguien que te acompa�e en Khorinis.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //No quiero que los monstruos te devoren, ni a ti ni al ornamento.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Aqu� tienes tu mapa

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas dice que no vaya solo cuando busque uno de los fragmentos del ornamento en los grandes bosques. Debo ir a Khorinis y buscar a alguien que me acompa�e."); 
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
func void DIA_Addon_Saturas_Hallo_wei�tdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_00"); //�Tienes la menor idea de lo que has hecho?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_01"); //Has confundido tanto la estructura de la magia, que pod�a o�rse desde Khorinis.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_02"); //Tienes suerte de que la Barrera simplemente se viniera abajo ese d�a.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_wei�tdu_15_03"); //�De qu� te quejas? Todo ha funcionado muy bien.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_04"); //(despotricando) �Cuidado con lo que dices!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_05"); //(subiendo el tono) �A qu� demonios has venido aqu�?
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //�Est�s loco? L�rgate de aqu�.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Estas c�maras son muy peligrosas para aventureros de pacotilla.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(molesto) �Oye, no te conozco? Claro que s�. Bastardo
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(molesto) �No creer�s que me he olvidado de c�mo nos traicionaste en el Campamento Nuevo?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(Avergonzado) Yo...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(molesto) �Te llevaste todo el poder m�gico de nuestro mont�n de mineral y luego desapareciste sin m�s!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(molesto) �Qu� cre�as que estabas haciendo?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Lo siento. No sab�a lo que hac�a.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "De todos modos, tu plan no iba a funcionar.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Era necesario.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Era necesario. Sin el poder del mineral, nunca hubiera podido vencer al Durmiente.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(enfadado) �Qu� estupidez es esa? �Durmiente? �Vencer?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Tu plan no hubiera funcionado de ninguna forma. Volar la Barrera con el mont�n de mineral es la mayor tonter�a que he o�do.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Tendr�ais que haberos volado vosotros mismos.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(enfadado) �Esto es el colmo! �Qui�n te ha dado permiso para juzgarnos a nosotros y nuestras intenciones?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Si no fuera tan pac�fico, har�a caer sobre ti la ira de Adanos, amigo.
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Lo siento. No sab�a lo que hac�a.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //�Oh? �Y crees que as� se soluciona todo?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
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
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //No s�, simplemente, se me ocurri� pasarme.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Est�n malgastando mi tiempo. Vete de aqu�.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(para s�) Ya me ocupar� de ti.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"He encontrado a los Magos de Agua en la excavaci�n. Primero, tengo que averiguar lo que hacen aqu�. Saturas no estaba preparado para cont�rmelo. A�n se pone tenso con las viejas historias de la colonia penal."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Vete de aqu� antes de que te pase algo.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(preocupado) �Lares? �De verdad? �D�nde est�?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Estoy solo. Lares ha vuelto a la ciudad.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //�Qu�? �Y te ha enviado aqu� solo? �En qu� estaba pensando?
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

	description	 = 	"Te he tra�do tu ornamento.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Te he tra�do tu ornamento.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //�Y eso qu� narices significa? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //�Qui�n te lo ha dado? No me digas que Lares te lo dio sin m�s.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //D�jalo ya. Te lo he tra�do. Lo quieres, �no?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Claro. Pero me preocupa que T� vuelvas a estar metido en esto.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //�Por qu� haces una monta�a de ese viejo asunto del mont�n de mineral?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Despu�s de todo, yo ya hab�a trabajado contigo por aquel entonces, y no puedes decir que no era de confianza.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(suspira) �Y qu� acab� recibiendo? Mpfh, no te pienses que conf�o en ti.
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auff�llen, die bei Lares gest�rt haben
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
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(furioso) �QU�? �C�mo sabes eso? �Qui�n�? LARES� �Lo matar�!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Ha incumplido la primera norma. No hablar a nadie del 'Anillo de Agua'.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(rendido) No s� ni qu� decir. S�lo me f�o de ti mientras pueda vigilarte.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //Fue Vatras quien me habl� del Anillo.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(resignado) �Qu�? �Vatras? (sarc�sticamente) �Maravilloso! De todos los Magos de Agua de la isla, vas a dar con el �nico que NO te conoce.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Te lo advierto, esta vez no cometas ninguna estupidez.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(seco) Me esforzar�.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas no est� listo para dejarme entrar en el 'Anillo de Agua'. Dejar� que Vatras decida."); 

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

	description	 = 	"�Qu� est�s haciendo aqu� abajo?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //�Qu� est�s haciendo por aqu�?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(reverentemente) Estas salas esconden antiguos secretos. Secretos misteriosos.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Las inscripciones y los murales provienen de una cultura muy antigua.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Todo lo que ves aqu� est� escrito en un idioma totalmente desconocido para nosotros.
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

	description	 = 	"�Qu� clase de extra�os terremotos son esos?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //�Qu� clase de extra�os terremotos son esos?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //Ese es uno de los enigmas que trato de resolver.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Algo tras estas monta�as est� afectando a la estructura de la magia.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Es obvio que alguien trata de quebrar una poderosa magia con todo su poder.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Me temo que esos temblores pronto afectar�n a toda la isla.
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

	description	 = 	"�Por qu� es tan importante para ti ese ornamento?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //�Por qu� es tan importante para ti ese ornamento?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(molesto) Es la llave de un portal.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //No te dir� m�s.
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
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC tr�gt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese R�stung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Veo que llevas la armadura de los nuestros.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Veo que portas nuestro s�mbolo secreto. El anillo de aguamarina.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //Y veo en tu mirada que dices la verdad.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(murmurando) Muy bien. Permitir� que te integres en nuestras filas.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Pero no olvides que eso implica una gran responsabilidad.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //Y espero por tu bien que sepas hacer honor a ella.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas ha aceptado que me una al 'Anillo de Agua'."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //�Y c�mo puedo yo saber que ahora eres de los nuestros?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //El anillo de aguamarina que llevas pertenece a Lares. Lo reconozco.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Intentas enga�arme, �verdad? No esperaba menos.
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

	description	 = 	"Dame el anillo. Abrir� el portal.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Dame el anillo. Abrir� el portal.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(con astucia) �Bien! Como nuevo miembro, te conceder� el honor.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Sin embargo, a�n espero un mensaje de Vatras. Hasta que no lo reciba, no podemos irnos.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //TENGO un mensaje de Vatras para ti.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(molesto) Comprendo. Y, claro est�, no pod�as contenerte y tuviste que abrirlo, �verdad?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //Pues, ehh
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(amenazante) Espero por tu bien que no hagas tambalearse mi ya delicado sentido de la confianza.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(sorprendido) Muy interesante. Perfecto.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Toma, el anillo. Nos reuniremos en el portal y te esperaremos all�.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Si Nefarius est� en lo cierto, el portal se abrir� en cuanto introduzcas el anillo.
			
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
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Mientras Vatras no me d� una se�al de que eres de confianza, yo guardar� el anillo.
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

	description	 = 	"�Puedes ense�arme algo sobre magia?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //�Puedes ense�arme algo de magia?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //�Para que puedas volver a interferir en la estructura m�gica?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //No. No tengo tiempo para juegos.
};
