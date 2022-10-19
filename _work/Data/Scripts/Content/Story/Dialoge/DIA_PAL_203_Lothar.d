// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
	var int Lothar_ImOV;
// ---------------------

INSTANCE DIA_Lothar_EXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lothar_EXIT_Condition()
{	
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_EXIT_Info() 
{
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************

INSTANCE DIA_Lothar_FirstEXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent   = TRUE;
	description = "��� ����� ����! (�����)";
};
FUNC INT DIA_Lothar_FirstEXIT_Condition()
{	
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_FirstEXIT_Info() 
{
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //� ������ ����!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //�������! �� ���� �� ������ ����� ������� ������!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //�����.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //���� � ��� ���� ��� ������, ��� �� ������������� ����� � ��������, � ���� ����� ������� ��������, ���� ��� ����?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //���� �� ���������� � ��������, �� ������ ����������� ���� � ������������.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //����� ������ �������� �������� ������!
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine (self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine (Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos (self);
};


// ***************************************************************
//							Hallo
// ***************************************************************

instance DIA_Lothar_Hallo (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Hallo_Condition;
	information	 = 	DIA_Lothar_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lothar_Hallo_Condition ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //����, ���������!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //� �� �����, ����� �� �������� ����� ��� ������.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //�?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //� ������ � ������ ����� �������� ������ �� ���������� ����������� ��� � �����.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //�����...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //�������� �������� ���������� � ���� ������!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //������, ��� �������� ���:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //� �����. ������� ������ � ��������� ����� ������.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //��� �����������, ���� �����, ������ ��� ������ ��������� ���� ������������� ����� ������, ������� ������ ����������� ��� ������ ����� ������.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //������� � ������ ������ ��������� ����, ��� ��� ��������� ����� ���� ����������, ����� �� ��������� ��� ������.
	//ADDON<

	if Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	{
		B_StartOtherRoutine (Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht			E1
// ***************************************************************
instance DIA_Lothar_MESSAGE		(C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_MESSAGE_Condition;
	information	 = 	DIA_Lothar_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"� ���� ������ ��������� ��� ������������ ���������!";
};
func int DIA_Lothar_MESSAGE_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_MESSAGE_Info ()
{
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //� ���� ������ ��������� ��� ������������ ���������!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //�������������� ���� ����� ������ �� ���������.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //�� ��� �������, ���������� �������� ������, �������� ���� �����, �������� ��������� ������.
};	

// ***************************************************************
//							Auge Innos 				E2
// ***************************************************************
instance DIA_Lothar_EyeInnos (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_EyeInnos_Condition;
	information	 = 	DIA_Lothar_EyeInnos_Info;
	permanent    =  FALSE;
	description	 = 	"� ������, ����� �������� ���� ������!";
};
func int DIA_Lothar_EyeInnos_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_EyeInnos_Info ()
{
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //� ������, ����� �������� ���� ������!

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //������ � ����� ������ ������ ���� �����. �������� � ��� �� ����.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //��������� ���� ������! ������ �� ������ � ���?! �� �� ������������ � ������ ������!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //��� ������ � ��� ���.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //� �� ����, ������ �������� �� ����������������, ����� ������� ���� �� �������� ������ ������ ����...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //�� ��, ���������, �� ���� � ����, ��� �� ������ ��������� ��� ������ ������.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //��...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //� ������ �� ���� ���� ������� �� ����!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //������� �� ��� ������ ���� � ��������, � ������ - ��� ���. ����������!
		};
	};
};	

// ***************************************************************
//							Drachen 				E2
// ***************************************************************
instance DIA_Lothar_Dragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Dragons_Condition;
	information	 = 	DIA_Lothar_Dragons_Info;
	permanent    =  FALSE;
	description	 = 	"�������� - ����� ������ �������� �������!";
};
func int DIA_Lothar_Dragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Dragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //�������� - ����� ������ �������� �������!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //��� �� ����� ���� �������!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //��� ���� �����������!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //� ������ � ��� ����� ����� �������. �� ������� ������ ��� ������, ��������� ����� ������� � ��������!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //� ������� ������� � ������ ����������, ��� ����������� ����� ������ � ��������, � �������� ��� �������� ����������� � ������ ��������. ��� ��� �������� ���� ����!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //�� �� ����� ���������, ����� ���-���� ����� ���� ������ ����� �����!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //� ����� ����� �� ����. �� � ��� ������ ��������.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //����� �����, ���� �� �������� ��� ����� ��� ����. �� ������ ����� ������ �������� ������ ����� �����.
	};
	Player_TalkedAboutDragons = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lothar_Ornament_Condition;
	information	 = 	DIA_Addon_Lothar_Ornament_Info;

	description	 = 	"�� ������ ���-������ � �������� �������� �� ����� ������ � ����� �������?";
};

func int DIA_Addon_Lothar_Ornament_Condition ()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //�� ������ ���-������ � �������� �������� �� ����� ������ � ����� �������?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //�������. �� ���������� ���. ��� �������� ����������� ������.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //� ������ ���� ��� ����������?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "� ��� ����� �������������� ���������.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "�� �������, ��� ���������?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //�� �������, ��� ���������?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //���, ��������� ��������� �������?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //��������� � ����, ���� �������� ���������� ���� ����.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //��� �� ���������� �� �� �����. � ��� ������� ��� � ������ � ������ ��������.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //�������.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //� ��� ����� �������������� ���������.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //��� ������ ���� ���� ���������� �� ����� �������, � ����� ������.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //��, � ����� ���� �������. �� ����� ��� � ��������� �������. � �������, ��� ��� ���������� ����.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //���������� � �����, � ����� �� ����� ������. ��������, ��� �� ��� ��� � ����.
};

// ***************************************************************
//							WerVonDrachen 				E3
// ***************************************************************
instance DIA_Lothar_WhoDragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_WhoDragons_Condition;
	information	 = 	DIA_Lothar_WhoDragons_Info;
	permanent    =  FALSE;
	description	 = 	"���-�� ��� ���������� � ��������?";
};
func int DIA_Lothar_WhoDragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WhoDragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //���-�� ��� ���������� � ��������?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //��. ������ �� ����� �����. ���� � �� ��������.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //(���������) � ������������ ��� - ��� � ����! �� ���� ������� �� ���������� ����������� ��� �� �����!
	};
};	

