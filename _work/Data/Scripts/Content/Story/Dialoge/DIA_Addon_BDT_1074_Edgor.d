var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //��� ��� �������������...
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "��� ����?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //��� ����?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //�� ������ ������, ��� � ���� ����? � ���� ��������, ��� � ���� ����.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //������� �����-�� ������ �������� ���� ���� � �����. � ������� ��� �� ��������.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //����� ����� ����� �����, ������ ��� �����-�� ������ ������� ������ ����� ������.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //� ����� ������ ���� ���������� ��������� � ������� �������, ��� ������ ����.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //� �� ������, ��� ���� ���� �������������.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "��� ������ �������� �������?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //��� ������ �������� �������?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //����� ������. ���� ��������, ������� ��� ���������� �� ����.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //������� ��� ���� ������. � ������ ������ ������� ���.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "������ ������ ���� �� ������ ���� �������� ��������...";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //������ ������ ���� �� ������ ���� �������� ��������. �� �� �����?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //��������, � ���� �� ������� �� ������. ���, ��� � ����, - ��� ��, ��� ��� ������ ���� ���-�� � ��� ������ ������ �� ������.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //� ��� ���������� ����� ������� ���: '�����, ��������� ������ ������, ������� �� ������'.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //� �� ��������� ��������� ����� ������ ���� ����� ��������� ������!
	
	B_LogEntry (Topic_Addon_Stoneplate,"����� �� ���������� ������ �������� ��������. �� �������, ��� ��� ��������� � �����-�� ������ �������� �� �������.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "� ��� ��������� ��� ������ ������?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //� ��� ��������� ��� ������ ������?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //������ ����� ��� ������� ������. ����� ��������� ����� ������� ������ ������� ������.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //��� ���� ������ �����... ��� ������, � ��� �� ����� - ��� ���� ������� �����.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //�� ��������� ������ ���� �� ��������� ����������. � ��� ������ ������� ����������.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //����� ����, ���� ������� � �� �� ������� ��...
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "� ����� �������� ��������!";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//(��������) � ����� �������� ��������!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(������) ������? �� ������ ������.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(������) ����� �� ��������� ��������� ���� ������� � ������. (������)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//������ ������� ���� ���-����?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//� ������ ���� ��� �������� ���. � �������� ���� ������ ������ ���� ������, ��� � �������� ������!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//�� � ����, ��� �������� �� ��� ���� � ������, �� �� ������� �����. (� �������� �������) ��! �������� �� ���...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//����� ����, � ����, ��� �������� ������ �� ���������� ���.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//���� ������, � ���� ������� ���� ���� ���� �����.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//�������, � ������ �� ���� ������ ���������...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"� �������� ����� ������ �������� ���.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//��� ����� ������. ���� ���������� ������ ������, �� ���������.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "�������� ����...";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//�� ������ �������� ���...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//��� �� �� ����� ������?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "���� �������� ���� (5 LP, 100 ������)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "������ �������� ���� (5 LP, 100 ������)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"������ �� ���� (1,  100 ������)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//��� �������� ���� �� ����?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//��������� ������ ����� �� ����� � ������� �� �����-�������. ������ ������������ � ������� ����� ����� ���� �����.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//����� ����� �� ������� ��������� ���� ������ ���������.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//� ��� �������� ������?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//������ �� ����� �����. ������ ������ ������ �� �� ������� ������� ����.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//��� ������ ������ �� ���� �������� ����?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//������� ������� ���� ���� ����� - ����� �������� ������ � �������.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//��� ���������� ���������� ������ �������� ��� �� ���� -  ��� ������������ ��� ��� ��������� �����.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		


