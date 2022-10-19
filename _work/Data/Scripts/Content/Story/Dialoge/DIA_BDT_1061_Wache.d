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
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_00");//St�j - tudy nem��e� proj�t.
	AI_Output (other, self, "DIA_1061_Wache_Hallo_15_01");//Cht�l bych mluvit s tv�m ��fem.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_02");//(ironicky) �, j� v�m, ty chce� mluvit s m�m ��fem. Tak to t� SAMOZ�EJM� nech�m proj�t.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_03");//(smrteln� v�n�) Ale jen v tom p��pad�, �e zn� jeho jm�no. Proto�e jestli ne, tak t� budu muset zab�t! Jasn�?
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Lee",DIA_1061_Wache_Hallo_Lee);
	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		Info_AddChoice (DIA_1061_Wache_Hallo,"Dexter",DIA_1061_Wache_Hallo_Dexter);
	};
	Info_AddChoice (DIA_1061_Wache_Hallo,"Diego",DIA_1061_Wache_Hallo_Diego);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Nem�m tu�en�.",DIA_1061_Wache_Hallo_Ahnung);
};
FUNC VOID DIA_1061_Wache_Hallo_Lee()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Lee_15_00");//Lee.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Lee_01_01");//Fajn, co na to m�m ��ct? Pr�v� jsi propadl �ivotem, chlape!
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Dexter()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Dexter_15_00");//Dexter.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_01");//Dobr�... H�d�m, �e ��fa zn�. Fajn, dovol�m ti proj�t. Ale varuju t�.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_02");//K�ivej pohyb a nedostane� se odsud vcelku!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_03");//Tak�e se zhluboka nadechni a nech hezky svoje zbran� tam, kde jsou. Dextera nejde� v dom�.
	
	Knows_Dexter = TRUE;
	BanditGuard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_1061_Wache_Hallo_Diego()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Diego_15_00");//Diego.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_01");//Spr�vn�!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_02");//Ne, to byl jen �ert. Nem� ani pon�t�, kdo je m�j ��f.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_03");//Tak�e nevid�m ��dnej d�vod, pro� bych t� m�l nechat na�ivu.
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Ahnung()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Ahnung_15_00");//Nem�m tu�en�.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Ahnung_01_01");//Tak to se� mrtvej ignorant.
	
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
	AI_Output (self, other, "DIA_1061_Wache_Perm_01_00");//Pamatuj, bu� v pohod� a dostane� se odsud �ivej.
	AI_StopProcessInfos (self);
};
	 
	
