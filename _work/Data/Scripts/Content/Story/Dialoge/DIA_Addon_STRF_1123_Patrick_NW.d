//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_NW_EXIT   (C_INFO)
{
	npc         = STRF_1123_Addon_Patrick_NW;
	nr          = 999;
	condition   = DIA_Addon_Patrick_NW_EXIT_Condition;
	information = DIA_Addon_Patrick_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Patrick_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Patrick_NW_PICKPOCKET (C_INFO)
{
	npc			= STRF_1123_Addon_Patrick_NW;
	nr			= 900;
	condition	= DIA_Addon_Patrick_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Patrick_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Patrick_NW_PICKPOCKET_Condition()
{
	C_Beklauen (35, 50);
};
 
FUNC VOID DIA_Addon_Patrick_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Patrick_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Patrick_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Patrick_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Patrick_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Patrick_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Patrick_NW_PICKPOCKET);
};
	
func void DIA_Addon_Patrick_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Patrick_NW_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_NW_Hi   (C_INFO)
{
	npc         = STRF_1123_Addon_Patrick_NW;
	nr          = 2;
	condition   = DIA_Addon_Patrick_NW_Hi_Condition;
	information = DIA_Addon_Patrick_NW_Hi_Info;
	permanent   = FALSE;
	description = "I jak? Wszystko w porz�dku?";
};
FUNC INT DIA_Addon_Patrick_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_NW_Hi_15_00");//I jak? Wszystko w porz�dku?
	AI_Output (self, other, "DIA_Addon_Patrick_NW_Hi_07_01");//Doskonale. Magowie Wody pomogli nam wydosta� si� z tej przekl�tej doliny.
	AI_Output (other, self, "DIA_Addon_Patrick_NW_Hi_15_02");//Jakie macie plany?
	AI_Output (self, other, "DIA_Addon_Patrick_NW_Hi_07_03");//B�d� dalej walczy� u boku Lee. Pewnego dnia opu�cimy t� wysp�.
	AI_Output (other, self, "DIA_Addon_Patrick_NW_Hi_15_04");//A p�niej?
	AI_Output (self, other, "DIA_Addon_Patrick_NW_Hi_07_05");//Zobaczy si�. Je�li wojna wci�� trwa, p�jd� walczy� z orkami. Ale kto wie, co si� jeszcze wydarzy...
};





