//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_PIR_1389_Tom_EXIT   (C_INFO)
{
	npc         = PIR_1389_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_PIR_Tom_EXIT_Condition;
	information = DIA_Addon_PIR_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_PIR_Tom_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_PIR_Tom_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
/*
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_PIR_1389_Tom_Hi   (C_INFO)
{
	npc         = PIR_1389_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_PIR_Tom_Hi_Condition;
	information = DIA_Addon_PIR_Tom_Hi_Info;
	permanent   = FALSE;
	description = "Und, wie geht's dir?";
};
FUNC INT DIA_Addon_PIR_Tom_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_PIR_Tom_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_PIR_Tom_Hi_15_00");//Und, wie geht's dir?
	AI_Output (self, other, "DIA_Addon_PIR_Tom_Hi_11_01");//Die Piraten haben mich aufgenommen. Guck mal, sie haben mir sogar eine ihrer Rüstungen gegeben.
	AI_Output (self, other, "DIA_Addon_PIR_Tom_Hi_11_02");//Aber ... Moment mal - du bist gar kein Bandit? Ich dachte ...
	AI_Output (other, self, "DIA_Addon_PIR_Tom_Hi_15_03");//(zwinkert) Pssst ... bleib ruhig. Alles ist gut.
	
	B_GivePlayerXP ((XP_Ambient) *2);
	AI_StopProcessInfos (self);
};
*/


