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
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_00");//NIE budź go!
	AI_Output (other, self, "DIA_Addon_10008_Bandit_Hi_15_01");//Co?!
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_02");//Dla swojego dobra trzymaj się z daleka od Skinnera.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_03");//Ten koleś jest nieprzewidywalny. Niedawno zabił gościa, który go obudził.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_Hi_01_04");//Niech śpi. Tak będzie najlepiej dla nas wszystkich.
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
	description = "Jesteś kopaczem?";
};
FUNC INT DIA_Addon_10008_Bandit_soup_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10008_Bandit_soup_Info()
{
	AI_Output (other, self, "DIA_Addon_10008_Bandit_soup_15_00");//Jesteś kopaczem?
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_01");//To przez te spodnie? Nie, noszę je, bo są wygodne.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_02");//Gotuję gulasz. Masz, spróbuj, nabierzesz sił.
	B_GiveInvItems (self, other, ItFo_Addon_Meatsoup,1);
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_03");//Trzeba zawsze ćwiczyć, żeby nabrać sił - na zewnątrz czyha wiele niebezpieczeństw.
	AI_Output (self, other, "DIA_Addon_10008_Bandit_soup_01_04");//Jeśli chcesz, mogę ci pomóc nabrać sił.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Bandyta przy kotle może pomóc mi odzyskać siły.");	
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
	description = "Chcę być silniejszy.";
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
	AI_Output (other,self ,"DIA_Addon_10008_Bandit_Teach_15_00"); //Chcę być silniejszy.

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





