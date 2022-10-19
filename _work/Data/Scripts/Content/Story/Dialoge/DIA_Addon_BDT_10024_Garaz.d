//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//������� �������.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//���� �����-�� ��������?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//��������. ��������� ���������. �� ���������� �� ������.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "������ �� �� ����� �� ��� �������?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//������ �� �� ����� �� ��� �������?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//� ���� ��������� �� ����. �� � ���������� ���� '����� ������ ����'.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//������� ������� ��� ����������� � ���� ���������.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//� �������, �� �� ����������� � ���� �������.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//� �����? ����� �� ������ ��������� �� ������ � ������?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//������� ��� ����� ������� ������� ����� ����. � � �� ���� ��������� ����������� ������� �� ���� ��������� ����.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//���� �� ������ ��������� � ���������� - ���� �� �����, ��� � ���� ���������. ������ �� ���� ���������� �� ����, �����?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "�� ��� ������ ���������� ���-������ ��� ��������?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//�� ��� ������ ���������� ���-������ ��� ��������?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//����. �� - ������ �� ������ �������. �� ��������� ������ ���� � ������ ���������.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//�� �� ����� ��������� �� ����� ����� ������. � ��� �� �� �� ��� �� ������.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//��� ���?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//�� ������, ��� �� - ������ � ������� �� �����, ���� � ����-�� ������ �����, ��� � ����. ���������� - � �� ������ � ���� �� ����.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//������ �� ���� � ���� �� ���� � �� ���������� ���, ���� �� ������, ����� �� ���� � ������ � �������� ���� ��������������...
	
	B_LogEntry (Topic_Addon_Tempel,"���� ������� ������, ��� � ����� ���� ������� ����� ������� ����, �� ��������� ������� ����.");
	B_LogEntry (Topic_Addon_Tempel,"����� ������� ���������, �� ������ ��� ����� ��������. ��� ����� ��� ������."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "��������� ������ ���.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//��, ������. � ���������� ���������.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//������� ��� ���� ����. �� ���� ����� �����?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//� ���� �������, ��� �� ������� ���������, ����� ������� ������ ����, ��? �����, ��� �� �� �� ����������, ����� ��� ������.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//�� ������� ����� ������! �������� ������.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//� ����� ������� ������.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//�� ��, ��������, ����� ���� ����� ������.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//����� ��������� �� ���� ����������, ��� ����������� ��������.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//�� ����� ������� ������� ����� �� ���������� ����������... ����� ����...
};




