///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_EXIT   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 999;
	condition   = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Constantino_PICKPOCKET (C_INFO)
{
	npc			= VLK_417_Constantino;
	nr			= 900;
	condition	= DIA_Constantino_PICKPOCKET_Condition;
	information	= DIA_Constantino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Constantino_PICKPOCKET_Condition()
{
	C_Beklauen (59, 90);
};
 
FUNC VOID DIA_Constantino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Constantino_PICKPOCKET);
	Info_AddChoice		(DIA_Constantino_PICKPOCKET, DIALOG_BACK 		,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Constantino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Constantino_PICKPOCKET);
};
	
func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Constantino_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Hallo   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Constantino_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Hallo_Info()
{
	//ADDON	AI_Output (self, other,"DIA_Constantino_Hallo_10_00"); //Was willst du? Hier gibt es nichts umsonst und ich werde dir auch nichts verkaufen.
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //¿Qué quieres? No pienso decirte nada.
};

///////////////////////////////////////////////////////////////////////
//	Suche Stelle als Lehrling
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_AboutLehrling (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent   = FALSE;
	description = "Busco convertirme en aprendiz.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Busco convertirme en aprendiz.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //¿De verdad? ¿Y con quién vas a probar?
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Heilung   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 5;
	condition   = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Heilung_Info;
	permanent   = FALSE;
	Description = "Necesito que me curen.";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //Necesito que me curen.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //(Bruscamente) ¿Por qué, estás herido?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"No mucho.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Sí.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Sí.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Entonces ve a donde Vatras. Te dejará como nuevo. ¡Y deja de sangrar sobre mi suelo!
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //No tienes más que un rasguño y yo tengo cosas más importantes que hacer que hablar contigo.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //No mucho.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Pues entonces, piérdete, o acabarás herido de verdad.
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info LestersKraeuter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Constantino_LestersKraeuter		(C_INFO)
{
	npc		 = 	VLK_417_Constantino;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Constantino_LestersKraeuter_Condition;
	information	 = 	DIA_Addon_Constantino_LestersKraeuter_Info;

	description	 = 	"¿Puedo venderte unas hierbas?";
};

func int DIA_Addon_Constantino_LestersKraeuter_Condition ()
{
	if (MIS_Constantino_BringHerbs == 0)
	&& (MIS_Addon_Lester_PickForConstantino != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //¿Puedo venderte unas hierbas?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Si tienes algo que ofrecer
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Trade   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 700;
	condition   = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent   = TRUE;
	description = "Enséñame tu mercancía.";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Enséñame tu mercancía.
	
	if ( Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Constantino vende suministros para alquimistas."); 
		
		Constantino_Logpatch1 = TRUE;
	};
};

// *******************************************************
//						Bei Dir!		//e2
// *******************************************************
instance DIA_Constantino_BeiDir (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent   = FALSE;
	description = "Quiero ser tu aprendiz.";
};
FUNC INT DIA_Constantino_BeiDir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_BeiDir_Info()
{
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //Quiero ser tu aprendiz.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //¿MÍO? ¡No! Ya he tenido el dudoso placer de enfrentarme a un aprendiz. Con eso tuve suficiente.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //Invertí varios años en su educación y, al final, el muy inútil se envenenó.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //¡Ve a probar con uno de los otros maestros!
};

// *******************************************************
//						Bei anderem Meister		//e2
// *******************************************************
instance DIA_Constantino_ZUSTIMMUNG (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_ZUSTIMMUNG_Condition;
	information = DIA_Constantino_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "Quiero intentarlo con uno de los otros maestros.";
};
FUNC INT DIA_Constantino_ZUSTIMMUNG_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Quiero ser aprendiz con uno de los otros maestros.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //¿Has venido a solicitar mi aprobación?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Mm, por lo que a mí concierne, puedes ser aprendiz con quien quieras.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //Bien, ¡pues no vas a obtenerla! Las cosas que he oído sobre ti no me gustan.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //No votaré para que un criminal como tú consiga un puesto honorable en nuestra ciudad.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Hasta que no hayas arreglado este asunto con el comandante de la guardia de la ciudad, ¡mi respuesta será no!
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino me dará su consentimiento para que me convierta en aprendiz siempre y cuando no se me acuse de ningún crimen en la ciudad.");	
	
	 Constantino_Logpatch2 = TRUE;
	  	
	};
};

