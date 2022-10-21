// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_6_EXIT_Condition;
	information	= DIA_OCVLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_6_PEOPLE_Condition;
	information	= DIA_OCVLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� ��������� �����?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //��� ��������� �����?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //������ ��������� ���� ������ - ������, ���, ��� �� ���� ��������.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //�� ��� �� �� ������������� ����������� ������. ��, ���� ������ ���-���� �� ��� ����� �� ������� � ����.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //���� ���� ����� ����������, �������� � �������. �� ������� ��� � ���� �������� ���� �������.
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_6_LOCATION_Condition;
	information	= DIA_OCVLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "��� �� ������ ���������� ��� � �������� � ������ ��������?";
};                       

FUNC INT DIA_OCVLK_6_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //��� �� ������ ���������� ��� � �������� � ������ ��������?
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //���� ��������� �������� ����� �����. � ���� ����� �� ����, ��� ���� �������� �� ���.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //������� �� ���� ���� - ��� ������� ��� �����. � �����, ������� �����, ��� ���������� ������� ������.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //��� �������, � �� ������ �������� ��� �����.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //�� ������ ����� ����. ���� ��� �������� ������� � ������, � ��� �� ����� �� ������� �����.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_6_STANDARD_Condition;
	information	= DIA_OCVLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ����?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //��� ����?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //��� ��������: '������ � ����� � � ���� �� ����� �����'. � ��� ��� ��� �����.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //������ ��� ������� ������ ��������� ���� ������������ � ������� ��������������. ������, ������, ������, ��� �� ������� ������� � ������ ������. (������� �������)
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //�� ��� ����� ������� �� ������, ���� ��� ������� ������� �� ����� ��� ������!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //�������� �� ��������. �� ����� ����! ��� ������ �� �������.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //�������, ��� ��� ������� �����! ������ � ��� �������� ����!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //��� ��-�� ���� ��������� ����. ��� �� ����� ��������� ���, ��� �� ���������� �����. �����, ����� ���� ������� ��� � �����.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //��� �������� �����, ��� ��� �������� ����� ������, �� ������ ���������� �����!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_6 (var c_NPC slf)
{
	DIA_OCVLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
