
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(molesto) Por fin vuelves. Llevo horas esper�ndote.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(confundido) Un momento. No eres un mercader de la ciudad, �verdad?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(enfadado) �D�nde est� Baltram?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"�Qui�n eres t�?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //�Qui�n eres t�?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //No creo que eso sea asunto tuyo, pero si quieres saberlo, me llamo Skip. �Te suena de algo?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(haci�ndose el tonto) �Qui�n?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //�Me est�s diciendo que no has o�do hablar de m�? Demonios, �t� d�nde vives?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Soy uno de los delincuentes m�s buscados de Khorinis. Yo y los m�os llevamos a�os siendo el azote de los mares de esta insignificante isla.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(indignado) Vamos, hombre, te tiene que sonar mi nombre.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Eres un pirata.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "�Deber�a conocerte?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Pues claro. Ahora ya me acuerdo.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Pues claro. Ahora ya me acuerdo.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(perplejo) �En serio? �De verdad que me conoces?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //�Mierda! Y yo que pensaba pasarme un rato por la ciudad.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Menos mal que no he ido.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //La milicia me hubiera encerrado enseguida.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //No has venido a deshacerte de m�, �verdad?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Bueeenoooo�.
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Por tu bien. Si luchas contra el viejo Skip, eres historia.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //�Deber�a conocerte?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Cuidado con lo que dices, chaval, o el viejo Skip te ense�ar� modales.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Eres un pirata.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(irritado) S�, maldita sea. Eso se ve a simple vista. Y tengo mal genio.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Estoy tan aburrido que hasta masticar�a las tablas de mi propio barco.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"�Baltram? �Esperas a un mercader?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //�Baltram? �Esperas a un mercader?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Chico listo, �no?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Lo acababa de decir yo, �verdad?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Ese mercader in�til parece que se ha olvidado de m�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Si pudiera ponerle las manos encima
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"El pirata Skip me ha contado que el comerciante Baltram ha hecho negocios con los piratas."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"Tengo un paquete para ti de Baltram.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Tengo un paquete para ti. De Baltram.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //�Qu�? �Me env�a a un recadero?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Menudo cobarde sin agallas, �no crees? �Qu� puedes esperar de un rastrero como �l?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Dice que quiere 3 botellas de ron a cambio.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(r�e) Eso le gustar�a, �verdad? Primero me hace esperar una eternidad, luego ni aparece en persona y ahora tiene el valor de poner condiciones.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Toma, dale 2 botellas. Con eso tendr� suficiente.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"�De d�nde vienes?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //�De d�nde vienes?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //�Quieres saber d�nde est� nuestro escondite?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Es lo �ltimo que le dir�a a alguien de la milicia.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Si te lo digo, ser�a como invitar a la milicia a que me detuviera.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //Y, en caso de que quisieras hacernos una visita, eso tampoco te favorecer�a.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //La isla de Khorinis es grande y nadie llega nunca a donde estamos nosotros. A menos que tengan alguna embarcaci�n.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //Y luego tendr�as que atravesar tambi�n los acantilados. Nadie los supera con vida, a menos que conozcan el sendero secreto.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //S�lo hay dos personas que conozcan el sendero y t� no eres una de ellas
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"�Conoces a alguien con un parche?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //�Conoces a alguien con un parche?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Conozco a mucha gente con parche.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Hay alguien rondando por Khorinis que parece conocerte muy bien.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //No s� de qui�n hablas. No trato con lobos de mar.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Pero
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //D�jalo, no me interesa mucho.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Ha desaparecido un mont�n de gente.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Hay muchos ciudadanos desaparecidos. Y todo parece indicar que t� sabes algo al respecto.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(se siente descubierto) Emm� Mierda, no es lo que crees.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //�Tengo pinta de comerciante de esclavos? No, yo s�lo transporto mercanc�a. Lo que es y de donde proviene no es asunto m�o.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Hemos transportado todo tipo de cosas para esos cerdos.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Al principio, eran cosas normales. Bueno, a veces, puede que fuera contrabando.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Pero luego empezaron a secuestrar a gente de la ciudad. No s� qu� piensan hacer con ellos.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //Lo �nico que yo hice fue transportarlos.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"�De qui�n hablas?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //�De qu� est�s hablando?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //De los bandidos, claro est�. �De qui�n si no? Esa escoria que se est� estableciendo en la isla como si fuera su casa.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //Y no s�lo aqu�, alrededor de Khorinis.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Ahora recuerdo su nombre. Dexter. S�, creo que lo llamaban Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"El capit�n bandido Dexter se ha llevado a la gente de Khorinis. Se dice que anda en alg�n lugar al sur de la granja de Onar."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"No me vale eso de 'bandidos'. Quiero un nombre�";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //Lo de 'bandidos' se me queda corto. Necesito un nombre
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //�Un nombre? �Quieres saber qui�n lidera a los bandidos? Mierda, c�mo se llama ese bastardo
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Mmh, no me acuerdo del nombre. Y eso que no era muy complicado.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Pero puedo mostrarte d�nde buscar al jefe de la banda en esta parte de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //�Tienes un mapa en condiciones?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Tengo un mapa aqu� mismo.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Pero alguien lo ha garabateado. Vaya gracia, estrope�rtelo.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //No.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Entonces supongo que tendr� que darte una descripci�n.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Hay una granja enorme hacia el este, lejos de aqu�. El granjero se llama Onar, creo.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Tiene unas tierras muy extensas. Hacia  el sur, hay una peque�a fortaleza sobre un alto acantilado.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //All� encontrar�s a tu hombre.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Toma. Tengo un mapa de Khorinis.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Toma. Tengo un mapa de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Magn�fico. Te dibujar� el escondite de ese tipo.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Aqu� est� tu mapa.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"�D�nde llevasteis a esa gente?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //�D�nde llevasteis a esa gente?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Ya te lo he icho, no pienso decirte d�nde est� nuestra bah�a.
};
