//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10025_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10025_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10025_Wache_EXIT_Condition;
	information = DIA_Addon_10025_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10025_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10025_Wache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10025_Wache_Hi   (C_INFO)
{
	npc         = BDT_10025_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10025_Wache_Hi_Condition;
	information = DIA_Addon_10025_Wache_Hi_Info;
	permanent   = TRUE;
	description = "Как дела?";
};
FUNC INT DIA_Addon_10025_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10025_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10025_Wache_Hi_15_00");//Как дела?
	AI_Output (self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_01");//Я готовлю вкусное тушеное мясо для рудокопов и охранников.
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_02");//А рабы почти ничего не получат. Немного застоявшейся воды и старый хлеб, не более того.
		AI_Output (self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_03");//Этим городским крысам это не сильно повредит.
	};
};

