//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10029_Buddler_EXIT   (C_INFO)
{
	npc         = BDT_10029_Addon_Buddler;
	nr          = 999;
	condition   = DIA_Addon_10029_Buddler_EXIT_Condition;
	information = DIA_Addon_10029_Buddler_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10029_Buddler_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10029_Buddler_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10029_Buddler_Hi   (C_INFO)
{
	npc         = BDT_10029_Addon_Buddler;
	nr          = 2;
	condition   = DIA_Addon_10029_Buddler_Hi_Condition;
	information = DIA_Addon_10029_Buddler_Hi_Info;
	permanent   = TRUE;
	description = "Co s³ychaæ?";
};
FUNC INT DIA_Addon_10029_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10029_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10029_Buddler_Hi_15_00");//Co s³ychaæ?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10029_Buddler_Hi_06_01");//Niewolnicy odwalaj¹ ca³¹ robotê, wiêc nic nie robiê.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10029_Buddler_Hi_06_02");//Bêdê musia³ trochê pokopaæ, zanim siê do tego znowu przyzwyczajê.
		AI_StopProcessInfos(self);
	};
};
//---------------------------------------------------------------------
//	Info Hacken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10029_Buddler_Hacken   (C_INFO)
{
	npc         = BDT_10029_Addon_Buddler;
	nr          = 3;
	condition   = DIA_Addon_10029_Buddler_Hacken_Condition;
	information = DIA_Addon_10029_Buddler_Hacken_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_10029_Buddler_Hacken_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10029_Buddler_Hacken_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_10029_Buddler_Hacken_06_00");//Tajemnica tkwi w pracy nóg.
	AI_Output (self, other, "DIA_Addon_10029_Buddler_Hacken_06_01");//Si³a zamachu pochodzi z nóg.
	
	B_Upgrade_Hero_HackChance(5);
	
};
