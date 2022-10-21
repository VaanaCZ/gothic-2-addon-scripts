// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_12_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_12_EXIT_Condition;
	information	= DIA_PAL_12_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_12_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_12_JOIN_Condition;
	information	= DIA_PAL_12_JOIN_Info;
	permanent	= TRUE;
	description = "� ���� ����� ���������!";
};                       

FUNC INT DIA_PAL_12_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //� ���� ����� ���������!
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //��? �� ����� ����! �� �� ���� �� ������� � ��������� ������.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //���� �� � �� �����, ��� ������ ���� ������ ����� �����������, � �� �������, ��� �� ����������� ���� ����.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //������ ������ �� ������, ����� ��������� ������������� ������ � ������ ������� ������ ����� ���� ������� � ��������.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_12_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_12_PEOPLE_Condition;
	information	= DIA_PAL_12_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� ��������� �����?";
};                       

FUNC INT DIA_PAL_12_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //��� ��������� �����?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //�������������� ���� �����. �� ���� ����� �������� �� ��� ����, ���������� �������� ������.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //�� ������� ��� � ��������. �����, ���� �������, � �� ������ ���� ��������� ����� ������ ������������ �������.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_12_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_12_LOCATION_Condition;
	information	= DIA_PAL_12_LOCATION_Info;
	permanent	= TRUE;
	description = "��� ��, ��������, ������� �����, � ��������?";
};                       

FUNC INT DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //��� ��, ��������, ������� �����, � ��������?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //����, �������� ����� �������, ������� ���� ����� �� �������� ��� �� ����, ��� ������ ���.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //������������, ��� ���� ����� �� ����� ���� ���������, ��� ���������, ����� ���������� � ����� ������� ������ � ���� �������.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //��� ��� ����� ����� �� ������ ���������.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_12_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_12_STANDARD_Condition;
	information	= DIA_PAL_12_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ����?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //��� ����?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //������, ����� �� �����, ��� ����� ���� � ���������, ��� ����������� ��������� ������ ���-�� ����������.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //� ��� ��� ��� ��� ������� �������� �� ������ ������ � ������ ��������. ��� ��������� ����.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //����� ������! ������� ������ �� �������� ���. ������, ��� �������� ������ ����������� � ������, ����� ������ �������� �������� ����.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //�� ���, ������������� �������������, ��� � ������ �� ���� ������, �����?!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_12 (var c_NPC slf)
{
	DIA_PAL_12_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
