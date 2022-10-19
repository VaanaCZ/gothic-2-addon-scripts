// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_17_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_17_EXIT_Condition;
	information	= DIA_VLK_17_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_17_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_17_JOIN_Condition;
	information	= DIA_VLK_17_JOIN_Info;
	permanent	= TRUE;
	description = "��� ����� ��� ����, ����� ����� ����������� ����� ������?";
};                       

FUNC INT DIA_VLK_17_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_17_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //��� ����� ��� ����, ����� ����� ����������� ����� ������?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //�������-������������ �� ������ ����� ������ ����� ����� ������� ������� �����, � ��������. ���� ����� ���������� � ����� �� ���.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_17_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_17_PEOPLE_Condition;
	information	= DIA_VLK_17_PEOPLE_Info;
	permanent	= TRUE;
	description = "� ��� ����� ���������� ������� � ���� ������?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //� ��� ����� ���������� ������� � ���� ������?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //� ��� ���, ��� � ����� ������ ��������, ��� ����� � ���� ���� ��� ������.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //���� ����� ������������ �����. �� ������� ��� � ��������.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //�� ���� ����� ���� � ����, ������ ���� �� ������� ����� ��� ������ �������� � ���������.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_17_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_17_LOCATION_Condition;
	information	= DIA_VLK_17_LOCATION_Info;
	permanent	= TRUE;
	description = "� �������� ���� ���������� �����?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //� �������� ���� ���������� �����?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(�������) ��������, ���� ����� �������� �� ���� ������. ���� ���� ����� �����������, ������� ������� � �����.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //�� ���� �� ������ ���-������ ������, ��� �� �������� ������� � ��������� �����, ��� � ������ ����� ������.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_17_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_17_STANDARD_Condition;
	information	= DIA_VLK_17_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ������?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //��� ����������?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //���������, ����� ���� ������� ��������? ��� ������ ��������� ������, ������� � ������, �� ���� �� ������� ������ ������ ������.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //���� �� ��� ������� ���� �������� ��� �� ����� ��� ��������, ��� �� ������-����� ������������ � ����. ������ ����, � ��� �����-�� ������ �������...
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //� ������ ��� ������, ��� ������ ����� ��������. ��� ��� ��-�� ����. �� ����� �� ��� ������ ����� �������� �����.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //�������, ��� ����� � �������� �������� �������. ����� ����� ������ �������� ���-�� �����������. �� ����� �� �� ��� ��� ������ ������ ��� �� �������� ��������.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //������, ����� ��� ������� ������, �������� ������ ����������� � ���������� �������.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_17 (var c_NPC slf)
{
	DIA_VLK_17_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
