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
	description = "Co s³ychaæ?";
};
FUNC INT DIA_Addon_Monty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Monty_Hi_15_00");//Co s³ychaæ?
	AI_Output (self, other, "DIA_Addon_Monty_Hi_08_01");//¯yjê i tylko to siê liczy.
	
	if (Monty_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Monty_Hi_08_02");//Jeœli kiedyœ bêdziesz chcia³ pogadaæ, jestem do twojej dyspozycji.
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
	AI_Output (self, other, "DIA_Addon_Monty_Hacken_08_00");//Najwa¿niejszy jest k¹t, pod jakim zadajesz uderzenie.
	AI_Output (self, other, "DIA_Addon_Monty_Hacken_08_01");//Nie za p³asko i nie za ostro. Tak naj³atwiej pozyskaæ kruszec i nie po³amaæ kilofa.
	
	B_Upgrade_Hero_HackChance(5);
};




