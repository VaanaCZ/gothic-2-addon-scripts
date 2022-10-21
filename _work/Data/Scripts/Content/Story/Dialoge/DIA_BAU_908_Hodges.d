//##################################################
//##
//##	Kapitel 1
//##
//##################################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Hodges_Kap1_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap1_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap1_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap1_EXIT_Condition ()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};

func void DIA_Hodges_Kap1_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Hodges_HALLO		(C_INFO)
{
	npc		 	= BAU_908_Hodges;
	nr		 	= 1;
	condition	= DIA_Hodges_HALLO_Condition;
	information	= DIA_Hodges_HALLO_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hodges_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Hodges_HALLO_15_00"); //������, � ������� �����.
	AI_Output (self, other, "DIA_Hodges_HALLO_03_01"); //�� ����� ���� �����������, �� ������ � ���� ��� ���������� ������������� - � ��������� �������.
	AI_Output (other, self, "DIA_Hodges_HALLO_15_02"); //�� ������ �����, ��?
	AI_Output (self, other, "DIA_Hodges_HALLO_03_03"); //���� �� ������. ������ ������ ������� ������, ��� ���� ������� ���������� ���.
};

// ************************************************************
// 			  				 About Farm
// ************************************************************
instance DIA_Hodges_TellAboutFarm	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_TellAboutFarm_Condition;
	information	 = 	DIA_Hodges_TellAboutFarm_Info;
	permanent 	 = 	FALSE;
	description	 = 	"��� �� ������ ���������� ��� �� ���� �����?";
};

func int DIA_Hodges_TellAboutFarm_Condition ()
{
	if ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};	
};

func void DIA_Hodges_TellAboutFarm_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_TellAboutFarm_15_00"); //��� �� ������ ���������� ��� �� ���� �����?
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_01"); //��� ����� �����.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_02"); //��� ������� ������ - ��� ���. �� ��������� ���� ����� ��� ���������.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_03"); //� ���, ��������, �������� ������������ � �����.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_04"); //(���������) �� � ������ �� ������, ������ ����, ��� ���� ����, ��������� �������� �����.
	
	if (Npc_GetDistToWP (self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_05"); //��� ��� ������ - �����.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_06"); //����� ������ ��������� �������.
	};
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_07"); //��������, ���� ������� � ����� ���������� ���� ���-������ ������.
};

// ************************************************************
// 			  				   AboutSld 
// ************************************************************
instance DIA_Hodges_AboutSld	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_AboutSld_Condition;
	information	 = 	DIA_Hodges_AboutSld_Info;
	permanent 	 = 	FALSE;
	description	 = 	"� ��� ������ ���������?";
};

func int DIA_Hodges_AboutSld_Condition ()
{
	if (hero.guild != GIL_SLD) 
	&& (hero.guild != GIL_DJG)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_AboutSld_15_00"); //� ��� ������ ���������?
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_01"); //���� ����� ��, ����� ��� �� ������� ���� ���������.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_02"); //�� ����� ��� �������� �����, ����� ���� � ����� ��������.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_03"); //��� ��� ���� �� ����� ������� ���-������ ��� �������� � ����� �������.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_04"); //��� ������ � ���� �����, ����� ������ ���� ������.
};

// ************************************************************
// 			  				   TRADE 
// ************************************************************
instance DIA_Hodges_TRADE	(C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 2;
	condition	= DIA_Hodges_TRADE_Condition;
	information	= DIA_Hodges_TRADE_Info;
	permanent 	= TRUE;
	description	= "���� � ������ ������ � ����?";
	trade		= TRUE;
};

func int DIA_Hodges_TRADE_Condition ()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info ()
{	
	AI_Output (other, self ,"DIA_Hodges_TRADE_15_00"); //���� � ������ ������ � ����?
	AI_Output (self, other, "DIA_Hodges_TRADE_03_01"); //� ���� ���� ��� ����. �� ������� ����� ��� ���� � ������ � ��� �����.
	
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
};


