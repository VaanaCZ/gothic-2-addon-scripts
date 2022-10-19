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
	description = "Tak�e se u� vr�t� do pr�ce?";
};
FUNC INT DIA_Addon_Monty_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Monty_NW_Hi_15_00");//Tak co, u� zase v pr�ci?
	AI_Output (self, other, "DIA_Addon_Monty_NW_Hi_08_01");//�lov��e � co jsem byl pry�, nehli tu ani prstem. Te� se mus�m znova zavrtat do t�ch stavebn�ch pl�n�.
	AI_Output (other, self, "DIA_Addon_Monty_NW_Hi_15_02");//Fajn, nebudu t� ru�it.
	AI_Output (self, other, "DIA_Addon_Monty_NW_Hi_08_03");//(sm�je se) Prima, ��astnou cestu.
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
