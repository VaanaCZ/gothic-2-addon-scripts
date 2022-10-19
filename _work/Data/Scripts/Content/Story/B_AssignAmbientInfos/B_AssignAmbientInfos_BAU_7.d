// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_7_EXIT_Condition;
	information	= DIA_BAU_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_7_JOIN_Condition;
	information	= DIA_BAU_7_JOIN_Info;
	permanent	= TRUE;
	description = "��� �� ������ � ���������?";
};                       

FUNC INT DIA_BAU_7_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_JOIN_15_00"); //��� �� ������ � ���������?
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_01"); //���� ����� �� ��� ������ ����� �����.
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_02"); //����������� �� ��� ����� ���� ���, ��� ����� ��� ����� ����������� ��. �� ��� �� ��� �������� ���.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_7_PEOPLE_Condition;
	information	= DIA_BAU_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� ��������� �����?";
};                       

FUNC INT DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_PEOPLE_15_00"); //��� ����� �������?
	AI_Output (self, other, "DIA_BAU_7_PEOPLE_07_01"); //��� ������� ����� ����������� �����. ������ ����� ������ ����. �� �� ����� �� � ������.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_7_LOCATION_Condition;
	information	= DIA_BAU_7_LOCATION_Info;
	permanent	= TRUE;
	description = "�������� ��� ��������� ������� ������.";
};                       

FUNC INT DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_LOCATION_15_00"); //�������� ��� ��������� ������� ������.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_01"); //��� ������� ����� �� ������� ������ ����������� �����. ����� ������ ��������� � ������.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_02"); //� ����� �������  - �� ����������� � ���-������. �� ������ ������� ���� �� ������. � ��� ����� ������� �������� ��������.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_7_STANDARD_Condition;
	information	= DIA_BAU_7_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ������?";
};                       
func INT DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_STANDARD_15_00"); //��� ����������?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_01"); //�� �������� ������������� - �� ������ �� ������ ������ ������. ������ ��� ����� ������ �� ������ ��� ���. � ��� ������!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_02"); //������ ��� ������ ���������� ����.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_03"); //��� ������ � ������� � ��������! ������ ������ ������ ������ ������ �������� ����� �� ������� �����.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_04"); //���� ���������: ��������� ����� ����� ������ ������� ����� ������ �������� � ��������� ����� ��������.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_05"); //������, ����� ������� ����������, �������� �������� �� ����, ����� �������� �� ������. ����� ��� ������ ��� �����������.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_7 (var c_NPC slf)
{
	DIA_BAU_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
