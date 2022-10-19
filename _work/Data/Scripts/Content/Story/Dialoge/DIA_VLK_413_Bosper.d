// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //����� ���������� � ��� �����, ���������!
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //� ������. � ����� ���� � ������ �������.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //��� ������� ���� � �������?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"������ ������ ���� � ������� �������. ��� ����� ��������� � ��������� �����, � ������ ����� ������.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "��� ����� ������� � ������� �������...";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //��� ����� ������� � ������� �������...
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //��� ����� ��������? ������ �� ����.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //���� ����� ���� ��������� ����������� ���, ���� ��, ����� ��������� ������.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //� ������ ����� ���� �� �� ��� ���� �� �������.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //� ��� �������...
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"����� ������� � ������� �������, � ���� ������ ����� ��������� �����������, ���� �������� ������.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "� ��� ������!";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //� ��� ������!
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //��� - ��� �� ������� �� ����� ������.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //���������, ��� � ���� ���, ������ ���� ������ ���� ���� �����.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //�� ���-������ ������ �� �����, �?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //�����...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //� ��� �� ������� ���� ������� ����� � ��������.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //� ���� ������ ������� ���� �� ������ �����, ��� �� ��������� ���.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //� ���� ���� ���� ��������� ����, ���� �� ��� ���� � ����.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //�����������! ������� ��� ��� �����, ��� ���� ������� ������ - � ����� �� � ���� �� ����� ������� ����.
	};
	
  B_LogEntry (TOPIC_Lehrling,"������ ���� ������ �������. � ���� ������ �������� � ����.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "� ���� ����� ����� ��������!";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //� ���� ����� ����� ��������!

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(����������) �������! ������, �� ��� ������ ������.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //����� �������, ��� �� ������� �������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //�� ����� ���� �� ������ � ����� ������������.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //�� ����� �������, ��� ������� �� ����� ����.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //������ ���� ���� ���� �������������. � �� ��� �������, ��� ��, �� ��� �� ��� ������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //������ ���� ���� ���� ��������� ������ � ������������� �����.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //������ ������� �� �����, ��� �� �����.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //����������� �������, ��� �� ������ ����� �������� ���� ��������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //����������� �������, ��� �� ����������� � ������������ � ������ - �������, ��� �����-������ ������?
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //����������, ����� ���� ������ ��� ������.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //����������� ������� ���� �� ������ � ����.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //������ �������, ��� �� ������ ������� ��, ������� ������ ������ ������ ����.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //������ �������� � �����-�� ������ - � �� ����, ��� �� ����� � ����, �� ���� ����� ���������� � ���.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //������ �������, ��� ��� �� ������� � ����� �� ����.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //������ �������, ��� ������� �� ����� ����.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //��� ��������, ��� �� ������� ��������� ���� ��������!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //�� ������� ��������� ������� ��������. ����� ����������, ����� ���� �������� � �������.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //�� ������ ������ �������� �� ���� ����� ������ ��������.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "������ - � ������� ��� ����.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "� ����� ����� ����� ��������!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //���� ����� �������� ��������� ���� �� ������� ��������. ��� ����� �� �� ������� ����� �������� � ������ ����� ������.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //��� ��������, ��� �� ������ ���������� �� �����, ��� ��� ����������� � ����.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //������ ��� ����� ���� � ����, � ������ ������� ������, ����� �� �� ������ ���� �� ���-��.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //�� ������ ����� ��� ���, �� ��� ������ �� ������� � ����� ������� ��������.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //� ����� ����� ����� ��������!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //�� �� ��������� �� ����! �����, �� �����������.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"������ ������ ���� � �������. ������ � ����� ������� � ������� �������.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //������ - � ������� ��� ����.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //������, �� ����� ���������� �������! �� ����� ����� ��������� ������ ��� ���� ������.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "� ��� ���� � ������ ��������� � ������� � ������� �������?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //� ��� ���� � ������ ��������� � ������� � ������� �������?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(�����������) ����!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //����� � ������ ��� ����� ��������.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //������� ����������� - �������� ����. � ���� �� ���� ������� ��� ������ ����.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //� ��� �������� ������� - ��� �����, ��� �� ������������. ��, ��������, ���� �� ������ ������� ����.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //� ��� ���, ��������, ����� ����� ������. � ����� � ������.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //�� �� �����, ���� �������� �� ������ ����� - ���� ����������� ��������� ���� �������� �� ������ ����� ������...
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "� ������ ���� ������ ������ ������?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //� ������ ���� ������ ������ ������?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //��� �� ������, ��������� ����� ��������� ����� ������� ������.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //���� ���� ��� ������������� ���������, �� ������ �������� ��� �� ���� ���.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //��� ����� ������. ��, ��������, ��������� ���-�� � ������� ��������.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //������ ����� ��������� ������ � ������� � ��������� ����� ����� ���.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "� ������ ���� ��������� �� ������ � ������ ��������?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //� ������ ���� ��������� �� ������ � ������ ��������?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(�������������) � ��������, ��� �� �������� ����.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //�� ���� �� ����� ���...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //��� ��������, ��� �� ������������ �� ����?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //���� ����� ������ �� �������� �� ����� ��������� - �� ��.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //�� ���� ��� �� ������ ����� ��� ���.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //�� �� ���� �� ��������� ����� ������� �������!
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"������ ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(��������) ������! �� �������� ��� ��������� - �� ��� ����� �������.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //��������� �� ����, ���� �� �������.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //����� �������, �� ������� ������, �������� ���� ��� ������� ��� ���.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //� ��� ����� - ����� ��� ���� ��� ����������, ��� �� ���������� �� ����.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //���� �� ���������� �����, ����� ����� ���� ��������, �� �� ����� ��������� � ������ ��������.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "��� �� ������, ����� � ������ ��� ����?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //��� �� ������, ����� � ������ ��� ����?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //� ����� ���� ������� ����� � ��������, � �� ��������� ��� - ������ - ��������� ������� ����.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"������ ����� ������� ���� ������� ����� � ��������.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //������� ��� ��������� ������� ����.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //����� � �����, ��� �� ������ ��� �������.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //���� ������ � ���� �� ����� �� ��� ����� ��������, � ���� ����� ����� � ���������� ���������. � ����� � ������ ���� � ����, ���� �� ��������.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //��� (��������) �� ������� ����� �������� ������� ������� - ���� �� ����� ������������� ������.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"� ������ �������� ������� ����� ������� ����. ����� � ����� ���� �������� �� ����, ���� ������ ��� ��������� �� ������ � ������� ���������.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"� ������ ��������� ��� ������� ���� ������� ����� � ��������.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "������ ������� ����...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //������ ������� ����...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //�� ��� ���� �������� ������� �������. � ���� �������� � ���� ����� �� ������� ����.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //� ������ �� - ���.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //�������! � ����, ��� �� ��������� ��� ���� ������.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //��� ������, ��� � � ������ ����.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //�? ��� �������? ����� ��� �� �����, ��� ������� ��� ������ ���� �������� ��� ��������� ��������� � ������� �������?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"������ ������ ���� � �������, ���� ������ ������� �� ����� ������.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //�� ������������ �� ��������� - �� � ���� ��� ���� �����. ��� � ������ ��� �����.
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "����� ���� ������� ����� � ��������! (5 LP)";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //����� ���� ������� ����� � ��������!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //������. ������. ��� �������� ������.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //������ ������ ��� � ���������� ����� ���������. ����� ������� ��������� ��������� �������� �� ���������� ������� ���, � �������� �����.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //������� ��� ������ �����, � ��� ���������...
			B_LogEntry (TOPIC_BosperWolf,"������ ������ ���� ������� ����� � ��������.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"������ ��� ���� ������.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //������ ��� ���� ������.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //�� ����� �� ��� ����, ����� ������������ ��� ������, �� ������ �������� ��� �����!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //��� ��� ������ �� ����!
	};
};

