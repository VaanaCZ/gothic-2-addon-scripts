///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1014_BANDIT_EXIT   (C_INFO)
{
	npc         = BDT_1014_Bandit_L;
	nr          = 999;
	condition   = DIA_BDT_1014_BANDIT_EXIT_Condition;
	information = DIA_BDT_1014_BANDIT_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1014_BANDIT_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1014_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info KILLER
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1014_BANDIT_KILLER		(C_INFO)
{
	npc			 = 	BDT_1014_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_BDT_1014_BANDIT_KILLER_Condition;
	information	 = 	DIA_BDT_1014_BANDIT_KILLER_Info;
	important	 = 	TRUE;
};
func int DIA_BDT_1014_BANDIT_KILLER_Condition ()
{	
	if (Npc_KnowsInfo(other,DIA_1013_BANDIT_AMBUSH))
	|| (Npc_IsDead(Ambusher_1013))
	|| (Bdt13_Friend == TRUE)
	|| (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_BDT_1014_BANDIT_KILLER_Info ()
{
	AI_Output (self, other, "DIA_BDT_1014_BANDIT_KILLER_06_00"); //Das ist der Kerl! Machen wir ihn fertig!
	
	AI_StopProcessInfos (self);

	B_Attack 			(self, other, AR_SuddenEnemyInferno, 1);
};


 



