// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_STRF_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_STRF_1_EXIT_Condition;
	information	= DIA_STRF_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STRF_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_STRF_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_STRF_1_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_STRF_1_STANDARD_Condition;
	information	= DIA_STRF_1_STANDARD_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_STRF_1_STANDARD_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_STRF_1_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_STRF_1_STANDARD_01_00"); //Si j'étais parti quand j'en ai eu l'occasion, je n'aurais pas besoin de trimer pour ce salaud !
	};
	if (randy == 1)
	{
		AI_Output (self,other,"DIA_STRF_1_STANDARD_01_01"); //Tout cela, c'est une histoire de minerai. C'est toujours la même chose. Ils veulent tous ce maudit minerai.
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_STRF_1_STANDARD_01_02"); //Si vous deviez manger les détritus qu'ils nous jettent, vous aussi vous songeriez à la révolte !
	};
	
	AI_StopProcessInfos	(self);
};

//**************************************************************
//----------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_STRF_1 (var c_NPC slf)
{
	DIA_STRF_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_STRF_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};





