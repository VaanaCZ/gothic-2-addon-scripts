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
	description = "¿Qué pasa?";
};
FUNC INT DIA_Addon_10027_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10027_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10027_Buddler_Hi_15_00");//¿Qué tal todo?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_01");//He trabajado para los Magnates del Mineral durante mucho tiempo. Me alegro de que ahora cave otro.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_02");//Mierda. Tendremos que volver a cavar nosotros, ¿eh?
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
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_00");//Trabajo neuronal, chaval. Extraer oro es un procedimiento puramente mental. No intentes forzar la roca, es más dura que tú.
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_01");//Libera tu mente de todo e intenta fusionarte con el oro. Es como la meditación, es una oración.
	
	B_Upgrade_Hero_HackChance(10);
};

