//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_EXIT   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 999;
	condition   = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Paul_PICKPOCKET (C_INFO)
{
	npc			= BDT_1070_Addon_Paul;
	nr			= 900;
	condition	= DIA_Addon_Paul_PICKPOCKET_Condition;
	information	= DIA_Addon_Paul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Paul_PICKPOCKET_Condition()
{
	C_Beklauen (22, 19);
};
 
FUNC VOID DIA_Addon_Paul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
	
func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Hi   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 1;
	condition   = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent   = FALSE;
	description = "� ���� ���� ���-������ �� ���������� �����������?";
};
FUNC INT DIA_Addon_Paul_Hi_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Paul_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Hi_15_00"); //� ���� ���� ���-������ �� ���������� �����������?
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_01"); //� ���� ���� �����. � ���� ������ ��������� ������ ����.
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_02"); //�� � �� ����� ��. ��� ������������, ��� � ���� �������� �������.
};
//---------------------------------------------------------------------
//	Info Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Huno   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent   = FALSE;
	description	= "�� ��������� �� ����?";
};
FUNC INT DIA_Addon_Paul_Huno_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Paul_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Huno_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Huno_15_00"); //�� ��������� �� ����?
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_01"); //� ����� ���������� ������� ������ � ���� �������� � ���. �� � ��� ��� ������� �� ��� ��� ������.
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_02"); //�� ������, ��� � ��� ������ �� ���������.
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_03"); //� ��� � ���� ��� ��������, ����� ��� ���������� �������� � ����?
};

//---------------------------------------------------------------------
//	Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Attentat   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 3;
	condition   = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Paul_Attentat_03_00"); //�����, ��������. � ��� �� ������ �� ���������! ��� �� ������ �� ����?
};
	
//---------------------------------------------------------------------
//	HunoVerdacht
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoVerdacht   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 4;
	condition   = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent   = FALSE;
	description	= "���� ������������� � ������������ � ���������...";
};
FUNC INT DIA_Addon_Paul_HunoVerdacht_Condition()
{	
	if ( (Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoVerdacht_15_00"); //���� ������������� � ������������ � ���������...
	AI_Output (self, other, "DIA_Addon_Paul_HunoVerdacht_03_01"); //� ������ ��� ��� �� ����!
};
	
//---------------------------------------------------------------------
//	Arbeitest f�r Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoArbeit (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent   = FALSE;
	description	= "�� �� �� ��������� �� ����! ��� ��� �� ������ ���-�� �����!";
};
FUNC INT DIA_Addon_Paul_HunoArbeit_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_Huno))
	&& (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoVerdacht))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoArbeit_15_00"); //�� �� �� ��������� �� ����! ��� ��� �� ������ ���-�� �����!
	AI_Output (self, other, "DIA_Addon_Paul_HunoArbeit_03_01"); //(� ��������) � ������ �� ���� - ������! ��� ����� ����!
	Npc_ExchangeRoutine(self, "AWAY");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	Angst vor Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_FearEsteban (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent   = FALSE;
	description	= "�� ������, ��� ������� ������� � �����, ���� ������, ��� �� ����������� ����?";
};
FUNC INT DIA_Addon_Paul_FearEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoArbeit))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_FearEsteban_15_00"); //�� ������, ��� ������� ������� � �����, ���� ������, ��� �� ����������� ����?
	AI_Output (self, other, "DIA_Addon_Paul_FearEsteban_03_01"); //������! ������ ���� � �����. � �� ���� �������� ��������� � �����.
	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	MaulPaul
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_MaulPaul (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent   = FALSE;
	description	= "�������� ���, ��� ���� ��������!";
};
FUNC INT DIA_Addon_Paul_MaulPaul_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_FearEsteban))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_00"); //(����������) ���, ����� ���, ��� ���� ��������, ��� � ������� ���� �� ���� ������!
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_01"); //�� �� ������ ������ ���� ������ ������, ��� �� ��������� �� �����.
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_02"); //(�������) ����!
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_03"); //�� ������ ���������!
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_04"); //(�����������) ���...
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_05"); //(�����������) � ���� ������, ��� � ���� � ��������� �����-�� �����������.
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_06"); //(�����������) ��� ��� �� ��������� �������� �� ��������. ��� ��� �������� ��� ���� � ��� �����...
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_07"); //� ������ ������ � ������� ������ �� �������.
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_08"); //�������! ��� ������, ��� ���� �� ��� ������.
	
	Npc_ExchangeRoutine(self, "START");
	
	Paul_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "���� ������, ��� ���� ��������� ��������, ������ ��� �� ������������� ���� ����.");
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1070_Paul_Mine   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_1070_Paul_Mine_03_00");//�������! ���, � ����, ����� �� ���� �� ��� ��� ����.
	B_GiveInvItems (self, other, ItMi_Nugget,2);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//----------------------------------------------------------------------
//	PERM
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_PERM (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 99;
	condition   = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent   = TRUE;
	description = "� ����� ��� � �������?";
};
FUNC INT DIA_Addon_Paul_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,  DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Paul_PERM_15_00"); //� ����� ��� � �������?
	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output (self, other, "DIA_Addon_Paul_PERM_03_01"); //��, � ������ ���� ������ �� ���� �����!
	}
	else 
	{
		if (Paul_TellAll == TRUE)
		&& (Huno_zuSnaf == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_02"); //� ��������� ���� ���, ��� � ����!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_03"); //� ������ ���� ������ ���� ������, ��������!
		};
	};
};




