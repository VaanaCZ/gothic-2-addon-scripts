// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "�������� ��� ��������� �� ���� ���������!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //�������� ��� ��������� �� ���� ���������!
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //���� � ���� � ���� �����-�� ��������, ��� � ��. ��, �������, ������ ��� ������. �� ������ ����� ����� � ������ ���������.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //���� ���-�� �� ��� ����� ���� �����������, �� ������� ��������� �� ������������.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� ��������� �����?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //��� ���������� �����?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //���� ���� ��������� ��� ������ - �� ��������. �������, ���� ������ ��, �� ������ ����� �����, ������� ��� ��� ����� ������������ ��� ��������.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //� �� ����� �� ��������� � ��� �����, ���� �� ��������� ����� ������, ��� ��� ���� ����� ��������.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "��� �� ������ ���������� ��� �� ���� ��������?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //��� �� ������ ������� �� ���� ������?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //����� ���� ��� �����. ����� ����� � ������� � ������ � ������ � ����� ������.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //�� ���-������ ���� ������ �� ������������ �����. ��� ��������� ����� �������.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_13_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_13_STANDARD_Condition;
	information	= DIA_BAU_13_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ������?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //��� ����������?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //������ �� ������ ������ �� �������� ��� ������ � ����! ��� �� �������� ������ � ��� ����, ����� �� ������ ����������!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //��������� �� ������ �� ������� ������ ��������. ���� ������� ����, �� ����� ������� �� �������� ������.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //�������! ����� �����, ��� � ������ �������� ��������� �������. ��� ����� ��������� �� �������!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //�������, ����, ��� ������� � ��� ����������� � ������ ��������. ��, �� ��� - ��� ��� ������� ������.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //����� ������ ����� �������, � ��� ����� �������� ������� �� ���� ������, ����� �� ����� ����� ��������� � �������.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
