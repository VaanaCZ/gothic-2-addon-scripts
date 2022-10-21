// *********************************************************
// 			  				EXIT
// *********************************************************
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int Vatras_MORE;

///////////////////////////////////////////////////////////////////////
//	Info KillerWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_KillerWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_KillerWarning_Condition;
	information	 = 	DIA_Addon_Vatras_KillerWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_KillerWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 3)
	&& (MadKillerCount < 7)
	&& (VatrasPissedOffForever == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Vatras_KillerWarning_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //� ������ ��� ����.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //�������, ��� �� ������� � �������� �������� �����.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //���� ��� ���, �� � ������ ������������ ����, �����. 
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //�� ����� �������� ������ ���, ��� � ��������� ������ ���� �������� ����������� � ������������� ����� ���������.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //��� � ���� ������ ����?
};

///////////////////////////////////////////////////////////////////////
//	Info LastWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_LastWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_LastWarning_Condition;
	information	 = 	DIA_Addon_Vatras_LastWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_LastWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 7)
	&& (VatrasPissedOffForever == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_LastWarning_Info ()
{
	B_LastWarningVatras ();
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_06"); //��� �� ������ ������� � ���� ����������?

	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "������.", DIA_Addon_Vatras_LastWarning_Arsch );	 
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "��� ����� ����. � �� �������, ��� �����.", DIA_Addon_Vatras_LastWarning_Reue );	 
};
func void DIA_Addon_Vatras_LastWarning_Arsch ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //������.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //� �� ����� � ����� ������ �� ���� ���������.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //�� �� ���������� ��� ������� ������.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff ();
};

func void DIA_Addon_Vatras_LastWarning_Reue ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //��� ����� ����. � �� �������, ��� �����.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //� ���� �������� �� ���� � ������� �����, ����� ��� ������� ���� ��������.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //���� ����, ���� � ������ ���� �� �� ����� ��������, � �������� �� �������� ����.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};

///////////////////////////////////////////////////////////////////////
//	Info PissedOf
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PissedOff		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_PissedOff_Condition;
	information	 = 	DIA_Addon_Vatras_PissedOff_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_PissedOff_Condition ()
{
	if (MadKillerCount > VatrasMadKillerCount)
	&& (Npc_KnowsInfo (other, DIA_Addon_Vatras_LastWarning))
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PissedOff_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //���� ����� ��� �� �����, ��� � ���� ������.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //�� ����� �� ������ ���������� ��������� ��������.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //�� �� ���������� ��� ������� ������... 
	B_VatrasPissedOff ();
};

// ----------------------------
instance DIA_Vatras_EXIT   (C_INFO)
{
	npc         = VLK_439_Vatras;
	nr          = 999;
	condition   = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Vatras_EXIT_Info()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (Vatras_LaresExit == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_00"); //�������!
		if (Vatras_GehZuLares == TRUE) 
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //���� ������� ������...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //� ����, ����� �� ������ ��� ��������� ������.
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //����������� � ����. ��� �� ������� �������� �� ����� �����.
			Vatras_GehZuLares = TRUE;
		};	
			
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //������� ��� ���� �������� � �����, ��� ��� ����� �������. �� �����, ��� ������.
		CreateInvItems (self, ItMi_Ornament_Addon_Vatras, 1);									
		B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);	
		
		Vatras_LaresExit = TRUE;
	};
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
	
	if (Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine  (VLK_455_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_454_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_428_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_450_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_426_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_421_Valentino,"VATRASAWAY");	
		
		Vatras_SchickeLeuteWeg = FALSE;
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Vatras_PICKPOCKET (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 900;
	condition	= DIA_Vatras_PICKPOCKET_Condition;
	information	= DIA_Vatras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       
func INT DIA_Vatras_PICKPOCKET_Condition()
{
	C_Beklauen (91, 250);
};
func VOID DIA_Vatras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vatras_PICKPOCKET);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_BACK 		,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vatras_PICKPOCKET_DoIt);
};
func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};
func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};



// *********************************************************
// 			  				Hallo
// *********************************************************
instance DIA_Vatras_GREET		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Vatras_GREET_Condition;
	information	 = 	DIA_Vatras_GREET_Info;

	important	 =  TRUE;
};
func int DIA_Vatras_GREET_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GREET_Info ()
{
	AI_Output (self, other, "DIA_Vatras_GREET_05_00"); //�� �������� � ����� ������.
	AI_Output (other, self, "DIA_Vatras_GREET_15_01"); //��� ��?
	AI_Output (self, other, "DIA_Vatras_GREET_05_02"); //� ������, ����� �������, ������ ���������� ������������� � �������.
	AI_Output (self, other, "DIA_Vatras_GREET_05_03"); //��� � ���� ������� ��� ����?
};



// *********************************************************
// 		  				Brief abgeben
// *********************************************************
instance DIA_Addon_Vatras_Cavalorn		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Cavalorn_Condition;
	information	= DIA_Addon_Vatras_Cavalorn_Info;

	description	= "� ���� ��� ���� ������.";
};
func int DIA_Addon_Vatras_Cavalorn_Condition ()
{
	if 	(
			(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon_Sealed) >=1)
			&& (MIS_Addon_Cavalorn_Letter2Vatras == LOG_RUNNING)
		)
		||	(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon)>=1) 
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Cavalorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Cavalorn_15_00"); //� ���� ��� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_01"); //��� ����?
	
	if (SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon,1);
		AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //��, ��... ��� �������. � �������, ��� �� ������ � ����� ����?
	};

	B_UseFakeScroll();
	
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //��. ��� ����� ������ ��������.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //��������� ��� � ���� ������ ��� ������?
	
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "� ������ ��� � ��������.", DIA_Addon_Vatras_Cavalorn_Bandit );

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "� ������� ��� � ���������, ��������.", DIA_Addon_Vatras_Cavalorn_Cavalorn );
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};
func void DIA_Addon_Vatras_Cavalorn_Bandit ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //� ������ ��� � ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //(�����������) � ������! ��� �����. ��� ����� �����.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //���� ��, ��� �� �������� ������, �� � ��� �������� ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //� ������ ��� ����� ������ ����������� � ����.
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};
func void DIA_Addon_Vatras_Cavalorn_Cavalorn ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //� ������� ��� � ���������, ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //(� ����������) ��������? � ��� ��?
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //�� ������ �������� ����, ��� �� �������� � ����� ���������� � ����� �������. ��� �� ��� �� �������.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //� ������, �� �������� ������� ���������. ��� ������� � ���� ������.
	
	B_GivePlayerXP (XP_Addon_CavalornTrust);
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};

// ************************************************************
// 		Cavalorn Sent Me
// ************************************************************
var int Vatras_Why;
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CavalornSentMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_CavalornSentMe_Condition;
	information	= DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent	= FALSE;
	description	= "���� ������� � ���� ��������!";
};
func int DIA_Addon_Vatras_CavalornSentMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	&& (Vatras_Why == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CavalornSentMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_00"); //���� ������� � ���� ��������!
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_01"); //� ��� �� �� ���� ������?
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_02"); //�� ������, ��� �� ����� ������ �����.
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_03"); //(���������) ���... ������, �� ������ �������������� � ���, �����?
};

// ************************************************************
// 		Tell Me About RING 		(Trigger f�r MIS_Waffenh�ndler)
// ************************************************************
instance DIA_Addon_Vatras_TellMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_TellMe_Condition;
	information	= DIA_Addon_Vatras_TellMe_Info;
	permanent	= TRUE;

	description	= "�������� ��� � ������ ����.";
};
func int DIA_Addon_Vatras_TellMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_TellMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_15_00"); //�������� ��� � ������ ����.

	if (!Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_01"); //(���������) � ����� ��� ��� ������?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_02"); //��� ��� �� ���� �� ��������� ������ ������ ����������, � �� ����� ���������� ���� ���.
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_03"); //�� � �������� ���� ��, ��� ���� ����� ��������.
		
		Info_ClearChoices (DIA_Addon_Vatras_TellMe);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "��� ������ �� �����������?", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "� ��� ��������� ���� ����?", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "��� �������� ������ ������ ����?", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};
