///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_270_EXIT   (C_INFO)
{
	npc         = PAL_270_Ritter;
	nr          = 999;
	condition   = DIA_PAL_270_EXIT_Condition;
	information = DIA_PAL_270_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_PAL_270_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_270_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info OUT
///////////////////////////////////////////////////////////////////////
instance DIA_Ritter_OUT		(C_INFO)
{
	npc			 = 	PAL_270_Ritter;
	condition	 = 	DIA_Ritter_OUT_Condition;
	information	 = 	DIA_Ritter_OUT_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int DIA_Ritter_OUT_NoPerm;
func int DIA_Ritter_OUT_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Ritter_OUT_Info ()
{
	if (DIA_Ritter_OUT_NoPerm == FALSE)
	{
		AI_Output			(self, other, "DIA_Ritter_OUT_06_00"); //You've come from Khorinis, haven't you? When all this is over, I shall return there.
		DIA_Ritter_OUT_NoPerm = TRUE;
	};
	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Ritter_OUT_06_01"); //It's a great comfort having you on our side, Sir.
		}
		else
		{
			AI_Output			(self, other, "DIA_Ritter_OUT_06_02"); //We're going to make it. We'll bring the ore to Khorinis and let them celebrate us!
		};
};


 



