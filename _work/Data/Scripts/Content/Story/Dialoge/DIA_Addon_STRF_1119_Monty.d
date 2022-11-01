//---------------------------------------------------------------------
//Arbeiter von Garvell
//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Monty_EXIT   (C_INFO)
{
	npc         = STRF_1119_Addon_Monty;
	nr          = 999;
	condition   = DIA_Addon_Monty_EXIT_Condition;
	information = DIA_Addon_Monty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Monty_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
var int Monty_einmal;
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Monty_Hi   (C_INFO)
{
	npc         = STRF_1119_Addon_Monty;
	nr          = 2;
	condition   = DIA_Addon_Monty_Hi_Condition;
	information = DIA_Addon_Monty_Hi_Info;
	permanent   = FALSE;
	description = "Co słychać?";
};
FUNC INT DIA_Addon_Monty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Monty_Hi_15_00");//Co słychać?
	AI_Output (self, other, "DIA_Addon_Monty_Hi_08_01");//Żyję i tylko to się liczy.
	
	if (Monty_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Monty_Hi_08_02");//Jeśli kiedyś będziesz chciał pogadać, jestem do twojej dyspozycji.
		Monty_einmal = TRUE;
	};
};
//---------------------------------------------------------------------
//	Info Hacken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Monty_Hacken   (C_INFO)
{
	npc         = STRF_1119_Addon_Monty;
	nr          = 2;
	condition   = DIA_Addon_Monty_Hacken_Condition;
	information = DIA_Addon_Monty_Hacken_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Monty_Hacken_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_Hacken_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Monty_Hacken_08_00");//Najważniejszy jest kąt, pod jakim zadajesz uderzenie.
	AI_Output (self, other, "DIA_Addon_Monty_Hacken_08_01");//Nie za płasko i nie za ostro. Tak najłatwiej pozyskać kruszec i nie połamać kilofa.
	
	B_Upgrade_Hero_HackChance(5);
};