func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_TellMe);
};
func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //��� ������ �� �����������?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //�� ����� �� ���� ������� ������ � ����� �������.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //���� ���� �� ������ ������� ����, �� ��� ����� �������� ���� ������ ���� ���� ������������� ������ �������.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //������� �� ������������ ������ ���� ���. ��������� ��� ���������� ��� �����. 
	
	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "� ��� ��� ������ ��� ����?", DIA_Addon_Vatras_TellMe_Konkret);
	};
};
func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //(�����) � ��� ��� ������ ��� ����?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //������� ������� ����� �������� ������������� ������ ����������.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //�������, ��������, ����� ��������� �� ���.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //� ���� �� ������ � ���, ��� ������ ������ �������������� � ������������...
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //� ������ ���� ���-��, ��� �������� ��������!
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //�� ������, ��� ������� �������� ���������� �������� �� �������� ������� � ��������. 
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //������ �� �������� ����� ������ �������� �����.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //���� ���-������ ������� �� ����, ��� ��� �����.
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"����� �������� �� �������� ���������� �������� ������. ������ �����, ����� � ����� ��� �� ������ ����."); 
	B_LogEntry (TOPIC_Addon_BanditTrader,"��������� ��������� ������ ����� ���������� ��������� ������. � ���� ����� ��� � ������, ��� �������� ������ ���� ������."); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"������ ���� ���������� ��������� �������� � ��������."); 
};
func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //� ��� ��������� ���� ����?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //��� ��������� ��������� ������� ����������� � ������-������� �� ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //�� �����������, ��� � ���� ������ ����� ���������� ������ � ��� ����� �������, ������� ��� �� �������� �� �����.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"���� ���� ��������� ����� �������� ������� ��������, ������� ��������� �� ������-������� �� ��������. ��������, ��� ��������� ������ � ��������������� ����� �������."); 

	Info_AddChoice (DIA_Addon_Vatras_TellMe, "�������� ��� �� ����.", DIA_Addon_Vatras_TellMe_Unexplored);
};
func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //�������� ��� �� ����.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //���� ������ �������������� � ����������, � ���� �������� � ����� ������, ������� �� �������� ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //�� ������ ����� � ���� ������ � ��� ������, ���� �� ������ ����� �� ���.
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //����������.
	B_LogEntry (TOPIC_Addon_KDW,"������ ��� ��������� ���� �� ������� � ����������, ������ �������, ����� � ������������� � ������ ����."); 
};
func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //��� �������� ������ ������ ����?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //���� �� �� �������� � ���� ��������, � �� ���� �������� ���� �����������.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //�� �� ��������� ��� ���������� � ����.
};

