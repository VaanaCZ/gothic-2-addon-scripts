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
		AI_Output			(self, other, "DIA_Ritter_OUT_06_00"); //Vieni da Khorinis, non è vero? Quando tutto questo sarà finito, tornerò lì.
		DIA_Ritter_OUT_NoPerm = TRUE;
	};
	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Ritter_OUT_06_01"); //Ci è di grande conforto avervi al nostro fianco, Signore.
		}
		else
		{
			AI_Output			(self, other, "DIA_Ritter_OUT_06_02"); //Ce la faremo. Porteremo il metallo a Khorinis e saremo inneggiati come eroi!
		};
};


 



