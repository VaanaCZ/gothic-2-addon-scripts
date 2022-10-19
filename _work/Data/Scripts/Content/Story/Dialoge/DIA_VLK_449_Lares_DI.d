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

	description = "Wie sieht's aus?";
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
	AI_Output (other,self ,"DIA_Lares_DI_Hallo_15_00"); //Wie sieht's aus?

	if (ORkSturmDI == TRUE)
	{
		AI_Output (self ,other,"DIA_Lares_DI_Hallo_09_01"); //Beeil dich ein bisschen. Die Orks kommen bestimmt noch mal wieder.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_DI_Hallo_09_02"); //Na ja. Recht gespenstisch, die Grotte hier.
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

	description = "Bring mir deine Fähigkeiten bei.";
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
	AI_Output (other,self ,"DIA_Lares_DI_Training_15_00"); //Bring mir deine Fähigkeiten bei.
	AI_Output (self ,other,"DIA_Lares_DI_Training_09_01"); //Kein Problem.
	
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Schleichen lernen"	,DIA_Lares_DI_Training_SNEAK);
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
			AI_Output (self ,other,"DIA_Lares_DI_Training_1H_1_09_00"); //Du musst das vordere Bein etwas gebeugt und das hintere gesteckt halten, dann hast du einen festeren Stand.
	};
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Schleichen lernen"	,DIA_Lares_DI_Training_SNEAK);
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
			AI_Output (self ,other,"DIA_Lares_DI_Training_1H_5_09_00"); //Bleibe in deiner Hüfte flexibel, dann kannst du dich bei einem Gegenangriff besser wegdrehen.
	};
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Schleichen lernen"	,DIA_Lares_DI_Training_SNEAK);
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
		AI_Output (self ,other,"DIA_Lares_DI_Training_DEX_1_09_00"); //Die obere Hälfte deines Körpers muss immer in Harmonie mit dem Rest agieren.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Schleichen lernen"	,DIA_Lares_DI_Training_SNEAK);
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
		AI_Output (self ,other,"DIA_Lares_DI_Training_DEX_5_09_00"); //Bei deinen Füssen musst du immer auf ihre Stellung achten.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Schleichen lernen"	,DIA_Lares_DI_Training_SNEAK);
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
		AI_Output (self ,other,"DIA_Lares_DI_Training_SNEAK_09_00"); //Benutze immer die ganze Fußsohle beim Schleichen.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Schleichen lernen"	,DIA_Lares_DI_Training_SNEAK);
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

	description = "Dich kümmert das Ganze scheinbar überhaupt nicht.";
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
	AI_Output (other,self ,"DIA_Lares_DI_UndeadDragonDead_15_00"); //Dich kümmert das Ganze scheinbar überhaupt nicht.
	AI_Output (self ,other,"DIA_Lares_DI_UndeadDragonDead_09_01"); //Ach, weißt du, ich habe mir gedacht, dass du es schaffen würdest.

	if (DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE )
	{
		AI_Output (other,self ,"DIA_Lares_DI_UndeadDragonDead_15_02"); //Was hast du jetzt vor?
		AI_Output (self ,other,"DIA_Lares_DI_UndeadDragonDead_09_03"); //Keine Ahnung. Ich werde dir erst einmal folgen, schätze ich.
		
		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos (self);
};
