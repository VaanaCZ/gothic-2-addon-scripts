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
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_00");//H�, vous voulez aller � la mine ? Alors n'oubliez pas de vous �quiper chez Scatty.
	AI_Output (other, self, "DIA_Addon_BDT_10031_Wache_Scatty_15_01");//De quoi aurai-je besoin ?
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_02");//Ben, tout au moins d'une pioche. Et pensez � emporter des provisions, �a ne vous fera pas de mal.
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_03");//Ou peut-�tre des potions de soins ? �a grouille de foreurs, l�-dessous.
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
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_01");//Eh ben, eh ben... Les esclaves �taient press�s de partir, en tout cas.
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_02");//Quand on leur a annonc� qu'ils �taient libres, ils ont fil� comme des lapins !
		Wache_Joker = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_03");//Ouais. Alors �vitez de vous attirer des ennuis, et tout se passera bien.
	
};
