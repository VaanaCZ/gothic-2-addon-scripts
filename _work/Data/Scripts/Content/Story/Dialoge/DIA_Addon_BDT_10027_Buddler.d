//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10027_Buddler_EXIT   (C_INFO)
{
	npc         = BDT_10027_Addon_Buddler;
	nr          = 999;
	condition   = DIA_Addon_10027_Buddler_EXIT_Condition;
	information = DIA_Addon_10027_Buddler_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10027_Buddler_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10027_Buddler_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10027_Buddler_Hi   (C_INFO)
{
	npc         = BDT_10027_Addon_Buddler;
	nr          = 2;
	condition   = DIA_Addon_10027_Buddler_Hi_Condition;
	information = DIA_Addon_10027_Buddler_Hi_Info;
	permanent   = TRUE;
	description = "Co s�ycha�?";
};
FUNC INT DIA_Addon_10027_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10027_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10027_Buddler_Hi_15_00");//Co s�ycha�?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_01");//Do�� ju� harowa�em dla baron�w rudy. Dobrze, �e teraz inni kopi�.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_02");//Do diab�a, wygl�da na to, �e znowu musimy sami kopa�, co?
	};
};
//---------------------------------------------------------------------
//	Info Hacken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10027_Buddler_Hacken   (C_INFO)
{
	npc         = BDT_10027_Addon_Buddler;
	nr          = 3;
	condition   = DIA_Addon_10027_Buddler_Hacken_Condition;
	information = DIA_Addon_10027_Buddler_Hacken_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_10027_Buddler_Hacken_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10027_Buddler_Hacken_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_00");//Praca umys�owa. Ch�opcze, kopanie z�ota to praca czysto umys�owa. Nie pr�buj pokona� ska�y - jest twardsza ni� ty.
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_01");//Uwolnij sw�j umys� - musisz si� sta� jedno�ci� ze z�otem. Wtedy kopanie stanie si� modlitw�, medytacj�.
	
	B_Upgrade_Hero_HackChance(10);
};