// ***************************************************************
//							Regeln 				E1
// ***************************************************************
instance DIA_Lothar_Regeln (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_Regeln_Condition;
	information	 = 	DIA_Lothar_Regeln_Info;
	permanent    =  FALSE;
	description	 = 	"������ - ������� ��� ������ ����� ������!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //(������ �����) ������ - ������� ��� ������ ����� ������!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //��-������, �������������� ������� ���� ����� �������������� � ������� ��������, ������ �� ������ ��������.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //��� ������ ������ � ������� ����� ������ �������� ������ ��������� ���������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //��-������, ��������� ������, ����������� � ������� ��������, � ��������� ����� �������� ��������� ������� ���������. ������ ���� ����� ������ ���� �������� � ����� ���������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //� � �������, ���, ��� ���������� � ������������, ������ ��������� ����� ���������� ���������.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //���� �������?
	
	Lothar_Regeln = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lothar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Lothar_MissingPeople_Info;

	description	 = 	"� ������ ��������� ������?";
};

func int DIA_Addon_Lothar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lothar_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //� ������ ��������� ������?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //��, � � ������ ���� ��� ������.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //���� ����� ��, ��� ��������� �� ��� ��� �� ��������, ��� ����� �� ����� ���������.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //�������������, ��� �������� ������ � ���������� ���������� � �����������.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //��� ��� �� ����� �� �������������. ���� �������?
	
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};
	
	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen 				E2
// ***************************************************************
instance DIA_Lothar_HowCitizen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	4;
	condition	 = 	DIA_Lothar_HowCitizen_Condition;
	information	 = 	DIA_Lothar_HowCitizen_Info;
	permanent    =  FALSE;
	description	 = 	"��� � ���� ����� ����������� ����� ������?";
};
func int DIA_Lothar_HowCitizen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_HowCitizen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //��� � ���� ����� ����������� ����� ������?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //����������� ������ ����� ��������� ������ ���, ��� ����� ���������� ������!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //�� �� �����, ��� �� ������� ��������� ����� ������ ������� ������ ������, ��� �� ��������� �����������!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //��� ���������, �� �������� ������ � ������� ����� ������ - � �� ����� ����!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //������ ������ ������ ���������, �� ������� �������� ������ � ������!
};

// ***************************************************************
//							WoArbeit				E3
// ***************************************************************
instance DIA_Lothar_WoArbeit (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	5;
	condition	 = 	DIA_Lothar_WoArbeit_Condition;
	information	 = 	DIA_Lothar_WoArbeit_Info;
	permanent    =  FALSE;
	description	 = 	"��� � ���� ����� ������?";
};
func int DIA_Lothar_WoArbeit_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoArbeit_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //��� � ���� ����� ������?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //���� �������� ����� �������� ������ �� ��������  � ������ ����� ������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //��� ������ ������ ������ ���� �� ������, �� ������� ����������� ����� ������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //������ ������ ������� ������ ����������� � ����, ������ ������ ��������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //���� �� ����� ����� ������ � �������� ��������, ������ �� ����!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //��� ����� ������� ��������. ���� �� ��� ���� ���� ���, �� ��������� �� ����!
};

