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
	description = "Qu'y a-t-il?";
};
FUNC INT DIA_Addon_10027_Buddler_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10027_Buddler_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10027_Buddler_Hi_15_00");//Comment ça va ?
	
	if (Sklaven_Flucht == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_01");//J'ai déjà bien assez travaillé pour le compte des barons du minerai. Content que quelqu'un creuse enfin à ma place...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10027_Buddler_Hi_11_02");//Bon sang... il va falloir qu'on se remette à creuser nous-mêmes, pas vrai ?
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
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_00");//Tout est dans la tête, mon garçon. Le travail à la mine est un travail mental, avant tout. Il ne faut pas essayer de forcer la pierre - elle est plus dure que vous, de toutes façons.
	AI_Output (self, other, "DIA_Addon_10027_Buddler_Hacken_11_01");//Libérez votre esprit de tout, et essayez de ne faire qu'un avec l'or. Ensuite, c'est une méditation, une prière.
	
	B_Upgrade_Hero_HackChance(10);
};