// *********************************************************
// 		  				Wanna JOIN (+ Ex-Segen)
// *********************************************************
instance DIA_Addon_Vatras_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_WannaBeRanger_Condition;
	information	= DIA_Addon_Vatras_WannaBeRanger_Info;

	description	= "� ���� �������������� � �������� ������ ����!";
};
func int DIA_Addon_Vatras_WannaBeRanger_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //� ���� �������������� � �������� ������ ����!
	
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //������? ������ �� ��� �������� ������ ����������.
		AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //��� �� ������ ���� �������?
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //������ ����, ����� ��� ���� ���-��, ��� �������� ����. � ��������� ������ �� �� ������ ������ �� �����.
	};
	
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //�� � ������ ������ �� ���� ��� ���...
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_03"); //Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erz�hle mir was �ber dich.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_04"); //��� �� ������ �����?
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_05"); //��, �� ������ ���������� ���, ������ �� ������ � ����� �� ������ � ���� �����.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_06"); //� ���� ������ ��������� ��� ����� ���������.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_07"); //��� �� ���������?
		
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"������ ������� ...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"����� ���������� ������� ����!",DIA_Vatras_INFLUENCE_FIRST_LIE);
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //���� �� �������������, ���������� �������� �����, ������� ���������. ��� ����� ������������ ��������� ���� ������.
	
	if (Vatras_First == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //���� ��� ������������� ������, ������ �� ����� ����� �������. ��� ������ ���� ���?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //(���������) �������? �� �������� � ���������, ������� �� ���������� ������� ����������� ������ � ��������. ������ �� ������ ���?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"��, � ���-�� ������ �� ����...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"��� ������ �� ���� ��� ������� ...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //����� ���������� ������� ����!
	
	if (Vatras_First == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //(�������) ���. � ��� ������ ���� ���?
	}
	else 
 	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //������� ����, ��... ������ �� ������ ���?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"��, � ���-�� ������ �� ����...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"��� ������ �� ���� ��� ������� ...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = 2;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //��� ������ �� ���� ��� �������. �� ������ ���� ������������ ���������.
	
	if (Vatras_Second == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //� ���� ����� �������� ��� ������� � ��������������� ������� �����. � �� ������ ������?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //���������... ��� �� ���... (���������) � �� ������ ����? � ��� �� �� ����� �����?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"� �������� ����������� � ��� ...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"� ������ ����������� ...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //��, � ���-�� ������ �� ����...
	
	if (Vatras_Second == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //(�����������) �� ���� �� �������, ������ �� ������?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //���. � ������� �� ������� ���� ���� ������ ����. ��� �� ����� ������?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"� �������� ����������� � ���...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"� ������ ����������� ...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = 2;
};
func VOID B_Vatras_INFLUENCE_REPEAT()
{
	//RAUS wegen ADDON
	//AI_Output (other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); //Und, gibst du mir jetzt deinen Segen?	
	
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); //������, ����� ���������:
	
	if (Vatras_Third == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //�� ������ �����������...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //�� �������� ����������� � ���...
	};
	if (Vatras_Second  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //...�������� ������ ��������� �������...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //...������� ������ �����...
	};
	if (Vatras_First  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //...� ���, ��� ������ �������, ����� ��������� ������.
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //...��� ����� ���������� ������� ����.
	};
		
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //� �� ������, ����� �������� ��� ���������...
	if (Vatras_First   == TRUE)
	&& (Vatras_Second  == TRUE)
	&& (Vatras_Third   == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //��� ��� ������ �������� �������������, �� � �� �����, ��� �� ������ ���.
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //������� � �������� ������������, ��� ���� ������ ����������.
		
		AI_Output (self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //� ���� ���� ���� ���� �������������� � ������ ����.
		
		Info_ClearChoices  (DIA_Addon_Vatras_WannaBeRanger);
	}
	else 
	{
		AI_Output (self, other, "DIA_Vatras_Add_05_00"); //��� �������, ��� �� �� ��� �������� ���.
		AI_Output (self, other, "DIA_Vatras_Add_05_01"); //���� �� ����������, ��� � �������� ����-������ � ���, ��� �� ��������� ���, �� ������� ��� ������� ����.
		AI_Output (self, other, "DIA_Vatras_Add_05_02"); //� �������� ������� ��� �������, ������� �������� ���, ��� ���� �����������.
		if (Wld_IsTime(05,05,20,10))
		{
			AI_Output (other, self, "DIA_Vatras_Add_15_03"); //� ��� ������ �����, ������� �����?
			AI_Output (self, other, "DIA_Vatras_Add_05_04"); //��� �������� ������ �������� ����, ��� � ���������� ��. ��� ��� �� ����������.
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_05"); //������ � ������. ��� ��� �� ���������?
		
		//ADDON - SC kann nicht mehr versagen!
		//Vatras_Chance = TRUE; 
		Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"������ ������� ...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"����� ���������� ������� ����!",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
	
	//else-Fall raus - Addon
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); //Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //� ������ ����������� ������� ��������.
	Vatras_Third = TRUE;
	
	B_Vatras_INFLUENCE_REPEAT();
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //� �������� ����������� � ���...
	Vatras_Third = FALSE;
		
	B_Vatras_INFLUENCE_REPEAT();
}; 
// ************************************************************
// 			  			How to JOIN
// ************************************************************
// ------------------------------------------------------------
// Was mu� ich tun?
// ------------------------------------------------------------
instance DIA_Addon_Vatras_HowToJoin	(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_HowToJoin_Condition;
	information	= DIA_Addon_Vatras_HowToJoin_Info;

	description	= "��� � ������ ������?";
};
func int DIA_Addon_Vatras_HowToJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_HowToJoin_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //��� � ������ ������?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //�� ������ ��������, ����� ��������������� ������ �� ����, ������� � ���� ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //�� �� ��������� ���� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //���� ������ �������������� � ��������, �� ������ ��������, ��� ����� ����������� ��� ���� �� ���.
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //��� ��� ������?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //����� ��� ��� ����� ���� ������� � ���� ����, �� ������ ��������� �� ����� ������ ������� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //� ������ ����� ����� �� ������, ����� �� �������� ��� ������� ���� �� ���������� ������� ��� �� ���� �������.
	
	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "� ��� �� ��� ����� �������, ����� ������� ����?", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "� ��������� ������ �����. ������� ������ ���.", DIA_Addon_Vatras_HowToJoin_FreedMen );
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "� ��������� �������. ��� �������, ��� ���������� ������� ������.", DIA_Addon_Vatras_HowToJoin_Sleeper );
};
func void DIA_Addon_Vatras_HowToJoin_Sleeper ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //� ��������� �������. ��� �������, ��� ���������� ������� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //� ��������� ����� � ������ ����� ����������� �������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //������� ������� ��� ����������� �����, �������� �������� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //� �� ������, ����� ��� ���� ��������� ����� ���������, ���� � ����� ������ ��� ���.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //���� ��� ������� �������, �� ��� ������� ������ ������ �� ���� ���� �����.
};
func void DIA_Addon_Vatras_HowToJoin_FreedMen ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //� ��������� ������ �����. ������� ������ ���.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //���� ���� ��� ������������� ���� ������...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //������� ������� � ������ �������� ����� �������� ������������ �� ������ ����� ����, �� � ������ �����������.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //����������� �� ���� ������ ����� � ������������ ��������, ������� �������� ���������.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //������� ��� ��������� �������� ���������� ������ �� ��������� ������. ������ ����������� ���������� ����� �� ������� ������ � ��������� ������� ����� � ����������.
};
func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //� ��� �� ��� ����� �������, ����� ������� ����?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //������� ���������� � ������� ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //����� �����, ��������� ��� �����, ������������� � ������ �������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //���� ������� ��������� ��� ������� �� ������������, �� ������� ��������� ����� ����� ���.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"������ ������ ���� � ������ ���� ������ � ��� ������, ���� � ����� ��������� �����."); 

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //������...
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //��� ���?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //...������� �� ������ ��������� ��������� ���������.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //��� ���� �������������� ��������!
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //�������� � ������ �������.
	
	B_LogEntry (TOPIC_Addon_RingOfWater,"������ �����, ����� � ������� ����� ������ ������ ���������."); 

	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
};
// ------------------------------------------------------------
// Hilf mir bei GILDE!
// ------------------------------------------------------------
instance DIA_Addon_Vatras_GuildBypass (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_GuildBypass_Condition;
	information	= DIA_Addon_Vatras_GuildBypass_Info;

	description	= "�� ���� ����� �� ������ ���� ���������!";
};
func int DIA_Addon_Vatras_GuildBypass_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_GuildBypass_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //�� ���� ����� �� ������ ���� ���������!
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //���, ������, ������ �� �����������. ��� �������, ��� ������� �� ������� ������ ������������ ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //� ������ ���� �����.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //�� ������� ���� �������� ��������� ��� ����� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //�� ������ ���������� � �������, ��� � �������. �� ������� ����.

	B_LogEntry (TOPIC_Addon_RingOfWater,"����� ����������� � ������ �������, � ������ �������� � ���� �� ����������� ��������� ��������."); 
	

	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "��� � �������.", DIA_Addon_Vatras_GuildBypass_BACK );
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "� ����� ���������� � ������ ��������?", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};
func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //��� � �������.
	Vatras_GehZuLares = TRUE;
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
};
func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //� ����� ���������� � ������ ��������?
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //���� ������ ��� ����������, ������� �������� ����������� �������.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //� ������: ��������� ���������, ��������� ����� ���� � ����� ��������� �� ����� ��������������.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //����� �� �����, ��� ���.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //����� ������� ���� ������� ��� ��������� �������. �������� � ���.

	B_LogEntry (TOPIC_Addon_RingOfWater,"� ���� �������������� � ���������, ����� ���� ��� ���������, ������� �� ����� �������� ��������������."); 
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "��� � �������.", DIA_Addon_Vatras_GuildBypass_BACK );
};
// ------------------------------------------------------------
// Ranger NOW 	(MissingPeople ist hier schon Succes!!!)
// ------------------------------------------------------------
instance DIA_Addon_Vatras_NowRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_NowRanger_Condition;
	information	= DIA_Addon_Vatras_NowRanger_Info;
	permanent	= TRUE;

	description	= "� ����� �������� � �������� ������ ����!";
};
func int DIA_Addon_Vatras_NowRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (SC_IsRanger == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_NowRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //� ����� �������� � �������� ������ ����!
	AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //������, �� �������� ��������� ����� ������?
	
	if (Kapitel >= 2) //Pass-Schl�ssel von Hagen
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //��.
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //�� �� �������� ���� � ������ ��������, ����� � ����� ��� �������������� ����� ����!
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //���� ������, ��� ������ ������.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //��� ���� �����, ����� �� ������� ���������. ������ ��� ������, ����������� ������ ��� ����� ����� �������������.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //���� �� �������������...
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //������.
		};
		
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //�� �������, ��� ����� ���. �� ������� ����� �� ��� � ������ ������� �� ����� �������.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //� ������ ���� ��� ������. ����� ��� ������� ���� ����� ����� ��������� � ������ � ���� ������� ������ ��� � ���� ����.
		CreateInvItems (self, ItRi_Ranger_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Addon, 1);		
		if (hero.guild == GIL_KDF)
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //�� ������ ��� ���� ����� ���. � ����� ��� ����� �����.
		};
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //�� ������ ���� ������. � ������ ��� � ����������� �� ������ ��������.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //��� ����� ����� ���� � ������� '������� ������'. ������ ������ ������� ���� � ���� ��������.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //�� ��������� ������ ��� �������. ��� ��������� �� ���� � ����� �����.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //�� ������ ������ ������, ����� ������ ������ ����.
		
		B_LogEntry (TOPIC_Addon_RingOfWater,"� ���� ������ ������ ����. ��� ����� ������ ���� ���� � ������� '������� ������'."); 

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP (XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //���. ���� ���.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //� ����� ������ �������. ����������� � ����. ��� ��������� ����� ������!
	};
};
// ------------------------------------------------------------
// NACH RangerMeeting
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CloseMeeting		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_CloseMeeting_Condition;
	information	= DIA_Addon_Vatras_CloseMeeting_Info;
	description = "������ ������ ������� ���� � ����.";
};
func int DIA_Addon_Vatras_CloseMeeting_Condition ()
{
	if (Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CloseMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //������ ������ ������� ���� � ����.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //������! � ���� ����!
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //� �������� ���� ����� ������, ����� �� ������������� � ��������� ����� ����.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //�� ������ ��������� ������� ������� ������ ������ � ������, � ����� ����� �� �������� ������� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //� �� ��������� ����� � ���������� ����������� � ���������.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //������� ��� ������ ��������. ������ �� ����� ������ ���� �������.
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //����� ������� ���� � ����, ���� �� ��� �� ������� ��������.
	};
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven, 1);									
	B_GiveInvItems (self, other, ItWr_Vatras2Saturas_FindRaven, 1);	
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //�� �������� � ����� ������.
		
	B_LogEntry (TOPIC_Addon_KDW,"������ ��� ��� ������ ��� ��������. � ������ �������������� � ����� ���� � ������ ����� ������, ����� ����� ������� ������� ������ ������."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Sklaven,"� ������ ������, � ����� ����� ����� �������� ������� ��������."); 


	RangerMeetingRunning = LOG_SUCCESS; //Joly:Muss hier stehen!Sonst Chaos mit Rangern! -> Meeting
	B_SchlussMitRangerMeeting ();
	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// 			  			Missing People
