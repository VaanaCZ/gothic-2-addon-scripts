// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_8_EXIT_Condition;
	information	= DIA_VLK_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_8_JOIN_Condition;
	information	= DIA_VLK_8_JOIN_Info;
	permanent	= TRUE;
	description = "� ���� ����� ����������� ����� ������!";
};                       

FUNC INT DIA_VLK_8_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //� ���� ����� ����������� ����� ������!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //� ��� �� ����� �� ���� ��������? ��� � ������ �� �������� ������������� � ������ ����� ������. ����� ����, ���� ���� �������, ����-������ �� ��� ����� ������.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //� ��������� ������, ���� �������� ���������� � �����������, ����� �� ��������������� ���� ��� ����������.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //�� ������, �� ������ ������ �� ����. � ��� ���, ��� ������ ��������, ���������� ������ ������ �� ������.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //� � �� �����, ����� ������, �� ����� ��� ������� �� ����� �������.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_8_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_8_PEOPLE_Condition;
	information	= DIA_VLK_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� ����� ����������� �������� ����� ������?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //��� ����� ����������� �������� ����� ������?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //����� ���������... ������� ������������ �� ������ ����� ������. ��� ����� ����������.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_8_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_8_LOCATION_Condition;
	information	= DIA_VLK_8_LOCATION_Info;
	permanent	= TRUE;
	description = "��� ����� �����������?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //��� ����������� ����� ����� �������?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //������� �������, �� ������� �������� �������� � ������. ��� �������� �����! ���� ����������� ����� ��������� �� ����.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //�� � ����������, ��� ��� ������ ���� �� ����. �������� �������� ���� ������� �����, ��� ����������� ����������.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //��� �������������. ��� ������������ ������� ����� �� ������ ���� ������.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_8_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_8_STANDARD_Condition;
	information	= DIA_VLK_8_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ������?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //��� ����������?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //��� �����������.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //���� ���� ����, ��� �������� ������������ �����, ��� ����, ������ ��� ��������� ��������� ���� ����� �������� �������.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //���� �� ���������, �������, ������� � ���� ���-������.
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
		SC_HearedAboutMissingPeople = TRUE;
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //��� ����, ����� �������� �������, ����� ��� ���� �������. � �������, ��� ��-�� �����. ���, ���������, ����� ������� �� ���!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //��������, ����� ����, � ������������� �������, �� ����� ���� ����� �������� �����, � �����, ��� ���� ������������.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //� ������, ��� �������� ����� ������ �����, ����� ���������� �� ������� ��� ����. ��� ����� �� ��������, ��� ��� �������.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //�� ���������, ��� ��� ��������? ������ ���� ������� �� ���������, ���� �� ��� ��� �������� �� ����� ����� �����.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //� �������� ������� �� �������, ����� �������� ����� ��������� �����.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //�������, ��� ���� �������� ���� �� �������� ��������, �������� � �������� ������! � ��� ��� �� ������� �����!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //�������, ��� ��� ������� ����������. ������� ��� ������?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_8 (var c_NPC slf)
{
	DIA_VLK_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
