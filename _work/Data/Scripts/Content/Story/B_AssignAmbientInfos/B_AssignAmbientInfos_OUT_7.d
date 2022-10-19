// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OUT_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OUT_7_EXIT_Condition;
	information	= DIA_OUT_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OUT_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OUT_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_OUT_7_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_OUT_7_STANDARD_Condition;
	information	= DIA_OUT_7_STANDARD_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func INT DIA_OUT_7_STANDARD_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_OUT_7_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_00"); //Ultimamente da queste parti è diventato molto più pericoloso, e i razziatori dei campi stanno diventando una vera piaga.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_01"); //Dobbiamo pagare le nostre tasse alla città. Se non lo facciamo, avremo dei guai con i paladini.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_02"); //La ribellione di Onar avrà delle conseguenze serie. Io preferisco restarne fuori.
	};
	
	AI_StopProcessInfos	(self);
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OUT_7 (var c_NPC slf)
{
	DIA_OUT_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OUT_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
