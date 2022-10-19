//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//�� ������ �������. ����� �� ����� ������� � �����, ���� � ���� ��� ������� �������� ������.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//���� �� � ����� - ��� ����� ������� ������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//��� ������ �� ������. ������� ���� �������, ��� ��������� �� ����. � ���� � ����.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//�����������. ���� �� ����������� ���������� �� ������� ���� ��� ����������, ������ ����� ����. ������ �������.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//���� ���� ��� �� ��������, ������ ���������� � ���������. �� ������������� �� ������.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "��� ����� �����, ��� ����� ������� � ������...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//��� ����� �����, ��� ����� ������� � ������...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//������? �� ������������� �������, ��� ������� ������ � ����?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//��� ��������� ������ ��������� ������ �� ������� ������. �� ������ ���� ������, ��� ������� ��� �������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//��� ��� �����  ������ ��� ���� �� ����� ������.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"����� - ������������ ��������. ����� ��������� �� ����, ��� �������� ����� ���, ��� ������� � ���� �� ����."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "�� �� ������� ����? � �� ������� ������...";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//�� �� ������� ����? � �� ������� ������...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//�� ��� ����� �� �����������?! ��������, �� ��� ����� �� ���� ����������. �... ��� ������ ��� ������ ��������?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//���, �� ������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//����� ����, �� ���, ��� ��������� ������, � ����� - ���, ��� ���� ���� ���������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//� ���?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//��� ������� ������.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//�� ������ �����? ����� ������� ���� ������� ������ � ������ �� ����� ��� �����.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "�� ����� ����, ������ ����. �� ��� ������ ������ ������.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //�� ����� ����, ������ ����. �� ��� ������ ������ ������.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //�����-�� � ������� ���� ���-���. �� ������, ������ � �� ��� ��� ���?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //������ ��� � ������ ��� ����� ����� �����.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //� �������� �� �� ����, ��� ������ �����. �� � ������ �������� �������. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //� �� ���� ������ ��� ������!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(������) ���!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "���, � ���� ���� �������� ������...";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//���, � ���� ���� �������� ������...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//��� ������������ ������. ������ ������� ����� �������� ���������.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "���, � ���� ���� ������� �������� ��������...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//���, � ���� ���� ������� �������� ��������...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//�� ���� �������� - ��� ��� �� ������ ������ ������ ��� ������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//� ��� �������� �������� � ���������� � �����.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//��� ��������� ��� �������. ���� ������ - ����� �� ������.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//� ����� �, �������, ����� ������� � ��� ������� �����?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//����� ���� ������ - � ����� ������ ����������, ��� ������.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"� ����� ����� ��������, � ������ ��� ����� ������� � ����� ���� ��������.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "� ������ ���� ����� �����.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//� ������ ���� ����� �����.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//������. ����� � ���� ��� ������ ���� �� �������.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "��, � ��� �� ���� �� �������? ��� � ���� ������� ����� ��?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//��, � ��� �� ���� �� �������? ��� � ���� ������� ����� ��?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//�����. ��� ������� ������� ���������� ��� ��������� ������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//�������, ��� ��� �������� �������������� �������� ��� ����� �����. �� ������������� ������� �������� �� �, � �����.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "��� ��� �����������?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//��� ��� �����������?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//��-�, ��� ������� ���� ������. ��������� ��� ��������, ��� ������ ������ ������ ������.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//� ���, ���� ��� ������?..
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//...������� ������ ���������� �� ����. �� � ������ ����������, ��� ��� ��������� �����, ����� ������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//���� ������...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//���� ������ - ���?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//...���-������ �� �������� �� �� ���. �� � �� ���� ������, ��� ��� �� ���������� ���� ��� �����... �� ������� ���� ���� ������� �����.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//��� �� ���������?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//���???
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//������ �� ����� � ������ � ��������. � ��� ������� ��������, ��� ����� ���������. �����? ���, ����� ����, �?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//�� �������?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//����� � �� �����. �� � ����� ����, � ���� ����� �������� ���� ��������.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//���� ������ - ���, ��� � ��� ��������.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//����� ����, �� �� ������ ������� ��������, �� �� ��������.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//�� � ������ ���������, �������� �� ��������, �������� ������� ������ ��������.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//�� - �������. ����������, �����������, ����������.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//���� �� �� �� �����, ��� ��������, ������� � �����.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//��� ��� ��� ������� �����, ��� ���, � ��� ������� �������, ��� ������.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//���� �� �������?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//���� ����� ����� �����. ��� �������� �� �����? ����� ����, ��? ��, �������, ������� ������� ����� �� �������� �� ����� �����?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "����� ������ �� ���� �� ����� ������� � ������?";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//����� ������ �� ���� �� ����� ������� � ������?
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//��������, � ��� � �������?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//� ������ ����� ����� ������ ������. � ���������� �� ����.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//��, ��. � ���������� � ���, ����� ����������� �������� ������ ��������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//������. � ��������� � �������.
	
	B_LogEntry (Topic_Addon_Sklaven,"������� �����. ������ ����� ����������� � ���, ����� ���� ������ �������� ������."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"����� ����� ���������� � ���������� �����. ����� ����� ������ � ��� ���� ������ ����."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"� ���������� ���������. ������ ������ � ������ ����� ������������."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "� ������ ���. ����� �����.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//� ������ ���. ����� �����.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//������, �� ����� ������� �������� ����.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//������ �� ������� ������?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//��� ���� � ������ ���������. � ���� ��������� ��������� ����.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(�������) ��, �� ��������� ����-�� ���������, ���� ���? (��������) ����������� ���� ����.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//��� �����, �����, ���� ���� ��� �����������.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//��� �����. � ���� �� ���� ����� ����� ����� � ����� ���������. � �� ����� �� ��� �� ������ ��������� ����...
	
	AI_StopProcessInfos (self);
	
};



