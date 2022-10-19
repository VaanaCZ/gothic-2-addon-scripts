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
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_00"); //Seit die Barriere um die Strafkolonie weg ist, haben wir st�ndig �rger mit Banditen.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_01"); //Auf die Miliz ist kein Verlass. Wir m�ssen uns selbst verteidigen.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_1_STANDARD_01_02"); //Ich lass mich f�r niemanden einspannen. Weder vom K�nig, noch von dem fetten Onar. Ich k�mpfe nur f�r mich selbst.
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
