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
	description = "Co s�ycha�?";
};
FUNC INT DIA_Addon_10028_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10028_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10028_Buddler_Hi_15_00");//Co s�ycha�?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_01");//Nie zamierzam tu kopa�. Od tego mamy niewolnik�w.
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_02");//Zdobywanie z�ota jeszcze nigdy nie by�o tak �atwe!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_03");//Hmmf. Co za idiota uwolni� niewolnik�w?
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
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_00");//Musisz kopa� od do�u do g�ry.
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_01");//To troch� trudne, ale tym sposobem wydob�dziesz ze ska�y wi�cej z�ota.
	
	B_Upgrade_Hero_HackChance(5);
};



  
