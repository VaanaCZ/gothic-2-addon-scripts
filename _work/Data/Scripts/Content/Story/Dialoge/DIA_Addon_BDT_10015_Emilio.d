//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_EXIT   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 999;
	condition   = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Emilio_PICKPOCKET (C_INFO)
{
	npc			= BDT_10015_Addon_Emilio;
	nr			= 900;
	condition	= DIA_Addon_Emilio_PICKPOCKET_Condition;
	information	= DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	C_Beklauen (76, 112);
};
 
FUNC VOID DIA_Addon_Emilio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
	
func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Hi   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent   = FALSE;
	description	= "�� ���������, ��� �������.";
};
FUNC INT DIA_Addon_Emilio_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00");//�� ���������, ��� �������.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01");//� � ���� �������. ��������� ���, ����� � ��� � �����, � ����� ��� ������.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//----------------------------------------------------------------------
//	Info Gold
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Gold   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 2;
	condition   = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent   = FALSE;
	description	= "���� �������� ������, ������� �� ���������?";
};
FUNC INT DIA_Addon_Emilio_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Gold_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00");//���� �������� ������, ������� �� ���������?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01");//����� �������� ��� � ������������. ������ �� ����������� �������� ���� ��, ��� �� �����.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02");//������ �������� ���� ���� - ����� �������, �� �������� ���� ��������� � ��������.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03");//��� �������, ��� ������� �������. � ��� ��� ��� ����� ��� �������, ���������� ������� �����������, � �������� ��� ����� �������� ������, ��� ��, ��� �� �������� � �����.
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Stein   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 3;
	condition   = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent   = FALSE;
	description	= "��� ��� �� ������� � �������� �������?";
};
FUNC INT DIA_Addon_Emilio_Stein_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00");//��� ��� �� ������� � �������� �������?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01");//��� ��������� ����� � �������.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02");//����� ��������� � ������������� ������, � ������� ���������� ���������� ��� �����.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03");//�������, �� �� ����� ������ � ������ ������ ���, ����� ���-�� ���� � �����.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04");//������� �� � ���� ���������� ���� �� ����� ������� �������� ������, � ����� ����� ����� �����, ���� �������. ��� ��� �������.
};
//---------------------------------------------------------------------
//	Info Attentat 
//---------------------------------------------------------------------
var int Emilio_Switch;

INSTANCE DIA_Addon_Emilio_Attentat   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 4;
	condition   = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent   = TRUE;
	description	= "��� ���� �������� � ���������?";
};
FUNC INT DIA_Addon_Emilio_Attentat_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio)) 
	&& (Npc_IsDead (Senyan))
	{
		return FALSE;		//selbe Condition wie 'Hilf mir...'
	}
	else if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC VOID DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Emilio_Attentat_15_00"); //��� ���� �������� � ���������?
	if (Emilio_Switch == 0)
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_01"); //(���������) ��, ��������, � �� ���� ������ �� ���� �����!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_02"); //(���������) ������ ������!
		Emilio_Switch = 0;
	};
};

//----------------------------------------------------------------------
//	Info Senyan 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Senyan   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Emilio_Senyan_Condition()
{	
	if Npc_IsDead (Senyan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Senyan_Info()
{	
	if (Senyan_Called == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00");//(�������) ����� ���, ������ ������ ��������: '����������, ��� ������'?
		AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01");//(����) ������������� �����.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //�� ���� �������!
	};
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03");//� ���? �����-�� ��������?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04");//(������) ���, ��������, � ���� � ���� �� ����� ������ ������� ���������.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05");//���� ��������. (��������) ���� ������� ������� �� ��������.
	
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry (Topic_Addon_Esteban, "������ �� �� ������� ��������.");
};

//----------------------------------------------------------------------
//	Info Jetzt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Jetzt   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 5;
	condition   = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent   = FALSE;
	description	= "������ �� ������ �� � �����?";
};
FUNC INT DIA_Addon_Emilio_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Jetzt_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //������ �� ������ �� � �����?
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //(������ ����������) � ��� ��� ���������� ����� � ��������, ���� �� ���� �������� � ��� �� ���������. ������ ��� ���� ��������� ��������� ����.
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //(�������, ������ ����������) ������, ��� � ������ ��������� ������� ������.
};

//----------------------------------------------------------------------
//	Info VonEmilio
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_VonEmilio (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 6;
	condition   = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent   = FALSE;
	description	= "������ ����������� ��� � ����...";
};
FUNC INT DIA_Addon_Emilio_VonEmilio_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_VonEmilio_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //������ ����������� ��� � ����...
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //������? ���� ������ - �����. ��, ��������, �������.
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //�� ������, ��� �� �� ��� � ����� � ��� ���, ��� ��������� ���������.
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //(���������) �... ������ �� ����!
	
	if (!Npc_IsDead (Senyan))
	{	
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //�� ��������� ������ � ��������!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //� �� ��� � ������� � ���������! � � �������� ������, � ��� �� ��� �������!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //���� ��� ������� ����� �� ����� ���. ������ � ������ ������ ��� �����?
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //������ ���� � �����!
		AI_StopProcessInfos(self);
	};
	B_LogEntry (Topic_Addon_Esteban, "������ ������, ��� ������ - �����.");
};
//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_HilfMir (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 7;
	condition   = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent   = FALSE;
	description	= "������ ��� ��������, ��� ����������� ���������!";
};
FUNC INT DIA_Addon_Emilio_HilfMir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead (Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_HilfMir_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //������ ��� ��������, ��� ����������� ���������!
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //���! � �� ���� � ��� �����������!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //���� ���� ����� �����, ��� ������, �������, ��� �� ������ ���� �������, ���� �� ������� ����� �������, ������ ��� ��� ������� �������.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //(�������) �... ����! � ����� ���� ���� ���. � ������ ������.
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //������.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //����... �������� � ����. �� ������ ���-�� ����� �� ���� ����.
	Emilio_TellAll = TRUE;
	
	B_LogEntry (Topic_Addon_Esteban, "������ ������� ������ ���: ����.");
};

//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_GegenEsteban (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 8;
	condition   = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent   = FALSE;
	description	= "��� �� ������ ������ ��������?";
};
FUNC INT DIA_Addon_Emilio_GegenEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_GegenEsteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //��� �� ������ ������ ��������?
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //���, � ��� ��� ������ ������, - ��� ������.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //������ ��������� ���� ������ �� ��� ������� �������.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //�� ������� ���� � �� ������ ������� � ����� ��������� ������.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //� ��� ������? ������ ��� ��� ������ �� ������ ������� ������ � ������� �� ����� � �������� ������ �������� � ����.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //��� ����� ���� ��� ���� ���������!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Mine   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Emilio_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00");//������, �� ������ �������. �����, ����� � �����.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
	
	
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Hacker   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent   = TRUE;
	Description = "��� ����?"; 
};
FUNC INT DIA_Addon_Emilio_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Emilio_Hacker_15_00"); //��� ����?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //� ������ ������ � ���.
};