// *******************************************************
//						Was muß ich tun?		//e3
// *******************************************************
instance DIA_Constantino_BringHerbs (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent   = FALSE;
	description = "¿Qué tendré que hacer para convertirme en TU aprendiz?";
};
FUNC INT DIA_Constantino_BringHerbs_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_BeiDir))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_BringHerbs_Info()
{
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //¿Qué tendré que hacer para convertirme en TU aprendiz?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //(Suspira) No podría soportar a OTRO diletante en mi conciencia.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //Hay multitud de hierbas ahí fuera. Usadas en diversas combinaciones, producen los más variados efectos.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Probablemente no conoces ni la mitad.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //(Suspira) Toma, ésta es una lista de las plantas más importantes.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //Tráeme una planta de cada tipo y quizá reconsidere lo de admitirte como aprendiz.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino quiere una planta de cada tipo. Si no las consigo, no me aceptará como su aprendiz.");
	
};

// *******************************************************
//					Wegen der Pflanzen		//e4
// *******************************************************
instance DIA_Constantino_HerbsRunning (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent   = TRUE;
	description = "En cuanto a las plantas...";
};
FUNC INT DIA_Constantino_HerbsRunning_Condition()
{	
	if (MIS_Constantino_BringHerbs == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_HerbsRunning_Info()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //En cuanto a las plantas...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Si no te las puedes arreglar por ti mismo, ¡tampoco serás un buen alquimista!
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
	Info_AddChoice (DIA_Constantino_HerbsRunning, "Ya veo.", DIA_Constantino_HerbsRunning_Running);
	if (Npc_HasItems (other, ItPl_Mana_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Mana_Herb_02) > 0)
	&& (Npc_HasItems (other, ItPl_Mana_Herb_03) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_02) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_03) > 0)
	&& (Npc_HasItems (other, ItPl_Dex_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Strength_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Speed_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Temp_Herb) > 0)
	&& (Npc_HasItems (other, ItPl_Perm_Herb) > 0)
	{
		Info_AddChoice (DIA_Constantino_HerbsRunning, "¡Tengo todas las plantas que tenía que traerte!", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //¡Tengo todas las plantas que tenía que traerte!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //¿Qué? Te estás riendo de mí, ¿verdad?

	//11 Gegenstände gegeben (Pflanzen) HACK für Screen ADDON
	AI_PrintScreen ("11 Gegenstände gegeben (Pflanzen)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems (other, ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Temp_Herb,1);
	Npc_RemoveInvItems (other, ItPl_Perm_Herb,1);
	
	CreateInvItems (self, ItPl_Mana_Herb_01,1);
	CreateInvItems (self, ItPl_Mana_Herb_02,1);
	CreateInvItems (self, ItPl_Mana_Herb_03,1);
	CreateInvItems (self, ItPl_Health_Herb_01,1);
	CreateInvItems (self, ItPl_Health_Herb_02,1);
	CreateInvItems (self, ItPl_Health_Herb_03,1);
	CreateInvItems (self, ItPl_Dex_Herb_01,1);
	CreateInvItems (self, ItPl_Strength_Herb_01,1);
	CreateInvItems (self, ItPl_Speed_Herb_01,1);
	CreateInvItems (self, ItPl_Temp_Herb,1);
	CreateInvItems (self, ItPl_Perm_Herb,1);
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //¡Por Adanos! Están todas aquí.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Quién sabe, quizá algún día consigas ser un buen alquimista, después de todo.
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino me aceptará como su aprendiz, siempre y cuando el resto de los maestros den su consentimiento.");
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Running_15_00"); //Ya veo.
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

// *******************************************************
//						LEHRLING		//e5
// *******************************************************

var int Constantino_StartGuild;
// ----------------------------

instance DIA_Constantino_LEHRLING (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent   = TRUE;
	description = "Entonces, ¿puedo convertirme en tu aprendiz?";
};
FUNC INT DIA_Constantino_LEHRLING_Condition()
{	
	if (MIS_Constantino_BringHerbs == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Entonces, ¿puedo convertirme en tu aprendiz?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Por lo que a mí respecta, sí.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //Lo único que le importa a Harad es que seas capaz de defender la ciudad si es atacada por orcos.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //Y parece que ya le convenciste de ello.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Pero piensa que eres un cobarde.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Pero Harad dice que nunca te había visto.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper se ha mostrado reticente a la hora de comentar tus cualidades.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //Supongo que le gustaría tenerte como aprendiz suyo.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Pero finalmente aceptó.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //¡Refrenar su aprobación por esa causa no es algo muy honorable!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Pero si los demás maestros aceptan, no necesitarás su voto.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //Y Bosper aún no te conoce.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben es un hombre muy religioso.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Te ha dado su bendición. Es una buena señal.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Solo te dará su aprobación con la bendición de los dioses.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben no sabe quién eres.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //En cuanto a Matteo, canta tus alabanzas a los cuatro vientos.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matteo dice que aún le debes algo. Si quieres su voto, será mejor que te ocupes de ese asuntillo.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matteo dice que todavía no ha hablado contigo sobre esto.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matteo dice que nunca te había visto en su tienda.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //¡Esto significa que tienes la aprobación de todos los maestros!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Ahora tienes la aprobación de cuatro maestros, suficiente para ser aceptado como aprendiz.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //¿Estás preparado para comenzar tu aprendizaje conmigo?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Primero necesito meditarlo.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Sí, maestro.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Necesitas la aprobación de, al menos, cuatro maestros para poder ser aceptado como aprendiz en la parte baja de la ciudad.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Esto significa que deberías hablar con todos los que aún no han dado su aprobación.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //(Irritado) ¡De eso nada! ¡He oído rumores de que estás acusado de criminal aquí en Khorinis!
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //No te admitiré como aprendiz hasta que no hayas solucionado este problema con el comandante de la guardia de la ciudad.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Sí, maestro.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //(Suspira) ¡Entonces de acuerdo! Espero no tener que lamentar esta decisión.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //Desde este momento, puedes considerarte mi aprendiz.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Constantino me ha aceptado como su aprendiz, ahora puedo acceder al barrio alto.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Primero necesito meditarlo.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //¡De acuerdo! Si no puedes poner tu corazón de verdad en esto, deberías seguir otro camino distinto.
	
	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Constantino_MILKommentar;
	var int Constantino_INNOSKommentar;
// ----------------------------------

instance DIA_Constantino_AlsLehrling (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Constantino_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_AlsLehrling_Info()
{
	if (B_GetGreatestPetzCrime (self) > CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //(Irritado) Me niego a instruirte más mientras estés acusado de un crimen en la ciudad.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Acude a Lord Andre y arregla el tema inmediatamente.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //¿Así que te has unido a la milicia? Ya me había enterado.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Te haces aprendiz a toda prisa ¿y luego vas y te unes a la milicia? No te lo voy a poner nada fácil.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //Espero que te atengas a nuestro acuerdo y me traigas plantas y setas regularmente.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //Si dos trabajos son demasiado para ti, ¡tendrás que dormir menos!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Veo que has entrado al servicio de Innos. Supongo que eso significa que, de ahora en adelante, no tendrás mucho tiempo libre para buscar hierbas para un viejo.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Aún así, considero un gran honor haberte apoyado en tu camino.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Si, a pesar de tus nuevas labores, encuentras tiempo para entretenerte con la alquimia, puedes estar seguro de que siempre serás bienvenido aquí.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //¿En qué has estado liado?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //¡Espero más de mi aprendiz que dejarse caer por mi casa de ciento un viento!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //¿Me trajiste al menos alguna seta?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //Aquí estás otra vez...
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};

// *******************************************************
//					Aufgaben als Lehrling	
// *******************************************************
instance DIA_Constantino_Aufgaben (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Aufgaben_Info;
	permanent   = FALSE;
	description = "¿Cuáles son mis tareas?";
};
FUNC INT DIA_Constantino_Aufgaben_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Aufgaben_Info()
{
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //¿Cuáles son mis tareas?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Sé que no puedo esperar que un hombre joven pase todo el día encerrado conmigo.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //De vez en cuando, tendrás que traerme las plantas que necesite. A cambio, te instruiré en el arte de la alquimia.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Puedes comprarme las botellas. En cambio, la mayor parte de los ingredientes tendrás que obtenerlos por ti mismo.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //Y espero que te comportes adecuadamente como habitante de esta ciudad.
};

// *******************************************************
//					Welche Pflanzen	
// *******************************************************
instance DIA_Constantino_Mushrooms (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent   = FALSE;
	description = "¿Qué plantas se supone que debo conseguir?";
};
FUNC INT DIA_Constantino_Mushrooms_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Mushrooms_Info()
{
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //¿Qué plantas se supone que debo conseguir?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Te compraré todo lo que me traigas y pagaré el precio habitual.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //En cambio, por las setas te pagaré un precio especial.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Puedo venderle hongos a Constantino, a un precio especialmente bueno.");
};

// *******************************************************
//					Mushrooms Running
// *******************************************************

instance DIA_Constantino_MushroomsRunning (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent   = TRUE;
	description = "Querías setas...";
};
FUNC INT DIA_Constantino_MushroomsRunning_Condition()
{	
	if (MIS_Constantino_Mushrooms == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //Querías setas...

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Voy a traerte unas...", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "¿Por qué son tan importantes esas cosas?", DIA_Constantino_MushroomsRunning_Why);
	};
	if (Npc_HasItems (other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems (other, ItPl_Mushroom_02) > 0)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Tengo algunas...", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;
	
	if (Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //Tengo unas cuantas setas tenebrosas por aquí...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //¡Ah! ¡Ésas son las mejores! ¡Bien hecho! ¡Aquí tienes tu dinero!
		Dunkelpilz_dabei = TRUE;
		
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
				
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01) );
		B_GiveInvItems (other, self, ItPl_Mushroom_01, Npc_HasItems (other, ItPl_Mushroom_01));
	};
	
	if (Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_02"); //Y aquí hay algunas de las otras...
		}
		else
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //¡Tengo unas cuantas setas por aquí!
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Éstas no son tan buenas como las setas tenebrosas, pero me las quedaré de todas formas.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //¿Por qué son tan importantes esas cosas?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //Aunque seas mi aprendiz, no te lo voy a contar todo.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //De acuerdo, te lo diré. Pero debes mantener el secreto.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Las setas tenebrosas están llenas de energía mágica. Y cada vez que comas una, un poco de esta energía se acumulará en tu cuerpo.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Cuando hayas comido una cantidad suficiente de estas setas, tu energía mágica aumentará...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Si te hubiera dicho esto antes, te habrías zampado todas las setas, ¿verdad?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //(Suspira) ¡Oh, tío!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Ya me has preguntado eso. (Con picardía) ¿Quién sabe? A lo mejor algún día termine diciéndotelo...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Voy a traerte unas...
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //¡Genial! Trae todas las que puedas encontrar...
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

// *******************************************************
//					Unterrichte mich	
// *******************************************************
instance DIA_Constantino_Alchemy (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent   = FALSE;
	description = "¡Instrúyeme en el arte de la alquimia!";
};
FUNC INT DIA_Constantino_Alchemy_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Alchemy_Info()
{
	AI_Output (other, self,"DIA_Constantino_Alchemy_15_00"); //¡Instrúyeme en el arte de la alquimia!
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //De acuerdo. Primero los fundamentos.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Todas las pociones están hechas de plantas. Poseen todo tipo de poderes.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //No hacen nada más que poner toda su fuerza en crecer. Y el arte de la alquimia trata de modificar este poder.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //Para preparar una poción en la mesa del alquimista, necesitas un frasco de laboratorio.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //Necesitas saber la fórmula correcta y tener los ingredientes adecuados.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //Hay unas cuantas fórmulas que podría enseñarte.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //Pociones que restauran la fuerza perdida e incluso pociones que afectan permanentemente a tu fuerza.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //No puedes aprender todo a la vez.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino puede enseñarme el arte de la alquimia.");
};

// *******************************************************
//					für Nicht-Lehrlinge	
// *******************************************************
INSTANCE DIA_Constantino_NewRecipes (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent   = FALSE;
	description = "Estoy buscando nuevas recetas de pociones.";
};
FUNC INT DIA_Constantino_NewRecipes_Condition()
{	
	if (Player_IsApprentice != APP_Constantino)
	&& (Player_IsApprentice > APP_NONE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_ALCHEMY) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_NewRecipes_Info()
{
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //Estoy buscando nuevas recetas de pociones.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //¿Tienes alguna experiencia previa con la alquimia?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Sí que tengo.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //Y aún sigues vivo... no son malas calificaciones.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //Creo que puedo darte unas cuantas fórmulas. Depende, naturalmente, de lo que quieras saber.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino puede enseñarme el arte de la alquimia.");
};
	
// *******************************************************
//							TEACH		
// *******************************************************
INSTANCE DIA_Constantino_TEACH (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent   = TRUE;
	description = "¿Qué recetas puedes enseñarme?";
};
FUNC INT DIA_Constantino_TEACH_Condition()
{	
	if (Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_TEACH_Info()
{
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //¿Qué recetas puedes enseñarme?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Lo siento. No hay nada más que yo pueda enseñarte.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //Conozco unas cuantas. Elige tú mismo.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esencia de curación", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extracto de curación", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixir de curación", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixir de vida", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)                                                                                                                                   
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esencia de maná", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Constantino_TEACH_Mana01);                  
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)   
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)                                                                                                                                                                                                                                                                  
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extracto de maná", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Constantino_TEACH_Mana02);                 
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixir de fuerza", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Los ingredientes de una esencia de curación son plantas curativas y maleza de llanura.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //Para preparar un extracto sanador necesitas hierbas curativas y maleza de llanura.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //Asegúrate de calentar el extracto con mucho cuidado.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //Crear un elixir de sanación requiere bastante experiencia.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //Necesitas raíces curativas y maleza de llanura. Ten especial cuidado esta vez al calentarlo.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //¡El elixir de la vida! Una rara poción. No tanto por lo que cuesta hacerla. Realmente no es tan complicada.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Pero los ingredientes son muy escasos. Necesitas raíces curativas y acedera.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //La esencia de la magia es la poción mágica más simple.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //Coge ortigas de fuego y maleza de llanura y caliéntalas despacio.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Dado que ya sabes preparar esencia de magia, con un poco de empeño deberías ser capaz de preparar también un extracto.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //Tienes que poner la cantidad adecuada de empeño en decocerla. Usa hierba del fuego y maleza de llanura para esta poción.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //¡El elixir de la fuerza! Una poción excelente. Necesitas la escasa raíz de dragón y acedera.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //Al hervir la poción, no dejes que las burbujas se hagan muy grandes, ¡o te llevarás una fea sorpresa!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