// ***************************************************************
//							ToOV 				E2
// ***************************************************************
instance DIA_Lothar_ToOV (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	6;
	condition	 = 	DIA_Lothar_ToOV_Condition;
	information	 = 	DIA_Lothar_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"��� ��� ������� � ������� �������?";
};
func int DIA_Lothar_ToOV_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToOV_Info ()
{
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //��� ��� ������� � ������� �������?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //�����, �� ���� ������ ��������?!
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //�� �� ��������� ����������� ����� ������. �� ������ ���� �� �������� - ������ ��� ����� ���� �� ������.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //���, ��� ��������� �� ����������� �������, ��� ���� �������� ��������� �����!
};	

// ***************************************************************
//							ToMiliz 				E2
// ***************************************************************
instance DIA_Lothar_ToMiliz (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToMiliz_Condition;
	information	 = 	DIA_Lothar_ToMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"��� � ���� ��������� �� ������ � ���������?";
};
func int DIA_Lothar_ToMiliz_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToMiliz_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //��� � ���� ��������� �� ������ � ���������?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //�� ������� �������� ����� ������, �� ������ � ��������� ����������� ������ �������� ������.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //�������.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //���� �� ������ ������ ������, �������� � ������ ����� � ��������.
};	

// ***************************************************************
//							ToPaladins 				E2
// ***************************************************************
instance DIA_Lothar_ToPaladins (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToPaladins_Condition;
	information	 = 	DIA_Lothar_ToPaladins_Info;
	permanent    =  FALSE;
	description	 = 	"��� ��� ����� �������, ����� �������� ������� ��� � ����?";
};
func int DIA_Lothar_ToPaladins_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToPaladins_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //��� ��� ����� �������, ����� �������� ������� ��� � ����?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //(���������) ���? �� ���� �� ��������� ������ ���������!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //�� ���� �� ���������!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //��� �� ���� ������ ������ � ���, ����� ������ ������� ��������?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //������ �������� �� ������ ���������, ������� ����������� ���������� ������ �������, ���� �������� ����� �����.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //(������) ���� �� ������ ����� ���������, ������� ���� ���� ����� ������ � ��������� ����, ��� �������!
};	

// ***************************************************************
//							WoAndre 				E2
// ***************************************************************
instance DIA_Lothar_WoAndre (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	8;
	condition	 = 	DIA_Lothar_WoAndre_Condition;
	information	 = 	DIA_Lothar_WoAndre_Info;
	permanent    =  FALSE;
	description	 = 	"��� ��� ����� ��������� ��������� ������?";
};
func int DIA_Lothar_WoAndre_Condition ()
{	
	if ( Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE) )
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoAndre_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //��� ��� ����� ��������� ��������� ������?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //����� ����� ����� ����� � �������� � ��������������� ����� ������.
};	

// ***************************************************************
//							Schlafen 				E2
// ***************************************************************
instance DIA_Lothar_Schlafen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	9;
	condition	 = 	DIA_Lothar_Schlafen_Condition;
	information	 = 	DIA_Lothar_Schlafen_Info;
	permanent    =  FALSE;
	description	 = 	"��� � ���� �������� ����?";
};
func int DIA_Lothar_Schlafen_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //��� � ���� �������� ����?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //���� �� ����� ����� ��� �������, ��� � �����, ����������� ����� ���������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //�������� ������ �� ������ ���� ��������, ������� ������� � ���� �����.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //������������� �������� � �������� ������� ����� ������ ���.
};	

