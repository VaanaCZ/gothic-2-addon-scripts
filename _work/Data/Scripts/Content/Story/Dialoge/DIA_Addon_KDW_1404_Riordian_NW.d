///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Riordian_EXIT   (C_INFO)
{
	npc         = KDW_1404_Addon_Riordian_NW;
	nr          = 999;
	condition   = DIA_Addon_Riordian_EXIT_Condition;
	information = DIA_Addon_Riordian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Riordian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Riordian_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1404_Addon_Riordian_NW;
	nr			= 900;
	condition	= DIA_Addon_Riordian_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Riordian_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Riordian_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Riordian_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Riordian_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Riordian_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Riordian_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Riordian_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Riordian_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Riordian_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_LightningFlash, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Riordian_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Riordian_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Riordian_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Hallo		(C_INFO)
{
	npc			 = 	KDW_1404_Addon_Riordian_NW;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Riordian_Hallo_Condition;
	information	 = 	DIA_Addon_Riordian_Hallo_Info;
	description	 = 	"Cosa stai facendo qui?";
};

func int DIA_Addon_Riordian_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Hallo_15_00"); //Cosa stai facendo?
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_01"); //Sto studiando la cultura del popolo antico.
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_02"); //Stando a queste iscrizioni, quelle genti vissero molto tempo fa.
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_03"); //Non so QUANDO eressero questi edifici, ma la loro civiltà aveva raggiunto un elevato livello di sviluppo.
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_04"); //Costruirono una città sull'altro versante delle montagne. (riflettendo) E un tempio per Adanos.
};
///////////////////////////////////////////////////////////////////////
//	Info Alter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Alter		(C_INFO)
{
	npc			 = 	KDW_1404_Addon_Riordian_NW;
	nr			 = 	6;
	condition	 = 	DIA_Addon_Riordian_Alter_Condition;
	information	 = 	DIA_Addon_Riordian_Alter_Info;
	description	 = 	"Quanti anni pensi che abbia questo edificio?";
};
func int DIA_Addon_Riordian_Alter_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Addon_Riordian_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Addon_Riordian_Alter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Alter_15_00"); //Quanti anni pensi che abbia questo edificio?
	AI_Output	(self, other, "DIA_Addon_Riordian_Alter_10_01"); //Di preciso non lo so ancora, ma deve risalire a centinaia di anni fa.
};
///////////////////////////////////////////////////////////////////////
//	Info Atlantis
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Atlantis		(C_INFO)
{
	npc			 = 	KDW_1404_Addon_Riordian_NW;
	nr			 = 	4;
	condition	 = 	DIA_Addon_Riordian_Atlantis_Condition;
	information	 = 	DIA_Addon_Riordian_Atlantis_Info;
	description	 = 	"Una città perduta sull'isola di Khorinis?";
};

func int DIA_Addon_Riordian_Atlantis_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Addon_Riordian_Hallo)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Atlantis_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Atlantis_15_00"); //Una città perduta sull'isola di Khorinis?
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_01"); //Già. Finora siamo vissuti nella convinzione di conoscere tutta l'isola.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_02"); //Ritenevamo che la zona nordorientale fosse occupata da un'unica catena montuosa.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_03"); //Ma ci sbagliavamo.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_04"); //Oltre queste montagne si apre una valle, e lì sorgeva la città fondata dal popolo antico.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_05"); //(sospira) Sarebbe bellissimo poterne ammirare gli edifici, ma credo che siano da tempo ridotti in macerie...
	
	B_LogEntry (TOPIC_Addon_KDW,"I Maghi dell'Acqua sospettano che dietro il portale si trovi un'antica città perduta."); 
};
///////////////////////////////////////////////////////////////////////
//	Info SaturasWantYou
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_SaturasWantYou		(C_INFO)
{
	npc			 = 	KDW_1404_Addon_Riordian_NW;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Riordian_SaturasWantYou_Condition;
	information	 = 	DIA_Addon_Riordian_SaturasWantYou_Info;
	description	 = 	"Saturas vuole vederti.";
};