//##################################################
//##
//##	Kapitel 2
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap2_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap2_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap2_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap2_EXIT_Condition ()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 3
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap3_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap3_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap3_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap3_EXIT_Condition ()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Warum arbeitest du nicht?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_DontWork		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_DontWork_Condition;
	information	 = 	DIA_Hodges_DontWork_Info;
	permanent 	 = 	FALSE;
	description	 = 	"������ �� �� ���������?";
};

func int DIA_Hodges_DontWork_Condition ()
{
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_DontWork_15_00"); //������ �� �� ���������?
	AI_Output (self ,other,"DIA_Hodges_DontWork_03_01"); //�� ��� ������ �� ������? �������� ���������� �������.

	MIS_RescueBennet = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"������ ������ ��������� ���������� � ������."); 

};

///////////////////////////////////////////////////////////////////////
//	Was ist passiert?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_WhatHappened		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_WhatHappened_Condition;
	information	 = 	DIA_Hodges_WhatHappened_Info;
	permanent 	 = 	FALSE;
	description	 = 	"��� ���������?";
};

func int DIA_Hodges_WhatHappened_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_WhatHappened_15_00"); //��� ���������?
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_01"); //��, �� ���� � ������ �� ���������, ����� ���������� �������� ����. ���-�� ������: '��� ���, ������� ��!'
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_02"); //��, ��� � ���������! � �������� ������. � ����� ���, ��� ����� �� ���� ������� ������.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_03"); //������ ����� �� ����. � �� ����, ��� ���������, �� ����� � �������� �� ������, ��� �� ���� ��� �� ����.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_04"); //������ ����, �� ������ ���-�� � ������.
};

///////////////////////////////////////////////////////////////////////
//	Weswegen wurde Bennet denn verhaftet?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetsCrime			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	32;
	condition	 = 	DIA_Hodges_BennetsCrime_Condition;
	information	 = 	DIA_Hodges_BennetsCrime_Info;
	permanent 	 = 	FALSE;
	description	 = 	"��� ������ ������� ����������?";
};

func int DIA_Hodges_BennetsCrime_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetsCrime_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_00"); //��� ������ ������� ����������?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_01"); //��������! ������� ����������� � �������� ��������. ����� ����. � ��� � ��� ��� ��� �����.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_02"); //��� ������ �� �� ������� � ����� � �� ����������, ��� ��� ����?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_03"); //��� ������� ���� � ������ ��� ��� ���������. �����, ����� ������ ������, �������� ��������.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_04"); //��������?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_05"); //���������, ���� � ��� ��������� � �������... ��� ��� ����� ����� ���������.

	B_LogEntry (TOPIC_RESCUEBENNET,"�������, ��� ������ ���� ��������. ��� ������ ������ ����������, ��� ������ ���������, �� �� �� ������������ ������� � �����."); 
};


///////////////////////////////////////////////////////////////////////
//	Wie reagieren die S�ldner?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetAndSLD			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	33;
	condition	 = 	DIA_Hodges_BennetAndSLD_Condition;
	information	 = 	DIA_Hodges_BennetAndSLD_Info;
	permanent 	 = 	FALSE;
	description	 = 	"� ��� ������������� �������� �� �����?";
};

func int DIA_Hodges_BennetAndSLD_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_00"); //� ��� ������������� �������� �� �����?
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_01"); //�����������, � �� ����, ��� ��� ���������, �� ������ �� ��� ������ � ������.
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_02"); //��� �������.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_03"); //���� �� � ��� ���� ����� ������, ��� �� ��������� ����� ��� �������, ����� ���������� �������.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_04"); //�������� � ��, ����� ����, �� ���-������ ������� ������.
};
//##################################################
//##
//##	Kapitel 4
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap4_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap4_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap4_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap4_EXIT_Condition ()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 5
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap5_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap5_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap5_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap5_EXIT_Condition ()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hodges_PICKPOCKET (C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 900;
	condition	= DIA_Hodges_PICKPOCKET_Condition;
	information	= DIA_Hodges_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Hodges_PICKPOCKET_Condition()
{
	C_Beklauen (15, 10);
};
 
FUNC VOID DIA_Hodges_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hodges_PICKPOCKET);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_BACK 		,DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};
	
func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};




