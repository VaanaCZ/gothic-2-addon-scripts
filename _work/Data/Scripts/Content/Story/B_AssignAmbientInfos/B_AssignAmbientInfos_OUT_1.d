// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OUT_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OUT_1_EXIT_Condition;
	information	= DIA_OUT_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OUT_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OUT_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_OUT_1_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_OUT_1_STANDARD_Condition;
	information	= DIA_OUT_1_STANDARD_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func INT DIA_OUT_1_STANDARD_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_OUT_1_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_00"); //Desde que desapareció la barrera que rodeaba la penitenciaría, los bandidos nos han dado guerra de manera constante.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_01"); //No se puede confiar en la milicia. Tenemos que defendernos por nuestra cuenta.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_02"); //No voy a dejar que nadie se aproveche de mí. Ni el rey, ni el gordo Onar. Solo lucho para mí.
	};
	
	AI_StopProcessInfos	(self);
};
	

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OUT_1 (var c_NPC slf)
{
	DIA_OUT_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OUT_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
