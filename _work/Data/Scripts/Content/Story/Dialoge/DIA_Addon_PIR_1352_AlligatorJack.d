// ************************************************************
// 			  				 Exit 
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Exit(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 999;
	condition	= DIA_Addon_AlligatorJack_Exit_Condition;
	information	= DIA_Addon_AlligatorJack_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;	
};
var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;
FUNC VOID DIA_Addon_AlligatorJack_Exit_Info()
{	
	
	if (MIS_KrokoJagd == LOG_SUCCESS)
	&& (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_00"); //���� � ���� �����������, �� ������� ����� ���� � ����� ������ ����� � ����������.
	
		if (PIR_1354_Addon_Henry.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output (other ,self,"DIA_Addon_AlligatorJack_Exit_15_01"); //����������?
			AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_02"); //��������� ���� �� �����, � �� �������, � ��� � ������.
		};
		
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine (self, "START");
		
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_AlligatorJack_PICKPOCKET (C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 900;
	condition	= DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information	= DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	C_Beklauen (100, 333);
};
 
FUNC VOID DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
	
func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
// ************************************************************
// 			  		Hello
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Hello(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Hello_Condition;
	information	= DIA_Addon_AlligatorJack_Hello_Info;
	permanent	= FALSE;
	Important	= TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Hello_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_AlligatorJack_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_00"); //���, ���� ������, �� �����? �� �� ����� �� ���������.
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Hello_15_01"); //����� ��� ���������?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_02"); //��, �����, ������� ����� ������������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_03"); //�� ���� �� �� ��������, ���?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_04"); //�������� ����� � ����� ������� ����������� ����� � ��������.
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WerBistDu_Info;

	description	 = 	"��� ��?";
};

func int DIA_Addon_AlligatorJack_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WerBistDu_15_00"); //��� �� �����?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_01"); //������, �� ��� ��� ������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_02"); //(�����) � - ��������� ����.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_03"); //���� ������ ������ ���� ������. � - ���� �� ����� ������� ������� � ���� �����.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_04"); //������ � ��������� ������ �� �������� ������ ���������� ��������, ��� � ���� ���������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_05"); //��� ��� ������ �� �������������� � ����� ��������.
};

///////////////////////////////////////////////////////////////////////
//	Info Vorschlag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Vorschlag		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Vorschlag_Info;

	description	 = 	"�� ������ �������� �� ����� �����?";
};

func int DIA_Addon_AlligatorJack_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_15_00"); //�� ������ �������� �� ����� �����?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_01"); //�������. �� ��������� ���������, �������� �� �������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_02"); //� ��� ���� �� ���� ����?
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"������ � ��� �������� ����� ����� � ��������� ����� ������.");
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "� ���� �������������� � ������.", DIA_Addon_AlligatorJack_Vorschlag_join );
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "� ������ ����� ������.", DIA_Addon_AlligatorJack_Vorschlag_tot );
};

func void 	B_AlligatorJack_Besser ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_00"); //�����, � ���� � ���� ���� ������ �����������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_01"); //������������� � ���.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_02"); //� ���� ����� ����� ��� ��������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_03"); //� ����� �� ���������� ��� ���, � ���� ���������� ������� �� �����.
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
};
func void DIA_Addon_AlligatorJack_Vorschlag_tot ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_tot_15_00"); //� ������ ����� ������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_01"); //(�������) ���? ��? � ��� �� �� ����������� ��� �������?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_02"); //����� �� ���� �� �����?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_03"); //�� � ���� � ������ �� ���������. ��� ������� � ���� ������ ����� ������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_04"); //�� ���� ����� ������ �� ���� �� ��������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_05"); //��������� �� ���, ��� � ��� ��� ���� ���� ����� ���� ���������.
	
	B_AlligatorJack_Besser ();
};
func void DIA_Addon_AlligatorJack_Vorschlag_join ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_join_15_00"); //� ���� �������������� � ������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_01"); //�������������?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_02"); //� ��������� �� �� ���, ��� �������, ������� �������������� � ����� �������.

	B_AlligatorJack_Besser ();
};

///////////////////////////////////////////////////////////////////////
//	Info BDTRuestung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_BDTRuestung		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Info;

	description	 = 	"��� ����� ������� ��������.";
};

