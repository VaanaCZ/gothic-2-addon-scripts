// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "��� ����� ������, ����� �������� ����� �����������.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //��� ����� ������, ����� �������� ����� �����������.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //��, ������. �� ������ ������� �������� ����� � ��� ����������� ������ ������ ���� ������?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //�� �������������, � ���� ���� ����� �� ��������, ����� � ������ ����. ������� � ������ ����. ���� �� ������, ���� �� �� �� ���������� � ����.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"� ����� ����������, ��������� ������ ��� ��������� �������.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //����, � ������� ���� ���������. � � ��� ������ ����, ��� ������ ����. ������ ���� � � ���������.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //��, � ��� �� �� ������, �� � ����� �����.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "��� ������ ������� �������� �������?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //��� ������ ������� �������� �������?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //�� �������, �� ��������. ������� - ��� ������ ��, ��� ��� ���� �����.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "��� ��� ����� �����?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //��� ��� ����� �����?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //�� ������� ��������� ������, ������ ����� ������ ���� ���� �������� ���.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //����������� ��������� ������� ������ �����, � ������ ������� ����� �������� ������ � ���������� �����.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "��� ��������� ����������?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //��� ��������� ����������?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //������ �����. �� ������� �� ���� ����� ������� ����� ������ ������. ���� ��� ��������� � ������.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //��������� ������ - ��� ����. ����� ��� �� ���� ���, ����� ��� ����� ���������� � ����� ��� ���� �� �����.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "�������� ��� �� ���� ���������.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //�������� ��� �� ���� ���������.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //�� ����� �������. ��� ������� �������� � �������� ������ �������.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //��� ���� ���������� ��������� ���������. ��� ������������ ������ ������ ����.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die h�chsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "���� ���-������ ���������?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //���� ���-������ ���������?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //����� ������� � ���. ��� ����� ��� ��� �� ���� ��������� �� ������� ��� ������ � ���� ����.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //�������, ��� � ���� �����-������ ��������� ���� �����. � ����� ������� ��������� ���� �����.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //�������� ������� �� ������� ������ �������. ���� �� ��� ��������� �����, � ���������, � �������� ����� � ��������.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //� ��� ��� �� ���� �������� � ���. ���� �� ��� ������ ��������� � ����� ���� ������.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //�� ������ ����� ������� ������������ ��������, �� �� ��� ������� �����. ��� ������ ������� ������� ���������� ������ �� ��� �� ���� �������.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //����� ������, �� ������ ������� ���� �� ��� �����.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //���� �������� ����� ��������� �������� ��� ������ ����������� ��� � ������ �� ������ � ��� ������ �������.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //� ������ � �������� � �� ����� ���. �� �������� � ���� �����!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //������ ����� ����� ���������� ���������, � ������� ������ ���� ��������. ��� ��� ������ ����� ��� ������� �������� �� ������ ��������.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //���. � � ��������� ������ ������� �� ���. � ������ ������ �� ������ ���������� ��������!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //��. �� �������� ������ ��� ���������! ����� ������� ���, ��� ������� �� ����� �������� ����. ������� ���� ������.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //�������� ��� ������ �����, � ��� �������� ������ ����� �����, ����� ������� ��.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};
