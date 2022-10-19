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
	description	 = 	"Co robisz?";
};

func int DIA_Addon_Riordian_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Hallo_15_00"); //Co robisz?
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_01"); //Badam kulturê tego staro¿ytnego ludu.
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_02"); //Z inskrypcji wiemy, ¿e ¿yli tu bardzo dawno temu.
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_03"); //Nie wiem dok³adnie, KIEDY powsta³a ta budowla, ale ich cywilizacja by³a bardzo rozwiniêta.
	AI_Output	(self, other, "DIA_Addon_Riordian_Hallo_10_04"); //Zbudowali miasto po drugiej stronie gór. Oraz œwi¹tyniê Adanosa.
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
	description	 = 	"Na ile lat oceniasz wiek tego budynku?";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_Alter_15_00"); //Na ile lat oceniasz wiek tego budynku?
	AI_Output	(self, other, "DIA_Addon_Riordian_Alter_10_01"); //Nie potrafiê powiedzieæ dok³adnie, ale na pewno ma ju¿ kilkaset lat.
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
	description	 = 	"Zaginione miasto na wyspie Khorinis?";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_Atlantis_15_00"); //Zaginione miasto na wyspie Khorinis?
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_01"); //Tak. Do tej pory myœleliœmy, ¿e znamy ca³¹ wyspê.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_02"); //S¹dziliœmy, ¿e ca³¹ jej pó³nocno-wschodni¹ czêœæ zajmuje ogromny masyw górski.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_03"); //Ale myliliœmy siê.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_04"); //Za górami le¿y dolina. Znajdowa³o siê tam miasto prastarej cywilizacji.
	AI_Output	(self, other, "DIA_Addon_Riordian_Atlantis_10_05"); //Chêtnie bym zobaczy³ budynki tego miasta, ale pewnie rozpad³y siê w py³ wieki temu...
	
	B_LogEntry (TOPIC_Addon_KDW,"Magowie Wody podejrzewaj¹, ¿e za portalem znajduje siê staro¿ytne, zaginione miasto."); 
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
	description	 = 	"Saturas chce ciê widzieæ.";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_SaturasWantYou_15_00"); //Saturas chce ciê widzieæ.
	AI_Output	(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_01"); //Czy¿by posun¹³ siê naprzód ze swym dochodzeniem? W takim razie natychmiast siê z nim zobaczê.
	
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_02"); //Jeœli chcesz siê dowiedzieæ wiêcej o tym miejscu, porozmawiaj z Nefariusem.
		AI_Output	(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_03"); //Znajdziesz go w g³êbi krypt.
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

	description	 = 	"Dowiedzia³eœ siê czegoœ nowego?";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_Perm_15_00"); //Dowiedzia³eœ siê czegoœ nowego?
	if (Riordian_PermNews == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_Perm_10_01"); //Wiem, ¿e ta prastara cywilizacja czci³a Adanosa!
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_Perm_10_02"); //Raczej nie. Wróæ póŸniej.
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

	description	 = 	"Vatras da³ mi Amulet Szukaj¹cego Ognika...";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_TeachPre_15_00"); //Vatras da³ mi Amulet Szukaj¹cego Ognika...
	AI_Output	(self, other, "DIA_Addon_Riordian_TeachPre_10_01"); //Ach! To rzadki artefakt. Za jego pomoc¹ mo¿esz wyszkoliæ ognika.
	AI_Output	(other, self, "DIA_Addon_Riordian_TeachPre_15_02"); //Mo¿esz mi w tym pomóc?
	AI_Output	(self, other, "DIA_Addon_Riordian_TeachPre_10_03"); //Oczywiœcie. Przez d³ugi czas zajmowa³em siê tym rodzajem magii.
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

	description	 = 	"Poka¿ mi, jak wyszkoliæ mojego ognika.";
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