func int DIA_Addon_AlligatorJack_BDTRuestung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Vorschlag))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_15_00"); //��� ����� ���������� �������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_01"); //����� ��� ��� ���� ������������?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_02"); //���� ���� � ��� ������, �� ������ ������� � ����.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_03"); //���� ������ �� ������� � ���������� �����.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_04"); //Au�er den Banditen SELBST vielleicht.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_05"); //Die werden dich h�chstens noch f�r einen von ihnen halten.
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "�� �� ������, ��� ��� ����� ����� �������?", DIA_Addon_AlligatorJack_BDTRuestung_wo );
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "������ �������...", DIA_Addon_AlligatorJack_BDTRuestung_gut );
};
func void DIA_Addon_AlligatorJack_BDTRuestung_gut ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00"); //������ �������...
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01"); //��, ��� ����, ��� ������� ��������� ����� �������������.
};
func void DIA_Addon_AlligatorJack_BDTRuestung_wo ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00"); //�� �� ������, ��� ��� ����� ����� �������?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01"); //� ��� � ��������� ������ ��� ���� ��������.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_02"); //Mmh ... Ich denke, die hatte genau deine Gr��e.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03"); //�� ����, ������� �� �� �� ��� ���.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"� ������� ������ ���� ������� ��������. �� ��������� ���� �� ����� ������� ���, ��� �� ���."); 
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Greg		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Greg_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Greg_Info;

	description	 = 	"������ �������� ����� ����?";
};

func int DIA_Addon_AlligatorJack_Greg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_00"); //������ �������� ����� ����?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_01"); //��. � ��� ����� ���������� �����, �����-���� ����������� ����. 
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_02"); //�����, � ���� ������ ��������. � �������� ��� � ��������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_03"); //(�������) �����? � ��������? ������!
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_04"); //���� � ������ ������� ���������� � ���� �� �������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_05"); //� ������� �� ����� ������� ������ �� ����������� �������� ������. 
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_06"); //��� �� ���� �� ����� ��������� ������������ � ������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_07"); //�� �� �� ��� �� ������ � ����� �� ����� ����. ������ �� �������� �������� ��� � ������ � ������.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_08"); //��, ���� �� ��� ��������...
};

///////////////////////////////////////////////////////////////////////
//	Info PIRLager
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_PIRLager		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_PIRLager_Condition;
	information	 = 	DIA_Addon_AlligatorJack_PIRLager_Info;

	description	 = 	"��� ��������� ��� ������?";
};

func int DIA_Addon_AlligatorJack_PIRLager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_00"); //��� ��������� ��� ������?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_01"); //������ ���� ������? ��� ����� ���� � ����������� �� �����. ���� ��� ������ �� ������� �� ������ ������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_02"); //��� � ����� ���� ����.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_03"); //� ��� �� ���� ���������, �� �� ������ ������� ��� ���� ������.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_04"); //����� ��?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_05"); //������ ��� ������������ � ������, � ������ ������ ������� ���.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_06"); //���� �� ����, �� ������� �������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_07"); //�� ��� �� ������ ��� ���������. ��������?

	Log_CreateTopic (TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RatHunt,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RatHunt,"���������� ����� ����� ������ � �����.");

};

///////////////////////////////////////////////////////////////////////
//	Info WasJagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WasJagen		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WasJagen_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WasJagen_Info;

	description	 = 	"�� ���� �� ���������?";
};

func int DIA_Addon_AlligatorJack_WasJagen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_00"); //�� ���� �� ���������?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_01"); //���� ����� �� �����������. �� �� ���� ����������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_02"); //� ���� ��, �� ����� ��� �� ��������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_03"); //������� ��� ���������� ������ �������� ����.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_04"); //���?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_05"); //���� ����������� ������� ������ ���� ����� ���� ������ ������, ���� �������, ��� ��������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_06"); //�����-����� �������� ������ ���� ���� ������ �������� ����.

	B_LogEntry (TOPIC_Addon_RatHunt,"������������ �������� �����, ���� �������� ����� ����, - ��� �������� �����.");
};

// ************************************************************
//				Pirates
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Pirates(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Pirates_Condition;
	information	= DIA_Addon_AlligatorJack_Pirates_Info;
	permanent	= FALSE;
	description	= "�������� ��� ������ � �������.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
		{
			return TRUE;
		};
};

FUNC VOID DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Pirates_15_00"); //�������� ��� ������ � �������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_01"); //�� ����� ����� ��� ����� ���. �� ������ ����� ��� ����� �����, �� �������� �� ����������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_02"); //���� ��� ������ ����� ������ ���� � ������ �������� �� �������� ��������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_03"); //�� �� ������� ������. ��� ��������� ������ ��� �� ����������� ������� � �������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_04"); //������� ���� � �������� ����� ���������� �� ������ ��������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_05"); //� ��������� ������ ����� � ������ � ����, ����� �� ��������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_06"); //�������, �� �������� �������� ���.
};


