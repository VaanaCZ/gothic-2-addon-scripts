//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Pardos_NW_EXIT   (C_INFO)
{
	npc         = STRF_1127_Addon_Pardos_NW;
	nr          = 999;
	condition   = DIA_Addon_Pardos_NW_EXIT_Condition;
	information = DIA_Addon_Pardos_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Pardos_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Pardos_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Pardos_NW_Hi   (C_INFO)
{
	npc         = STRF_1127_Addon_Pardos_NW;
	nr          = 2;
	condition   = DIA_Addon_Pardos_NW_Hi_Condition;
	information = DIA_Addon_Pardos_NW_Hi_Info;
	permanent   = TRUE;
	description = "Dobrze siê czujesz?";
};
FUNC INT DIA_Addon_Pardos_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Pardos_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Pardos_NW_Hi_15_00");//Dobrze siê czujesz?
	AI_Output (self, other, "DIA_Addon_Pardos_NW_Hi_03_01");//Ej, wybawco... Jeszcze raz dziêkujê. Teraz mogê ca³y dzieñ odpoczywaæ.
	AI_Output (other, self, "DIA_Addon_Pardos_NW_Hi_15_02");//Widzê. No có¿, na mnie ju¿ czas.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Pardos_NW_PICKPOCKET (C_INFO)
{
	npc			= STRF_1127_Addon_Pardos_NW;
	nr			= 900;
	condition	= DIA_Addon_Pardos_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Pardos_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Pardos_NW_PICKPOCKET_Condition()
{
	C_Beklauen (85, 10);
};
 
FUNC VOID DIA_Addon_Pardos_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Pardos_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Pardos_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Pardos_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Pardos_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Pardos_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Pardos_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Pardos_NW_PICKPOCKET);
};
	
func void DIA_Addon_Pardos_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Pardos_NW_PICKPOCKET);
};




