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
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_06_00");//Idziesz do kopalni?
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Chcê siê widzieæ z Krukiem.",DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Tak.",DIA_Addon_BDT_10019_Wache_Hi_Ja);
};
FUNC VOID B_Say_Wache_kaputt()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_kaputt_15_00");//Dlaczego oni nie ¿yj¹?
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_kaputt_06_01");//Zaharowali siê na œmieræ.
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");//Chcê siê widzieæ z Krukiem.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");//Hej, spróbuj wejœæ do œwi¹tyni, a bêdziesz tak samo martwy, jak ci wiêŸniowie.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");//Lepiej ruszaj do kopalni.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");//Tak.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");//Trzymaj siê. Dbaj o siebie lepiej ni¿ kolesie, którzy tu le¿¹.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};	
	
	
	