// ************************************************************
// ------------------------------------------------------------
// MissingPeople PERM
// ------------------------------------------------------------
var int MISSINGPEOPLEINFO[20];
// ------------------------------------------------------------
instance DIA_Addon_Vatras_MissingPeople (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_MissingPeople_Condition;
	information	= DIA_Addon_Vatras_MissingPeople_Info;
	permanent	= TRUE;
	description	= "������ �����, ��������� ��� �����...";
};
func int DIA_Addon_Vatras_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};
var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;
func void DIA_Addon_Vatras_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //������ �����, ��������� ��� �����...
	AI_Output (self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //��?
	
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice (DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "� ����, ��� ��������� ��������� ����.", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "������� ���������� ���� ��, ��� � ����...", DIA_Addon_Vatras_MissingPeople_Report);
	};
	
	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "��� ��� �� ������?", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};
func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
};
func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //��� ��� �� ������?
	AI_Output (self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //����������� ����� ������� � ������. ���� ������� �������� ���� ������ ������ ���.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"����������� �� ����� ������� � ������������ �����. ����� ����� ������ ������ ������ ���."); 
	
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};
func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //������� ���������� ���� ��, ��� � ����...
	
	 if ((MIS_Akil_BringMissPeopleBack != 0)
	 || (MIS_Bengar_BringMissPeopleBack != 0))
	 &&	(MISSINGPEOPLEINFO[1] == FALSE)
	 {
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //������� ���� �������� ����� �������.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	 };
	
	if ((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //� �����, ��� ��������������� �� ��� ������������ ����� �� ��������.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //������, ������ ������� �������, ��������� ���, ��� ������� ������� ���������� ����� �� ����.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	
	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //� ���� ���-�� ������� ������. � ���� �� �� ����� ����� �� ���� � ���� �����������.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};	
	
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //� ���� ������� �� ��������.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //������� ��������� ������� �� ����� �����.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	
	if ((Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //�����, �������, ���������� ���������, ������ �������������� � ���.
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //�� ���� ���������, ��� �������������� � ��� �� ������ ����.
		};
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};
		
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //������� �������� ����� �������. �� ����� ��������������� �� ��� ��� ���������.
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //� ������������ � ��������� �� �������. ����� �� ������� �� �������� ����� ������.
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //�� ��������� ������ ����. ���� ���������.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //��� �������, �� �� ������ ����. ���������.
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports );
		B_GivePlayerXP (XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //��� �� �����?
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //���� ������ �������.
	};
};
func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //� ����, ��� ��������� ��������� ����.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //��� �� �����?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //������� �� �������� ����� ������� �� � ��������� ����� ��������.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //������ �� ��� ������ � ����?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //� ����� ��� �������. �� ���� �������� ������� �������.
	if (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	{	
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //���.
		B_UseFakeScroll ();
	};
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //�������� ������. � ������, ��� �� ������� �� ������ ������ �� ��� �������.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Vatras_WhereAreMissingPeople);
};
// ------------------------------------------------------------
// Gefangene befreit
// ------------------------------------------------------------
instance DIA_Addon_Vatras_Free (C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Vatras_Free_Condition;
	information	 = 	DIA_Addon_Vatras_Free_Info;
	permanent	 =  FALSE;
	description	 = 	"��������� ���� ��������� � ���� ����.";
};
func int DIA_Addon_Vatras_Free_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Free_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Free_15_00"); //��������� ���� ��������� � ���� ����.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_01"); //������� ������, ��� ���.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_02"); //�� �� ������ ���������� ���� ����. �� ����������� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_03"); //(�������) ������, ���������� ����� �����. ������ ��� ���� � ����� ��� ���� ������������� ����� ����������.
	
	B_RaiseAttribute (other, ATR_MANA_MAX, 3);
	other.attribute[ATR_MANA]	   = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	
	Snd_Play ("Levelup");
	
	// ***Mike** Auskommentiert, weil FALSCHE funktion - bitte R�cksprache, bevor du's wieder �nderst
	//var string concatText;
	//concatText = ConcatStrings (NAME_Bonus_ManaMax,IntToString (4));
	//PrintScreen (concatText, -1,-1,FONT_ScreenSmall,2); 
};

// ************************************************************
// 			  				Waffenh�ndler
// ************************************************************
instance DIA_Addon_Vatras_Waffen (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Waffen_Condition;
	information	= DIA_Addon_Vatras_Waffen_Info;
	permanent 	= TRUE;
	description = "������ ����� �������� �������...";
};
func int DIA_Addon_Vatras_Waffen_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_15_00"); //������ ����� �������� �������...
	
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
	Info_AddChoice (DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if (Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "� ���� ��������, ������� ������� ������ ��������!", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "��� ����� �� ������ ��� ����� ��������?", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};
func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
};
func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //��� ����� �� ������ ��� ����� ��������?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //������ �������, ���������� ���������. �� ������ ���������� ���� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //�� ������ ������� �������� ������� �� ������ ����.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //�� ������� ������� � �������� ������. ����� ������� ���� ������ � ��������� ���������, �� ����: ������ ����������.
		
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //� ���� ��������, ������� ������� ������ ��������!
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //��� ����� ��������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //�������. ������ ���������� ����������� ����, ����� ���������� ���?
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //��. ������ ��������� �� ���, ����� �� ������� ����� �� ������.
		AI_Output	(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //������� ������, ��� ���.

		if (Npc_KnowsInfo (other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //(� ��������) � ������ �� ������� ���� � ������ ����?
			AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //(���������) �� �� �� ���� ��������������, � �� ��� ������.
		};
		
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //�� ������� ���� ���� ������.
		
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //���� ���.
		AI_Output	(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //����� ������� � ��� ����� ������ ����������� � ����. ��� ���������� ���������� ���������� ����������.
	};
};

// ************************************************************
// 			  				Waffenh�ndler
// ************************************************************
instance DIA_Addon_Vatras_WISP (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_WISP_Condition;
	information	= DIA_Addon_Vatras_WISP_Info;

	description = "�� ������ ������ ��� � ���� �������?";
};
func int DIA_Addon_Vatras_WISP_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WISP_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //�� ������ ������ ��� � ���� �������?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //�� ����� ����������� �����. �� � ������������� ���� ���-��� ���� ����, ����� ��������� ���� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //� ��� ���� ���� ������. ���� �� ����������.
	CreateInvItems (self, ItAm_Addon_WispDetector, 1);									
	B_GiveInvItems (self, other, ItAm_Addon_WispDetector, 1);
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //��� ������ ������� �������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //����� ������ ����. ������ ������, ������� ����� � ���� �������, �������� ������� ����������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //�� ����� �������� ���� ������ ��������, ������� ��� ���� �� ��� �� � �� �����.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //����� ������� �������, ������ ������ ������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //���� ������ �������� ���� ���� ��� ����������, ����� ������ � ������ ��� �����, � ������ ��������.
	
	B_LogEntry (TOPIC_Addon_BanditTrader,"������ ��� ��� ������ ������� ����������� �������, ������� ������� ��� � ������� �������� �������."); 
	Log_CreateTopic (TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned); 
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned_NF); 

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //������ ������ ������� ���� ������ ������.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //� ��� ������� �� ������� ������, ������ ������ ������ �������� � ��������.
	};

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //����� ���, � �� ������� �� �������� ����.

	Info_ClearChoices (DIA_Addon_Vatras_WISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "�������! � ����������� ������������ ��.", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "� ��� ��� ����� ������ ������ ������?", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "������ ������ � �������?", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;	
};
func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //�������! � ����������� ������������ ��.
	Info_ClearChoices (DIA_Addon_Vatras_WISP);
};
func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //� ��� ��� ����� ������ ������ ������?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //��� ���, ����� ������ ������? ������ ������, ���� ������ �� ��� �� �������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //��� �������, ������� �����, ��� ������� ��� �����. �� ���� �� ���, � � ������ ������ �� ������������ ������ � ���������.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //��������, �� ������ ���������� ���� ������.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"��� ���������� ������ ����� ������ �� ������ ������ �������� ���. ������� ��� ������ ������ �������� ����� ��� ���� �������."); 
	};
};
func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //������ ������ � �������?
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //������ ������� - ��� ������������ ��������. ��� ��������� ������� �� ���������� �������.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //��� ������� � ���������� ����� ����� ����. ��� ���� �� ����.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //���� �� ��������, ��� �� ������� �� ������ � ���. ��� �������� ������ �����, � ������� ��� ���� ���� �� ������ ����.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //������ ������� ���� �������� ������� �� ����� ������.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //�� ����� �� ����� ������ ���� ���������� ���������. ���� ����� ��������� �� ��� ��������.
};

