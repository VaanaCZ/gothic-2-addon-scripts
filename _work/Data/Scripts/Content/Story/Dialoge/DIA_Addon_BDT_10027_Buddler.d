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
	description = "Jak se vede?";
};
FUNC INT DIA_Addon_10027_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10027_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10027_Buddler_Hi_15_00");//Jak se vede?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_01");//Už jsem pro rudobarony dâel dost dlouho. Teë se tu pro zmênu mùže lopotit zase nêkdo jinej.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_02");//Sakra, to teë jako máme zase dolovat sami nebo co?
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
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_00");//To chce makat hlavnê hlavou, hochu. Dolování zlata je èistê mentální záležitost. Kámen k nièemu nepâinutíš – je tvrdší než ty.
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_01");//Otevâi svou mysl a splyà se silou zlata. Je to jako meditace, jako modlitba.
	
	B_Upgrade_Hero_HackChance(10);
};

