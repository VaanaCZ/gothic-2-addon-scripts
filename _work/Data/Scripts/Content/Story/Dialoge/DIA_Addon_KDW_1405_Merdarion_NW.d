///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_EXIT   (C_INFO)
{
	npc         = KDW_1405_Addon_Merdarion_NW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1405_Addon_Merdarion_NW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Hallo_Condition;
	information	 = 	DIA_Addon_Merdarion_Hallo_Info;

	description	 = 	"¿Ocupado?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //¿Ocupado?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Esas cámaras son un misterio para mí. Es difícil creer que nadie las hayas descubierto hasta ahora.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Hemos podido despejar la entrada sin problemas.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //La gente está tan ocupada con su rutina diaria que nadie se fijó de cerca en esta construcción.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //No se me ocurre otra explicación.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Aufgabe_Condition;
	information	 = 	DIA_Addon_Merdarion_Aufgabe_Info;

	description	 = 	"¿A qué te dedicas?";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Aufgabe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //¿Cuán es tu cometido aquí?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //Intento averiguar a dónde conduce este portal redondo.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //Además, ayudo a Nefarius a buscar el ornamento perdido.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //Está claro que este portal conduce a otra parte de la isla que aún no conocemos.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //(pensando) No recuerdo haber leído o escuchado nada sobre eso
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nafarius anda buscando un ornamento perdido."); 
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_DaDurch_Condition;
	information	 = 	DIA_Addon_Merdarion_DaDurch_Info;

	description	 = 	"¿De verdad quieres atravesar el portal?";
};

func int DIA_Addon_Merdarion_DaDurch_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_DaDurch_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //¿De verdad quieres atravesar el portal?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Por supuesto. Siempre que encontremos el ornamento perdido, claro está.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //Lo admito, es una misión algo arriesgada.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Pero debemos averiguar de inmediato qué es lo que producía esos terremotos.
};
///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Bedrohung_Condition;
	information	 = 	DIA_Addon_Merdarion_Bedrohung_Info;

	description	 = 	"¿Qué sabes acerca de los terremotos?";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_DaDurch))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Bedrohung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //¿Qué sabes acerca de los terremotos?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Algo al otro lado es lo que los produce.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //Eso mismo es lo que está despertando a los centinelas de piedra, probablemente.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Pero eso no es asunto mío. Saturas y Cronos te darán más información al respecto.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information	 = 	DIA_Addon_Merdarion_Wasdahinter2_Info;

	description	 = 	"¿Qué esperas encontrar por allí?";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //¿Qué crees que encontraremos por allí?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //No estoy muy seguro.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Sospecho que al otro lado habrá una estructura similar a esta. Y un portal similar a este.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //Lo demás ya lo veremos cuando lleguemos allí.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Merdarion_PERM_Condition;
	information	 = 	DIA_Addon_Merdarion_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Puedes enseñarme algo sobre magia?";
};

func int DIA_Addon_Merdarion_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //¿Puedes enseñarme algo de magia?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Cuando estemos allí, estaré a tu disposición.
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Teleportstein_Condition;
	information	 = 	DIA_Addon_Merdarion_Teleportstein_Info;

	description	 = 	"¿Cuál es la forma más rápida de volver a la ciudad?";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //¿Cuál es la forma más rápida de volver a la ciudad?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Te recomiendo volver por donde has venido.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //(pensando) Pero también podrías… No. Eso sería arriesgado.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Suéltalo.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //Vale. Los constructores de las salas tenías su propia forma de viajar.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Por lo que sabemos, podían teletransportarse.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //Eso no es nada especial.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //Las piedras de teletransporte que hemos encontrado en Khorinis sí que son especiales.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Parece que la piedra de teletransporte de estas salas conduce a la ciudad portuaria.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Sin embargo, nadie ha tenido el valor de probarlo.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "¿Y si yo quisiera probarla?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "¿Dónde esta la piedra de teletransporte?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //¿Dónde está esa piedra de teletransporte?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //Hay una puerta en el lavabo. La he cerrado ahí detrás.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Dame la llave. Quiero echarle un vistazo a eso.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //¿Y si yo quisiera probarla?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Ni idea. Sabemos muy poco acerca de ella. Tal vez no sobrevivas.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Dame la llave. Quiero echarle un vistazo a esa cosa.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //(inseguro) ¿De verdad? Yo no me hago responsable.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Dámela.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Si tú lo dices. Aquí tienes.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion me dio la llave de una puerta cerrada en las bóvedas del portal. Tras ella hay una piedra de teletransporte que me llevará de vuelta al puerto marítimo."); 

	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Info;

	description	 = 	"¿Dónde están las otras piedras de teletransporte?";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //¿Dónde están las otras piedras de teletransporte?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //Hasta ahora, sólo hemos encontrado otra en el centro de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //Cerca de la taberna 'La arpía feliz'.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Debería de haber otra piedra de teletransporte cerca de la taberna 'La arpía muerta'."); 
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Info;

	description	 = 	"Las piedras de teletransporte parecen funcionar bien.";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info ()
{
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Las piedras de teletransporte parecen funcionar muy bien.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //¿Lo has hecho? ¿Te has metido dentro?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Sí, y se ve que aún funcionan.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //(fascinado) Increíble. Tendré que echarle un buen vistazo más tarde.
};


