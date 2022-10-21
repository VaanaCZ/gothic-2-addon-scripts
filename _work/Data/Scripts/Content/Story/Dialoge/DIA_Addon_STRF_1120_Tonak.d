//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tonak_EXIT   (C_INFO)
{
	npc         = STRF_1120_Addon_Tonak;
	nr          = 999;
	condition   = DIA_Addon_Tonak_EXIT_Condition;
	information = DIA_Addon_Tonak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tonak_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Tonak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tonak_Hi   (C_INFO)
{
	npc         = STRF_1120_Addon_Tonak;
	nr          = 2;
	condition   = DIA_Addon_Tonak_Hi_Condition;
	information = DIA_Addon_Tonak_Hi_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Tonak_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Sklaven_Flucht == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tonak_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Tonak_Hi_03_00"); //Czego chcesz? Jestem tu wiêŸniem, choæ nie zrobi³em nic z³ego.
	AI_StopProcessInfos (self);
};


