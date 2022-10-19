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
	description = "Co s³ychaæ?";
};
FUNC INT DIA_Addon_10028_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10028_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10028_Buddler_Hi_15_00");//Co s³ychaæ?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_01");//Nie zamierzam tu kopaæ. Od tego mamy niewolników.
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_02");//Zdobywanie z³ota jeszcze nigdy nie by³o tak ³atwe!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_03");//Hmmf. Co za idiota uwolni³ niewolników?
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
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_00");//Musisz kopaæ od do³u do góry.
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_01");//To trochê trudne, ale tym sposobem wydobêdziesz ze ska³y wiêcej z³ota.
	
	B_Upgrade_Hero_HackChance(5);
};



  
