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
		AI_Output (self,other,"DIA_OUT_1_STANDARD_13_00"); //Hasta ahora, hemos podido mantener a raya a los orcos, pero cada vez hay más.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_13_01"); //La milicia tampoco acude en nuestra ayuda. Solo salen de la ciudad para llevarse la cosecha y el ganado.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_13_02"); //Onar está loco enfrentándose a la ciudad cuando los paladines están allí.
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
