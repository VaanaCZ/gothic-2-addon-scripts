//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE Addon_10008_Bandit_EXIT   (C_INFO)
{
	npc         = BDT_10008_Addon_Bandit;
	nr          = 999;
	condition   = Addon_10008_Bandit_EXIT_Condition;
	information = Addon_10008_Bandit_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT Addon_10008_Bandit_EXIT_Condition()
{	
		return TRUE;
};
FUNC VOID Addon_10008_Bandit_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_10008_Bandit_PICKPOCKET (C_INFO)
{
	npc			= BDT_10008_Addon_Bandit;
	nr			= 900;
	condition	= DIA_Addon_10008_Bandit_PICKPOCKET_Condition;
	information	= DIA_Addon_10008_Bandit_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_10008_Bandit_PICKPOCKET_Condition()
{
	C_Beklauen (55, 99);
};
 
FUNC VOID DIA_Addon_10008_Bandit_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_10008_Bandit_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_10008_Bandit_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_10008_Bandit_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_10008_Bandit_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_10008_Bandit_PICKPOCKET_DoIt);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_10008_Bandit_PICKPOCKET);
};
	
func void DIA_Addon_10008_Bandit_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_10008_Bandit_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10008_Bandit_Hi   (C_INFO)
{
	npc         = BDT_10008_Addon_Bandit;
	nr          = 2;
	condition   = DIA_Addon_10008_Bandit_Hi_Condition;
	information = DIA_Addon_10008_Bandit_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10008_Bandit_Hi_Condition()
{	
	if (Npc_GetDistToNpc(other, Skinner) <= 600)
	&& (!Npc_IsDead(Skinner))
	&& (Skinner.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10008_Bandit_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_00");//NEBUĎ ho!
	AI_Output (other, self, "DIA_Addon_10008_Bandit_Hi_15_01");//Co?
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_02");//Jestli se máš rád, tak se drž dál od Skinnera.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_03");//Ten chlap je nevyzpytatelnej. Toho, kdo ho posledně vzbudil, zabil.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_04");//Nechej ho spát, bude to tak pro všechny lepší.
};
//--------------------------------------------------------------------
//	Info soup
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10008_Bandit_soup   (C_INFO)
{
	npc         = BDT_10008_Addon_Bandit;
	nr          = 2;
	condition   = DIA_Addon_10008_Bandit_soup_Condition;
	information = DIA_Addon_10008_Bandit_soup_Info;
	permanent   = FALSE;
	description = "Ty jsi kopáč?";
};
FUNC INT DIA_Addon_10008_Bandit_soup_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10008_Bandit_soup_Info()
{
	AI_Output (other, self, "DIA_Addon_10008_Bandit_soup_15_00");//Ty jsi kopáč?
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_01");//To jako že mám tyhle kalhoty? Ne, jen je nosím, protože jsou pohodlný.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_02");//Dělám tu akorát dušený maso. Tumáš, ochutnej, posílí tě.
	B_GiveInvItems (self, other, ItFo_Addon_Meatsoup,1);
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_03");//Posilování se vždycky hodí - všude číhá spousta nebezpečí.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_04");//Jestli chceš, můžu ti poradit, jak bejt silnější.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Bandita u kotle s polévkou mi pomůže zvýšit sílu.");	
};
//*******************************************
//	TechPlayer
//*******************************************

INSTANCE DIA_Addon_10008_Bandit_Teach(C_INFO)
{
	npc			= BDT_10008_Addon_Bandit;
	nr			= 7;
	condition	= DIA_Addon_10008_Bandit_Teach_Condition;
	information	= DIA_Addon_10008_Bandit_Teach_Info;
	permanent	= TRUE;
	description = "Chci se stát silnějším.";
};                       

FUNC INT DIA_Addon_10008_Bandit_Teach_Condition()
{
	if Npc_KnowsInfo (other, DIA_Addon_10008_Bandit_soup)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10008_Bandit_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_10008_Bandit_Teach_15_00"); //Chci být silnější.

	Info_ClearChoices 	(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_10008_Bandit_Teach_STR_5);
};

FUNC VOID DIA_Addon_10008_Bandit_Teach_Back ()
{
	Info_ClearChoices (DIA_Addon_10008_Bandit_Teach);
};

FUNC VOID DIA_Addon_10008_Bandit_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices 	(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_10008_Bandit_Teach_STR_5);
};

FUNC VOID DIA_Addon_10008_Bandit_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices 	(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_10008_Bandit_Teach_STR_5);
};





