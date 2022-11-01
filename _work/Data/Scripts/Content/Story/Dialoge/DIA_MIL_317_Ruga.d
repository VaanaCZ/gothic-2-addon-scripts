///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ruga_EXIT   (C_INFO)
{
	npc         = Mil_317_Ruga;
	nr          = 999;
	condition   = DIA_Ruga_EXIT_Condition;
	information = DIA_Ruga_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ruga_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ruga_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ruga_PICKPOCKET (C_INFO)
{
	npc			= Mil_317_Ruga;
	nr			= 900;
	condition	= DIA_Ruga_PICKPOCKET_Condition;
	information	= DIA_Ruga_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait facile de lui voler la clef)";
};                       

FUNC INT DIA_Ruga_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_03) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ruga_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ruga_PICKPOCKET);
	Info_AddChoice		(DIA_Ruga_PICKPOCKET, DIALOG_BACK 		,DIA_Ruga_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ruga_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ruga_PICKPOCKET_DoIt);
};

func void DIA_Ruga_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_03, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Ruga_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Ruga_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ruga_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_Hallo		(C_INFO)
{
	npc		 	 = 	Mil_317_Ruga;
	nr			 =  2;
	condition	 = 	DIA_Ruga_Hallo_Condition;
	information	 = 	DIA_Ruga_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Ruga_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Ruga_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ruga_Hallo_15_00"); //Que faites-vous ici ?
	AI_Output (self, other, "DIA_Ruga_Hallo_11_01"); //J'apprends aux gars à se servir d'une arbalète et à devenir un peu plus adroits.
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Ruga, un garde de la ville, peut m'aider à augmenter ma Dextérité et m'apprendre à utiliser une arbalète. Mais pour cela, je dois d'abord servir le roi.");
};
///////////////////////////////////////////////////////////////////////
//	Info Train
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_Train		(C_INFO)
{
	npc			 = 	Mil_317_Ruga;
	nr			 = 	5;
	condition	 = 	DIA_Ruga_Train_Condition;
	information	 = 	DIA_Ruga_Train_Info;
	permanent	 = 	TRUE;
	description	 = 	"Pouvez-vous m'entraîner ?";
};

func int DIA_Ruga_Train_Condition ()
{
	if (Ruga_TeachCrossbow == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ruga_Train_Info ()
{
	AI_Output (other, self, "DIA_Ruga_Train_15_00"); //Pouvez-vous m'entraîner ?
	
	if (hero.guild == GIL_MIL)
	|| (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ruga_Train_11_01"); //Bien sûr. Si vous êtes assez expérimenté, je peux vous aider.
		AI_Output (self, other, "DIA_Ruga_Train_11_02"); //Rappelez-vous bien que la dextérité et le combat à distance sont comme l'arbalète et le carreau. L'un...
		AI_Output (other, self, "DIA_Ruga_Train_15_03"); //… ne vaut rien sans l'autre. J'ai bien compris.
	
		Ruga_TeachCrossbow = TRUE;
		Ruga_TeachDEX 	   = TRUE;
	}
	else if ((hero.guild == GIL_SLD)
	|| 		 (hero.guild == GIL_DJG))
	{
		AI_Output (self, other, "DIA_Ruga_Train_11_04"); //Hors de ma vue, (méprisant) mercenaire.
		AI_StopProcessInfos (self);
	}
	else 
	{	 
		AI_Output (self, other, "DIA_Ruga_Train_11_05"); //Non, je n'entraîne que les hommes au service du roi. Personne d'autre.
		AI_Output (self, other, "DIA_Ruga_Train_11_06"); //Mais nous avons toujours besoin de monde. Si vous voulez vous joindre à la milice, allez parler au seigneur Hagen.
	};     
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Ruga_Teach(C_INFO)
{
	npc			= Mil_317_Ruga;
	nr			= 100;
	condition	= DIA_Ruga_Teach_Condition;
	information	= DIA_Ruga_Teach_Info;
	permanent	= TRUE;
	description = "Montrez-moi comment me servir d'une arbalète.";
};                       
//-------------------------------------
var int DIA_Ruga_Teach_permanent;
//------------------------------------- 
FUNC INT DIA_Ruga_Teach_Condition()
{
	if (Ruga_TeachCrossbow == TRUE)
	&& (DIA_Ruga_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Ruga_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Ruga_Teach_15_00"); //Montrez-moi comment me servir d'une arbalète.

	Info_ClearChoices 	(DIA_Ruga_Teach);
	Info_AddChoice 		(DIA_Ruga_Teach,	DIALOG_BACK		,DIA_Ruga_Teach_Back);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Ruga_Teach_1H_1);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))		,DIA_Ruga_Teach_1H_5);
};

FUNC VOID DIA_Ruga_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 90)
	{
		AI_Output(self,other,"DIA_Ruga_Teach_11_00"); //Je ne peux rien vous apprendre de plus. Il est temps de vous trouver un autre professeur.
		DIA_Ruga_Teach_permanent = TRUE;
		
	};
	Info_ClearChoices (DIA_Ruga_Teach);
};

FUNC VOID DIA_Ruga_Teach_1H_1 ()
{
	 B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 90);
	
	Info_ClearChoices 	(DIA_Ruga_Teach);
	Info_AddChoice 		(DIA_Ruga_Teach,	DIALOG_BACK		,DIA_Ruga_Teach_Back);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,DIA_Ruga_Teach_1H_1);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Ruga_Teach_1H_5);
	
};
FUNC VOID DIA_Ruga_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 90);
	
	Info_ClearChoices 	(DIA_Ruga_Teach);
	Info_AddChoice 		(DIA_Ruga_Teach,	DIALOG_BACK		,DIA_Ruga_Teach_Back);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,DIA_Ruga_Teach_1H_1);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Ruga_Teach_1H_5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_TEACHDEX		(C_INFO)
{
	npc		  	 = 	Mil_317_Ruga;
	nr			 = 	101;
	condition	 = 	DIA_Ruga_TEACHDEX_Condition;
	information	 = 	DIA_Ruga_TEACHDEX_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux devenir plus agile.";
};
//------------------------------------
var int DIA_Ruga_TEACHDEX_permanent;
//------------------------------------
func int DIA_Ruga_TEACHDEX_Condition ()
{	
	if (Ruga_TeachDEX == TRUE)
	&& (DIA_Ruga_TEACHDEX_permanent == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ruga_TEACHDEX_Info ()
{
	AI_Output (other, self, "DIA_Ruga_TEACHDEX_15_00"); //Je voudrais devenir plus agile.
	
	Info_ClearChoices   (DIA_Ruga_TEACHDEX);
	Info_AddChoice 		(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Ruga_TEACHDEX_1);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Ruga_TEACHDEX_5);
	
};
func void DIA_Ruga_TEACHDEX_BACK()
{
	if (other.attribute[ATR_DEXTERITY] >= T_LOW)
	{
		AI_Output (self, other, "DIA_Ruga_TEACHDEX_11_00"); //C'est tout ce que je suis en mesure de vous enseigner. Allez trouver un autre maître si vous voulez devenir plus agile.
		DIA_Ruga_TEACHDEX_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Ruga_TEACHDEX);
};
func void DIA_Ruga_TEACHDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Ruga_TEACHDEX);
	
	Info_AddChoice 		(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Ruga_TEACHDEX_1);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Ruga_TEACHDEX_5);
	
	
};
func void DIA_Ruga_TEACHDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Ruga_TEACHDEX);
	
	Info_AddChoice 		(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Ruga_TEACHDEX_1);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Ruga_TEACHDEX_5);
	
	
};
 








