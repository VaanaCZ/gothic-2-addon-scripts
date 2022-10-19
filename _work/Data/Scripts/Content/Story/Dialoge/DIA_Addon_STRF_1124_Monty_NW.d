//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Monty_NW_EXIT   (C_INFO)
{
	npc         = STRF_1124_Addon_Monty_NW;
	nr          = 999;
	condition   = DIA_Addon_Monty_NW_EXIT_Condition;
	information = DIA_Addon_Monty_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Monty_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Monty_NW_Hi   (C_INFO)
{
	npc         = STRF_1124_Addon_Monty_NW;
	nr          = 2;
	condition   = DIA_Addon_Monty_NW_Hi_Condition;
	information = DIA_Addon_Monty_NW_Hi_Info;
	permanent   = FALSE;
	description = "And? Back to work, are you?";
};
FUNC INT DIA_Addon_Monty_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Monty_NW_Hi_15_00");//And? Back to work, are you?
	AI_Output (self, other, "DIA_Addon_Monty_NW_Hi_08_01");//Oh man - they didn't get anything done while I was gone. Now I have to delve into those construction plans again.
	AI_Output (other, self, "DIA_Addon_Monty_NW_Hi_15_02");//Oh well. Don't let me keep you, then.
	AI_Output (self, other, "DIA_Addon_Monty_NW_Hi_08_03");//(laughs) All right. Have a good trip.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Monty_NW_PICKPOCKET (C_INFO)
{
	npc			= STRF_1124_Addon_Monty_NW;
	nr			= 900;
	condition	= DIA_Addon_Monty_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Monty_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Monty_NW_PICKPOCKET_Condition()
{
	C_Beklauen (60, 60);
};
 
FUNC VOID DIA_Addon_Monty_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Monty_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Monty_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Monty_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Monty_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Monty_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Monty_NW_PICKPOCKET);
};
	
func void DIA_Addon_Monty_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Monty_NW_PICKPOCKET);
};
