// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_STRF_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_STRF_13_EXIT_Condition;
	information	= DIA_STRF_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STRF_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_STRF_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_STRF_13_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_STRF_13_STANDARD_Condition;
	information	= DIA_STRF_13_STANDARD_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_STRF_13_STANDARD_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_STRF_13_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_STRF_13_STANDARD_13_00"); //Nech mę na pokoji, chlape!
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_STRF_13_STANDARD_13_01"); //Co ode mę chceš? Nech mę být!
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_STRF_13_STANDARD_13_02"); //Všichni tady chcípneme!
	};
	
	AI_StopProcessInfos	(self);
};

//**************************************************************
//----------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_STRF_13 (var c_NPC slf)
{
	DIA_STRF_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_STRF_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};





