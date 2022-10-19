///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_EXIT   (C_INFO)
{
	npc         = KDW_1405_Addon_Merdarion_NW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1405_Addon_Merdarion_NW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Hallo_Condition;
	information	 = 	DIA_Addon_Merdarion_Hallo_Info;

	description	 = 	"�����?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //�����?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //��� ���������� ��� ���� - ������� �������. ������ ����������� ����, ��� ����� ������ �� �� �����.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //��� �� ������� ����� ���� ��� ������ ����������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //���� ��� ������ ������ ������������� ������, ��� ����� �� ������� �������� �������� �� ��� ���������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //������� ���������� � ���� ���.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Aufgabe_Condition;
	information	 = 	DIA_Addon_Merdarion_Aufgabe_Info;

	description	 = 	"��� �� ����������� �����?";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Aufgabe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //��� �� ������ ����� �������?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //� ������� ��������, ���� ����� ���� ������� ������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //� ��� � ������� ��������� ������ ���������� ��������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //����� ������� � ������������, ��� ���� ������ ����� � �� ����� �������, ������� ������ ��� ���� ����������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //(�����������) � ����, �������, ������� �� ������ � �� ����� ��� ���...
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"�������� ���� ��������� ��������."); 
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_DaDurch_Condition;
	information	 = 	DIA_Addon_Merdarion_DaDurch_Info;

	description	 = 	"�� ������������� ������ ������ ����� ���� ������?";
};

func int DIA_Addon_Merdarion_DaDurch_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_DaDurch_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //�� ������������� ������ ������ ����� ���� ������?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //��. ��, ���� �� ������ ���������� ��������, �������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //� �������, ��� ���������� ����������� �����.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //�� ��� ������ ���������� ��������, ��� ��� ����� ���� ������� � ����������� ���������������.
};
///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Bedrohung_Condition;
	information	 = 	DIA_Addon_Merdarion_Bedrohung_Info;

	description	 = 	"� ��� ���� �������� ��� �������������?";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_DaDurch))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Bedrohung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //� ��� ���� �������� ��� �������������?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //�� �������� �������� ���-�� �� ������ �������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //��������, ��-�� ����� ������������ �������� ������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //�� ��� ��� �� ��� ������. ������� � ������ ����� ���������� ���� ������.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information	 = 	DIA_Addon_Merdarion_Wasdahinter2_Info;

	description	 = 	"� ���, ��� �� �������, �� ��� �������?";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //� ���, ��� �� �������, �� ��� �������?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //� ���� �� ����.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //� �������, ��� �� ��� ������� ������ ���� ��������, ������ � ����. � ������ ����� �������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //��� ��������� �� ������, ������ ����� ������� ����.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Merdarion_PERM_Condition;
	information	 = 	DIA_Addon_Merdarion_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"�� ������ ������� ���� ����-������ �� ������� �����?";
};

func int DIA_Addon_Merdarion_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //�� ������ ���� ������� �����?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //����� �� �������� ���, � ���� � ������ ����� ������������.
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Teleportstein_Condition;
	information	 = 	DIA_Addon_Merdarion_Teleportstein_Info;

	description	 = 	"��� ������� ����� ��������� � �����?";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //��� ������� ����� ��������� � �����?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //� ������� ���� ����� ��� �� �����, ��� �� � ������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //(����������) �� �� ����� ������... ���, ��� ������� ������.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //����������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //�����. ��������� ���� ����� ������������� ����� ��������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //��������� �� ����� ������, ��� ����� �����������������.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //� ���� ��� ������ ����������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //���������������� �����, ������� �� ����� � ��������, �� ����� ����, ������ ��������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //�������, ��� ���������������� ������ � ���� ����� ����� ����� � �����.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //�� �� � ���� �� ��� �� ������� �������� ��� ���������.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "��� ���� ��� ����������� ������������� � ��� �������?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "��� ��������� ���� ������?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //��� ��������� ���� ������?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //�� ������, � ������� � ���������. � ����� ��� ���.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "��� ��� ����. � ���� ���������� �� ����.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //��� ���� ��� ����������� ������������� � ��� �������?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //�� ����. ��� ������� ���� �� ���� ��������. ��������, �� �� ��������.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //��� ��� ����. � ���� ���������� �� ����.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //(����������) ������? �� � �� ������� �� �����������.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //����� ����.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //���� �� ��� ������. ����������.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"��������� ��� ��� ���� �� �������� �����. �� ��� ��������� ��������, ������� ��������� ���� ������� � ������."); 

	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Info;

	description	 = 	"��� ��������� ���������������� �����?";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //��� ��������� ���������������� �����?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //�� ���� ��� ����� ������ ����, ���-�� ���������� ��������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //����� � �������� '������� ������'.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"����� � �������� '������� ������' ������ ���� ��� ���� ��������."); 
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Info;

	description	 = 	"���������������� �����, ������, �������� ���������.";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info ()
{
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //���������������� �����, ������, �������� ���������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //�� ������ ���? �� ������������� ����� ����?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //��. ��������, ��� ��� ��� ��������.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //(����������) ����������. ��� ����� ����� ������� ��������� �� ���.
};


