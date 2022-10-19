///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Draal_EXIT   (C_INFO)
{
	npc         = STRF_1101_Draal;
	nr          = 999;
	condition   = DIA_Draal_EXIT_Condition;
	information = DIA_Draal_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Draal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Draal_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info DRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Draal_DRAGON		(C_INFO)
{
	npc		 = 	STRF_1101_Draal;
	nr		 = 	1;
	condition	 = 	DIA_Draal_DRAGON_Condition;
	information	 = 	DIA_Draal_DRAGON_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Draal_DRAGON_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Draal_DRAGON_Info ()
{
	AI_Output			(self, other, "DIA_Draal_DRAGON_03_00"); //I was outside when the dragon attacked.
	AI_Output			(self, other, "DIA_Draal_DRAGON_03_01"); //I saw it, big as 10 men - its fiery breath destroyed the huts in the blink of an eye!
	AI_Output			(self, other, "DIA_Draal_DRAGON_03_02"); //A dragon! I'm staying here. Nothing is going to budge me. I'm not crazy!
};






