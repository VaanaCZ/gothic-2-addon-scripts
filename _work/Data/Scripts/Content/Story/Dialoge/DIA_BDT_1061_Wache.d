// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_1061_Wache_EXIT   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 999;
	condition   = DIA_1061_Wache_EXIT_Condition;
	information = DIA_1061_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_1061_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_1061_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  	Hallo
// ************************************************************
INSTANCE DIA_1061_Wache_Hallo   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 1;
	condition   = DIA_1061_Wache_Hallo_Condition;
	information = DIA_1061_Wache_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_1061_Wache_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_1061_Wache_Hallo_Info()
{
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_00");//Stój! Têdy nie przejdziesz.
	AI_Output (other, self, "DIA_1061_Wache_Hallo_15_01");//Chcê rozmawiaæ z twoim przywódc¹.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_02");//Ach, rozumiem, chcesz porozmawiaæ z moim szefem. W takim razie OCZYWIŒCIE ciê przepuszczê.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_03");//Ale tylko pod warunkiem, ¿e wiesz, jak siê nazywa. Bo jeœli nie, to bêdê musia³ ciê zabiæ. A wiêc?
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Lee.",DIA_1061_Wache_Hallo_Lee);
	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		Info_AddChoice (DIA_1061_Wache_Hallo,"Dexter.",DIA_1061_Wache_Hallo_Dexter);
	};
	Info_AddChoice (DIA_1061_Wache_Hallo,"Diego.",DIA_1061_Wache_Hallo_Diego);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Nie mam pojêcia.",DIA_1061_Wache_Hallo_Ahnung);
};
FUNC VOID DIA_1061_Wache_Hallo_Lee()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Lee_15_00");//Lee.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Lee_01_01");//Hmmm, jakby to uj¹æ... W³aœnie po¿egna³eœ siê z ¿yciem, facet!
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Dexter()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Dexter_15_00");//Dexter.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_01");//No dobrze... Wygl¹da na to, ¿e rzeczywiœcie znasz szefa. Dobrze, przepuszczê ciê. Ale uwa¿aj!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_02");//Jeœli za bardzo siê do kogoœ zbli¿ysz, nie wyjdziesz st¹d ¿ywy!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_03");//WeŸ wiêc g³êboki oddech i nie wyci¹gaj broni. Dextera znajdziesz w domu.
	
	Knows_Dexter = TRUE;
	BanditGuard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_1061_Wache_Hallo_Diego()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Diego_15_00");//Diego.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_01");//Prawda!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_02");//Nie, tylko ¿artowa³em. Nie masz pojêcia, kto jest moim szefem.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_03");//Nie ma wiêc ¿adnego powodu, dla którego nie mia³bym ciê zabiæ.
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Ahnung()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Ahnung_15_00");//Nie mam pojêcia.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Ahnung_01_01");//A wiêc zginiesz, g³upcze!
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
// ************************************************************
// 			  Perm
//**************************************
INSTANCE DIA_1061_Wache_Perm   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 2;
	condition   = DIA_1061_Wache_Perm_Condition;
	information = DIA_1061_Wache_Perm_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_1061_Wache_Perm_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_1061_Wache_Perm_Info()
{
	AI_Output (self, other, "DIA_1061_Wache_Perm_01_00");//Pamiêtaj, zachowuj siê spokojnie, a wyjdziesz st¹d ¿ywy.
	AI_StopProcessInfos (self);
};
	 
	
