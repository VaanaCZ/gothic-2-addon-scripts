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
	description = "Ehi, cosa succede?";
};
FUNC INT DIA_Addon_Monty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Monty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Monty_Hi_15_00");//Ehi, come va?
	AI_Output (self, other, "DIA_Addon_Monty_Hi_08_01");//Sono vivo, il resto non m'importa.
	
	if (Monty_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Monty_Hi_08_02");//Se vuoi parlare di qualcosa, cerca Patrick.
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
	AI_Output (self, other, "DIA_Addon_Monty_Hacken_08_00");//Per estarre il metallo in maniera efficiente l'angolazione è essenziale.
	AI_Output (self, other, "DIA_Addon_Monty_Hacken_08_01");//Non inclinare la piccozza troppo, né troppo poco: così arriverai alle pepite e non danneggerai l'attrezzo.
	
	B_Upgrade_Hero_HackChance(5);
};