// **************************************************************
// 						Von Bogen geh�rt
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "� ������, ��� � ���� ���-�� ������.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //� ������, ��� � ���� ���-�� ������.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //��� ������ ���� ���? �������� ������, ��? ��� ���, ������ ������ ���� ������� ����? ��, �����.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //�� ���� � �������� �� ����� �������, ������� ������� ��� �� �������!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //� ��������� �� ����� ����� ����� �� ������. � ����� ��������, � ������ ������, ��� �� ������� - � ���� ����� �� �����.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //� ��� �� ������ ������, �� ���� ������� ������� � ������. � ��� �������� ��� ���!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //� ������� �� ��� ���� ����� �� ���, � ��������� �������� ���� �������� �������. �� ������ �� �����.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //���������!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //����� ����������, ��� ��� ��� ��� ��� ��������� ���-�� � ������. � ��������� �� ������� � ����� ��������� �����, �� ��� �� ������, ����� ���-������ ������� �� ������ � �����.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //����� � �������� �� ����� �������...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"� ������� ��� ������� ���. ��� ������� � ������, � ������� ���. ��������� �������� �������� �������, �� ��� ������ �� �����, ���� ��� ��� ��� ������ ���� � ������.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "� �����, ��� ���� ���...";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //� �����, ��� ���� ���...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //��� ���! ��� �� ����� ���?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //� ������ ����, ������ ����.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //�������, � ���� �� �������� ������� ��-�� �����...
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //��� - ��� ����������� ������ ����� � ������.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //�� - �� ��� �� �������. � ���� �������!
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"��� ���������� � ������?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //��� ���������� � ������?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //���� ���� ������������� ������� ������� �� ���, ����� ������ ������ �������.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //� ������ ����� ������ ���� ������� - � ��� �������� ��������. � �� �����, ��� ��� ���������� ��� ��� �������� �������.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //� ��� ������� ������� ��������� ������?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //���, ������ �� ��� �� �������� ���� ������ ��� �������.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //���� ��� ������� ��������. ���� ������, ����� �����.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //�� ���, ������� � ���������, ��?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //���, � �����-��, ��� �����. ���� �� ��, ������ ����� � ��������, �������� ����� � �� ������. (����������)
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //������, ���� ������� ���������� ������������� �����. ������� ������!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //�� ���� �� �� ������� ����, �����, �� ������� ������ ������� �������...
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //�� ��������� � ���������, ��? �������, ��� ����� ��������� ���� ���� ������, � �� ������� ��������� ��� �����...
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //��� �� �������� ��� �����?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //��� ����� ��� �����. �� ������ ��?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //������, �������...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "��� ������ ������ ������?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //��� ������ ������ ������?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //��� ������. ������� ��� ��� �����, ��� ������� ������.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //� ��� ���� �� ��� ����� ������� ����, ��� ����� ������ �� ������� ���������.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //��, � � ��������� �����, ���� �� ����������� ���������� � ���� �����. � � ���� ��� ������� ����������.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //� ��� � ���� �����?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //� ���� ����� ��� ����� ��� ����. �� �� ������ ������� ��������� ����� � ����� �� �������� �������.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"������ ����� ������� ����� ������� ���� �� ����� ��������.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "� ������ ��������� ���� ��� ����...";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //� ������ ��������� ���� ��� ����...
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //������ �����? �� ���� �� ������ ���� �������� �� ���������, ���?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //� ���� � �� ����� ���������� ����...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //������ ����� ��� ������...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //����� �����? ��� ������� ����� ...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //��, � ���� ����� ��������� - ��� �������� �����.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //� ��� ��� �� �����, ���� ������?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //� ���� �� � ������.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //���... ��� ����� ����� ���������.
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //��� ���� ����� ��������� ������... �� ���, ��������� �� ���?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //����� � ��������� �� ������ �� ���, � �� ������� ����� �����������...
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //� ����� ������� ������, ���� ��!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //�������� ������. ������ �� ��� ���, ����� � ���� ����� �����...
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //��, ������ - ���� ���������� ������ ����� ������, ���������� � �� ��������...
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "� ����, �� �������� ����� ����.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //� ����, �� �������� ����� ����.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //��. � ������ �� ���� �� ����. �� ������ ������� ��, ���� ������.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};








