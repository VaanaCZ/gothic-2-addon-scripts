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

	description = "Qu'y a-t-il?";
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
	AI_Output (other,self ,"DIA_Lares_DI_Hallo_15_00"); //Comment �a se passe ?

	if (ORkSturmDI == TRUE)
	{
		AI_Output (self ,other,"DIA_Lares_DI_Hallo_09_01"); //D�p�chez-vous�! Les orques ne vont sans doute pas tarder � revenir�!
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_DI_Hallo_09_02"); //Hmm... cette grotte me flanque la chair de poule...
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

	description = "Apprenez-moi ce que vous savez.";
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
	AI_Output (other,self ,"DIA_Lares_DI_Training_15_00"); //Enseignez-moi vos comp�tences.
	AI_Output (self ,other,"DIA_Lares_DI_Training_09_01"); //Pas de probl�me.
	
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Apprendre � �tre discret"	,DIA_Lares_DI_Training_SNEAK);
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
			AI_Output (self ,other,"DIA_Lares_DI_Training_1H_1_09_00"); //Pliez l�g�rement la jambe avant afin de garder l'autre bien droite. De cette mani�re, vous aurez une meilleure assise.
	};
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Apprendre � �tre discret"	,DIA_Lares_DI_Training_SNEAK);
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
			AI_Output (self ,other,"DIA_Lares_DI_Training_1H_5_09_00"); //Gardez les hanches bien souples afin de pouvoir esquiver les contre-attaques.
	};
	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Apprendre � �tre discret"	,DIA_Lares_DI_Training_SNEAK);
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
		AI_Output (self ,other,"DIA_Lares_DI_Training_DEX_1_09_00"); //Le haut du corps doit agir en harmonie avec les jambes.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Apprendre � �tre discret"	,DIA_Lares_DI_Training_SNEAK);
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
		AI_Output (self ,other,"DIA_Lares_DI_Training_DEX_5_09_00"); //Regardez toujours o� vous mettez les pieds.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Apprendre � �tre discret"	,DIA_Lares_DI_Training_SNEAK);
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
		AI_Output (self ,other,"DIA_Lares_DI_Training_SNEAK_09_00"); //Marchez bien sur le plat du pied quand vous essayez d'avancer discr�tement.
	};

	Info_ClearChoices (DIA_Lares_DI_Training);
	Info_AddChoice	  (DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(DIA_Lares_DI_Training, "Apprendre � �tre discret"	,DIA_Lares_DI_Training_SNEAK);
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

	description = "Tout cela ne semble pas beaucoup vous pr�occuper.";
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
	AI_Output (other,self ,"DIA_Lares_DI_UndeadDragonDead_15_00"); //Tout ceci n'a gu�re l'air de vous pr�occuper...
	AI_Output (self ,other,"DIA_Lares_DI_UndeadDragonDead_09_01"); //Bah. C'est que j'�tais s�r que vous y arriveriez, c'est tout.

	if (DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE )
	{
		AI_Output (other,self ,"DIA_Lares_DI_UndeadDragonDead_15_02"); //Que comptez-vous faire maintenant�?
		AI_Output (self ,other,"DIA_Lares_DI_UndeadDragonDead_09_03"); //Pas la moindre id�e. J'imagine que je vais vous suivre pour le moment.
		
		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos (self);
};
