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
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_00");//St�j! T�dy nie przejdziesz.
	AI_Output (other, self, "DIA_1061_Wache_Hallo_15_01");//Chc� rozmawia� z twoim przyw�dc�.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_02");//Ach, rozumiem, chcesz porozmawia� z moim szefem. W takim razie OCZYWI�CIE ci� przepuszcz�.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_03");//Ale tylko pod warunkiem, �e wiesz, jak si� nazywa. Bo je�li nie, to b�d� musia� ci� zabi�. A wi�c?
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Lee.",DIA_1061_Wache_Hallo_Lee);
	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		Info_AddChoice (DIA_1061_Wache_Hallo,"Dexter.",DIA_1061_Wache_Hallo_Dexter);
	};
	Info_AddChoice (DIA_1061_Wache_Hallo,"Diego.",DIA_1061_Wache_Hallo_Diego);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Nie mam poj�cia.",DIA_1061_Wache_Hallo_Ahnung);
};
FUNC VOID DIA_1061_Wache_Hallo_Lee()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Lee_15_00");//Lee.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Lee_01_01");//Hmmm, jakby to uj��... W�a�nie po�egna�e� si� z �yciem, facet!
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Dexter()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Dexter_15_00");//Dexter.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_01");//No dobrze... Wygl�da na to, �e rzeczywi�cie znasz szefa. Dobrze, przepuszcz� ci�. Ale uwa�aj!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_02");//Je�li za bardzo si� do kogo� zbli�ysz, nie wyjdziesz st�d �ywy!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_03");//We� wi�c g��boki oddech i nie wyci�gaj broni. Dextera znajdziesz w domu.
	
	Knows_Dexter = TRUE;
	BanditGuard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_1061_Wache_Hallo_Diego()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Diego_15_00");//Diego.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_01");//Prawda!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_02");//Nie, tylko �artowa�em. Nie masz poj�cia, kto jest moim szefem.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_03");//Nie ma wi�c �adnego powodu, dla kt�rego nie mia�bym ci� zabi�.
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Ahnung()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Ahnung_15_00");//Nie mam poj�cia.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Ahnung_01_01");//A wi�c zginiesz, g�upcze!
	
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
	AI_Output (self, other, "DIA_1061_Wache_Perm_01_00");//Pami�taj, zachowuj si� spokojnie, a wyjdziesz st�d �ywy.
	AI_StopProcessInfos (self);
};
	 
	
