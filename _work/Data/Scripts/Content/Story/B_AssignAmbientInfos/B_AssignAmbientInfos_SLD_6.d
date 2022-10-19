// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_6_EXIT_Condition;
	information	= DIA_SLD_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_6_JOIN_Condition;
	information	= DIA_SLD_6_JOIN_Info;
	permanent	= TRUE;
	description = "� ���� �������������� � ���!";
};                       

FUNC INT DIA_SLD_6_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //� ���� �������������� � ���!
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_01"); //� ������ �� ���� ���� � ����������. ������ �������, ��� �� ������ ���������. �� �������� ��� �����.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_02"); //������� �������� - ��� ����, �� �������� � ��� � ���������� - ��� ������ ������. ���� ���� ������ ����� ��� ����, � ���� �� ������.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_03"); //�������� � ��������. �� ������� ����... (�������)
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_6_PEOPLE_Condition;
	information	= DIA_SLD_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� ��������� �����?";
};                       

FUNC INT DIA_SLD_6_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //��� ���������� �����?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //��� ����� ����������� �����, ���� �� ��� ������ � ����. �� ���� ��������� ��.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //�� ��� ��������� � ����������� �����. �� �� ������ �� �� ��������� ���� � �������. (�������)
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //������� ��� ���. ���� � ���� ��������� �������� �����, ��, �������, ������������, ��� ����� ������ ��. ��� ��������� ������ ������ � ���� �����.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_6_LOCATION_Condition;
	information	= DIA_SLD_6_LOCATION_Info;
	permanent	= TRUE;
	description = "�� ��������� ��������?";
};                       

FUNC INT DIA_SLD_6_LOCATION_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //�� ��������� ��������?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //�� �������� �� ������ ����� �����, �� � ��� ��� ������.
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_02"); //���� �����, ����� �� ������ ��������� ����� ����������. ��� ��� ���������� ����� ���� ��� ��������.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_6_STANDARD_Condition;
	information	= DIA_SLD_6_STANDARD_Info;
	permanent	= TRUE;
	description = "��� ����������?";
};                       
func INT DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_STANDARD_15_00"); //� ��� ����?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_01"); //�� ������ ���� �� ���, ������!
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_02"); //���� ���� �����?
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_03"); //����� � ������� � ��������, � ������� ���� �� �������.
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_04"); //������ - ��� ��� ��������� ���������. ��� �� ��, ��� �����-�� ��� ���� ��� ���������� ���������.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_05"); //��� ��� ��� ���� �����, �� ��� �� ������� ����� �� ������ ����� ���������?
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_06"); //������, ������ ��� �������� �������� ���� ���������� ������� �� ������ � �������� �� ������.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_07"); //���� ����� ����� ������� ���� ����������. ��� ��������� ���� - � �� �� ��������� � ����� � ���������� ������� ����.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_08"); //���� ������� �� �������� �� ������,  �� ���� ������ ���� � ��������� ���.
		};	
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_09"); //��� �� ��� ���������� �����? ����� �� �� ���������� � ������ ������ � ����������?
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_10"); //���� �� ��� ��� � ��������.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_11"); //�� ������ ���� � ������ ��������. � ������, ��� ���� �������� ��� ���������� ������.
		};	
	};
	
	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_12"); //����� �� �������� �����, � ����� �����, ��� �� ��� ����� ����������� ����� ����.
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_13"); //�� �������? ��� ���-��! ������ ���� �� ���-�� ������� ����������� � �����.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_14"); //� �������. �� �� �� ����� �������, �� ������ ��� ��������� - ��� ������� ������.
		};	
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_6 (var c_NPC slf)
{
	DIA_SLD_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
