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
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_00"); //Ostatnio okolica sta³a siê o wiele bardziej niebezpieczna. Polne bestie to prawdziwa plaga.
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_01"); //Do tego musimy jeszcze p³aciæ kontrybucjê na rzecz miasta. Jeœli tego zaprzestaniemy, œci¹gniemy sobie na g³owê paladynów.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_OUT_7_STANDARD_07_02"); //Bunt Onara poci¹gnie za sob¹ powa¿ne konsekwencje. Wolê trzymaæ siê od tego z daleka.
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