// ************************************************************
// 			  			Lass uns jagen gehen
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_LetsGoHunting(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information	= DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent	= TRUE;
	description = "������ �� �����.";
};                       
FUNC INT DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if (MIS_KrokoJagd == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_WasJagen)) 
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00"); //������ �� �����.
	AI_Output (self,other ,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01"); //�������. ������ �� � ��������� � ���� ���������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02"); //�� �����?
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"��� ���.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"��.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};
const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00"); //��.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01"); //���������. ������� ����� �� ����.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "HUNT1");
		
		
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");

	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
		
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	
	MIS_KrokoJagd = LOG_RUNNING;
};

FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00"); //��� ���.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01"); //����� �������.
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter1		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter1)
	&& Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500  
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00"); //������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01"); //����� ��� ����� �������.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02"); //������ �� ����.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


///////////////////////////////////////////////////////////////////////
//	Info Das habe ich bef�rchtet
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_TheHunt		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_TheHunt_Condition;
	information	 = 	DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_TheHunt_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Kessel)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info ()
{
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_00"); //����� � � ������.
	AI_Output 	(other ,self, "DIA_Addon_AlligatorJack_TheHunt_15_01"); //����?
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_02"); //����� ������ �������� �� ���� ���������� ����, ��� ��� �����.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_03"); //������ ��� �������� ����������� � ������.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_04"); //���� ���������. ����������� � ������ ������ ������.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_05"); //���� ���� ������ �����, �� ������ �� ����.
	
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");

	Info_ClearChoices (DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"� ��� ���, � �������?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"������, ������.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Enough ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00"); //� ��� ���, � �������?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01"); //�� ��������� �������� ����� �����.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02"); //��� ����� ����������. ������� �����. ���� ������ ���� - ������� �� ��� ��������.
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Running ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00"); //������, ������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01"); //������������.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter2		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter2)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500)
	&& (GregIsBack == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00"); //������.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};

///////////////////////////////////////////////////////////////////////
//	Info Das ist jetzt aber genug
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_HuntEnd		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information	 = 	DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_HuntEnd_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Canyon)
	&& (Npc_GetDistToWP (self,"ADW_CANYON_TELEPORT_PATH_06") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info ()
{
	if (AlligatorJack_KrokosKilled == 0)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00"); //�� ��������� ���, ����� � ���� ����?
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01"); //�� �� ���� �� ����� �������� �����!
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02"); //�� �����. ��������, �� ���� � ������ �����-������ ����.
		
	}
	else if AlligatorJack_KrokosKilled == 1
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03"); //�������. ����� �������, ��� ��, ����� ��� �����������.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04"); //�� ������ �� ����� �� ����� ������ �����. ����� ������.
	}
	else	//mehr als 1!!
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05"); //� �� - ������� �������.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06"); //����! ���� �� � ������ ������ ��� ���������, � ��������� ��� � ����� �������� � ������.
	};
	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_07"); //������ ��� ���� �������� ���� ������� ������ �������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_08"); //�� ������� ��� � ����� ������.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_09"); //�� ��������� ������� �� ��������. ����� ��� ����, �� ����.
	
	if (PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_10"); //���� � ������ ������ �������� �����. ��� ������ - �� ���������� ��������.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_11"); //���� �� ��������� ���� ��������, �����, ��� ������ ���� �.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_12"); //��������, ��� ������� ��� ����� �����������.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_13"); //����� ������ ���������� ����� ����������...
	};
	
	MIS_AlligatorJack_BringMeat = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BringMeat,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BringMeat,"��������� ���� ��� ��� ������ ������ ����. � ������ �������� �� �������.");

	B_LogEntry (TOPIC_Addon_RatHunt,"����� ���� �������. �� ����� ��������� �������� ����.");
	
	B_GiveInvItems (self ,other,ItFoMuttonRaw,10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_KrokoJagd);
};


///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Angus		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Angus_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Angus_Info;
	permanent 	 = 	FALSE;
	description	 = 	"�� ������ ������ � �����?";

};

func int DIA_Addon_AlligatorJack_Angus_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bill_AngusnHank)	== TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Addon_AlligatorJack_Angus_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_00"); //�� ������ ������ � �����?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_03"); //� �� ��� �������� ����� �� �����.
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_04"); //� � �� ���� �������, ���� ��� ������� � ����� �� ��������.
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_05"); //������?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_06"); //��� ������� ��������� �������� � ����� � ������ ����.
};

///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Lake		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Lake_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Lake_Info;
	permanent 	 = 	FALSE;
	description	 = 	"��� ��� �� �����?";
};

