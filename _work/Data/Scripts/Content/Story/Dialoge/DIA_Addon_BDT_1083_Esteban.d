//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//��� �� ��� ����� ������, ��� � ���� �������� � ������.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//����� ������ ����������������...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//������ ��� ������� �������. ����� �� ����� ����������� � ���. ����� - ����� ����.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//������ ����� ����� ��������� �������� - ���� �� ������� �� �� �� ����, � ���� ����.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "� ���� ������� � �����!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//� ���� ������� � �����!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(���������) �����������. ����� �� ������ � ���������� ����� � ����������� ��������.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//������ ��� ������, ��� ������ � �����, ��������� ���� �������� ���� ������.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//� � ����� ������� �����, ���� �� ������� ���� ����� �����, ����� ����� ������� ����.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "��� ��� ���� �� ���� ������� ������.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//��� ��� ���� �� ���� ������� ������.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//������, �� ��� �� ���������.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//������ � ����� ����� ���� ������, ��� ������� �������� �� ������.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(����������) ����� �� �� ������ � ���, ��� �������� ������?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//��, ��������, ��������� ��������� �������, �����?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//�������, �� �� ���� ������ �� ������.
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(��������) ���� � � ��� ���� ������� ������, �� �� ������, ��� �� ����� ������� �������.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//���, � ���� ���� ��� ���� ������ ������...
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "����� ������?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//����� ������?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//���� �� �������� ����� ���� �����. �� ������ ����� ��� ��������� ����� ���.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//�� ����� ������ ���� �����?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//�� ��� ������ ������! ���������� ������. ������ ��� �� ������� � ������ �� ������ ������� �� ����.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//�� �������� ���-�� ������� - ���-�� ������ ��� ������� ���...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//��� ��� ��, ��� ����� ����� ����, ��� ����� �� ���� ����?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//���, ��� ������ ������, �������� �� ���. ����� ��� - � � ��� ���� ������� � �����.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//������ ������ ���� � ���� �� ����� ����.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//������? �� ���� �������� �� ����. � ������ ���, ����� �� ������� � ���.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "�� ����� �������� ���� ��������� ���������. � ������ ��������, ��� �� ���� �����.");

};
//--------------------------------------------------------------------
//	Info Attent�ter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "� ��� ��� ����� �������?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//� ��� ��� ����� �������?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//��� � ������ ����� �� ���� �����. ������� �� ������� � ��������.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//���������� ��������, ��� �� ���� �������, � ��� - ������, � �� ��� ������� ���� ��������!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//�������� �� ������. ���� ������ ����� ����� �����.
	
	B_LogEntry (Topic_Addon_Esteban, "����� ����� ���������, � ������ ���������� � ������ � ������ � ��������, �� ���� ��� �������. ���� ����� ��� ������ - ��� ������ ��������.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "��� ����� ������� �������.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //��� ����� ������� �������.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //�����? � ���� ��� ���� �������, ���� ��� ������ ������ �������� ���!
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //���� �� ��������� ��� �������, �� ��������� �� ����...
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "�� ������ �������...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//�� ������ �������...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//��������, � ���� ���� � ������ ����.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//� �����, ���� ����� ���������, ��� ����������� ���������...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//� ��� �� ���? ����� ��� ��� ��� - � ��� ������ ������� ��� ���...
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//��� ����������� �������� ����. � ������ ������ �� ����� � ����, ���� � ������ �� �����������...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//��! �������� ������, �����. ��� ��������� �������� ��.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//�� �������, ��� �� ������, ������. ������� � �������� �����.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//�����������, ����� �� ��������, ��� ����� �� ����������.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "� ��� ������ �����?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//� ��� ������ �����?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//��� ������ �����? � ����� ����, ��� �����.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//���� ����� ����������� �������. � ���� ������ ����� �����, �� ���.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//��� �������� �� ���� ���������������.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "���� � ������ �������� ������� ������?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//���� � ������ �������� ������� ������?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//�� ������ ��������� � �������. ���� ������ ������ � �����.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//� ���� ������������ ���� � ������� �������. �� ���������� � ������ � ������ ���������� �������� �� ����.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "� ������� �� ����.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//� ������� �� ����.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//�� �����, � ��� �� ��������������. � ����� �������, � ���� �������� ������ ��, ��� � �����.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//� � ������, ��� �� ������ �������� �� ����, � �� �� ����-������ ���. ��� �������?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "�� ������ ��������� ����?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//�� ������ ��������� ����? � ���� �� ���� � ���, ����� � �� ���� �������.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//�� ������ �������� ����� �����������. �� ���� ���� ��� �� ��������, �� ������ �������� �������� ������...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//� ����� ����, �� �������� ����� � ���� ��� ������� ������?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//��! ��� ���� ����� - � ���� ���������� �������� ��������� ����.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(���������) ����� ����������?..
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//���?.. �, �������, �� ������ ������� ����... ��, ������...
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "����� ���� ������ ������ ��, ��� � ������ ��� ���!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //����� ���� ������ ������ ��, ��� � ������ ��� ���!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //�, � ���� ���� ��������� �������. ��� ����. � ������ ���� ��������� � ������� ���� �� ����� �������!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




