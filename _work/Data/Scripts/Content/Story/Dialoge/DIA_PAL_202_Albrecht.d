///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Albrecht_EXIT   (C_INFO)
{
	npc         = PAL_202_Albrecht;
	nr          = 999;
	condition   = DIA_Albrecht_EXIT_Condition;
	information = DIA_Albrecht_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Albrecht_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Albrecht_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hagen		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  1;
	condition	 = 	DIA_Albrecht_Hagen_Condition;
	information	 = 	DIA_Albrecht_Hagen_Info;
	permanent    =  FALSE;
	description	 =  "I need to talk to Lord Hagen!";
};

func int DIA_Albrecht_Hagen_Condition ()
{	
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Hagen_15_00"); //I need to talk to Lord Hagen!
	AI_Output (self, other, "DIA_Albrecht_Hagen_03_01"); //He's in the great hall, straight through there.
	AI_Output (self, other, "DIA_Albrecht_Hagen_03_02"); //Whatever it is you want from him, keep it short - he is a busy man!
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hallo		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  2;
	condition	 = 	DIA_Albrecht_Hallo_Condition;
	information	 = 	DIA_Albrecht_Hallo_Info;
	permanent    =  FALSE;
	description	 =  "What does it mean to be a paladin?";
};

func int DIA_Albrecht_Hallo_Condition ()
{	
	return TRUE;
};
func void DIA_Albrecht_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Hallo_15_00"); //What does it mean to be a paladin?
	AI_Output (self, other, "DIA_Albrecht_Hallo_03_01"); //A paladin is a warrior of Innos. He lives in order to serve him, and fights in order to do him honor.
	AI_Output (self, other, "DIA_Albrecht_Hallo_03_02"); //In return, the gift of magic is bestowed upon us. The magic of runes - which we are granted as recognition for our deeds.
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_CanTeach		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  99;
	condition	 = 	DIA_Albrecht_CanTeach_Condition;
	information	 = 	DIA_Albrecht_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Can you teach me something?";
};

func int DIA_Albrecht_CanTeach_Condition ()
{	
	if  (Albrecht_TeachMANA == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Albrecht_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_CanTeach_15_00"); //Can you teach me something?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_01"); //If you prove yourself worthy, I shall bestow the magic runes of the paladins upon you.
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_02"); //Beyond that, I can teach you to increase your magic power.
		Albrecht_TeachMANA = TRUE;
		B_LogEntry (TOPIC_CityTeacher,"The paladin Albrecht can help me increase my magic powers.");
	}
	else
	{	
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_03"); //I only instruct paladins.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHPalRunes
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_TEACHPalRunes		(C_INFO)
{
	npc		  	 = 	PAL_202_Albrecht;
	nr			 = 	100;
	condition	 = 	DIA_Albrecht_TEACHPalRunes_Condition;
	information	 = 	DIA_Albrecht_TEACHPalRunes_Info;
	permanent	 = 	TRUE;
	description	 = 	"Am I worthy of receiving a rune?";
};
func int DIA_Albrecht_TEACHPalRunes_Condition ()
{	
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_TEACHPalRunes_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_TEACHPalRunes_15_00"); //Am I worthy of receiving a rune?
	
	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_01"); //As a sign of your rank, I bestow upon you the Rune of Light. It is the symbol of truth and justice.
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_02"); //Light the way for all those who walk the path of Innos.
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_03"); //You must earn all other runes. Come again when you think you have proven yourself worthy.
	
		PLAYER_TALENT_RUNES [SPL_PalLight] = TRUE;
	
		CreateInvItems (self,ItRu_PalLight,1);
		B_GiveInvItems (self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_04"); //Which way have you chosen?
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_05"); //The way of healing or the way of battle?
		
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,"I choose the path of healing.",DIA_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,"I choose the path of combat.",DIA_Albrecht_TEACHPalRunes_Combat);
	};	
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
};

FUNC VOID B_Albrecht_YouAreNotWorthy ()
{
	AI_Output (self ,other,"B_Albrecht_YouAreNotWorthy_03_00"); //You are not yet worthy of receiving the next spell for this path.
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output (other,self ,"DIA_Albrecht_TEACHPalRunes_Heal_15_00"); //I choose the path of healing.
	if  (PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	&&	(MIS_ReadyforChapter4 == TRUE)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Heal Light Wounds", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Heal Medium Wounds", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output (other,self ,"DIA_Albrecht_TEACHPalRunes_Combat_15_00"); //I choose the path of combat.
	
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	&&	(MIS_ReadyforChapter4 == TRUE)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Holy Arrow", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Expel evil", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};


FUNC INT DIA_Albrecht_TEACHPalRunes_PalLightHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalLightHeal] = TRUE;
	CreateInvItems (self,ItRu_PalLightHeal,1);
	B_GiveInvItems (self,other,ItRu_PalLightHeal,1);
	other.lp = (other.lp -CostForPalSpells);
	Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes); 

	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalMediumHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	PLAYER_TALENT_RUNES [SPL_PalMediumHeal] = TRUE;
	CreateInvItems (self,ItRu_PalMediumHeal,1);
	B_GiveInvItems (self,other,ItRu_PalMediumHeal,1); 
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalHolyBolt()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalHolyBolt] = TRUE;
	CreateInvItems (self,ItRu_PalHolyBolt,1);
	B_GiveInvItems (self,other,ItRu_PalHolyBolt,1);  
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalRepelEvil()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalRepelEvil] = TRUE;
	CreateInvItems (self,ItRu_PalRepelEvil,1);
	B_GiveInvItems (self,other,ItRu_PalRepelEvil,1);
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};



///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Teach		(C_INFO)
{
	npc		  	 = 	PAL_202_Albrecht;
	nr			 = 	101;
	condition	 = 	DIA_Albrecht_Teach_Condition;
	information	 = 	DIA_Albrecht_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"I want to increase my magic powers.";
};
func int DIA_Albrecht_Teach_Condition ()
{	
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_Teach_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Teach_15_00"); //I want to increase my magic power.
	
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
};
func void DIA_Albrecht_Teach_BACK()
{
	if (other.attribute [ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_Albrecht_Teach_03_00"); //If you want to increase your magic power even further, you must seek another teacher.
	};
	Info_ClearChoices (DIA_Albrecht_TEACH);
};
func void DIA_Albrecht_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_TEACH_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
	
};
func void DIA_Albrecht_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Albrecht_PICKPOCKET (C_INFO)
{
	npc			= PAL_202_Albrecht;
	nr			= 900;
	condition	= DIA_Albrecht_PICKPOCKET_Condition;
	information	= DIA_Albrecht_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Albrecht_PICKPOCKET_Condition()
{
	C_Beklauen (41, 160);
};
 
FUNC VOID DIA_Albrecht_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Albrecht_PICKPOCKET);
	Info_AddChoice		(DIA_Albrecht_PICKPOCKET, DIALOG_BACK 		,DIA_Albrecht_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Albrecht_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Albrecht_PICKPOCKET_DoIt);
};

func void DIA_Albrecht_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Albrecht_PICKPOCKET);
};
	
func void DIA_Albrecht_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Albrecht_PICKPOCKET);
};




