// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Lares_DI_EXIT(C_INFO)
{
	npc			= VLK_449_Lares_DI;
	nr			= 999;
	condition	= DIA_Lares_DI_EXIT_Condition;
	information	= DIA_Lares_DI_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Lares_DI_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Lares_DI_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************

INSTANCE DIA_Lares_DI_Hallo (C_INFO)
{
	npc			= VLK_449_Lares_DI;
	nr			= 2;
	condition	= DIA_Lares_DI_Hallo_Condition;
	information	= DIA_Lares_DI_Hallo_Info;
	permanent	 = 	TRUE;

	description = "Co s³ychaæ?";
};                       
FUNC INT DIA_Lares_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lares_DI_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_Lares_DI_Hallo_15_00"); //Jak idzie?

	if (ORkSturmDI == TRUE)
	{
		AI_Output (self ,other,"DIA_Lares_DI_Hallo_09_01"); //Poœpiesz siê. Orkowie na pewno wróc¹.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_DI_Hallo_09_02"); //Ta grota rzeczywiœcie jest straszna.
	};
};

// ************************************************************
// 	  	  Training
// ************************************************************

INSTANCE DIA_Lares_DI_Training (C_INFO)
{
	npc			= VLK_449_Lares_DI;
	nr			= 10;
	condition	= DIA_Lares_DI_Training_Condition;
	information	= DIA_Lares_DI_Training_Info;
	permanent	 = 	TRUE;

	description = "Naucz mnie tego, co potrafisz.";
};                       
FUNC INT DIA_Lares_DI_Training_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lares_DI_Training_Info()
{	
	AI_Output (other,self ,"DIA_Lares_DI_Training_15_00"); //Naucz mnie tego, co potrafisz.
	AI_Output (self ,other,"DIA_Lares_DI_Training_09_01"); //¯aden problem.
	
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Nauka skradania siê"	,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lares_DI_Training_1H_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lares_DI_Training_1H_5);
	
};

FUNC VOID DIA_Lares_DI_Training_1H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100))
	{
			AI_Output (self ,other,"DIA_Lares_DI_Training_1H_1_09_00"); //Musisz lekko ugi¹æ wysuniêt¹ nogê, a drug¹ trzymaæ prosto. Dziêki temu ³atwiej zachowasz równowagê.
	};
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Nauka skradania siê"	,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lares_DI_Training_1H_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5		, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lares_DI_Training_1H_5);
	
};

FUNC VOID DIA_Lares_DI_Training_1H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100))
	{
			AI_Output (self ,other,"DIA_Lares_DI_Training_1H_5_09_00"); //Biodra powinny byæ w ruchu. Bêdzie ci ³atwiej unikn¹æ ataku.
	};
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Nauka skradania siê"	,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lares_DI_Training_1H_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lares_DI_Training_1H_5);
	
};


//***************************************************************************
// DEX 1
//***************************************************************************

func void DIA_Lares_DI_Training_DEX_1 ()
{
	if (B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED))
	{
		AI_Output (self ,other,"DIA_Lares_DI_Training_DEX_1_09_00"); //Górna czêœæ cia³a musi poruszaæ siê w zgodzie z reszt¹.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Nauka skradania siê"	,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1		, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lares_DI_Training_1H_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5		, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lares_DI_Training_1H_5);
	
};

//***************************************************************************
// DEX 5
//***************************************************************************

func void DIA_Lares_DI_Training_DEX_5 ()
{
	if (B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED))
	{
		AI_Output (self ,other,"DIA_Lares_DI_Training_DEX_5_09_00"); //Ca³y czas musisz uwa¿aæ, ¿eby nie straciæ równowagi.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Nauka skradania siê"	,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lares_DI_Training_1H_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lares_DI_Training_1H_5);
	
};

// ------ SNEAK ------
func void DIA_Lares_DI_Training_SNEAK ()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
	{
		AI_Output (self ,other,"DIA_Lares_DI_Training_SNEAK_09_00"); //Zawsze stawiaj ca³¹ stopê, kiedy siê skradasz.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Nauka skradania siê"	,DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lares_DI_Training_1H_1);
	Info_AddChoice		(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lares_DI_Training_1H_5);
	
};

// ------ Back ------
func void DIA_Lares_DI_Training_BACK ()
{
	Info_ClearChoices (DIA_Lares_DI_Training);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************

INSTANCE DIA_Lares_DI_UndeadDragonDead (C_INFO)
{
	npc			= VLK_449_Lares_DI;
	nr			= 5;
	condition	= DIA_Lares_DI_UndeadDragonDead_Condition;
	information	= DIA_Lares_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;

	description = "Wygl¹dasz, jakbyœ niezbyt siê tym przejmowa³.";
};                       
FUNC INT DIA_Lares_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Lares_DI_UndeadDragonDead_OneTime;
FUNC VOID DIA_Lares_DI_UndeadDragonDead_Info()
{	
	AI_Output (other,self ,"DIA_Lares_DI_UndeadDragonDead_15_00"); //Wygl¹dasz, jakbyœ niezbyt siê tym przejmowa³.
	AI_Output (self ,other,"DIA_Lares_DI_UndeadDragonDead_09_01"); //Ech, no wiesz. Myœla³em, ¿e ci siê uda.

	if (DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE )
	{
		AI_Output (other,self ,"DIA_Lares_DI_UndeadDragonDead_15_02"); //Co zamierzasz teraz zrobiæ?
		AI_Output (self ,other,"DIA_Lares_DI_UndeadDragonDead_09_03"); //Nie mam pojêcia. Na razie bêdê siê chyba trzymaæ ciebie.
		
		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos (self);
};
