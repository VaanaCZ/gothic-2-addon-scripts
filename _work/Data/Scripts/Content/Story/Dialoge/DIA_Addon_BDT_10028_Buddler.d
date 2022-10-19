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
	description = "Wie sieht's aus?";
};
FUNC INT DIA_Addon_10028_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10028_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10028_Buddler_Hi_15_00");//Wie sieht's aus?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_01");//Ich mache mir nicht die Mühe und hacke selber. Wir haben genug Sklaven, die das für uns erledigen.
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_02");//(lacht) So leicht sind wir noch nie an unser Gold gekommen.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_03");//Grmpf. Welcher Idiot hat die Sklaven befreit?
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
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_00");//Immer von unten nach oben hacken.
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_01");//Das ist zwar schwierig, aber auf diese Weise kriegst du mehr Gold aus dem Gestein.
	
	B_Upgrade_Hero_HackChance(5);
};



  
