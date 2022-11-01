
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(molesto) Por fin vuelves. Llevo horas esperándote.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(confundido) Un momento. No eres un mercader de la ciudad, ¿verdad?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(enfadado) ¿Dónde está Baltram?
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

	description	 = 	"¿Quién eres tú?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //¿Quién eres tú?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //No creo que eso sea asunto tuyo, pero si quieres saberlo, me llamo Skip. ¿Te suena de algo?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(haciéndose el tonto) ¿Quién?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //¿Me estás diciendo que no has oído hablar de mí? Demonios, ¿tú dónde vives?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Soy uno de los delincuentes más buscados de Khorinis. Yo y los míos llevamos años siendo el azote de los mares de esta insignificante isla.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(indignado) Vamos, hombre, te tiene que sonar mi nombre.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Eres un pirata.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "¿Debería conocerte?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Pues claro. Ahora ya me acuerdo.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Pues claro. Ahora ya me acuerdo.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(perplejo) ¿En serio? ¿De verdad que me conoces?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //¡Mierda! Y yo que pensaba pasarme un rato por la ciudad.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Menos mal que no he ido.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //La milicia me hubiera encerrado enseguida.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //No has venido a deshacerte de mí, ¿verdad?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Bueeenoooo….
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Por tu bien. Si luchas contra el viejo Skip, eres historia.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //¿Debería conocerte?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Cuidado con lo que dices, chaval, o el viejo Skip te enseñará modales.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Eres un pirata.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(irritado) Sí, maldita sea. Eso se ve a simple vista. Y tengo mal genio.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Estoy tan aburrido que hasta masticaría las tablas de mi propio barco.
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

	description	 = 	"¿Baltram? ¿Esperas a un mercader?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //¿Baltram? ¿Esperas a un mercader?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Chico listo, ¿no?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Lo acababa de decir yo, ¿verdad?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Ese mercader inútil parece que se ha olvidado de mí.
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
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //¿Qué? ¿Me envía a un recadero?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Menudo cobarde sin agallas, ¿no crees? ¿Qué puedes esperar de un rastrero como él?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Dice que quiere 3 botellas de ron a cambio.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(ríe) Eso le gustaría, ¿verdad? Primero me hace esperar una eternidad, luego ni aparece en persona y ahora tiene el valor de poner condiciones.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Toma, dale 2 botellas. Con eso tendrá suficiente.
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

	description	 = 	"¿De dónde vienes?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //¿De dónde vienes?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //¿Quieres saber dónde está nuestro escondite?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Es lo último que le diría a alguien de la milicia.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Si te lo digo, sería como invitar a la milicia a que me detuviera.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //Y, en caso de que quisieras hacernos una visita, eso tampoco te favorecería.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //La isla de Khorinis es grande y nadie llega nunca a donde estamos nosotros. A menos que tengan alguna embarcación.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //Y luego tendrías que atravesar también los acantilados. Nadie los supera con vida, a menos que conozcan el sendero secreto.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Sólo hay dos personas que conozcan el sendero y tú no eres una de ellas
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

	description	 = 	"¿Conoces a alguien con un parche?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //¿Conoces a alguien con un parche?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Conozco a mucha gente con parche.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Hay alguien rondando por Khorinis que parece conocerte muy bien.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //No sé de quién hablas. No trato con lobos de mar.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Pero
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Déjalo, no me interesa mucho.
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

	description	 = 	"Ha desaparecido un montón de gente.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Hay muchos ciudadanos desaparecidos. Y todo parece indicar que tú sabes algo al respecto.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(se siente descubierto) Emm… Mierda, no es lo que crees.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //¿Tengo pinta de comerciante de esclavos? No, yo sólo transporto mercancía. Lo que es y de donde proviene no es asunto mío.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Hemos transportado todo tipo de cosas para esos cerdos.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Al principio, eran cosas normales. Bueno, a veces, puede que fuera contrabando.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Pero luego empezaron a secuestrar a gente de la ciudad. No sé qué piensan hacer con ellos.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //Lo único que yo hice fue transportarlos.
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

	description	 = 	"¿De quién hablas?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //¿De qué estás hablando?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //De los bandidos, claro está. ¿De quién si no? Esa escoria que se está estableciendo en la isla como si fuera su casa.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //Y no sólo aquí, alrededor de Khorinis.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Ahora recuerdo su nombre. Dexter. Sí, creo que lo llamaban Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"El capitán bandido Dexter se ha llevado a la gente de Khorinis. Se dice que anda en algún lugar al sur de la granja de Onar."); 

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

	description	 = 	"No me vale eso de 'bandidos'. Quiero un nombre…";
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //¿Un nombre? ¿Quieres saber quién lidera a los bandidos? Mierda, cómo se llama ese bastardo
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Mmh, no me acuerdo del nombre. Y eso que no era muy complicado.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Pero puedo mostrarte dónde buscar al jefe de la banda en esta parte de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //¿Tienes un mapa en condiciones?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Tengo un mapa aquí mismo.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Pero alguien lo ha garabateado. Vaya gracia, estropeártelo.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //No.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Entonces supongo que tendré que darte una descripción.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Hay una granja enorme hacia el este, lejos de aquí. El granjero se llama Onar, creo.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Tiene unas tierras muy extensas. Hacia  el sur, hay una pequeña fortaleza sobre un alto acantilado.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //Allí encontrarás a tu hombre.
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Magnífico. Te dibujaré el escondite de ese tipo.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Aquí está tu mapa.
	
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

	description	 = 	"¿Dónde llevasteis a esa gente?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //¿Dónde llevasteis a esa gente?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Ya te lo he icho, no pienso decirte dónde está nuestra bahía.
};
