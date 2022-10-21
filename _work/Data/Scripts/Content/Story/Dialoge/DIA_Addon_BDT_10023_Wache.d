//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//��, ���� �� �����? �� ������ ������� � ��� ������?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//�� ��, � ������ �� ���?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//��� ��� ������ �����. � �� ��������, ����� �� ���� ���, �� �� ���� �� �������� �� ������ ���������, ����� ��� �� ����� ��������. 
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//� ����� ������, �� �� �����, ����� ��� ������ ��� ������. ��� ������ �������� ������.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//����. � ��� ��� ��������?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//��� ������ ������ ��������.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//� � �����, ����� ��������� �����.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//����� - �� ���� ��� ������ �� �����, �� ����� �� ��������.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"������ ������ �� ����� ����. ������ ��� ����������� ��������."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "������� ��!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//������� ��!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//������. ����� ��������� �������. ���� ����������� ���, ��� ��� ������ � ���� ���� ����� ��������� ��.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//��, ��� � ������ ���� ����������� ��������� ��������. � ��?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"����� ���������� ����� ���� ������ � �������� � ������.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//� ���� ���� �����-�� ����� �� ���?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"� ��������� � �������.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(�������� ������ ��������)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"� �����, ��� ���� � �����.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//� �����, ��� ���� � �����.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//�� ������� ������ ��������. ����� �������, � ���� ��� �������� ����� �����������. ��������.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//���. ����� ����������?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(�����) �����. � ���� ������ ����� �� ����.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//����� �� ���� ��������� ����� ������ ��.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//������ �������. ������� - �� ������������, ��� ����� ������. ���� � ���� �� ����� ������� �� ������, � ������ �� ������.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"� ��������� � �������.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//�� �� ������ ��� ������, ��� ���� ����������� ��������.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//��, �� � ����� ������, ��� ������ �� ������ ��� ������� �� ������.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//�� �� ��� �����, ��� �� ����� ���� ���������� ��� �������?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//� �� ���� ������...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...������, ������ � ����.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//� ��������� � �������. �� �������� ��������� �����.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//��, ���� ����� ��������. �� � ��������� ����, ����� ��� ��� ����� ������������...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//...�������, ���� �� ������ �� ��, ����� �� ������� �������.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//�����, �����. � ������ �����, ��� �������, �� �����, ��� ��� � ����� ���� ������� ����.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
