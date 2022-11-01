//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10026_Wache_EXIT_Condition;
	information = DIA_Addon_10026_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10026_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_Hi   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10026_Wache_Hi_Condition;
	information = DIA_Addon_10026_Wache_Hi_Info;
	permanent   = TRUE;
	description = "Qu'y a-t-il?";
};
FUNC INT DIA_Addon_10026_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10026_Wache_Hi_15_00");//Comment ça va ?
	
	if (Sklaven_Flucht == FALSE)
	{	
		CreateInvItems (self, ItFo_Bacon,1);
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_01");//Dommage que nous n'ayons plus guère d'esclaves. Il va falloir aller en chercher d'autres, bientôt.
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_02");//Ces types sont complètement crevés. Sûrement parce qu'ils mangent mal, ici ! (rires)
		B_UseItem (self, ItFo_Bacon);
		
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_03");//Mais je préfèrerais renvoyer les mineurs au travail que donner un morceau de viande à ces chiens.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_04");//Les esclaves sont partis - tant pis. Dans ce cas, on va encore devoir se défouler sur les mineurs.
	};
	AI_StopProcessInfos (self);
};

//----------------------------------------------------------------------
//	Info Gruft
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_Gruft   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10026_Wache_Gruft_Condition;
	information = DIA_Addon_10026_Wache_Gruft_Info;
	permanent   = TRUE;
	description = "Que savez-vous à propos de la tombe ?";
};
FUNC INT DIA_Addon_10026_Wache_Gruft_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_Gruft_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10026_Wache_Gruft_15_00");//Que savez-vous à propos de la tombe ?
	AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_01");//La tombe est juste derrière ce passage.
	AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_02");//(blasé) Suivez les cadavres et vous y arriverez.
};