// ********************************************************
// 			  			  STONEPLATES
// *********************************************************
// ---------------------------------------------------------
// About Stoneplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_Stoneplate (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_Stoneplate_Condition;
	information	= DIA_Addon_Vatras_Stoneplate_Info;

	description	= "� ���� � ����� ���� �������� ��������.";
};

func int DIA_Addon_Vatras_Stoneplate_Condition ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //� ���� � ����� ���� �������� ��������. �� ��� �� �� ��� ���������� � ��� ���-������?
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //��� �������� ������� ��������, ������� �� ����� ���������.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //���������� ��������� �������������� ����� ��������. � ��������� �� ��� ���������� ���������� �� ������� ������� �������.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //���� ���������� ������ ���. ������� ��� ���, ����� ������� �����.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //���� ����� ����� ��������� �������.

	Log_CreateTopic (TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Stoneplates, LogText_Addon_VatrasTrade); 
	
	Log_CreateTopic (TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, LogText_Addon_VatrasTrade);

};
// ---------------------------------------------------------
// Sell Stonplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_SellStonplate		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_SellStonplate_Condition;
	information	= DIA_Addon_Vatras_SellStonplate_Info;
	permanent 	= TRUE;
	description	= "� ������ ���� ��� ��������...";
};
func int DIA_Addon_Vatras_SellStonplate_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_Stoneplate))
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_SellStonplate_Info ()
{
	var int anzahl; anzahl = Npc_HasItems (other, ItWr_StonePlateCommon_Addon);
	
	if (anzahl == 1)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //� ������ ���� ��� ��������...
	}
	else 
	{
		//Fixme Joly --> Hier SC-output "Hier.." oder �hnliche --Mike
	};
	
	B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, anzahl);
		
	AI_Output	(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //�������!
	
	if (anzahl >= 10)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //�� ��� � ������ ���� ���������� �����������!
		B_RaiseAttribute	(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute	(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //���, ������ � ������� ��������� ���������� �������...
		B_GiveInvItems (self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tr�nke
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //���, ������ � ������� ��������� �����...
		B_GiveInvItems (self, other, ItPo_Health_03, anzahl+1);
	};
	
	B_GivePlayerXP (XP_Addon_VatrasStonplate * anzahl);
};

// *********************************************************
// 			  			KLOSTER BYPASS
// *********************************************************
var int Vatras_SentToDaron;
// -----------------------------
instance DIA_Addon_Vatras_GuildHelp		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_GuildHelp_Condition;
	information	 = 	DIA_Addon_Vatras_GuildHelp_Info;

	description	 = 	"����� ������, ��� �� ������ ������ ��� ������� � ��������� ����� ����.";
};

func int DIA_Addon_Vatras_GuildHelp_Condition ()
{
	if (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //����� ������, ��� �� ������ ������ ��� ������� � ��������� ����� ����.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //��� ���� �����? ���� �� ���� ����?
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //��. � ���� ����� ����� ����.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //��������� ��� ��������, ��� � �������� ��������� �����������. ��� ����� ���� ����� ��� ������?

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //��������� ����� ������� ��������� �������, ����� � �������� �� ����. �� ������� ���� � ������.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //����� ��������, ��� ��� ������� ����� �� ���� � ���������.
	};	
	
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //� �� ����� �������� ���� � ���������. � ���-���� ��� ����, ������ ��. �� � ����� ������ ���� ���� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //������� ����� ������� �� �������� �� �������� �������, ������� �������������.
	Vatras_SentToDaron = TRUE;
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //�� � ������, ��� ������ �� ���������� �� ������.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //�� ��������� ��� � ���������, ������� � ���� ������.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //��� ������ ����� ����� ������ ��� ����. ���� �� ������� ������� ���������, �� ����������� �������� ���� � ���������.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //�����, ��� ���� ���� �� �������� � ���� ����, �� ��� ��� ������� �������������� � ���.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //����, �������, �������� ���� ����������.
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"��� ���� ����� ������� ��� ������� � ���������, ���� � ����� ��� ���������� ���������."); 
};


// ************************************************************
// ***														***
//							Gothic II 
// ***														***
// ************************************************************

// ============================================================
// MORE 	(Wegen der alten Schei�e...)
// ============================================================
instance DIA_Vatras_MORE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	998;
	condition	 = 	DIA_Vatras_MORE_Condition;
	information	 = 	DIA_Vatras_MORE_Info;
	permanent    =  TRUE;
	description	 = 	"(���)";
};
func int DIA_Vatras_MORE_Condition ()
{
	if (Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MORE_Info ()
{
	Vatras_MORE = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info INFLUENCE (SEGEN)
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INFLUENCE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	92;
	condition	 = 	DIA_Vatras_INFLUENCE_Condition;
	information	 = 	DIA_Vatras_INFLUENCE_Info;
	permanent    =  FALSE;
	description	 = 	"� ����� ������ �������������.";
};
func int DIA_Vatras_INFLUENCE_Condition ()
{
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	}; 
};
func void DIA_Vatras_INFLUENCE_Info ()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_00"); //� ����� ������ �������������.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_01"); //������ � ������ ���� ���� ��� �������������, ���������?
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_02"); //� ���� ����� �������� ������ �� �������� � ������ ����� ������.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //������ � �������������� �������, ��� ���!
	Snd_Play ("LevelUp");
	B_GivePlayerXP (XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry (TOPIC_Thorben,"��� ���� ������ ����������� ����.");
};

///////////////////////////////////////////////////////////////////////
//	Info WoKdF
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_WoKdF (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  93;
	condition	 = 	DIA_Vatras_WoKdF_Condition;
	information	 = 	DIA_Vatras_WoKdF_Info;
	permanent    =  FALSE;
	description	 = 	"��� ��� ����� ����� ������?";		
};

func int DIA_Vatras_WoKdF_Condition ()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Vatras_Segen == TRUE)
	&& (Vatras_SentToDaron == FALSE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_WoKdF_Info ()
{
	AI_Output (other, self, "DIA_Vatras_WoKdF_15_00"); //��� ��� ����� ����� ������?
	AI_Output (self, other, "DIA_Vatras_WoKdF_05_01"); //�������� �������� ��� �� �������� �������. �� ������� ��� ������������� ���������.
};

///////////////////////////////////////////////////////////////////////
//	Info Spende
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Spende (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  94;
	condition	 = 	DIA_Vatras_Spende_Condition;
	information	 = 	DIA_Vatras_Spende_Info;
	permanent    =  TRUE;
	description	 = 	"� ���� ������� ������������� �������!";
};

func int DIA_Vatras_Spende_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Spende_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Spende_15_00"); //� ���� ������� ������������� �������!
	AI_Output (self, other, "DIA_Vatras_Spende_05_01"); //������������� ������ ������� ������ ����� ������, ������� �� ��� ���������, ��� ���.
	AI_Output (self, other, "DIA_Vatras_Spende_05_02"); //������� �� ������ ������������?
	
	Info_ClearChoices   (DIA_Vatras_Spende);
	Info_AddChoice 		(DIA_Vatras_Spende, "��� ������ ����� ����������...", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "� ���� ���� 50 ������� �����...", DIA_Vatras_Spende_50);
	};
	if (Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "� ���� ���� 100 ������� �����...",	DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output (other, self, "DIA_Vatras_Spende_BACK_15_00"); //��� ������ ����� ����������...
	AI_Output (self, other, "DIA_Vatras_Spende_BACK_05_01"); //��� �� ��������, �� ������ �������� ���� ������ ��������� �����, ��� ���.
	Info_ClearChoices   (DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output (other, self, "DIA_Vatras_Spende_50_15_00"); //� ���� ���� 50 ������� �����...
	AI_Output (self, other, "DIA_Vatras_Spende_50_05_01"); //� ��������� ���� �� ����� �������, ��� ���. ���� ������ ����� ������� �����������.
	B_GiveInvItems (other, self, Itmi_Gold, 50);
	Info_ClearChoices   (DIA_Vatras_Spende);
};
	
func void DIA_Vatras_Spende_100()
{
	AI_Output (other, self, "DIA_Vatras_Spende_100_15_00"); //� ���� ���� 100 ������� �����...
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_01"); //� ������������ ���� �� ����� ������� �� ���� ������������ ���!
	Snd_Play ("LevelUp");
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_02"); //�� ����� ����, �� �������� �� �����, ������������ ��������!
	B_GiveInvItems (other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices   (DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Thorben,"��� ���� ������ ����������� ����.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_CanTeach		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  95;
	condition	 = 	DIA_Vatras_CanTeach_Condition;
	information	 = 	DIA_Vatras_CanTeach_Info;
	permanent    =  FALSE;
	description	 = 	"�� ������ ������� ���� ����-������ �� ������� �����?";
};

func int DIA_Vatras_CanTeach_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_CanTeach_15_00"); //�� ������ ������� ���� ����-������ �� ������� �����?
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_01"); //������ ��������� ������ � ��������� ������� ��������� ������������ ������ ���.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_02"); //�� ������� �������� ����� ����� ������������ ������ ��� ������ �������.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_03"); //� ���� �������� ����, ��� ���������� � ��������� ���� ���������� �����������.
	
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"��� ���� ������ ����� ������ ��� �������� ��� ���������� �����������.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Teach		(C_INFO)
{
	npc		  	 = 	VLK_439_Vatras;
	nr			 = 	100;
	condition	 = 	DIA_Vatras_Teach_Condition;
	information	 = 	DIA_Vatras_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ���� �������� ��� ���������� �����������.";
};
func int DIA_Vatras_Teach_Condition ()
{	
	if (Vatras_TeachMANA == TRUE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Teach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Teach_15_00"); //� ���� �������� ��� ���������� �����������.
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
};
func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output (self, other, "DIA_Vatras_Teach_05_00"); //���� ���������� ������� ����� ������� ������, ����� � ��� ��� �������� ��.
	};
	Info_ClearChoices (DIA_Vatras_TEACH);
};
func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_TEACH_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info GODS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_GODS		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	98;	//Joly: bracuht ne hohe Nummer, denn wird in den sp�teren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_GODS_Condition;
	information	 = 	DIA_Vatras_GODS_Info;
	permanent	 =  TRUE;
	description	 = 	"�������� ��� � �����.";
};

