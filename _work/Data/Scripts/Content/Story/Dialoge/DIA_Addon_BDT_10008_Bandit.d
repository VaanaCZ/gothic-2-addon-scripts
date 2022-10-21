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
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_00");//НЕ НАДО его будить!
	AI_Output (other, self, "DIA_Addon_10008_Bandit_Hi_15_01");//Что???
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_02");//Если ты не хочешь создавать себе проблем, не связывайся со Скиннером.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_03");//Это парень непредсказуем. Прошлый раз, когда один парень разбудил Скиннера, тот его убил.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_04");//Пусть он спит, для общего блага.
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
	description = "Ты рудокоп?";
};
FUNC INT DIA_Addon_10008_Bandit_soup_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10008_Bandit_soup_Info()
{
	AI_Output (other, self, "DIA_Addon_10008_Bandit_soup_15_00");//Ты рудокоп?
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_01");//Ты по штанам так решил? Нет, я ношу их просто потому, что это удобно.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_02");//Все, что я здесь делаю, - готовлю тушеное мясо. Вот, попробуй - оно придаст тебе сил.
	B_GiveInvItems (self, other, ItFo_Addon_Meatsoup,1);
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_03");//Это очень важно - тренировать свою силу. Вокруг столько опасностей.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_04");//Если хочешь, я готов помочь тебе стать сильнее.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Бандит у котелка может помочь мне стать сильнее.");	
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
	description = "Я хочу быть сильнее.";
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
	AI_Output (other,self ,"DIA_Addon_10008_Bandit_Teach_15_00"); //Я хочу быть сильнее.

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





