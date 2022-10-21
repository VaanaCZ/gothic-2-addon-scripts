//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //������ ����� ���� ����� �����? ����������!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //���� �� �� �����? ��-��, ������ � �������!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "� �����, �� � ����� ���� ������ ����.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//� �����, �� � ����� ���� ������ ����.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//� �� ����. ����� ������? 
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//�����? �������, �� ���� � ���-�� ������...
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//��... �� ����� ������ �� ������������?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"�� ��. � ������ ������.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"� �����, ���. ���, �� ������������.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"���� ������� ������� �� �������.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//�� ��. � ������ ������.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//������ ������... ��... �� ��� ���������� �������... � �����, �� �����.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//��� ��� ������. ��� ���� ��������?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//�������. ��������� ����������� �� �������, ��� �. ��� ������ ������ ������ ������ ���� �������� �������. 
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//� �����, ���. ���, �� ������������.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//��... ������ � ���� �������... �� �� �����.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "�����, ��� �� ������?";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//�����, ��� �� ������?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//��, ��� ������ ������� �� �����, �������� ��������� ���������.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//���-�� ��������, ���-�� �����, � ���-�� ������ ��� ������.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//� �� ��� �����?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//� ������ ��������� �������� ������, ��� ��������� ��� ����� �������, � ��� ����� ���� �� ���������� �� ����.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//��� �� �� �������? � ���� ������� ���� �������� �������! �� ��� ��� �������, ��� � ����� ���� �����.
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//����� ��� �������, ��� ���� ����� �����. ��-�� � ������ ���� � �����.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "��� �� ������� �������.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //��� �� ������� �������.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //���� ���������� ���. ������? �� ���� ����, � ��������. 
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //��������� ����� ����� ���� ���� � ������ ��������, ��� � ������.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "������ ������� ������� ������� (������: ������ 45, ������ 45. ����: 2100 �������)", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //���� ������, ��� � ���� ������������ �� ������?
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //����, ��������? ��, ��, � ��� � � ����� ���� ������. �����, ����� ���� ������.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "������ ������� ������� ������� (������: ������ 45, ������ 45. ����: 1400 �������)", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //������, � ���� �������.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //�������.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //��� ������ ���� �� �����������.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "������ ������� ��������� �� ��������...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(�������������) ��� ���� �� ���� �����?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //������ ����������. ������ �������, � ����� �� ������, ��� ����� �� ����������.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //� � ���� �� ����, ��� � ������ �����?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //��, ������, ��������.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //� ������ �� ���� �� ���� � ����� �� ����!
};


//----------------------------------------------------------------------
//	Paar Dinge geh�rt
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(��������) � ������ �������� ����. ������ �� �� ���� ������� ������, ���� � �� �� ������.
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "� ������ � ���� ����-������ ������.";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //� ������ � ���� ����-������ ������.
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //��?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //�����? (���������) �������, ��� ���� �����?
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //� ������, ��� ���� �� ���� �� ����� �� ����� ���������!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(�������������) ��� ���?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //��� ����������, ��� �� ���������� ��������.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(�������������) ���������...
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //������ �������� ���� ���! �� ������ ���-�� � ���������, ������ �� ������ ��������!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(��������) ������, �� ������ �� �������� ������?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //�� ������ �� ������������, ��� ����������� ����!
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //� ��� ��� ��� ������?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "� ���� ������ �� ���� �������, ����!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "���� �� ����������� ���������, �� �� ��� �����������!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "������, � ���� ���� �� �������.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(���������) �����, ��� ���� ����� � ��� ���������? ������, ��� ����� ����������� �������.
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //��, ����������, ��� ���...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //���� �� ����������� ���������, �� �� ��� �����������!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(�����������) �� � ����� ���� ����� �����, ��� ������ ��������? �������, ��� ������� ����������� � ��������? 
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //����� ��� ������!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //� ���� ������ �� ���� �������, ����!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //������ ��������? �� ��� �, ������. 
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //� �������� ������ ����� �� �������.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //� ����������, ��� ������� �������� � ����� ����. ����� ������� ��� �� ����������.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //�������, �� �� ���� � ���� ����������. ���� �������� �� ������ ����� � ���� ��������. ������� �� ������.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //������ �� ������?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //��� � �������� ���� �� ���, � ������� ������� - �� �����...
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //� ��� ����� ����� ������� �������?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //��� ��� ���� �� ��������. �� ��� ��� ���� � ����� ���� �����, ��� ��� ����. � �� ����� ��� � ������ �������� �����.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //����� �� ������. �� ������ ����� ���.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"���� ���� ������� �� ������, ������� ��� ������ ���� ��������� �� �������. �� ������, ��� �� ����� ��� �������� ������� �� ����� ����. �� �������� �� �������.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "����� ��� �������, ��� ����� �� ������!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "������, � ������� ����.", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //������, � ������� ����.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //������. ���������, ����� �� ���� ��������.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //����� ��� �������, ��� ����� �� ������!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //���. �� ������� ������, �������, �� � ���� �� �������.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //������, ���� �� ��� ��������, ��� ��� ���, ���� ��� �������� �������� ������ ������ ����� - ��������.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //�������.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(��������) �����. � ��������� �������. �� ������ ���, ��� � ����� ����, �����?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //��� � ������� � �������� � ��������. �� ������, ��� ������ ������.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "���� ������, ��� � ������ ���������� �� ������.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "��� ���� �����.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//��� ���� �����.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //� ����? �� ��� ���?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //���, ��� �� ���.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //� ��� � ����. ����� ������� ����� �� ���� ����.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //� �� ������. ���� �������, � �� ������.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //���, ������ ���. ��������� �������.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //� ������ ����� ��������� � ����� ��������.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //������ ���� ������� ���� ���� � �������. �������� � ��������.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "���� ������, ��� � ������ ���������� �� ������.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






