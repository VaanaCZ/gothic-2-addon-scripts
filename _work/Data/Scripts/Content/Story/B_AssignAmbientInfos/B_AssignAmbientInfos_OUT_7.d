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
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_00"); //En los últimos tiempos la zona se ha vuelto mucho más peligrosa y los incursores de campo son una auténtica plaga.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_01"); //Tenemos que pagar el tributo a la ciudad si no queremos líos con los paladines.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_02"); //La rebelión de Onar va a tener graves repercusiones. Prefiero mantenerme al margen.
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
