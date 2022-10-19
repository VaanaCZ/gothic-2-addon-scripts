//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tonak_NW_EXIT   (C_INFO)
{
	npc         = STRF_1125_Addon_Tonak_NW;
	nr          = 999;
	condition   = DIA_Addon_Tonak_NW_EXIT_Condition;
	information = DIA_Addon_Tonak_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tonak_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Tonak_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tonak_NW_Hi   (C_INFO)
{
	npc         = STRF_1125_Addon_Tonak_NW;
	nr          = 2;
	condition   = DIA_Addon_Tonak_NW_Hi_Condition;
	information = DIA_Addon_Tonak_NW_Hi_Info;
	permanent   = TRUE;
	description = "So, back to working in the fields?";
};
FUNC INT DIA_Addon_Tonak_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Tonak_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Tonak_NW_Hi_15_00");//So, back to working in the fields?
	AI_Output (self, other, "DIA_Addon_Tonak_NW_Hi_03_01");//Hey, the guy who saved my life! Yeah, it's more hard labor for me now.
	
	if !Npc_IsDead (Egill)
	&& !Npc_IsDead (Ehnim)
	{
		AI_Output (self, other, "DIA_Addon_Tonak_NW_Hi_03_02");//Especially with those two nutty brothers. Oh man, the bandits weren't THAT bad ...
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Tonak_NW_PICKPOCKET (C_INFO)
{
	npc			= STRF_1125_Addon_Tonak_NW;
	nr			= 900;
	condition	= DIA_Addon_Tonak_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Tonak_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Tonak_NW_PICKPOCKET_Condition()
{
	C_Beklauen (80, 160);
};
 
FUNC VOID DIA_Addon_Tonak_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tonak_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tonak_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tonak_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tonak_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tonak_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tonak_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tonak_NW_PICKPOCKET);
};
	
func void DIA_Addon_Tonak_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tonak_NW_PICKPOCKET);
};