func int DIA_Vatras_GODS_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GODS_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_15_00"); //�������� ��� � �����.
	AI_Output			(self, other, "DIA_Vatras_GODS_05_01"); //��� ������ �� ������ �����?
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK);
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR); 		 
	 		 
};
FUNC VOID DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices (DIA_Vatras_GODS); 
};
FUNC VOID DIA_Vatras_GODS_INNOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_INNOS_15_00"); //�������� ��� �� ������.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //������. (�����������) ����� - ������ � ���������� �� �����. �� ������ ������ � ���.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //�� ���������� ������ � ����� - ��� ����� ������������. �� ���� ����� � ����������.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //��� ����� - ���� ����, � �������� - ��� �����.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR); 	
	
};
FUNC VOID DIA_Vatras_GODS_ADANOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //�������� ��� �� �������.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //������ - ��� ������. �� - ���� ����������, ����� ���������� ����� ������� � ��������.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //�� ���������� ����� ���������. ��� ��� - ���� �� ���� �������, ����� � ������.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //��� ����� - ���� ����. � ���� ����� � ���� �������.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 	
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR); 	

};
FUNC VOID DIA_Vatras_GODS_BELIAR()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //�������� ��� � �������.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //������ - ��� ������ ��� ������, ���������� � ����� ���������������.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //�� ����� ������ ����� � �������, �� ������ ����� �� ������ ������� ����� ����� �����.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //������ �������� ���� ������� ���� �������, ������ �� ������ �������� ���� ����� ������.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR); 			 
	
};
///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HEAL		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	99;	//Joly: bracuht ne hohe Nummer, denn wird in den sp�teren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_HEAL_Condition;
	information	 = 	DIA_Vatras_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"�� ������ �������� ����?";
};

func int DIA_Vatras_HEAL_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HEAL_15_00"); //�� ������ �������� ����?
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_01"); //(������������) ������, ���������� ��� ����. �������� ��� �� ��� � ������ � ���� ���� ����� �����.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_02"); //������ �� �� ���������� � ����� ���������.
	};	
};

