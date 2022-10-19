///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fortuno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1075_Addon_Fortuno;
	nr			= 900;
	condition	= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information	= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Addon_Fortuno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
	
func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Hi   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fortuno_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(��������) ������ ������ ������� ���... �� ������������...
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//� ������... ������� �����, ����� ������� ���... ��, ��� ����� ����... �� ����� ����... �, ���, ����, ���� �����...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//� ����� ��� � �������?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"������� ����� � ���. ��� ����� '������� ���������'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//�������... ������� ���������... � �� ���� �����...
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"� ������� �����... (�����)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"� ���� ���� ������?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"��� ������ ��� �������� �����.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"���, ������ ���� '������� ���������'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//� ���� ���� ������?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//�������... ������� ��������� ������� ����������...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//��� ������ ��� �������� �����.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//�� �������, �� �������, �� �������, �� �������...
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//���, ������ ���� '������� ���������'.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(������� � ����) �-�-�-�...
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//��� ������... ���... �... �������... ��� ���������?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"'������� ���������' ����� ������� ������ � ����.");
};


///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_wer   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent   = FALSE;
	description	= "��, ����� ���, ��� � ����� ���������.";
};
FUNC INT DIA_Addon_Fortuno_wer_Condition()
{	
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_wer_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//��, ����� ���, ��� � ����� ���������.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//�����-�� � ����������� � �������� ������. ����� ��� ���� � �������.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//��, ��� �� - ���������� �����������, �� ��� ���, �����������, ����� ���� �����������...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//��, � ���� ��� ����������� � ������ ��������. �������� ���-������ ���������.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//�... � ������ �� �����. ���� ��������� ��� ������...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//�� ��, �������������. ��� ���������? ����� �� ������ � ����?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//�����... � ����� ������ ������ �... � ������ ����.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//��� ������ �����? ��� �� ������ � �����?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(��������) ��� ����. ������� �����, ����� ��� ����� ��� �������� � ������. � � ��� ����� �� �������...
};
///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_FREE   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 5;
	condition   = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent   = FALSE;
	description	= "������ �� ���� ������ ������� ���� ������.";
};
FUNC INT DIA_Addon_Fortuno_FREE_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_wer)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//������ �� ���� ������ ������� ���� ������.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//��... ��, ��������, ��� ��������.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//���� ����� ��������� ������� �������� ��� � ����.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//� �� ���-������ ������� ��� ���?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//���, � �����, ��� ������ ������� ������ � ����...
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//���������. �����, ���� ���� ������ ���������� ���� �����, � ����� ���.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"����� ������� ����������, �� �� ��� ��� ������ �� ������.");
};
///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Herb   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 99;
	condition   = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent   = FALSE;
	description	= "���� ����� ��� �������� �����?";
};
FUNC INT DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//���� ����� ��� �������� �����?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//��-�-�, �����������. � ����� ��� �����, ������� �� ��� ���������.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//� ���� ������� �� ��� ������, ��� ����.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(������ ��� �������� �����)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(������ 1 �������� �����)",DIA_Addon_Fortuno_Trade_1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trade   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 100;
	condition   = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent   = TRUE;
	description	= "� ���� ���� �������� ����� ��� ����...";
};
FUNC INT DIA_Addon_Fortuno_Trade_Condition()
{	
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo (other, DIA_Addon_Fortuno_Herb)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//� ���� ���� �������� ����� ��� ����...
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
};
FUNC VOID DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems (other, Itpl_Swampherb);
	
	if B_GiveInvItems (other, self, ITPL_Swampherb, amount)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, amount * Value_SwampHerb);
	
	B_GivePlayerXP (amount * 10);
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_1()
{
	if B_GiveInvItems (other, self, ITPL_Swampherb, 1)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, Value_SwampHerb);
	
	B_GivePlayerXP (10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trank   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 3;
	condition   = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent   = FALSE;
	description	= "� ���� ���� ����� ��� ����...";
};
FUNC INT DIA_Addon_Fortuno_Trank_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	&&   Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems (other, ItPo_Addon_Geist_01) >= 1)
	||  (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//� ���� ���� �����, ������� ������� ���� ���������.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//� ���� ����.
	
	if (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1)//der richtige
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_02,1)
		{
			AI_UseItem (self, ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP (XP_Addon_Fortuno_02);
		
	}
	else
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_01,1)//der...�h...t�dliche
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
			AI_StopProcessInfos (self);
			AI_UseItem (self, ItPo_Addon_Geist_01);
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_more   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent   = FALSE;
	description	= "�?..";
};
FUNC INT DIA_Addon_Fortuno_more_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_more_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//�?..
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//��! �... � ����� �����! ������ � �������... �, ������, ��� �� � �������?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//��, ��� �� �������? � ����� ������� - ��� ������� �����?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//� ����� ���... ��������� ��������. � ���. ��� ���� ����� ��������� �����... � ����� �� ��� ����.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//�� ������� ������� ������ � ������� � ����.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//�����? ��� ��� ����� � �����?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//������ ��������... �� �������� ������ � ���, ��� ������ ���. ������� ����, ������ ����� ��� �����...
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//� �����?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//�� �� ������ ������� ������...
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//�� ����� ��� ������, ��� �� ������ ������� ���, ���� ��������� �������� �����.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//��� ����� �� ������ ���� �����. ���, ���� �� ����� ��������� �������� ������� ����, ���������� �����.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//�������� �����?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//����� ��������� ����� �������. ��� ��������� � �����.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//��� � ����� �������� ��������. �� ������, ��� ��� ������ ��� ����.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//� ����� �� ����� ������������ ��, ��� �� ��� ��������, � ��� ���� �� �����.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//�� ����������� �� ��� ���������� ��������... � �� ��������� ����.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"������ ����� ������ �������� �� ����� �������."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"������ �����-�� ������������ �������� ����� ������� �������, ������� �� �������� � �����."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"����� �������, ��� ��� ������������� ��� ������ ��� ���������� �������� ��������."); 
	
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Addon_Fortuno_03);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fortuno_Attentat   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 9;
	condition   = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fortuno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&&  Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//���������? ������, �... ������������... ��������� �����. � ������ ��� ��� �� ����.
};

