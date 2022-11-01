// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BDT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BDT_13_EXIT_Condition;
	information	= DIA_BDT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BDT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BDT_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
INSTANCE DIA_BDT_13_STANDARD(C_INFO)
{
	nr			= 2;
	condition	= DIA_BDT_13_STANDARD_Condition;
	information	= DIA_BDT_13_STANDARD_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_BDT_13_STANDARD_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC void B_Verschwinde_Stimme13 ()
{
	AI_Output (self,other,"DIA_BDT_13_STANDARD_13_01"); //Zmiz!
};

FUNC VOID DIA_BDT_13_STANDARD_Info()
{	
	var int randy;
	randy = Hlp_Random (3);
	
	if (randy == 0)
	{
		AI_Output (self,other,"DIA_BDT_13_STANDARD_13_00"); //Co čumíš jak jelito!
	};
	if (randy == 1)
	{
		B_Verschwinde_Stimme13 ();
	};
	if (randy == 2)
	{
		AI_Output (self,other,"DIA_BDT_13_STANDARD_13_02"); //Nech mę na pokoji, ty vandráku.
	};
	
	AI_StopProcessInfos	(self);
};

//**************************************************************
//----------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BDT_13 (var c_NPC slf)
{
	DIA_BDT_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BDT_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};





