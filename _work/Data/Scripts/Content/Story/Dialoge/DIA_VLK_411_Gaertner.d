// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Gaertner_EXIT(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 999;
	condition	= DIA_Gaertner_EXIT_Condition;
	information	= DIA_Gaertner_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaertner_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gaertner_PICKPOCKET (C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 900;
	condition	= DIA_Gaertner_PICKPOCKET_Condition;
	information	= DIA_Gaertner_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Gaertner_PICKPOCKET_Condition()
{
	C_Beklauen (40, 50);
};
 
FUNC VOID DIA_Gaertner_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice		(DIA_Gaertner_PICKPOCKET, DIALOG_BACK 		,DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gaertner_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gaertner_PICKPOCKET);
};
	
func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gaertner_PICKPOCKET);
};
//*************************************************************
//		Was machst du hier?
//*************************************************************
INSTANCE DIA_Gaertner_Job(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Job_Condition;
	information	= DIA_Gaertner_Job_Info;
	permanent	= FALSE;
	description = "��� �� ������� �����?";
};                       

FUNC INT DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaertner_Job_Info()
{	
	AI_Output (other,self ,"DIA_Gaertner_Job_15_00"); //��� �� ������� �����?
	AI_Output (self ,other,"DIA_Gaertner_Job_09_01"); //� �� ��� �������? � �������� � �������� �� ���� �����.
	AI_Output (other,self ,"DIA_Gaertner_Job_15_02"); //��, ������, ������ ������� ������?
	AI_Output (self ,other,"DIA_Gaertner_Job_09_03"); //��, � �������� ��, ����� ��� ��� � ���������� ��������.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_04"); //�����-�� ���� ���� ������ ��������� � ������� �� ��, ��� � ��������� ������ �����.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_05"); //�� �������, �����������, ����� ��� ��������, � ���� �������� �����.
	AI_Output (self ,other,"DIA_Gaertner_Job_09_06"); //�� �������� ���� ��� ���� ���� �����. � � ������ ������� ����.
};
//*************************************************************
//		
//*************************************************************
INSTANCE DIA_Gaertner_Plants(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Plants_Condition;
	information	= DIA_Gaertner_Plants_Info;
	permanent	= FALSE;
	description = "�� ����������� �����-������ �����?";
};                       

FUNC INT DIA_Gaertner_Plants_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Gaertner_Job)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Plants_Info()
{	
	AI_Output (other,self ,"DIA_Gaertner_Plants_15_00"); //�� ����������� �����-������ �����?
	AI_Output (self ,other,"DIA_Gaertner_Plants_09_01"); //��, �������. � ��������� �������� ����� � �������� �������. ����� � ������� ������ �������� �����, �� ��� �� ����������� �����.
	AI_Output (self ,other,"DIA_Gaertner_Plants_09_02"); //� ������ ��� ������ ����������. ��� ���, ���� �� ������ ���-�� ������...
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"�������� ����������� ����� ������� ��� ���-����� ��������.");
};
//*************************************************************
//		Trade
//*************************************************************
INSTANCE DIA_Gaertner_Trade(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Trade_Condition;
	information	= DIA_Gaertner_Trade_Info;
	permanent	= TRUE;
	description = "������ ��� ���� ������.";
	trade		= TRUE;
};                       

FUNC INT DIA_Gaertner_Trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Gaertner_Plants)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Trade_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Gaertner_Trade_15_00"); //������ ��� ���� ������.
};
//*************************************************************
//		Krautabak
//*************************************************************
INSTANCE DIA_Gaertner_Krautabak(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 5;
	condition	= DIA_Gaertner_Krautabak_Condition;
	information	= DIA_Gaertner_Krautabak_Info;
	permanent	= FALSE;
	description = "� ���� ���� �������� �����.";
};                       

FUNC INT DIA_Gaertner_Krautabak_Condition()
{	
	if (Npc_HasItems (other,ItMi_SumpfTabak) >= 1)
	&& Wld_IsTime (06,45,21,45)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Krautabak_Info()
{	
	AI_Output (other,self ,"DIA_Gaertner_Krautabak_15_00"); //� ���� ���� �������� �����. ������ ����������?
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_01"); //���� �� ����... �, �����, �����. ������ �������.
	
	B_GiveInvItems (other, self, ItMi_SumpfTabak,1);
	Npc_RemoveInvItems (self,ItMi_SumpfTabak,1);
	
	CreateInvItems (self, Itmi_Joint,1);
	B_UseItem (self, itmi_Joint);
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_02"); //���... ���-���....
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self ,other,"DIA_Gaertner_Krautabak_09_03"); //������� �����. ���-�� ��� ����������� ������ ���.
	
	B_GivePlayerXP (XP_Ambient);
};
//*************************************************************
//		Sign
//*************************************************************
INSTANCE DIA_Gaertner_Sign(C_INFO)
{
	npc			= VLK_411_Gaertner;
	nr			= 6;
	condition	= DIA_Gaertner_Sign_Condition;
	information	= DIA_Gaertner_Sign_Info;
	permanent	= FALSE;
	description = "(�������� ������ �����)";
};                       

FUNC INT DIA_Gaertner_Sign_Condition()
{	
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gaertner_Sign_Info()
{	
	AI_PlayAni (other, "T_YES");
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_00"); //������ �� ���� �� ���. � � ���� ��������� ���� ���-����� ����������.
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_01"); //� ��������� ����� ����� ���� ��������� ������, ������� ����������� �������� �������������.
	AI_Output (self ,other,"DIA_Gaertner_Sign_09_02"); //���� ������ ��� ����� ������ ���� ����.
};

