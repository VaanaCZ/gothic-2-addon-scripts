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
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_06_00");//Na, bist du auf dem Weg in die Mine?
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Eigentlich will ich zu Raven.",DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Ja",DIA_Addon_BDT_10019_Wache_Hi_Ja);
};
FUNC VOID B_Say_Wache_kaputt()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_kaputt_15_00");//Warum sind sie tot?
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_kaputt_06_01");//(lacht hämisch) Die haben sich kaputt geschuftet.
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");//Eigentlich will ich zu Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");//(warnt) Hey - versuch den Tempel zu betreten und du bist so tot wie die Gefangenen hier.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");//Sieh lieber zu, dass du in die Mine kommst.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");//Ja.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");//Dann pass gut auf dich auf. Pass besser auf als die Typen, die hier überall rumliegen.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};	
	
	
	

