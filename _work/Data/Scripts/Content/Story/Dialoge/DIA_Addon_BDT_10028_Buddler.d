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
	description = "Jak se vede?";
};
FUNC INT DIA_Addon_10028_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10028_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10028_Buddler_Hi_15_00");//Jak se vede?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_01");//Pâece se nebudu obtêžovat s dolováním. Na to tu máme dost otrokù.
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_02");//(smêje se) Ještê nikdy jsme tak snadno nepâišli ke zlatu.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10028_Buddler_Hi_12_03");//Grrr. Kterej magor to osvobodil otroky?
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
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_00");//Vždycky doluj odspoda nahoru.
	AI_Output (self, other, "DIA_Addon_10028_Buddler_Hacken_12_01");//Je to sice makaèka, ale dá se tak z kamene získat mnohem víc zlata.
	
	B_Upgrade_Hero_HackChance(5);
};



  
