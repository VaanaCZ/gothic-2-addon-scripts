// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //������, � ���� ������ ������ ��� �������.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //��� ����� �������������.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "��� ���� ������.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //��� ���� ������.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "��� ����?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //��� ����?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //���� ����������. ������� ����������, �� ���� �������� �� ����������.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //� ��������� � ������ �������, ������� ��� ��� ����.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //��� ��� �� �������?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //� �� ���� ���� �������.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //�� ��������, ��������, �� � ������ ��������, ����� �������� ��� �������, � �� ���� ����� ��� ��������.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "�� ������ ������� ���� ����-������?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //�� ������ ���� ����-������ �������?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "��� ����� ����� ������� ���� ����-������?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //��� ����� ����� ����-������ ���� �������?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //����� � ������ ��������� ������ ������� ��������.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //��� ����� ������� ���� ����� ���������.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //���� ����� ���������� ��������� ������.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //������ �� ������������ ����� ������� ���������� ������.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //� ���?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //������, ������ ������, � ������ ����� �� �������������.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //�� �����, ���������� ����� ��� ������� ��������, ��� � ����� ����������.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was wei�t du �ber Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "��� �� ������� � ��������?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //��� �� ������� � ��������?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //�������� ������. �������� ������ ����� � ��� ����.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //������ ������ ����� ���� ����, ���� ���� �������.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //��� ����� ������ �� ������. ���� �� ��������������, �� ��������� �� ���. ��� � ���.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "����� ��� ���������� �������.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //����� ��� ���������� �������.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //� ��� �� ���������. ���� ��� ������ �������.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //�� ������ ���, ��� ��� ��� ������� � �� ������ ������ �� ��������.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //���, � �� ���� ���� �� ����. ��� �����, ����� ����� ����� ���.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"����� �� ������ ��� �������, ���� � �� ������ ���������� �����."); 
};

//*********************************************************
//	Du sollst mir die R�stung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "�� ������ ������ ��� ������� ��������. ������ �����.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //�� ������ ������ ��� ������� ��������. ������ �����.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //������ �����? ��, � �-�� ����� ��� ������������� �������� ���� �� ��� �������.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //�������� � ������ �������� - ��� ������ ������������.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //����� �� ����� ���� ������� �� ���� �����-������ ������� ������...
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(�����������) �������.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //��, �������, ��� ���.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //���� ����������. � ����� ��������� ����� �����.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"������ ����� ������� ���� ��������. ������� � ����!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

