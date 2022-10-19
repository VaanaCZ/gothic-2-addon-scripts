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
	description = "Wracasz do pracy na polu?";
};
FUNC INT DIA_Addon_Tonak_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Tonak_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Tonak_NW_Hi_15_00");//Wracasz do pracy na polu?
	AI_Output (self, other, "DIA_Addon_Tonak_NW_Hi_03_01");//Mój wybawca, niech mnie kule bij¹! Tak, wracam zmagaæ siê z codziennym trudem.
	
	if !Npc_IsDead (Egill)
	&& !Npc_IsDead (Ehnim)
	{
		AI_Output (self, other, "DIA_Addon_Tonak_NW_Hi_03_02");//I z tymi dwoma kopniêtymi braæmi. Nawet bandyci nie byli tak denerwuj¹cy.
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



