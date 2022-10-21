// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_7_EXIT_Condition;
	information	= DIA_MIL_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_7_JOIN_Condition;
	information	= DIA_MIL_7_JOIN_Info;
	permanent	= TRUE;
	description = "� ���� �������� � ���������!";
};                       

FUNC INT DIA_MIL_7_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //� ���� �������� � ���������!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //�� ���� �� ��������� ��������! � ���� �� ����, ��� ���� ����� ������� ����?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //��� ������ ��� �� ��������, �������� ������ � ������� ���������, � ����� ��������� � ����!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //�� � ���� ��������� ���������!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //�� ���� ��������� ��� ���, �������� ��������� ��� ����� �����. �� ������� ��� � ��������.
		};
	}
	else
	{
		B_Say (self, other, "$ABS_GOOD");
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_7_PEOPLE_Condition;
	information	= DIA_MIL_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� �� ������ � ���������?";
};                       

FUNC INT DIA_MIL_7_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //��� �� ������ � ���������?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //�� ������. ����� ����� �� �����, ����� ��� �����. ���� ��, ��� ������ � ��������� ������.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //��� ����� ��� ������ � ������ � ���� ����. ������� ����������� �� ���� ��������� � ����� �� ��� ������.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //���� ���� ���������� ��� ������ - �� ��� ���� ������. ���� ���������� ����� ������ ��������� ����.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_7_LOCATION_Condition;
	information	= DIA_MIL_7_LOCATION_Info;
	permanent	= TRUE;
	description = "� ��� � ���� �������� � ������?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //� ��� � ���� �������� � ������?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //���� �� �� ������ ��������� ����� � ������� ������ � �����, ����� ���������� ������. ����������� � ������ ����� ������ - ��������, ���� �������.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //���� �� ���������� �������� � ������ �������, ���� ����� �������� � ���������� � ��������� ���, �� ������� ����, ��������������� � ������ ����������.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //����������� ��� � �������� ��������� � �����������.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //����� ������ ����, � ����� �� ������ ��� ������� ����, ������������ �� �����.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_7_STANDARD_Condition;
	information	= DIA_MIL_7_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ������?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //��� ����������?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //�������� �������� ���� �� �����. ���� ��� ��� �� ������� ��������, � ��� ����. ����� ����, �������� ����?
			
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{		
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //�������, ��� ������� �������������. ������ ����� ��� ��� �� �������. ��� ��� � ����� ������ ����� � ������!
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //�������� ������ �������� ��������� ��������. ���, ��� �������� �����, ������ ���� �������. �������� ������, ����� ���� �����.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //�������, �������� �������� � �������� ������, �������� ����������. ���-�� ���� ��������, ��� ��� ����������.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //���� �� ��������� ����� ���� ������������ �������� ������. �� ����� ������� ������� �������� � ������� �� �������.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //����� ��������� ��� �������� ����� �����. ��������� �������� �������� ���� �����.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //� ��������� ���������, �� ��� ��� �� ���. ��������� �� ������� ����. �� �� ���� ����� ���������!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_7 (var c_NPC slf)
{
	DIA_MIL_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
