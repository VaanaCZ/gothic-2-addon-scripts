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
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_06_00");//Alors, vous partez à la mine ?
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"En fait, je cherche Raven...",DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Oui.",DIA_Addon_BDT_10019_Wache_Hi_Ja);
};
FUNC VOID B_Say_Wache_kaputt()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_kaputt_15_00");//Pourquoi sont-ils morts ?
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_kaputt_06_01");//(rires malicieux) Ils ont travaillé jusqu'à leur dernier souffle.
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");//En fait, je cherche Raven...
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");//(avertissement) Hé - si vous essayez d'entrer dans le temple, vous serez aussi mort que les prisonniers ici.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");//Allez plutôt faire un tour à la mine.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");//Oui.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");//Alors faites attention à vous. Soyez plus vigilant que ces types ne l'étaient avant de se retrouver en pièces.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};	
	
	
	