func int DIA_Addon_AlligatorJack_Lake_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_Angus) == TRUE)
	&& (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_00"); //��� ��� �� �����?

	if (MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_01"); //������� ���� �����?
		AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_02"); //��.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_03"); //����� � ������. � ��������� �� ��� ��������.
	}
	else
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_04"); //����� � ������� ������.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_05"); //��� �� ������ �� ������. �� �������� ������ ����������.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_06"); //��� ��� ��������� ��������� ���������.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_07"); //���� ���������� - ���� � ���� ��� ������ ��� ������, ����� �����, ������, �� ��������� ������� � ������ � ������. 
	};
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"������ ������ ���� � ������ �� ������� �� ������, ����� � ������.");
};
	
///////////////////////////////////////////////////////////////////////
//	Info kannst du mir was beibringen?
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_CanLearn		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_CanLearn_Condition;
	information	 = 	DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent 	 = 	TRUE;
	description	 = 	"�� ������ ������� ���� ����-������?";

};

func int DIA_Addon_AlligatorJack_CanLearn_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if ((Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE)
		|| (GregIsBack == TRUE))
		{
			return TRUE;
		};	
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_CanLearn_15_00"); //�� ������ ���� ����-������ �������?
	
	if MIS_KrokoJagd > LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_01"); //�������. � ������� ������� � ���� ������� ���� ������� � �������� ����� � �������� ����.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_02"); //���� ������, � ���� �������� ����� ���������.
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry		(Topic_Addon_PIR_Teacher,"��������� ���� ����� ������� ���� ������� � �������� ����� � �������� ����. ����� ����, �� ����� ������� ���� ����� �������� �� ����.");
		
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_03"); //�� ������� �� ������ �������� ���, ��� ����� � ����� ��������.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_04"); //� ����� ����� ���� ������ ����� ����, ��� �� ������ ������ �� �����.
	};
};
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AJ_Teach()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_Teach);
		
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach,DIALOG_BACK,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5) ,DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	 ,DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("����� ��������",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)),  DIA_Addon_AlligatorJack_Teach_FUR);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("���� ��������",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_AlligatorJack_Teach_Teeth);
};
///////////////////////////////////////////////////////////////////////
//	Info Unterrichte mich!
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Teach		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Teach_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Teach_Info;
	permanent 	 = 	TRUE;
	description	 = 	"��� ����!";
};
func int DIA_Addon_AlligatorJack_Teach_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func void DIA_Addon_AlligatorJack_Teach_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_Teach_15_00"); //� ����� �������!
	AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_01"); //���� ���� �������?
		
	B_AJ_Teach();

	//Wird nicht mehr gebraucht M.F. 
	//AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_02"); //Ich kann dir nichts mehr beibringen.
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Back ()
{
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Teach);
};
func void DIA_Addon_AlligatorJack_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 75);
	B_AJ_Teach();
};
func void DIA_Addon_AlligatorJack_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 75);
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_FUR()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ReptileSkin] == FALSE)
	{
		if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ReptileSkin))
		{
			AI_Output (self, other, "DIA_Addon_AlligatorJack_Teach_Fur_12_00"); //������ ����� ������ �� ������, ����� �� ��������� �����.
		};
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{
		 B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
func void B_AlliJack_AlliKlar()
{
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Anheuern_12_01"); //������...
};
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_Anheuern(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 11;
	condition	= DIA_Addon_AlligatorJack_Anheuern_Condition;
	information	= DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent	= FALSE;
	description = "������ �� �����.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_AlligatorJack_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Anheuern_15_00"); //������ �� �����.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos (self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_ComeOn(C_INFO)
{
	npc			= 	PIR_1352_Addon_AlligatorJack;
	nr		 	= 	12;
	condition	= 	DIA_Addon_AlligatorJack_ComeOn_Condition;
	information	= 	DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"������ �� ����.";
};
func int DIA_Addon_AlligatorJack_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_KommMit_15_00"); //������������� �� ���.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_GoHome(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 13;
	condition	= DIA_Addon_AlligatorJack_GoHome_Condition;
	information	= DIA_Addon_AlligatorJack_GoHome_Info;
	permanent	= TRUE;
	description = "�� ��� ������ �� �����.";
};                       
FUNC INT DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_AlligatorJack_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_DontNeedYou_15_00"); //�� ��� ������ �� �����.
	B_AlliJack_AlliKlar();

	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_TooFar(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 14;
	condition	= DIA_Addon_AlligatorJack_TooFar_Condition;
	information	= DIA_Addon_AlligatorJack_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_AlligatorJack_TooFar_Info()
{	
	B_Say(self, other, "$RUNAWAY");
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};






	




	






































