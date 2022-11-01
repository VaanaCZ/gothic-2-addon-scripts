//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10028_Buddler_EXIT   (C_INFO)
{
	npc         = BDT_10028_Addon_Buddler;
	nr          = 999;
	condition   = DIA_Addon_10028_Buddler_EXIT_Condition;
	information = DIA_Addon_10028_Buddler_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10028_Buddler_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10028_Buddler_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10028_Buddler_Hi   (C_INFO)
{
	npc         = BDT_10028_Addon_Buddler;
	nr          = 2;
	condition   = DIA_Addon_10028_Buddler_Hi_Condition;
	information = DIA_Addon_10028_Buddler_Hi_Info;
	permanent   = TRUE;
	description = "Qu'y a-t-il?";
};
FUNC INT DIA_Addon_10028_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10028_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10028_Buddler_Hi_15_00");//Comment ça va ?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_01");//Je ne vais certainement pas me fatiguer à aller creuser par moi-même. On a suffisamment d'esclaves pour le faire à notre place.
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_02");//(rit) Jamais je n'ai gagné de l'or aussi facilement !
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_03");//Grmpf. Quel imbécile a libéré les esclaves.
		AI_StopProcessInfos(self);
	};
};
//---------------------------------------------------------------------
//	Info Hacken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10028_Buddler_Hacken   (C_INFO)
{
	npc         = BDT_10028_Addon_Buddler;
	nr          = 3;
	condition   = DIA_Addon_10028_Buddler_Hacken_Condition;
	information = DIA_Addon_10028_Buddler_Hacken_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_10028_Buddler_Hacken_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10028_Buddler_Hacken_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_00");//Creusez toujours du bas vers le haut.
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_01");//C'est peut-être difficile, mais en procédant ainsi, vous pouvez extraire beaucoup plus d'or de la roche.
	
	B_Upgrade_Hero_HackChance(5);
};



  
