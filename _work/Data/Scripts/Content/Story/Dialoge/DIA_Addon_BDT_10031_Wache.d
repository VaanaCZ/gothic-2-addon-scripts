//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10031_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10031_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10031_Wache_EXIT_Condition;
	information = DIA_Addon_10031_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10031_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10031_Wache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Scatty
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10031_Wache_Scatty   (C_INFO)
{
	npc         = BDT_10031_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10031_Wache_Scatty_Condition;
	information = DIA_Addon_10031_Wache_Scatty_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10031_Wache_Scatty_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10031_Wache_Scatty_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_00");//Hé, vous voulez aller à la mine ? Alors n'oubliez pas de vous équiper chez Scatty.
	AI_Output (other, self, "DIA_Addon_BDT_10031_Wache_Scatty_15_01");//De quoi aurai-je besoin ?
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_02");//Ben, tout au moins d'une pioche. Et pensez à emporter des provisions, ça ne vous fera pas de mal.
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_03");//Ou peut-être des potions de soins ? Ça grouille de foreurs, là-dessous.
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
var int Wache_Joker;
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10031_Wache_Hi   (C_INFO)
{
	npc         = BDT_10031_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10031_Wache_Hi_Condition;
	information = DIA_Addon_10031_Wache_Hi_Info;
	permanent   = TRUE;
	description = "Tout va bien ?";
};
FUNC INT DIA_Addon_10031_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10031_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10031_Wache_Hi_15_00");//Tout va bien ?
	
	if (Sklaven_Flucht == TRUE)
	&& (Wache_Joker == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_01");//Eh ben, eh ben... Les esclaves étaient pressés de partir, en tout cas.
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_02");//Quand on leur a annoncé qu'ils étaient libres, ils ont filé comme des lapins !
		Wache_Joker = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_03");//Ouais. Alors évitez de vous attirer des ennuis, et tout se passera bien.
	
};
