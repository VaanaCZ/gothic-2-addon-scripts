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
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_06_00");//Takže jdeš do dolu?
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Vlastnì bych rád vidìl Havrana.",DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice (DIA_Addon_BDT_10019_Wache_Hi,"Ano.",DIA_Addon_BDT_10019_Wache_Hi_Ja);
};
FUNC VOID B_Say_Wache_kaputt()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_kaputt_15_00");//Proè jsou mrtví?
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_kaputt_06_01");//(ïábelský chechot) Umakali se k smrti.
	
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");//Vlastnì chci vidìt Havrana.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");//(varovnì) Hele, jen si zkus vlézt do toho chrámu a budeš mrtvej jako tady ti vìzni.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");//Radši hejbni kostrou a padej do dolu.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};
FUNC VOID DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output (other, self, "DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");//Jo.
	AI_Output (self, other, "DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");//Tak si dávej bacha. A to líp než ti, co sou tu teï všude rozkouskovaný.
	
	B_Say_Wache_kaputt();
	Info_ClearChoices (DIA_Addon_BDT_10019_Wache_Hi);
};	
	
	
	