// ********************************************************************
// 							Isgaroth Mission
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MISSION		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MISSION_Condition;
	information	= DIA_Vatras_MISSION_Info;
	
	important	= TRUE;
};
func int DIA_Vatras_MISSION_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
func void DIA_Vatras_MISSION_Info ()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_10"); //� ���� ���� ��������� ��� ������� ��������. �� �������� ������� ����� ����������.
	AI_Output (self, other, "DIA_Vatras_MISSION_05_01"); //���� �� ��������� ��� ������� ��� ����, �� ������ ������� ��������������.
	
	Info_ClearChoices   (DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"���� ���!",DIA_Vatras_MISSION_NO);
	Info_AddChoice 		(DIA_Vatras_MISSION,"�������.",DIA_Vatras_MISSION_YES);
};
FUNC VOID B_SayVatrasGo()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_13"); //������. ��� ��� �� � ������� ��������.
};
func VOID DIA_Vatras_MISSION_YES()
{
	AI_Output (other, self, "DIA_Vatras_MISSION_YES_15_00"); //� ������ ���.
	AI_Output (self, other, "DIA_Vatras_Add_05_11"); //������, ����� ������� ��� ��������� � ������ ���� �� ���� ������� � ������������.
	AI_Output (self, other, "DIA_Vatras_Add_05_12"); //� ����� �� ��������� ���������, � ���������� ���� ��������������� �������.
	
	B_GiveInvItems (self, hero, ItWr_VatrasMessage,1); 
	MIS_Vatras_Message = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Botschaft,LOG_RUNNING);
	B_LogEntry (TOPIC_Botschaft,"������ ��� ��� ������� ��� ������� ��������. �� ��������� � ������� ���������� �� ���������.");
	
	Info_ClearChoices 	(DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"� ������ ���������� �����.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice 		(DIA_Vatras_MISSION,"� ������� �������� ����������.",DIA_Vatras_MISSION_HEAL);	
	Info_AddChoice 		(DIA_Vatras_MISSION,"��� ��� ������� ������.",DIA_Vatras_MISSION_ICE);	
};
FUNC VOID DIA_Vatras_MISSION_NO ()
{	
	//AI_Output	(other, self, "DIA_Vatras_MISSION_NO_15_00"); //Such dir einen anderen Laufburschen, alter Mann!
	AI_Output (other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //���� ���!
	AI_Output (self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //��� �������. � �������� ����-������ �������.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_HEAL()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //� ������� �������� ����������.
	 B_SayVatrasGo();
	 
	B_GiveInvItems (self, hero,ItSc_LightHeal ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_ICE()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //��� ��� ������� ������.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Icebolt ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_LIGHT()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //� ������ ���������� �����.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Light ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MESSAGE_SUCCESS		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information	= DIA_Vatras_MESSAGE_SUCCESS_Info;
	
	description	= "� �������� ���� ���������.";
};

func int DIA_Vatras_MESSAGE_SUCCESS_Condition ()
{	
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& (Vatras_Return == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MESSAGE_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //� �������� ���� ���������.
	AI_Output (self, other, "DIA_Vatras_Add_05_14"); //����� ��� �������������. � ���� �������.
	
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	
	Info_ClearChoices (DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 ������� ������",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"������ ����������",DIA_Vatras_MESSAGE_SUCCESS_Ring);	
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 ����� ����",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems (self, hero,ItPl_Perm_Herb ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems (self, hero,ItRi_Dex_01 ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems (self, hero,ItMI_Nugget ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

////////////////////////// Geht weg //////////////////////////////////
const int kurz = 0;
const int lang = 1;

var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg (var int dauer)
{
	// EXIT IF
	
	if (Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	
	//FUNC
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500)
	&& (Npc_WasInState (self, ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP (self);
		
		AI_Output (self, other, "DIA_Vatras_Add_05_06"); //���������� ���� ����! � ����� � ������ �����.
		if (dauer == kurz)
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_07"); //��� �� ������ ����� �������. � ����� � �������, � �������� ��� ��������� ���� �������.
		}
		else //lang
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_08"); //� �� ����, ������� �� �. ���� �� �� ������ ����� ���������, �������� ��� ������� � ��������.
			
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_09"); //�� �������� � ���� ������!
		
		B_TurnToNpc (self, other);
	};
	
	Vatras_SchickeLeuteWeg = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AbloesePre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AbloesePre		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AbloesePre_Condition;
	information	 = 	DIA_Addon_Vatras_AbloesePre_Info;

	description	 = 	"� ���� ��������� � ����� � ������ ������.";
};

func int DIA_Addon_Vatras_AbloesePre_Condition ()
{
	if ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE))
	&& (Kapitel == 3)
	&& (VatrasCanLeaveTown_Kap3 == FALSE)
	&& (RavenIsDead == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Vatras_AbloesePre_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //� ���� ��������� � ����� � ������ ������. � ����� ��������� � ������.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //� ��-�� ����� �������� ��� �������� �������� �����?
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //� �� ����, ��������.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //� ��� ����� ���� ���, ����� ���� �������. ��������� ���� ���� ������ ���� ��� ��������� � �������.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //���� �� �������� ���, ����� ���� �� ���� �� ��� ������ ����, � ����� ������ ����.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"������ �� ����� ������ ��� ������ �������� � '������ ������' ���� �� �������� ��� ������ ���� ����, �������� �������� ��� � ������."); 
};

///////////////////////////////////////////////////////////////////////
//	Info AddonSolved
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AddonSolved		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AddonSolved_Condition;
	information	 = 	DIA_Addon_Vatras_AddonSolved_Info;

	description	 = 	"� ����� ���� �����.";
};

func int DIA_Addon_Vatras_AddonSolved_Condition ()
{
	 if (RavenIsDead == TRUE)
	 {
		return TRUE;
	 };
};

func void DIA_Addon_Vatras_AddonSolved_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //� ����� ���� �����.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //��� ������� ���� � ��������� � ������-��������� �����?
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //���������. ����� �����, ������ ���������.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //��� ����� ������� �������. ����� ���������, ��� ������ ��������� ������ �� ��������.

	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //������ � ���� ������ ����.
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //������� ���� �������� ����� ������, �� ��� ��?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info InnoseyeKaputt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INNOSEYEKAPUTT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information	 = 	DIA_Vatras_INNOSEYEKAPUTT_Info;

	description	 = 	"���� ������ ���������.";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition ()
{
		if 	(	(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)	)
		&& (Kapitel == 3)
		&& (VatrasCanLeaveTown_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info ()
{
	if (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //���� ������� �������.
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //���� ������� �������.
	};

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);

	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //���� ������ ���������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //� ����. � ��� ����� �� ���� �� ������ ����� ����������� ����������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //������ ������������ ���� ������ ����� ����, ����� ���������� ����.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //� �� ������ ��� ����������� ����� �����.

	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "� ���� ������ ������� ���������������� ������.", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten );

	if (hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "������ ������� ������ ���� ������ � ����?", DIA_Vatras_INNOSEYEKAPUTT_warumdu );
	};
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "��� ������ ����� � ������?", DIA_Vatras_INNOSEYEKAPUTT_Auge );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //��� ������ ����� � ������?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //�� ������ ������������ ���. �� ���, �����, ����� ��������� �������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //������ ������� �� ��� �����. �������� ������ ������ ���� �������� �������� ��.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //�� �������� �� � ����. ���� ������ ������� ����������� ������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //�� ����� � ���������. ����, ������, ������ ����, ��� �������� ���.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "��� ��� ����� �������, ���������� �������� ������?", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "��� ����� ������������ ���� �����?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //��� ����� ������������ ���� �����?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //� ���� ������ ���� ������. ���� ���� �������� ������� ������ ���� �������� ������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //������ �������������� ������ ��������� � ����� ����������� ����� ������ ��� ��� �����.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //������ �������� ������� � ���, ��� �� ������ �������� � ��� ����� ������ �������������� ������� �� ���� ����� �����.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //����� ����, ��� ����� ������� ���������� ����� �������� �����. � �����, ���������� �� ����� 3-� ��������.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "��� ����� ���� ����� ����� ������� ��������������� �����?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "��� ��� ����� �������� �����?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //��� ��� ����� �������� �����?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //� ������ � ������ ������� �������, ������� � ����. ����������������, ��� ������� ����� �����.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //�� ����� �� ������ �������� ������� � ������� ������.
	

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //��� ����� ���� ����� ����� ������� ��������������� �����?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //� ���� ������������ ���� ������� �����.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //�������, ������ ��� ����, ��� �� ���������� ������������ �� ������������� ���� ������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //�� ��� �������, ��� �� �������� � ������ ���������� ��������. ��� ������ ���� ���-��, ��� ������� ������ ������.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "������ ������? � ��� ������ ��������?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //������ ������? � ��� ������ ��������?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //�����. ��� ����� ���������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //�� � ����� ���� ������ - ��� �� ��������� ��� ����� � ���� �����.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //����������� ��������� ���� ��������, ����� �� �������, ��� ������ �������� ���� �� ���� � ���������.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "� ������ ����.", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter );
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //��� ��� ����� �������, ���������� �������� ������ �����?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //����������� ������ � ���, ��� ����� ������������� �������������.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //������ ������� ������ ���� ������ � ����?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //� ����������, ��� ���� ��� ������ ���-�� �������� ������ ���� ���������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //������� ������ ������ ���� ����� ���������� � ���������������, ��� ��� ����� ��������� � ������������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //���, ��� ���� ���������������� �� ������ ����� ���� ���� ����������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //� ������ �����, ��� �� �������������� ���������� �� �����������, ������� ������ ������� ���.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //���������� ������, ��� ����� �� ���������, ���� �� � ������ ��� ����������.

};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //� ���� ������ ������� ���������������� ������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //��� ������� ������, �� ���� ���� �� ����� �����.

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //� ������ ����.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //� ���� ������ ������������ � ����, ����� ����������� ��������� � ����� ������.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //����� �������� � �������� ����. � �� ������ �������� �������� �����. � ��������� �� ����.
	
	B_LogEntry (TOPIC_INNOSEYE, "������ ����� �������� ������ � ����� ������, ����� ������������ ����. � ������ ������� �������� � �������� ������� � ��� �������. �����, � ������ ����� �������, ������� ����� �������� ������������ ������ �������.");

	MIS_RitualInnosEyeRepair = LOG_RUNNING;
	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine	(self,"RITUALINNOSEYEREPAIR");

	
	// ------ Zuh�rer weg -------
		B_Vatras_Geheweg (kurz);
	// --------------------------
	
	//Joly: Weg mit den Ritualdementoren!!!!!

	DMT_1201.aivar[AIV_EnemyOverride] = TRUE;	//Joly: Damit sie erstmal nicht die Welt entv�lkern, ohne Zutun des Spielers!!!!!
	DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1203.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1205.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1208.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1211.aivar[AIV_EnemyOverride] = TRUE;

	B_StartOtherRoutine (DMT_1201 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1202 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1203 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1204 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1205 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1206 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1207 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1208 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1209 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1210 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1211 ,"AfterRitual");
};
///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_RitualInnosEyeRepair		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_RitualInnosEyeRepair_Condition;
	information	 = 	DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� ������� ���� � ������ ������?";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_RitualInnosEyeRepair_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_RitualInnosEyeRepair_15_00"); //��� ������� ���� � ������ ������?
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //�����: ������ ������ ��������� � ����� ������ ������ � ��������� � ��������� ����������� ����.
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //� �� ������ �������� ���� � ����������������� �������.
};

///////////////////////////////////////////////////////////////////////
//	Info Beginn
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_BEGINN		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	31;
	condition	 = 	DIA_Vatras_BEGINN_Condition;
	information	 = 	DIA_Vatras_BEGINN_Info;

	description	 = 	"� ������ ���, ��� �� ������ ���.";
};

