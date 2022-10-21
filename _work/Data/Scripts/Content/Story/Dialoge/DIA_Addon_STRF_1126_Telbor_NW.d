//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Telbor_NW_EXIT   (C_INFO)
{
	npc         = STRF_1126_Addon_Telbor_NW;
	nr          = 999;
	condition   = DIA_Addon_Telbor_NW_EXIT_Condition;
	information = DIA_Addon_Telbor_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Telbor_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Telbor_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Telbor_NW_PICKPOCKET (C_INFO)
{
	npc			= STRF_1126_Addon_Telbor_NW;
	nr			= 900;
	condition	= DIA_Addon_Telbor_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Telbor_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Telbor_NW_PICKPOCKET_Condition()
{
	C_Beklauen (60, 55);
};
 
FUNC VOID DIA_Addon_Telbor_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Telbor_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Telbor_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Telbor_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Telbor_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Telbor_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Telbor_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Telbor_NW_PICKPOCKET);
};
	
func void DIA_Addon_Telbor_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Telbor_NW_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Telbor_NW_Hi   (C_INFO)
{
	npc         = STRF_1126_Addon_Telbor_NW;
	nr          = 2;
	condition   = DIA_Addon_Telbor_NW_Hi_Condition;
	information = DIA_Addon_Telbor_NW_Hi_Info;
	permanent   = FALSE;
	description = "Wracasz do pracy na polu?";
};
FUNC INT DIA_Addon_Telbor_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Telbor_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Telbor_NW_Hi_15_00");//Z powrotem na pole, co?
	AI_Output (self, other, "DIA_Addon_Telbor_NW_Hi_12_01");//Mój wybawca, niech mnie kule bij¹! Tak, wracam zmagaæ siê z codziennym trudem.
	
	if !Npc_IsDead (Egill)
	&& !Npc_IsDead (Ehnim)
	{
		AI_Output (self, other, "DIA_Addon_Telbor_NW_Hi_12_02");//I z tymi dwoma kopniêtymi braæmi. Nawet bandyci nie byli tak denerwuj¹cy.
	};
};


