// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OUT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OUT_13_EXIT_Condition;
	information	= DIA_OUT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OUT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OUT_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_OUT_13_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_OUT_13_STANDARD_Condition;
	information	= DIA_OUT_13_STANDARD_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func INT DIA_OUT_13_STANDARD_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_OUT_13_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_13_00"); //Раньше нам удавалось не подпускать орков близко. Но последнее время их становится все больше и больше.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_13_01"); //От ополчения тоже мало толку. Они приходят из города только, чтобы забрать наш урожай и скот.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_13_02"); //Онар, наверное, выжил из ума, раз решился на конфликт с городом как раз тогда, когда прибыли паладины.
	};
	
	AI_StopProcessInfos	(self);
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OUT_13 (var c_NPC slf)
{
	DIA_OUT_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OUT_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
