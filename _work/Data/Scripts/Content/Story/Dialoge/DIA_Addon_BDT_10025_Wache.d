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
	description = "Co s�ycha�?";
};
FUNC INT DIA_Addon_10025_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10025_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10025_Wache_Hi_15_00");//Co s�ycha�?
	AI_Output (self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_01");//Gotuj� gulasz dla kopaczy i stra�nik�w.
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_02");//Niewolnicy b�d� musieli obej�� si� smakiem. Jak b�d� mieli szcz�cie, dostan� czerstwy chleb i wod�.
		AI_Output (self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_03");//Tym mi�czakom z miasta to nie zaszkodzi.
	};
};

