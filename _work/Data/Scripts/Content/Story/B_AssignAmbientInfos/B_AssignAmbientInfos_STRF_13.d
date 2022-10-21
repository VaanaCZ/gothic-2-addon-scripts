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
		AI_Output (self,other,"DIA_STRF_13_STANDARD_13_00"); //Zostaw mnie w spokoju, cz³owieku!
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_STRF_13_STANDARD_13_01"); //Czego chcesz? Nie czepiaj siê mnie!
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_STRF_13_STANDARD_13_02"); //Wszyscy tutaj umrzemy!
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





