
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //����� ������ ������� ����.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //��������� �������! �������-�� �� �����. �� ������, ��� �� �� ��������� �����.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(��������) ���? ��� �� ������ ����� ���������?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //�� ������ ����� ������, �� ����������� �� �����. ���� ������ ���� ��������.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //������ ���� ��� �� ����. �� ����� ��� ��������� ����.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(���������) ��������� ����? ����� ��� ��������?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //����� ���� ��� �� �� ������ ���� ����� �����, �������� ����� ��������, ��� ����� ���������. ��������, �� ���������� ������� ��� ��� ������ ���� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //�����. ������ �� ����� � ������ ���������� � ������.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "��� ��������� �� ��������� �����?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //��� ����������� ��� ��������?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //�� ������ ����� ������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //������������� ����� ������������� ������� �������. ������ �� ��������� �� ��� ������ �� �� ���������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //�� ����� � ������������ �������, ��� ��������� ���� ������� ���������� � ���� ����� ������� ����� �� ���� �����.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //������ �� �����-�� ������� �� �������� ������ � ������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //�� ���� �� ����� ������ ������������, ������ ��� ���������. 

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "���� �����-������ ����� ��������� �����?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "��� ������ ������?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //��� ������ ������?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //� ������ ������ ��������� � �����, � ������� �� ������� ����������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //�� ����� �� ������, ��� ����� ���� ������ ���������� ���� �������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //��������, ������������� ��������� ��-�� ������������� ��������������� ���������� ���������� �����.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //�� ������� ����� ����� ���������� ������, � ������ �� ����� �������� �������� �������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //���� ����������. �� ������ ���������� ������ �� ����, ��� �� �������� � ������ ������.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "� ��� ��� ������ ������?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "����� ����� ���� ������ ������ �����, � �� ���.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "��� ������ ����� � �����?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //��� ������ ����� � �����?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder M�chtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir k�nnen davon ausgehen, dass er nichts Gutes im Schilde f�hrt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //�� ����� ������, ��� ��� �������� ��������������� ���������, �����-�� ������� ���������� � �������� � ��������.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(������) �����������, �� �� ���� �� ���� ������ ��������...
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //����� ����� ���� ������ ������ �����, � �� ���. ����� �� ����� ����������� ��������?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //��������, �� ����� ����������� �� ���, � ������ ������-������ ����-����������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //��� ��� �����, �� ������ ������������� ���.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //���� �����-������ ����� ��������� �����?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //������ ����� �� ����� ���� ������. ��� ������ ��� ����������� � ������� ������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); // ������, ��� ��� ��� ����� �� ��������. ������� ����.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //��� ������?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //�� ��������� ����� � ��������� ������� ������� ��������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //� ������� ��������� ������ ������ ������ � ������ �����, ������� �� ������ ���������, ���� ����� ������, ��� ����� ���������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //��� ��������, ��������� ���� ��� ��� ������ ������� ��...
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "��� � ������ �������?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //��� � ������ �������?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //�� ������ ����� ������ � �� ���� ��� ���������� ���� �������.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //�� ���� � ������ ���� ����� ���?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //���� ��� ����� ������������ �������� ��� ����������, ��, ������ �������, ��!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //������� ��� ������� �������� � ������ ������, ������� �� �������, � ������� �� ���.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //�� ������ ������ ��� ����� ������ �� ���� ����� � �� ������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //�� ������ ���������� ����� ������, ������ ���� ����� ������ �� ��������.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //����� ����, �� ������ ����� ������ ���������� �����.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(�������) � ��� ���? � ������ ��� ��� ����� �����.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(�����������) � ����, ��� ����� ������� � ������. ����������� ��� ��� ���� ������� ��� �������.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"����� ���������� ������ ���� �������. � ������ ���������� ���, ���� ���� ��� �������� ��� �����."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"������� �����, ����� � ��������� �����."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"������� �����, ����� � �������� ��� ���, ��� ������� ������ ����� ���������� � ������."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "����� � �����.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //����� � �����.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //��� ����... ����� ������ ������ ���� ������� ����� ��������.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //� ���� ���������� � ��� ������ ��� ���� ���� ������ ����.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //�� ��������� ��� �� ������. �� �� ��������.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //�����������, ��� ������� �������� �� ����, ��� �������� �����, ��� ���.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //������� ���� ������� ����������� ������ �� ���������, ��� � ���.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //��� ������������ ������ ����������� � ��� ������� ���, ����� �� ���� ����� �� �� ������.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"������� ������� ����, ��� �� ��������, ��� ���. ����� ������� � ���, ��� ����� ���������� �������."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"��� ��� ��� �������, �������� �� ������� �� ������?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //��� ��� ��� �������, �������� �� ������� �� ������?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //��� ����� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //�����, �� �� ���� ������.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"������� ������ �� ������ �������� �� ����� ����. �� ������, ��� ����� �� ������� ������ ����."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"��� ����� ����� ���������� ������� ����� �������?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //��� ����� ����� ���������� ������� ����� �������?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //�������, � ������ ������ ��� ������ �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //��������� ��� ��������, ��� ������������ ����� � ���������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //�����, ��� ��� �� ������� �� ����, ����� �� ���������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //��������, ��� ������ ���� ���-������ ������.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"������� ������, ��� ������ ����� ������ ��� ������� ������� ��������."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"� ����� ���� �����.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //� ����� ���� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //�� �������� ��� ���� � ������� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //���� ���������, �����. � �� ���� �������� �� ��� ����� ����� ������.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"� ���� ������������� ������ �����.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //� ���� ������������� ������ �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //����� ����� ��� ���, ����� ��� �� ������ � ������ ����.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"������ ��������...";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //������ ��������...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //� ���� ��� ���� ���-��� ����.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //��� ��� �������� �������� �������� ��������. �� ��� ��� ���� �����.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //������ �� ���� ���-�� ���.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //��� ������ �����?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //�������� �������. ��� �� ��� �����?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"� ����� �������� ��������� ��������:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //������� ���������� ��� �������� � �������� �����.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //�� ��������� ���� �����������, �������� �����.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //��� � ���� ��� �����������, �� ���� ���� ��������, ��������, ����� ���� �����.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(������������) ����� �� ������, ������� ���� �� �����, ��� ��� ���������� ������ �����.
				Log_AddEntry (TOPIC_Addon_Relicts,"������� �������� ��������. ������� ���������� ����� �������� � �������� �����. �� ��� �������� ��� �������� ����� �����������."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //� ����� ��� �������� � ������ � ��� ������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //A! �������� ������� �������. ��� ��� ������� ����� �� ���������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //������ ������������ ����� ������ ����� � ��������.
				Log_AddEntry (TOPIC_Addon_Relicts,"���������� �������� �������� �� ������ ������� ������� �� ���."); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //� ����� ��� �������� � ������ � ���-������ ������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //���� �� ��������, ��� ���-�� ������� � ������� ��������� ������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //���������� ����� ����� ��������. � ��� �������� �������.
				Log_AddEntry (TOPIC_Addon_Relicts,"����� �������� �������� �� ������ ������ �� ���-������."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //��� ������ � ������ ����� � �������� �������.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //������ �����, ��� ��� ������ ���������.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //� ��� �� ����� �������. ������, ��� ������� �������.
				Log_AddEntry (TOPIC_Addon_Relicts,"������� �������� �������� �� ������ ��������� � ����� ����� ������."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //��� ���� ������ � ������� ������ � �������� ������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //��� ���������� �������� ������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //����������������, ��� �������� ������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //������ ��������� ���� �������� ����� � ����� ����� ������.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //�������� ���������, ��� �� ����� �� ������� ������ �����...
				Log_AddEntry (TOPIC_Addon_Relicts,"������ �������� �������� �� ���������� ������ �� ������."); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //����� ������. ����� ������ �����������, �� �� ��� ��� ����� ������������.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //����� � ���� ��������� ������ ���� �������� ���� ������ ����� ��������.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //����� �� � ������� ���.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //��� ������� ������ � �������� ��������������.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //������ �� ������� ��� ����������� ��������.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //�� ������ ��� �������� ������. ��������� ����.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //��������� ����� �� ������� � ����� ������������� ������� ��� ������.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //���������, ����� �� � ���-������ �����.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //������. �� ����������. ����� �������� ������ ���.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //������, ��� �� ������. �� ����� ���������� � ����� ������ ����������.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //�����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //���������� ����� �����-�� ��������� ��������. ��� ������� ��������� ��������� 5 �����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //� ������� �� ���� ����������� ��� ������, � ������� ���������� ��� � ������ ���� ���������.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //������� � ������� �������� ������� �������� ���� ������ ����� ����������� ��� ������.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "� ���, ���� �� ��� ������ �� ��������?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "��� ��� ������ ������?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //��� ��� ������ ������?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //�������� ������ ���������� ������ � ���������.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //�� ������, ��� ���� ������ ��� ������.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"������� �����, ����� � ������� ������ ������. ������� ������ ���, ��� ����� ��� ��������."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //� ���, ���� �� ��� ������ �� ��������?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //���� �� �� ������� ��, �� ������ ����� ��� ������� ������ � �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //������ ���� ��� ����������, �� �� �������� ��� ����� ������������ ���������� �����������.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"����� ��� ���� �������� ��������?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //����� ��� ���� �������� ��������?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //������, ������� �� ������ ����� � ����������, ��������.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //�� � ��������� ������ ��������� � ���� �����������, ������� ��������� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //� ������� �� ��� ���� �� ����� ����� �������� � �������� ������� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //�����, �������� ���� ����� �������� ������ � ���� ���������.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"�������� ��������� ��� ��� �����...";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //�������� ��������� ��� ��� �����...
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //��������, ��� ��� ������ �������� � �����, ����� �������� �������� � ��������� �� � ������� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //������� ������ ������, �� �������� ���� ���������� �� ���������� ������ � ����� ������� ���� ��� � ���� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //������ � ������� ������ ���� ���������� ���� ����� �������� �������. 

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"��� ����� ��� ���������� �������?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //��� ����� ��� ���������� �������?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //� ���� ����� ���� ����� ������ ��� ������� � ���������� �����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //��� �������� ��� � �������� ������ ���� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //�������, ��� ������������ �����������, ��������� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //� ���������� ����� ������ ���� �� ������ ���� ������� ���.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //����������, ��� ������ �� ��� �������� �����, � ��� ��������� ���������� �� ���� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //������ ������� ��� ����� ���������� ������. �� ���������� ������� �� �� �����...
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"������ ������...";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //������ ������...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //� ������� � ������ �������� � ������� ������. ����� - �� ������������.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //�� ������ ��� ��������� ����� � �������, � ��� �������� ������ � ������ ���������� ��������.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //�������. �����. �� �� �������, ��� ���� ����� ����������� ������. 
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //����� �� ��� ����� ��������������� �� ������ ���������� ����.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //�� ������� ������� �������� � ������������, ����������� ������.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //��� �� ���� ������. �� ������ ���������� �������.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(��������) ��, �������. � ������� ��� ����.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //���� ������ �� �������� ��������, ��� ����� � ������ ������.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //��� ����� �������. �� �������, ��� ����� ����� ���������� � ����, ����� ��������� �������������� ����������.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //�? ���� �� �� ��� ���-������ ��� ���� ��������?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //�� ��������� ��� ������ � ���, ��� ����� ������ �������� ����� �������.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //� ���� �������� ����� ���� ���� �� �����. ������� ��.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //����� �������� ������� ��������� �������� �����.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //�����. �� ������ ������������ � ���������� ������.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //� ��������� � ����� ������.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //�? ��� � �������?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //� �������. �� ������� � ����� ������� � ���� �� ������.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(������������) ���?! ��� ����������! ������ �� �� ���������� �� ���?!

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //�� ������ ���������� ���-�� �����?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //���, ���� ������.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //��� ���� �����: �� ����� ������������� ������. ������� ���.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"� �� ���� ����������� �� �������!";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //� �� ���� ����������� �� �������. �� ������ ���� �������.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //� ������ ��������...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //��� ����� ������, ��� ����� ���� ������� � ����...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //��� �� ����� ����� ���, ��� ������� ������ � ����?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //�������� ����� �������� ����������.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //� �� �����?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //�� ������ �������� �����.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //� �� ���� �� ���� ��� �������...
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //�����!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //� ���� ������ ��, ��� �� ������ ��� �����-�� ������...
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(���������) ������...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //��! ���������!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //�����, ����� ������� ���� ������� �������.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //�� ������� ������ � ���, ��� ������� � ����, � ����!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //�� ������ ���������� �� ���� �������!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"����� ����� ���� ������� �������. �� ������� �� �������� ������ � ����� �������. � ������ ���������� �� ���� �������.");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"� ������� � ������������.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //� ������� � ������������.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //��� �� �� ���� ������?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //��� �� ������� ��� ������ � ��� ������, ���� � ������ �� ��� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //� � ��� ��������?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //� �� ���� ���������� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //��-�... ��� ��������, ��� �� ������ ������ ��������� ���������� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //������ ��������� ���������� �������� ��� ���� ������ �������� ��������.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //��������, � ���������� �� ������� ������ �� ������� �����������.

	B_LogEntry (TOPIC_Addon_Quarhodron,"������� ������, ��� � ����� ����� ������ �� ������� ����������� � ���������� ������. ��� ��������� ������ �� ������."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"�������� � �������� ����� ������.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //�������� � �������� ����� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //��� ���������?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //��.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //������, �� ������, ��� ������� � ����?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //������ ���. � ��� ��� ��������� ���, ��� ���� ���� ������.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //�� ������� � �������������� ���� � ����� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(� ��������) �, ������! ����� �� �� ������. ��� �� ����� ���� ��� �����?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //� ������� �� ��� �������...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //���� ��� - �� ��� ����, ��� ������ �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //�� ������ ��� ����� ������ ������ ����� ���� ������� � ������� ���.
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "� ��� ��� �� ������ �������?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "��� ����� ��� ���� �������?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //� ��� ��� �� ������ �������?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //���������� ������� ���. ������ ������ ������ ������� ���� ���.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //�������� ���� �������� � ���� ���� ������� ������ ����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //� ��� �������������� ��������, ��� ������ ���������� ���� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //������ ����� ������������ � ������� ����� ����� ������� ����� ���.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //������ ��� �������, ������ ������ ������� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //��� �������� � ���� ��� ������ ��� � ��������� ��� ������� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //����� � �������� ���������� �� ���������� ���� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //�������, �������� ������� ����������, � �� ������� �� ������ ���� ����, ������� �� � ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //��������� ������� ��������� �����, ������� ����� �� ���������� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //����� ����������� ����� ������� ��������!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //������ �� ��������� ��� �������� ������ �������?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //����� - ������� ����, � ����� ������ �������� ���.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //� ��� ����� ������ ����� ����������� ������� ����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //����� �� ������ ��������� ������, ����� ��� ����� ��������.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"� ����� ������� ��������� ������� ������. ��� ���������� '������ �������'. ����� �� ������ �������� ��� � ���� ����!"); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //��� ����� ��� ���� �������?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //������ ��� ��������, ��� �� ������ ������ ��������� ������ � ����, ��� �������� � �������� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //�� ����� ���� ���������� ��� ����, ������ �� ������� ������������ ��� ����, ����� ���������� ������ ����������� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //���� � ����, ����� ������ ������� ����� ������� - ������� �������� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //����� �� �������� ��� �������� � �������, � ��� ������� ���������� �� ��� �������, �� ������� ������� �� ���������� ��������� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //�� ����, ���� �� ����� ������ ����������� �����, �� ���� ��� ��� �������, �� � ��� �������� ������� ������������.
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"��� ������ �������� ������� ��� � �����?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //��� ������ �������� ������� ��� � �����?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //�� ������� ���� �����, ����� � ��� ������� ���� ���. �������, ���, ���������� � �����, �� ������� ��� ���.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //������, �� ������ � ������ ������� �� ����. ������ ��� ������� �� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //������ �������� � ��� ����� ������ ����������� � ����.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"������� ������ ���� � ����, ������ ��� ���� �������� ������. � ������ ������ ����� ���� ����� � ���������� ������."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //�� ������� ��� ������� �������!
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //��������, ��� �� ������� ������.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //������������� ������������, � ��, ��� ����, ��� ���.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //��� ������, ��� �� ������ ��, ��� ������ ��� �������?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //��. ����� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //������, ��� �������. ����� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //�� ������ ������� ����, ��� ���. �� ��� ����� ����� � �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //�� ������ ������ ������ �� ��� ��� � ����������� ���������� � ���� ����� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //����� ����������� �������������, �� �������� ���� ���������� �������� � ������ � ����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //������ ������ �������. ������ - �� ��� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //� ����� ����� �� ������ ������� ��������������.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //��������� ��� �������, ��� ���. � �� ������� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //�� ��������� ����� � ����������� ���� �� ���� ��� ������� �����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //������� ���������� ������ ������. �� ������� �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //������� ����� ������ ��������� � ������ ����.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"������� ������� �� ������ �������."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"� ��������� ���������.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //� ��������� ���������.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //����� ������. �������, ��� ������� ����� � ������� � �����������.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"� ������ ������ �������.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //� ������ ������ �������.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //�� � �� ���� ��� ������������!
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //������ ������� - ��������� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //� ���� ���� ���� ����� � ���� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //������� ��� ����������, �� ����������� ��� �������� � �����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //� �� ���������� ������ ���� � �������������� ��� ���� �����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //������ �� ����� ���� �� ����� ������ �� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //���� ��� ������ ����� ��������� ��� ���������� ����.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "� ��� ��������� ������� ������ ���?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "��� �� ��� ������ � ���� �������?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //��� �� ��� ������ � ���� �������?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //������ ����. �� �������� ���, � �� ������ ��� ������.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //� ���� ���� ���� ���� �����.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //�� ������ ��� ������ ��� ���, � � ��������, ����� �� ������ ������� �� ����� � ���� ���...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...��� �������� ��� ���� � ������������ ��� � ���������.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "�� ������ ��������� ���?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //�� ������ ��������� ���?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des B�sen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschlie�t, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //���� �� ������ ��� ���, � ���� ��� ��� ���, � �� ������ ������� �� ������ ��������� ���.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //��� ��� �����. ����� �� �����.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"� ���� ������ ������ ������� �������� ��� �������� ��� ����."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //� ��� ��������� ������� ������ ���?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //����� ����� ��������, ����������� ���.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //�� ���� ���������! ������ ��� � �������.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //���� �� �������� ��� ������������, �� ������� �� ���� ���� ����.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"����� ��������� ������ ����� ����, � ������ ���������� �������.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� �� ������ ������ ������?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //��� �� ������ ������ ������?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //�� ��������� ����� � ������ ����� ��� ����� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //������� ����� �� �������� � ����� ��������� ���������.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //���� ���� ��� ����������, ��� ���...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //� ���, ��� �� ������ � ����. �� - �������� ��������� ����������. � ���� ������ ��� � ���� ��������.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //���� �� �� ���� ������ � ����, ���� ������ ��� �� ��������. �� ���������� ���� �� ���� ������� ����.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //������ �� ������ ��������� ���� ������ ������� � ������� �� ���� ����� ��� � ����������.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //������ � ������� ���� ��������������, ���������. �� ����� �������� �� ����.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"������ ������ ������� � �������� ���.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //������ ������ ������� � �������� ���.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //��� �������, ��� ���. ��� ��� ������.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //������ ������ ����� ����� ����. � ������ ��� � �������� ����.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //�������� ������� ������ ��� �� ���.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"�� ������ ������� ���� ������ �����?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //�� ������ ������� ���� ������ �����?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //�� - ��� ����. ��� ������ �������, ���� ������, ��� � ������ ����?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //�� �� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(��������) ����, �� �������� �������� �������. ��� �, � ������� ���� �������.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //������ ���� � �����, ��� �� ��������� ���� ������ � ����� ����, �� ������ �� ������� ������������ �� ��� ������.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //�� ��������� ����.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ���� ������� �� ��������� ������� �����.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //� ���� ������� �� ��������� ������� �����.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //��, �� ����� ��������� ���� ������.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //������ �� �� ������ ���� �����! �� ������� ���� ������ ����� ������������� ����������� ���� ��������.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //����� ������. ������ �� � ������ ���� �����!
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //������ �� ������� ��������� ����� ������ ����������. ��������� ��, ���� ������������.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //����� ������. �� ����� �������� � ��������� ���� �����.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //�� ����� ��������������� ���� ����� � ������! �� �� ��������� ���� ���� �����������.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //�� �������� ����� �������� � ����� ���� �����.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //����������, ������� ���� ���������, �������� �������� �������������� �����.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //����� ���� ��� ���������! �� ��� ����� ������� �������� �����.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //��� �� � ���� �����.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //����� �������� � ���������, ������ ���� �����, �� ������ ����������� � ��������� ����� ����.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //�� ��� �� ����� � �����. ����������� �����.
	};
};

