// ***************************************************************
//							PERM - VOR OV				
// ***************************************************************
instance DIA_Lothar_PermB4OV (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 3;
	condition	= DIA_Lothar_PermB4OV_Condition;
	information	= DIA_Lothar_PermB4OV_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
func int DIA_Lothar_PermB4OV_Condition ()
{	
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PermB4OV_Info ()
{
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //��� ���� ��������� �� ������ ���������� � ������ �����!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //�berfl�sige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //�� � ������ ��������� � ������ �������!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //��� � �������, �� ������ ���� � ���� ���������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //���... �������, �� �����, ��� ������.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //������� �������� �������� � ������?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //��������� � ����, ����� �� ����.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //����� ���, ����� � ������� ������������ ������? ������ ���������� � ��������!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //������ ���� �����?..
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //��� �� ���� ����!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //��� ���� ��������� ���, �������?!
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //��� ��� ����� ��������� ���������?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //������ � ������ ������ �� ��������!
	
	// ------ NEWS_Modul f�r Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //����� ��.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //��� � ������, �� ������������ � ������ �����?
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //� ������� ����, ��� �� ������ �������������� � ���������, ������ ���� ������� ����������� ������.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //� ������� ����� ������, ��� �� ������� ���������� � ���...
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //�? ��� �� ������?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //�� ������� �� ������ � ����.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //������� ���. �� ������ ��� � ��������?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //����� � �� ������� ����, ����� �� ��������� ����� ���� �����?!

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //� ������, �� ��� ������� ��������� ��������� ��������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //������, �� ����� ��������� �������� ������, ��?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //�� ������ ������������ �������, ��� � ��� ���������!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //���� ����� �� ���������.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //���� � ���� ������������� ���� ���-�� ������, ��� � ����� �����. �� ������� ����!
};


// #########################################
// #########################################
		
// 				Im Oberen Viertel
		
// #########################################
// #########################################


// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_HelloAgain_Condition;
	information	 = 	DIA_Lothar_HelloAgain_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lothar_HelloAgain_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};
func void DIA_Lothar_HelloAgain_Info ()
{
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_00"); //��! ����� ��!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //��� ���� ��� �� ������� �������� ������ � ������� �������!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //��� �� ���� ��� ������?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //� ������ ��������� �����.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //����������. ����� ��, ��� ���������� �����, ����� ���� ����� ������...
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //�� ���� �� ������������� � ��������� �����, ���?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //��� �� ����� ����?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //� ������ ����������� ���� �� ��...
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //��! ���� ����� ������� �� ���������� �� ���.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //���� ����, � ������� �� ������ ������ �������. � ��������� ������ �� ������ ��������� ������ ��� �� ������, ��� ����� ����.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //���� ����� ������� ������ � ���� ���������. �� ������� �� �� �������� ��� ������� - ��� ������ ���������.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //������ ������ ����� ����������� ������� ��������� - ��� ���� ���������� ������ ������!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //���� �������� �� ��, ��� �� ������ ���� ������ ������.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //������ ������ ���������, �� ����� ��������� ������ � ����� ���������.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //�� ���� ����� ��-�������� � ��������.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //� ���� �������� ����� ������� ��������. ��� ��� �������� � ��� � ���������.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //�� ������ ���� �����?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //�������.
};	

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_Hagen_Condition;
	information	 = 	DIA_Lothar_Hagen_Info;
	permanent    =  TRUE;
	description  = 	"��� � ���� ����� ����� ������?";
};
func int DIA_Lothar_Hagen_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //��� � ���� ����� ����� ������?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //�� � ������, � ����� �������� ��������.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //�� ���� �� ������ ��� ��� ������ �� �� �������.
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunning_Condition;
	information	 = 	DIA_Lothar_OWRunning_Info;
	permanent    =  FALSE;
	description  = 	"� ������ ��������� � ������ �������...";
};
func int DIA_Lothar_OWRunning_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) == 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunning_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //� ������ ��������� � ������ �������...
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //�? �� �� ������� ��� ������ ����������� � ��������, ���?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //��, � ������� ���...
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //����� ���, ��� ��� ��������...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //�� ������ ���� ������ ��������������...
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //�� ��� �, ����� �����. (���� ��� ���) ��� �� �������...
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunningBrief_Condition;
	information	 = 	DIA_Lothar_OWRunningBrief_Info;
	permanent    =  FALSE;
	description  = 	"� ���� ���� ��������������! ��� ������ �� ������������ �������!";
};
func int DIA_Lothar_OWRunningBrief_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunningBrief_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //� ���� ���� ��������������! ��� ������ �� ������������ �������!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //��� ������� ������������� ����������?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //� ��� ������������ � ����. � ���� ������ ������ � �������� �� ��� ���������.
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_PERM_Condition;
	information	 = 	DIA_Lothar_PERM_Info;
	permanent    =  TRUE;
	description  = 	"������ ����������� �� ����?";
};
func int DIA_Lothar_PERM_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PERM_Info ()
{
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //������ ����������� �� ���� �� ��������� �����?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //��, ���� ����� ������� ���������� ����� ����. ������ �� ��������� ��� ������ ����.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //�� ������ �������� ���� �� ����. � �������� ����� ��������� ������ � ���� ����������� ������ ������������ � ������ ����� � �������!
	}
	else //KdF oder NOV
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_03"); //���.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lothar_PICKPOCKET (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 900;
	condition	= DIA_Lothar_PICKPOCKET_Condition;
	information	= DIA_Lothar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Lothar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lothar_PICKPOCKET);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_BACK 		,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};
	
func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};





