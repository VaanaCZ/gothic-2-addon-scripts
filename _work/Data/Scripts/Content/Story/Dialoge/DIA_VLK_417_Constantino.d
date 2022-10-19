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
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //Was willst du? Hier gibt es nichts umsonst.
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
	description = "Ich bin auf der Suche nach einer Stelle als Lehrling.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Ich bin auf der Suche nach einer Stelle als Lehrling.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //So? Und bei wem willst du anfangen?
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
	Description = "Ich suche Heilung";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //Ich suche Heilung.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //(barsch) Wieso, bist du verletzt?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Eigentlich nicht.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Ja. ",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Ja.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Dann geh zu Vatras, der wird dich bestimmt heilen. Und blute nicht meinen Boden voll!
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //Du hast nicht mal einen Kratzer und ich habe Wichtigeres zu tun, als mit dir zu plaudern.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //Eigentlich nicht.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Dann verschwinde, sonst ziehst du dir noch eine Verletzung zu.
	
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

	description	 = 	"Kann ich dir Kräuter verkaufen?";
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
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //Kann ich dir Kräuter verkaufen?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Wenn du was anzubieten hast ...
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
	description = "Zeig mir deine Ware";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Zeig mir deine Ware.
	
	if ( Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Constantino verkauft alchemistisches Zubehör."); 
		
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
	description = "Ich will bei dir als Lehrling anfangen.";
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
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //Ich will bei dir als Lehrling anfangen.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //Bei MIR? Nein! Ich hatte schon einmal das zweifelhafte Vergnügen, mich mit einem Lehrling herumschlagen zu müssen.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //Ich habe Jahre in seine Ausbildung investiert, und am Ende hat der arme Narr sich selbst vergiftet.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //Fang bei einem der anderen Meister an!
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
	description = "Ich will bei einem der anderen Meister anfangen.";
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
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Ich will bei einem der anderen Meister anfangen.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //Du kommst, um dir meine Zustimmung zu holen?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Hm - meinetwegen kannst du anfangen, bei wem du willst.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //Aber du wirst sie nicht bekommen! Ich habe Dinge über dich gehört, die dagegen sprechen!
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Ich werde nicht dafür stimmen, dass ein Verbrecher wie du in unserer Stadt eine ehrenwerte Stellung bekommt.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Bevor du die Sache nicht beim Kommandanten der Stadtwache geregelt hast, sage ich nein!
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino gibt mir seine Zustimmung, wenn ich irgendwo als Lehrling anfangen will, solange ich nicht in der Stadt eines Verbrechens angeklagt bin.");	
	
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
	description = "Was muss ich tun, damit DU mich als Lehrling aufnimmst?";
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
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Was muss ich tun, damit DU mich als Lehrling aufnimmst?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //(seufzt) Ich will nicht NOCH einen Dilettanten auf dem Gewissen haben.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //Es gibt eine Vielzahl von Kräutern, die in den unterschiedlichsten Variationen die unterschiedlichsten Wirkungen entfalten.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Vermutlich kennst du nicht mal die Hälfte von ihnen.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //(seufzt) Hier - das ist eine Liste der wichtigsten Pflanzen.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //Bring mir eine Pflanze jeder Art, und werde ich noch mal darüber nachdenken, dich als Lehrling aufzunehmen.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino will eine Pflanze jeder Art, damit er mich als Lehrling aufnimmt.");
	
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
	description = "Wegen der Pflanzen ...";
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
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //Wegen der Pflanzen ...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Wenn du es nicht alleine schaffst, bist du auch nicht als Alchemist zu gebrauchen!
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
	Info_AddChoice (DIA_Constantino_HerbsRunning, "Verstehe.", DIA_Constantino_HerbsRunning_Running);
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
		Info_AddChoice (DIA_Constantino_HerbsRunning, "Ich habe alle Pflanzen, die ich dir bringen sollte!", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //Ich habe alle Pflanzen, die ich dir bringen sollte!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Was? Du willst mich doch auf den Arm nehmen!

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
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //Bei Adanos! Es ist tatsächlich alles dabei.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Aus dir könnte vielleicht doch noch ein brauchbarer Alchemist werden.
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino wird mich als Lehrling aufnehmen, wenn ich die Zustimmung der anderen Meister bekomme.");
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Running_15_00"); //Verstehe.
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
	description = "Kann ich jetzt bei dir als Lehrling anfangen?";
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
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Kann ich jetzt bei dir als Lehrling anfangen?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Was mich betrifft, ja.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //Für Harad ist nur wichtig, dass du in der Lage bist, die Stadt zu verteidigen, falls die Orks kommen.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //Und so wie es aussieht, hast du ihn davon überzeugt.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Aber er hält dich für einen Feigling.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Aber Harad sagt, er hat dich noch nie gesehen.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper hat sich sehr zurückhaltend über deine Qualitäten geäußert.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //Ich vermute, er würde dich gerne selber als Lehrling haben.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Aber am Ende hat er seine Zustimmung gegeben.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Aus diesem Grund seine Zustimmung zu verweigern, ist alles andere als rechtschaffen!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Aber wenn alle anderen Meister zustimmen, brauchst du seine Stimme nicht.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //Und Bosper kennt dich noch nicht.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben ist ein sehr gläubiger Mann.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Er hat dir seinen Segen gegeben. Das ist ein gutes Zeichen.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Er wird dir seine Zustimmung nur mit dem Segen der Götter geben.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben weiß nicht, wer du bist.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //Was Matteo betrifft - er hat dich in den höchsten Tönen gelobt.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matteo sagt, du schuldest ihm noch etwas. Wenn dir an seiner Stimme etwas liegt, solltest du die Sache bereinigen.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matteo sagt, er hat noch nicht mit dir über die Sache geredet.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matteo sagt, er hat dich noch nie in seinem Laden gesehen.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //Damit hast du die Zustimmung aller Meister!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Damit hast du die Zustimmung von vier Meistern. Das reicht aus, um als Lehrling aufgenommen zu werden.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Bist du bereit, deine Lehre bei mir zu beginnen?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Lass mich noch einmal darüber schlafen.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Ja, Meister.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Du brauchst die Zustimmung von mindestens vier Meistern, um in der Unterstadt als Lehrling anfangen zu können.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Also solltest du mit allen reden, die noch nicht von dir überzeugt sind.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //(verärgert) Unmöglich! Mir ist zu Ohren gekommen, dass du hier in Khorinis als Verbrecher angeklagt bist!
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Bevor du dies nicht mit dem Kommandanten der Stadtwache geklärt hast, werde ich dich nicht als Lehrling aufnehmen.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Ja, Meister.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //(seufzt) Gut! Ich hoffe, ich werde diese Entscheidung nicht bereuen.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //Ab sofort darfst du dich als mein Lehrling betrachten.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Constantino hat mich als Lehrling eingestellt. Ich habe nun Zugang zum oberen Viertel.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Lass mich noch einmal darüber schlafen.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //Gut! Wenn du nicht wirklich mit ganzem Herzen bei der Sache bist, solltest du dich für einen anderen Weg entscheiden!
	
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
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //(verärgert) Ich werde dich nicht weiter unterweisen, solange du in der Stadt eines Verbrechens angeklagt bist.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Geh zu Lord Andre und bring die Sache wieder ins Reine.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Du bist also der Miliz beigetreten? Ich habe schon davon gehört.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Mal eben schnell Lehrling werden und dann ab zur Miliz. Aber so einfach werde ich es dir nicht machen.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //Ich erwarte, dass du dich an unsere Abmachung hältst und mir regelmäßig Pflanzen und Pilze bringst.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //Wenn es dich überfordert, zwei Berufe auf einmal auszuüben, musst du eben weniger schlafen!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Ich sehe, du bist in den Dienst Innos' getreten. Das bedeutet wohl, dass du von nun an weniger Zeit haben wirst, einem alten Mann seine Kräuter zu bringen.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Dennoch ist es eine große Ehre für mich, dich auf deinem Weg unterstützt zu haben.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Wenn du trotz deiner neuen Pflichten Zeit finden solltest, dich der Alchemie zu widmen, bist du bei mir immer herzlich willkommen.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Wo hast du dich herumgetrieben?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //Ich erwarte mehr von meinem Lehrling, als alle Jubeljahre einmal bei mir reinzuschneien!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //Hast du mir wenigstens Pilze mitgebracht?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //Da bist du ja wieder ...
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
	description = "Was sind meine Aufgaben?";
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
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Was sind meine Aufgaben?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Mir ist klar, dass ich von einem jungen Mann nicht erwarten kann, den ganzen Tag bei mir in der Stube zu verbringen.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //Du wirst mir von Zeit zurzeit die Pflanzen bringen, die ich brauche. Dafür unterweise ich dich in der Kunst der Alchemie.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Die Flaschen kannst du bei mir kaufen. Die Zutaten wirst du dir zum größten Teil selbst besorgen müssen.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //Und ich erwarte von dir, dass du dich als Bürger der Stadt ordentlich aufführst.
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
	description = "Welche Pflanzen soll ich bringen? ";
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
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //Welche Pflanzen soll ich bringen?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Ich werde dir alles abkaufen, was du mir bringst - ich zahle dafür den üblichen Preis.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Für Pilze allerdings werde ich dir einen besonderen Preis zahlen.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bei Constantino kann ich Pilze zu einem besonderen guten Preis verkaufen.");
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
	description = "Du wolltest Pilze ...";
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
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //Du wolltest Pilze ...

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Ich werde dir welche bringen...", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Warum sind dir die Dinger so wichtig?", DIA_Constantino_MushroomsRunning_Why);
	};
	if (Npc_HasItems (other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems (other, ItPl_Mushroom_02) > 0)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Ich habe hier ein paar...", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;
	
	if (Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //Ich habe hier ein paar Dunkelpilze ...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //Ah! Das sind die besten! Gut gemacht! Hier hast du dein Gold!
		Dunkelpilz_dabei = TRUE;
		
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
				
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01) );
		B_GiveInvItems (other, self, ItPl_Mushroom_01, Npc_HasItems (other, ItPl_Mushroom_01));
	};
	
	if (Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_02"); //Und hier sind noch ein paar von den anderen ...
		}
		else
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //Ich habe hier ein paar Pilze!
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Die sind zwar nicht so gut wie Dunkelpilze, aber ich werde sie trotzdem nehmen.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //Warum sind dir die Dinger so wichtig?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //Du bist zwar mein Lehrling, aber alles werde ich dir nicht verraten.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //Also gut - du sollst es wissen. Aber du musst es für dich behalten.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Dunkelpilze tragen magische Energie in sich. Und jedesmal, wenn du einen isst, sammelt sich ein kleines bisschen dieser Energie in deinem Körper.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Wenn du eine ausreichende Menge von diesen Pilzen zu dir genommen hast, steigert das deine magische Energie ...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Hätte ich dir das vorher gesagt, hättest du die Pilze alle selber gefuttert, richtig?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //(seufzt) Oh, Mann!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Das hast du mich schonmal gefragt. (verschmitzt) Wer weiß, vielleicht erzähle ich es dir eines Tages...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Ich werde dir welche bringen ...
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //Gut! Bring mir so viele, wie du nur finden kannst ...
	
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
	description = "Unterrichte mich in der Kunst der Alchemie!";
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
	AI_Output (other, self,"DIA_Constantino_Alchemy_15_00"); //Unterrichte mich in der Kunst der Alchemie!
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //Gut. Zuerst einmal die Grundlagen.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Jeder Trank wird aus Pflanzen gemacht, denn sie besitzen die unterschiedlichsten Kräfte.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Sie tun nichts anderes, als mit all ihrer Kraft zu wachsen - und diese Kraft zu verändern, ist die Kunst der Alchimie.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //Zur Herstellung eines Tranks am Alchemietisch brauchst du eine Laborflasche.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //Du musst die richtige Rezeptur kennen und die entsprechenden Zutaten haben.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //Es gibt eine Reihe von Rezepturen, die ich dir beibringen kann.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //Tränke, die dir verlorene Kräfte zurückgeben und sogar solche, die deine Kräfte permanent verändern.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //Du kannst nicht alles auf einmal lernen. Also wähle mit Bedacht, welches Wissen du dir aneignen willst.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino kann mich in der Kunst der Alchemie unterweisen.");
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
	description = "Ich bin auf der Suche nach neuen Rezepturen für Tränke.";
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
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //Ich bin auf der Suche nach neuen Rezepturen für Tränke.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //Hast du bereits Erfahrung mit der Alchemie.
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Ja, habe ich.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //Und du lebst noch ... das sind schon mal gute Voraussetzungen.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //Ich denke, ich kann dir einige Rezepturen verraten. Es kommt natürlich darauf an, was du wissen willst.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino kann mich in der Kunst der Alchemie unterweisen.");
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
	description = "Welche Rezepturen kannst du mir beibringen?";
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
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //Welche Rezepturen kannst du mir beibringen?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Tut mir Leid. Es gibt nichts mehr, was ich dir beibringen kann.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //Ich kenne einige - triff deine Wahl selbst.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)                                                                                                                                   
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Constantino_TEACH_Mana01);                  
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)   
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)                                                                                                                                                                                                                                                                  
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Constantino_TEACH_Mana02);                 
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
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
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Die Zutaten für eine Essenz der Heilung sind Heilpflanzen und Feldknöterich.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //Um ein Extrakt der Heilung herzustellen, brauchst du Heilkräuter und Feldknöterich.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //Du musst aufpassen, dass du den Extrakt sehr vorsichtig erhitzt.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //Das Elixier der Heilung herzustellen, erfordert einiges an Erfahrung.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //Du brauchst Heilwurzeln und Feldknöterich. Sei diesmal beim Erhitzen besonders vorsichtig.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //Das Elixier des Lebens! Ein seltenes Gebräu. Nicht so sehr wegen des Aufwandes - der Trank ist recht einfach herzustellen.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Aber die Zutaten sind sehr selten. Du brauchst Heilwurzeln und Kronstöckel.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //Die Essenz der Magie ist der einfachste der magischen Tränke.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //Nimm Feuernesseln und Feldknöterich und erhitze sie langsam.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Da du schon einen Essenz der Magie herstellen kannst, wird es dir mit etwas Mühe sicher auch gelingen, einen Extrakt herzustellen.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //Aber du brauchst das richtige Fingerspitzengefühl, wenn du den Sud auskochst. Nimm Feuerkraut und Feldknöterich für diesen Trank.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //Das Elixier der Stärke! Ein meisterlicher Trank. Du brauchst die seltenen Drachenwurzeln und Kronstöckl.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //Wenn du den Sud aufkochst, achte darauf, dass die Bläschen nicht zu groß werden, sonst erlebst du dein blaues Wunder!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


