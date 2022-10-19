//////////////////////////////////////////////////////////////////
///	  			 
///
///			DIA_ORC_AntiPaladinX
///
///
//////////////////////////////////////////////////////////////////

// ***********************************************************************************************************************
// 	  	DIA_ORC_AntiPaladin1_EXIT
// ***********************************************************************************************************************

INSTANCE DIA_ORC_AntiPaladin1_EXIT(C_INFO)
{
	npc			= OrcElite_AntiPaladin1;
	nr			= 999;
	condition	= DIA_ORC_AntiPaladin1_EXIT_Condition;
	information	= DIA_ORC_AntiPaladin1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_ORC_AntiPaladin1_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_ORC_AntiPaladin1_EXIT_Info()
{	
	 AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ORC_AntiPaladin1
///////////////////////////////////////////////////////////////////////
instance DIA_ORC_AntiPaladin1		(C_INFO)
{
	npc		 	= 	OrcElite_AntiPaladin1;
	nr		 	= 	1;
	condition	= 	DIA_ORC_AntiPaladin1_Condition;
	information	= 	DIA_ORC_AntiPaladin1_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_ORC_AntiPaladin1_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
		{
			return TRUE;			
		};
};

func void DIA_ORC_AntiPaladin1_Info ()
{	
	B_AssignORC_AntiPaladinTalk (self);
};

// ***********************************************************************************************************************
// 	  	DIA_ORC_AntiPaladin2_EXIT
// ***********************************************************************************************************************

INSTANCE DIA_ORC_AntiPaladin2_EXIT(C_INFO)
{
	npc			= OrcElite_AntiPaladin2;
	nr			= 999;
	condition	= DIA_ORC_AntiPaladin2_EXIT_Condition;
	information	= DIA_ORC_AntiPaladin2_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_ORC_AntiPaladin2_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_ORC_AntiPaladin2_EXIT_Info()
{	
	 AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ORC_AntiPaladin2
///////////////////////////////////////////////////////////////////////
instance DIA_ORC_AntiPaladin2		(C_INFO)
{
	npc		 	= 	OrcElite_AntiPaladin2;
	nr		 	= 	1;
	condition	= 	DIA_ORC_AntiPaladin2_Condition;
	information	= 	DIA_ORC_AntiPaladin2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_ORC_AntiPaladin2_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_ORC_AntiPaladin2_Info ()
{	
	B_AssignORC_AntiPaladinTalk (self);
};

// ***********************************************************************************************************************
// 	  	DIA_ORC_AntiPaladin3_EXIT
// ***********************************************************************************************************************

INSTANCE DIA_ORC_AntiPaladin3_EXIT(C_INFO)
{
	npc			= OrcElite_AntiPaladin3;
	nr			= 999;
	condition	= DIA_ORC_AntiPaladin3_EXIT_Condition;
	information	= DIA_ORC_AntiPaladin3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_ORC_AntiPaladin3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_ORC_AntiPaladin3_EXIT_Info()
{	
	 AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ORC_AntiPaladin3
///////////////////////////////////////////////////////////////////////
instance DIA_ORC_AntiPaladin3		(C_INFO)
{
	npc		 	= 	OrcElite_AntiPaladin3;
	nr		 	= 	1;
	condition	= 	DIA_ORC_AntiPaladin3_Condition;
	information	= 	DIA_ORC_AntiPaladin3_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_ORC_AntiPaladin3_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_ORC_AntiPaladin3_Info ()
{	
	B_AssignORC_AntiPaladinTalk (self);
};