func int DIA_Vatras_BEGINN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_GetDistToWP(self,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Xardas,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Pyrokar,	"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
		&& (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Vatras_BEGINN_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_00"); //� ������ ���, ��� �� ������ ���. ��� ���������� ����.
	B_GivePlayerXP (XP_RitualInnosEyeRuns);

	B_GiveInvItems 		(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem 	(self, ItMi_InnosEye_Broken_MIS);

	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_01"); //��, ������ ��� ������ ��� ���������� �������.
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_02"); //��� ������ �������� �����?
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_03"); //��, ��. �� ������ 3 ������ �������� �����?
	
	if (B_GiveInvItems (other, self, ItPL_SwampHerb,3))
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_04"); //��. ��. ��� 3 ��������.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_05"); //�����������.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_06"); //���, ���� ���, ���!
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_07"); //������. ����� ��� �������� �������� ��� ���.
	};
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_08"); //�� ������ ���������, �� ������ ������ � �������, ����� �� ����� ������ ���������. �� ����������� ���� ����!
 	
	Info_ClearChoices	(DIA_Vatras_BEGINN);
	Info_AddChoice	(DIA_Vatras_BEGINN, DIALOG_ENDE, DIA_Vatras_BEGINN_los );

};
func void DIA_Vatras_BEGINN_los ()
{
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 	
 	Npc_ExchangeRoutine	(self,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk (self,60);

	RitualInnosEyeRuns = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info augeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_AUGEGEHEILT_Condition;
	information	 = 	DIA_Vatras_AUGEGEHEILT_Info;
	important	 = 	TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition ()
{
	if (Kapitel == 3)
		&& (RitualInnosEyeRuns == LOG_RUNNING)
		&& (Npc_RefuseTalk(self) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Vatras_AUGEGEHEILT_Info ()
{
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //�� ���������. ��� ������� ��������� ���� ����� � ������������ ����.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //����� ������� �������� ����, ��� ������������ ��� �����.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //�������, � ��� ����� ����, ����� �� ��������� ���� ������. ������.
 	
 	B_LogEntry (TOPIC_INNOSEYE, "���� ��� ������������. ������� ������ ��� ���, � ���������� ����� �� ��������.");
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 
 	RitualInnosEyeRuns = LOG_SUCCESS;
 	MIS_RitualInnosEyeRepair = LOG_SUCCESS;	
 
	B_StartOtherRoutine   (Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine   (Xardas, "RitualInnosEyeRepair");
	
	B_StartOtherRoutine  (VLK_455_Buerger,"START");
	B_StartOtherRoutine  (VLK_454_Buerger,"START");
	B_StartOtherRoutine  (VLK_428_Buergerin,"START");
	B_StartOtherRoutine  (VLK_450_Buerger,"START");
	B_StartOtherRoutine  (VLK_426_Buergerin,"START");
	B_StartOtherRoutine  (VLK_421_Valentino,"START");
};



///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_PERMKAP3		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_PERMKAP3_Condition;
	information	 = 	DIA_Vatras_PERMKAP3_Info;

	description	 = 	"�������, ��� ����� ������������ ���� ������.";
};

func int DIA_Vatras_PERMKAP3_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_PERMKAP3_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_PERMKAP3_15_00"); //�������, ��� ����� ������������ ���� ������.
	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_01"); //������ ������ ����� �������������. ����� ������� ��� ���� ���� �������.

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_02"); //�������� � ���������, �� �������� ���, ��� ���� ����� �����.
	};

	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_03"); //�������, ������� ���� ����� ����� � ����������, ��� ���.

};

///////////////////////////////////////////////////////////////////////
//	Info HildaKrank
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HILDAKRANK		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	34;
	condition	 = 	DIA_Vatras_HILDAKRANK_Condition;
	information	 = 	DIA_Vatras_HILDAKRANK_Info;

	description	 = 	"���� �������, ������, ������.";
};

func int DIA_Vatras_HILDAKRANK_Condition ()
{
	if (MIS_HealHilda == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Vatras_GREET))
		{
				return TRUE;
		};
};

func void DIA_Vatras_HILDAKRANK_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //���� �������, ������, ������.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //���? �����? ��� ������ ������� ������ ������ ���������� � ����.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //��� ���� ������� ����, � �� � ���� ������ �� �����. ������, � ��� �� ���������, ������� �������� ���������.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //��, ������, ��� ��� ����� �� �����, �� ��� �� ������� �� ���.
	CreateInvItems (self, ItPo_HealHilda_MIS, 1);									
	B_GiveInvItems (self, other, ItPo_HealHilda_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_OBSESSION		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	35;
	condition	 = 	DIA_Vatras_OBSESSION_Condition;
	information	 = 	DIA_Vatras_OBSESSION_Info;

	description	 = 	"� ������ ���������� �������.";
};

func int DIA_Vatras_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
		{
				return TRUE;
		};
};

func void DIA_Vatras_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_OBSESSION_15_00"); //� ������ ���������� �������.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_01"); //��, � ��������� �� ������. �� ������� ����� ����������� ����������� ������� ������� ������.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_02"); //���, ��� � ���� - ��� �������� ���� ����, �� ������ ��������� ����� �������� ���� ����. �������� � ���������. �� ������� ����.
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 	  				   Ich habe alle Drachen get�tet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_Vatras_AllDragonsDead(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 59;
	condition	= DIA_Vatras_AllDragonsDead_Condition;
	information	= DIA_Vatras_AllDragonsDead_Info;
	description = "������� ������ �� ����� ����� ����.";
};                       
FUNC INT DIA_Vatras_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vatras_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_00"); //������� ������ �� ����� ����� ����.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_01"); //� ����, ��� �� ��������� � ������ �������. ������ ����� ������� ��������� ��� ���� ���� �������.
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_02"); //� ����.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_03"); //����� ����� ���� ���������� ������� � ������� �� ���, ���� ���� ����� ������. � ������ ���� � ����� ���� ������, �������? ������ ������������� ����.
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_KnowWhereEnemy_Condition;
	information	 = 	DIA_Vatras_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"� ����, ��� ��������� ��� ����.";
};
func int DIA_Vatras_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Vatras_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Vatras_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //� ����, ��� ��������� ��� ����.
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //����� �� ����� ������ ������� � ������ ��� � ��� ������, ���� �� ��� �� ������ � ���.
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //�� ������ ������������ ����?
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //� ����� ����� �� ����. ��, � ������� �� ��� ��� ������ � ����� ������, ��� ����.
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                    	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                    	
	B_LogEntry (TOPIC_Crew,"��� ��� �� �������, ������ ��������� ��� ������������ ���� � ���� �����������. �������, ���������� ��� �������� � ������, ����� ��������� ����� �������� ��� ����.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Vatras_KnowWhereEnemy_15_04"); //� ���� ������ � ��� ��� ������� ����� ������. �����, ��� �� �������� ����� ��� ����.
		AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //��� �������� �����. � ���� �����������.
	}
	else 
	{
		Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"��� ����� ��� �������� �� ����.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"� ����� �� �����, ��� �� ������ �� ���� �������.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //� ����� �� �����, ��� �� ������ �� ���� �������. ���������� � ������.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //������ �� ����� ����� ����������. �����, ���� ���, ���� �� �������.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	// ------ Zuh�rer weg -------
	B_Vatras_GeheWeg (lang);
	
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_No_15_00"); //��� ����� ��� �������� �� ����.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_No_05_01"); //��� ������. ����������� �� ���, ���� �����������.

	Vatras_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_LeaveMyShip_Condition;
	information	 = 	DIA_Vatras_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"���� ����� �������� �����. �� ����� ������.";
};
func int DIA_Vatras_LeaveMyShip_Condition ()
{	
	if (Vatras_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //���� ����� �������� �����. �� ����� ������.
	AI_Output			(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //��������, �� ����. � ��� �� � ����� ������������ ����, ���� �� ����� ��������. �� ������ ���.
	
	Vatras_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"PRAY"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_StillNeedYou_Condition;
	information	 = 	DIA_Vatras_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�������� ������ �� ��������� ������.";
};

func int DIA_Vatras_StillNeedYou_Condition ()
{	
	if ((Vatras_IsOnBOard == LOG_OBSOLETE)	
	|| (Vatras_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Vatras_StillNeedYou_15_00"); //�������� ������ �� ��������� ������.
	AI_Output	(self, other, "DIA_Vatras_StillNeedYou_05_01"); //������ �������. �������, �� ������ ��� �� ����������.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);

	// ------ Zuh�rer weg -------
	B_Vatras_GeheWeg (lang);
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition ()
{
	if (VatrasPissedOffForever == TRUE)
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info ()
{
	B_VatrasPissedOff ();
	AI_StopProcessInfos (self);  Vatras_MORE = FALSE;
};