func int DIA_Addon_Riordian_SaturasWantYou_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_Hallo))
	&& (MIS_Addon_Saturas_BringRiordian2Me == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SaturasWantYou_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_SaturasWantYou_15_00"); //Saturas vuole vederti.
	AI_Output	(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_01"); //Ha fatto progressi nelle indagini? Allora andrò da lui immediatamente.
	
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_02"); //Se vuoi saperne di più su questo complesso, parla con Nefarius.
		AI_Output	(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_03"); //Si è addentrato nei sotterranei, lo troverai lì.
	};	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Saturas");
	MIS_Addon_Saturas_BringRiordian2Me = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
var int Riordian_PermNews;

instance DIA_Addon_Riordian_Perm		(C_INFO)
{
	npc			 = 	KDW_1404_Addon_Riordian_NW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Riordian_Perm_Condition;
	information	 = 	DIA_Addon_Riordian_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ci sono novità?";
};

func int DIA_Addon_Riordian_Perm_Condition ()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Perm_15_00"); //Ci sono novità?
	if (Riordian_PermNews == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_Perm_10_01"); //È confermato: il popolo antico credeva in Adanos!
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_Perm_10_02"); //No. Torna un'altra volta.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachPre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_TeachPre		(C_INFO)
{
	npc			 = 	KDW_1404_Addon_Riordian_NW;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Riordian_TeachPre_Condition;
	information	 = 	DIA_Addon_Riordian_TeachPre_Info;

	description	 = 	"Vatras mi ha dato questo amuleto del fuoco fatuo cercatore…";
};
func int DIA_Addon_Riordian_TeachPre_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_Hallo))
	&& (Npc_HasItems (other,ItAm_Addon_WispDetector))
		{
			return TRUE;
		};
};
func void DIA_Addon_Riordian_TeachPre_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_TeachPre_15_00"); //Vatras mi ha dato questo amuleto del fuoco fatuo indagatore...
	AI_Output	(self, other, "DIA_Addon_Riordian_TeachPre_10_01"); //Ah! (in tono circospetto) Un manufatto raro. Puoi usarlo per addestrare i fuochi fatui, lo sapevi?
	AI_Output	(other, self, "DIA_Addon_Riordian_TeachPre_15_02"); //Puoi insegnarmi a farlo?
	AI_Output	(self, other, "DIA_Addon_Riordian_TeachPre_10_03"); //Volentieri. Ho una grande esperienza con questo tipo di magia.
	Riordian_Addon_TeachPlayer = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeach);
};
///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Teach		(C_INFO)
{
	npc		 = 	KDW_1404_Addon_Riordian_NW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Riordian_Teach_Condition;
	information	 = 	DIA_Addon_Riordian_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Fammi vedere come posso addestrare il mio fuoco fatuo.";
};
var int DIA_Addon_Riordian_Teach_NoPerm;

func int DIA_Addon_Riordian_Teach_Condition ()
{
	if (Riordian_Addon_TeachPlayer == TRUE)
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	&& (Npc_HasItems (other,ItAm_Addon_WispDetector))
		{
			return TRUE;
		};
};
func void DIA_Addon_Riordian_Teach_Info ()
{
	B_DIA_Addon_Riordian_Teach_15_00 ();

	if ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF]	 	== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF]		== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] 	== FALSE)	
	{                                            
		Info_ClearChoices (DIA_Addon_Riordian_Teach);
		Info_AddChoice (DIA_Addon_Riordian_Teach,DIALOG_BACK,DIA_Addon_Riordian_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01 ();

		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FF, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF)),DIA_Addon_Riordian_Teach_WISPSKILL_FF);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_NONE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE)),DIA_Addon_Riordian_Teach_WISPSKILL_NONE);
		};
			
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_RUNE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE)),DIA_Addon_Riordian_Teach_WISPSKILL_RUNE);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_MAGIC, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC)),DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC);
		};
			
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FOOD, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD)),DIA_Addon_Riordian_Teach_WISPSKILL_FOOD);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_POTIONS, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS)),DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS);
		};
	}
	else 
	{
		B_DIA_Addon_Riordian_Teach_10_08 ();
		DIA_Addon_Riordian_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Riordian_Teach_WISPSKILL_X ()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00 ();
};
FUNC VOID DIA_Addon_Riordian_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Riordian_Teach);
};
FUNC VOID DIA_Addon_Riordian_Teach_WISPSKILL_FF ()
{
	if B_TeachPlayerTalentWispDetector  (self, other, WISPSKILL_FF)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_Teach);
};
FUNC VOID DIA_Addon_Riordian_Teach_WISPSKILL_NONE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_NONE)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_Teach);
};
FUNC VOID DIA_Addon_Riordian_Teach_WISPSKILL_RUNE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_RUNE)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_Teach);
};
FUNC VOID DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_MAGIC)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_Teach);
};
FUNC VOID DIA_Addon_Riordian_Teach_WISPSKILL_FOOD ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_FOOD)
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X ();
	};	
	Info_ClearChoices (DIA_Addon_Riordian_Teach);
};
FUNC VOID DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_POTIONS)
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X ();
	};
	Info_ClearChoices (DIA_Addon_Riordian_Teach);
};


