//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10019_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10019_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10019_Wache_EXIT_Condition;
	information = DIA_Addon_10019_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10019_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10019_Wache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10019_Wache_Hi   (C_INFO)
{
	npc         = BDT_10019_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10019_Wache_Hi_Condition;
	information = DIA_Addon_10019_Wache_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_10019_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10019_Wache_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_06_00");//So, on your way to the mine?
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Actually, I want to see Raven.",DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Yes.",DIA_Addon_BDT_10019_Wache_Hi_Ja);
};
FUNC VOID B_Say_Wache_kaputt()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_kaputt_15_00");//Why are they dead?
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_kaputt_06_01");//(laughs maliciously) They worked themselves to pieces.
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");//Actually, I want to see Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");//(warning) Hey - try to enter the temple and you are as dead as the prisoners here.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");//Move your ass over into the mine instead.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");//Yes.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");//Then watch out for yourself. Watch out better than these guys who are scattered all over the place here did.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};	
	
	
	

