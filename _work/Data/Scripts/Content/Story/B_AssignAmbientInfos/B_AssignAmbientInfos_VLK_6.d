// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "��� ��� ����� ����������� ����� ������?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //��� ��� ����� ����������� ����� ������?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //�� ������ ������ �����? ������? ����� ��� ��������� �� ����������� ����� �����?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //� �� ���������� �������� ����� �������.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //������ �����? ���� ����� ������ ������, � ��� ������, ��� �����. ��, �������, ���� �� �����������, �� ������ ���������� � ���-������ �� ����������� �������.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "� ��� ��� ����� ����������� ������� ��������?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //� ��� ��� ����� ����������� ������� ��������?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //�������� ���������� � ������� ��� �������� � ������ ����� ������. ��� �� �� ������� � ������ ��������� ��������.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //� �� ������ ����� �������������� ���� �������� � ��������� ������.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "��� ��� ��������� ��������������� � ������?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //��� ��� ��������� ��������������� � ������?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //���� �������, ��� ����� �� ���-�� ������ ����� ������? ���� ��������� �� ������ ��������?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //���� � ���� ��� ��� ����� � ���������������, ���� ����� ���������� � ������ - ���� �� ������� ���� ���� - � �������� ��� ����������.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //�� ��������� ����� � ������� � �������. � �������� ��������� �������� ����� ������ ��� ����.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ������?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //��� ����������?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //� ��� ���, ��� ������ ������, ����� ���������� �������. �� �������� ����� ����� ����. ��� ��� ������ ����� ����� ������, ���� ������?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //��������� ����� �������� � ��������� �� ����� ��� �����. ������, ���-��, �������, ������ �� ���.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //��� ��������� ����� �������� ��������, �������� ��������. ��-�����, ����� ��� ���� ��� �� ��������.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //�������, ��� ���� �� ��������� ����� ���� ��������. ������ ������� � ������� �� �������. ����� ��� �������.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //���������, ���� ���� ���� ������ � ���� ��������� � ��������...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //�������, ��� ���� ����� �������� ����� �����, ����� ���������� ������ ��������. �������-�� �������� ������������!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
