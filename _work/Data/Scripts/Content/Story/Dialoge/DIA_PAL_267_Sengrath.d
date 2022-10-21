
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Sengrath_EXIT(C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 999;
	condition	= DIA_Sengrath_EXIT_Condition;
	information	= DIA_Sengrath_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Sengrath_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Sengrath_Hello (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Hello_Condition;
	information	= DIA_Sengrath_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_00"); //� ����! � ����, ��� ����-������ ��� �������!
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_01"); //�� ������ ����� ������? ��� ��������� ���� ���������, ��?
	AI_Output (other ,self,"DIA_Sengrath_Hello_15_02"); //���, ��� ��������� �� ���� �������� ������. � ������ �� ������� ����� ������.
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_03"); //(�����) ��������� ����...
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_04"); //��, ����������� ������ ��������� ������� ���������� � �����. �� ������� ��� � ���� ������� ������, ���������� ����� ��������.
};
// ************************************************************
// 			  	Equipment 
// ************************************************************
INSTANCE DIA_Sengrath_Equipment (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Equipment_Condition;
	information	= DIA_Sengrath_Equipment_Info;
	permanent	= FALSE;
	description = "��� � ���� ����� ���������� �����?";
};                       

FUNC INT DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Equipment_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_00"); //��� � ���� ����� ���������� �����?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_01"); //������ ������������� �������. ����������� ����� �������� �� ��� ���������.
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_02"); //� ��� ������ �����?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_03"); //� ��� ���� ������ � ������������. ���� ���� ����������� ���� �� ���, ��� ��� �����.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"������� ������� ������ � �����.");
};
// ************************************************************
// 			  	Lehrer
// ************************************************************
INSTANCE DIA_Sengrath_Perm (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Perm_Condition;
	information	= DIA_Sengrath_Perm_Info;
	permanent	= FALSE;
	description = "� � ���� ����� ����� ��������� ����-������?";
};                       

FUNC INT DIA_Sengrath_Perm_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Sengrath_Perm_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Perm_15_00"); //��� ����� ����� ������� ���� ����-������?
	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_01"); //�������� � �������� - �� ����� ������������ ���.
	}
	else
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_02"); //������ ��������. �� ������� ������ ��������� � �����. �����, � ���� �� ������ ����-������ �������.
		
		Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Teacher_OC,"������� ��������� �������� � �����.");
	};
};
// ************************************************************
// 			Scrolls
// ************************************************************
INSTANCE DIA_Sengrath_Scrolls (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 9;
	condition	= DIA_Sengrath_Scrolls_Condition;
	information	= DIA_Sengrath_Scrolls_Info;
	permanent	= TRUE;
	trade		= TRUE;
	description = "������ ��� ���� ������.";

};                       

FUNC INT DIA_Sengrath_Scrolls_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Sengrath_Equipment)
	{
		return TRUE;
	};	 
};
FUNC VOID DIA_Sengrath_Scrolls_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Sengrath_Scrolls_15_00"); //������ ��� ���� ������.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sengrath_PICKPOCKET (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 900;
	condition	= DIA_Sengrath_PICKPOCKET_Condition;
	information	= DIA_Sengrath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Sengrath_PICKPOCKET_Condition()
{
	C_Beklauen (32, 35);
};
 
FUNC VOID DIA_Sengrath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_BACK 		,DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};
	
func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};



