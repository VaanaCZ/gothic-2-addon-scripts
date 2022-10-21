// ************************************************************
// 			Lares Patch 
// ************************************************************
instance DIA_Addon_Lares_Patch		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 99;
	condition	= DIA_Addon_Lares_Patch_Condition;
	information	= DIA_Addon_Lares_Patch_Info;
	description	= "(�������� - ����������� �������� �����)";
};
func int DIA_Addon_Lares_Patch_Condition ()
{
	if (Npc_HasItems  (self,ItMi_Ornament_Addon_Vatras))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Patch_Info ()
{
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras,1);
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap1_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap1_EXIT_Condition;
	information	= DIA_Lares_Kap1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HaltsMaul
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_HaltsMaul		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_HaltsMaul_Condition;
	information	 = 	DIA_Addon_Lares_HaltsMaul_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_HaltsMaul_Condition ()
{
	if (Lares_HaltsMaul == TRUE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Lares_HaltsMaul_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_HaltsMaul_09_01"); //�������� �����, � ������.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lares_PICKPOCKET (C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 900;
	condition	= DIA_Lares_PICKPOCKET_Condition;
	information	= DIA_Lares_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Lares_PICKPOCKET_Condition()
{
	C_Beklauen (95, 350);
};
 
FUNC VOID DIA_Lares_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lares_PICKPOCKET);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_BACK 			,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
	
func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Lares_HALLO		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Lares_HALLO_Condition;
	information	= DIA_Lares_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE; 
};
func int DIA_Lares_HALLO_Condition ()
{	
	if 	(RangerMeetingRunning == 0)//ADDON
		{
			return TRUE;
		};
};
func void DIA_Lares_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Lares_HALLO_09_00"); //�, ������ ����, ����� � ���! ��� �� ������� �����?
	
	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output (self, other, "DIA_Lares_HALLO_09_01"); //�� ���, ������� ����?
		AI_Output (self, other, "DIA_Lares_HALLO_09_02"); //(�������) ��� ������������ ������ �������� ������ � ��������� �����.
		B_GivePlayerXP (500); //wer's schafft...	
	};
			
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"�� ��� ����������� ������?",DIA_Lares_HALLO_NO);
	Info_AddChoice 		(DIA_Lares_HALLO,"��, �����, ������ �������� ...",DIA_Lares_HALLO_YES);
};
FUNC VOID DIA_Lares_HALLO_NO()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NO_15_00"); //�� ��� ����������� ������?
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_01"); //������, �� ���, �� ������� ����? �� ���� ������ � ����� ������.
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_02"); //�� ������ ��� � �����... ��, �� ������ ������������ ���. �� ������� ��?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"������� ��, � ����� ��!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"��?..",DIA_Lares_HALLO_NOIDEA);
};
FUNC VOID DIA_Lares_HALLO_YES()
{
	AI_Output (other, self, "DIA_Lares_HALLO_YES_15_00"); //��, �����, ������ ��������! � ��� �� ����� ����?
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_01"); //� ���� ��������� �� ������ �������� ������ � �� � ������� �������.
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_02"); //�� ���� ������� ��?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"������� ��, � ����� ��!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"��?..",DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------	
	func void B_Lares_AboutLee()
	{
		AI_Output (self, other, "B_Lares_AboutLee_09_00"); //� �������� �� ������� ������ � ���. ����� ����� ����, ��� ������ ��� ���������.
		AI_Output (self, other, "B_Lares_AboutLee_09_01"); //�� � ��� ����� ������ �� ����� ��������� �����.
		AI_Output (self, other, "B_Lares_AboutLee_09_02"); //�� ����������� � ���� ��������. �� � ������� �������� �����, � ���� ������ �� �� ���.
	};
// ------------------------------	

FUNC VOID DIA_Lares_HALLO_LEE()
{
	AI_Output (other, self, "DIA_Lares_HALLO_LEE_15_00"); //������� ��, � ����� ��!
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};
FUNC VOID DIA_Lares_HALLO_NOIDEA()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //��?..
	AI_Output (self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //����, ������, ������ �������� ��������. �� ��� ������������� ��������� � ����� ������.
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};



// ************************************************************
// ***														***
// 								ADDON
// ***														***
// ************************************************************

// ------------------------------------------------------------
// Vatras schickt mich 
// ------------------------------------------------------------
instance DIA_Addon_Lares_Vatras		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Vatras_Condition;
	information	= DIA_Addon_Lares_Vatras_Info;

	description	= "���� ������ ������.";
};
func int DIA_Addon_Lares_Vatras_Condition ()
{
	if (Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Vatras_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Vatras_15_00"); //���� ������ ������. �� ������, ��� ���� ��� ����������� ������, � ���� ���������� � ����.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_01"); //(���������) ����, �� ��� ��������� � ��������. ������ ����, �� �������� �� ���� �����������.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_02"); //����� �� �� ������ �� ���� ��� ���. �������� ������, ����� ������� ��������� ����.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_03"); //����, ��� ���� �����?
	Lares_RangerHelp = TRUE;

	if (GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine	(Bau_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine	(Greg_NW,"Taverne");
	};
};

// ************************************************************
// 						Ring des Wassers
// ************************************************************
// ------------------------------------------------------------
// WhatAreYouGuys
// ------------------------------------------------------------
instance DIA_Addon_Lares_WhatAreYouGuys		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 6;
	condition	= DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information	= DIA_Addon_Lares_WhatAreYouGuys_Info;

	description	 = 	"��� � ��� �� ���� � ��������?";
};
func int DIA_Addon_Lares_WhatAreYouGuys_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WhatAreYouGuys_Info ()
{	
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_00"); //��� � ��� �� ���� � ��������?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //� �������� � ������ ���� ��������� ����������. ���������?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //��� �� ����������?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //�� �� ��� ��������, � ��� ��������� � ���, ����� ��-�� ������ �������� � ������� � ��� �� ���� �������.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //�� �������� � '������ ����'?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //�� ������ � ���?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //��, ��� ������ ������.
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //��� �, �� ��� ������� �� ���� ������.

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"����� ����������� � '������ ����'." ); 
};
// ------------------------------------------------------------
// Ranger
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ranger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_Ranger_Condition;
	information	= DIA_Addon_Lares_Ranger_Info;

	description	= "�������� ��� � '������ ����'.";
};
func int DIA_Addon_Lares_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_00"); //�������� ��� � '������ ����'.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_01"); //������ ��� ����� ���� - �� �� �����, ��� �������� ��� ����� ����.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_02"); //�� � ������� �� ���������, �� ��������� �����.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_03"); //������ - ��� ������� ������ � ������ � ������ ���, ����������� ��������.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_04"); //�� ���� ������ ������������ �� ���, ��� ����� ��� ������ �������� � �����.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_05"); //������� ���������� �� ����!
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_06"); //�������.
	B_LogEntry (TOPIC_Addon_RingOfWater,"����� �������� ������ ��� ����� ���� - ��� �����, ��� �������� ��� ����� ����. �� �������� ��������� �����. ��� ����� �� ������ ����, � ����� �� ����� ��� �������� ����." ); 
};
// ------------------------------------------------------------
// Info WannaBeRanger
// ------------------------------------------------------------
instance DIA_Addon_Lares_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_WannaBeRanger_Condition;
	information	= DIA_Addon_Lares_WannaBeRanger_Info;

	description	= "� ���� �������������� � ������ ����...";
};
func int DIA_Addon_Lares_WannaBeRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ranger))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_15_00"); //� ���� �������������� � ������ ����...
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //� �� ������. �� ������� � ���, ������ �� �� �������� � ���� ����, ������ ������� ����.
	
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 


	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "�������.", DIA_Addon_Lares_WannaBeRanger_BACK );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "� ��� ��� ������ - ���� ������ ������ ��������?", DIA_Addon_Lares_WannaBeRanger_HowIsIt );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "��� �� ������ ��� ����, ����� ���������� ����������� �� ����� ����?", DIA_Addon_Lares_WannaBeRanger_AboutYou );
};
func void DIA_Addon_Lares_WannaBeRanger_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_BACK_15_00"); //�������.
	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
};
func void DIA_Addon_Lares_WannaBeRanger_AboutYou ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00"); //��� �� ������ ��� ����, ����� ���������� ����������� �� ����� ����?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //� ������� �� ��� �� �����, ���� �� ���� �� ��������.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //(���������) � � ��� ���� ��������� ������ ���� ��� ������������.
};
func void DIA_Addon_Lares_WannaBeRanger_HowIsIt ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //� ��� ��� ������ - ���� ������ ������ ��������?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //�� �� ������ �� ��������� ���������� ��������, � ������� �� ������ ��������������.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //����� �� ����������� ����� �� ���, �� �� ���� ���� ���������, ��������� ������� �� �� �����.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //������������, ��� ��������� �� ���� � ������ ������ - ��������.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //�� ��������� ����� � �� �����, ����� ����������� ����� � ����� ���������.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //�� ����� ��������� �� �����. ��� ��������� �� ������� �� ��������.
};
// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_07"); //����� � ������� ������ ��������� �������� ������ ��������.
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_08"); //������� ����, � �� �������� ���� ����������.
};
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_RingBack_Condition;
	information	 = 	DIA_Addon_Lares_RingBack_Info;

	description	 = 	"� ���� ������ �������� ������ ����.";
};
func int DIA_Addon_Lares_RingBack_Condition ()
{
	if (SC_IsRanger == TRUE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	&& (((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B")<1000) )||((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08")<1000)))
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_RingBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_00"); //� ���� ������ �������� ������ ����.
	
	if (Lares_GotRingBack == FALSE) 
	&& (SC_GotLaresRing == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_01"); //���������. � ���� �������� ������� ���� ������?
		
		if (B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_02"); //�������, ��� ���.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_03"); //�������, ���� ��� �����������. � ���, ��� �� ���� ����� �� ���.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP (XP_Ambient);
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_04"); //��-�... ��� � ���� �� � �����.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_05"); //���������� ������� ��� ��������! ��� ��� �����.
		};
	};

	AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_06"); //��������, ���� ������� �������� �������� ����������? ������ ���� �����������.
	B_Lares_Geheimtreffen();
	
	B_LogEntry (TOPIC_Addon_RingOfWater, "����� ��������� ���� �� ������ ������� ������ ���� � ������� ������."); 
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
};
// ------------------------------------------------------------
// Info RingBack2
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack2		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_RingBack2_Condition;
	information	= DIA_Addon_Lares_RingBack2_Info;

	description	= "��� ���� ������.";
};
func int DIA_Addon_Lares_RingBack2_Condition ()
{
	if (Npc_HasItems (other,ItRi_Ranger_Lares_Addon))
	&& (Lares_GotRingBack == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RingBack2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack2_15_00"); //��� ���� ������.
	B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1);
	AI_Output	(self, other, "DIA_Addon_Lares_RingBack2_09_01"); //������������. � ������, ��� �� ��� �������.
	B_GivePlayerXP (XP_Ambient);
	Lares_GotRingBack = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geduld
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Geduld		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 =  2;
	condition	 = 	DIA_Addon_Lares_Geduld_Condition;
	information	 = 	DIA_Addon_Lares_Geduld_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_Geduld_Condition ()
{
	if (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")>200)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_Geduld_Info ()
{ 
	AI_Output	(self, other, "DIA_Addon_Lares_Geduld_09_01"); //���� �������� ������� ���������. ��� �� ��� ���������.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 						RANGER MEETING
// ************************************************************
instance DIA_Addon_Lares_GetRangerArmor		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_GetRangerArmor_Condition;
	information	= DIA_Addon_Lares_GetRangerArmor_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_GetRangerArmor_Condition ()
{
	if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	&& ((Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")<200))
	&& (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_GetRangerArmor_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //����, ��� ���� ����, �� ��������� �����, ����� ������������� ���� ���������� � �������� ������ ����.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //����, ������� ������ ����� ������������, ����� ������������� �� �����.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //������� ��, ����� �� ��� ����� ��������, ��� ��� ���� ����������.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //��� ����� �������� ��� � ����� ��������� �� ����� ������, ��� � ��� ���� ����������.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //� ������ ����� �� �������� ��� �������.
	CreateInvItem	(hero, ITAR_RANGER_Addon);
	AI_EquipArmor	(hero, ITAR_RANGER_Addon);	
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //���� �� � ���������! �� ������� �� ������� �� � ������ ��� �����-���� ������ ���������� �����.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //�����: ���� ����� ������ ���������� � �����. ����� �� ������ �����, ��� �� �������� ������� ��������. 
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //������� � ������ ���� ���������. ��� ���� ������� �������. ������� ���.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_08"); //������� ����?
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "� ������ ����.", DIA_Addon_Lares_GetRangerArmor_end );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "��� �� ������ ������ ���?", DIA_Addon_Lares_GetRangerArmor_Learn );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "��� ������ ������?", DIA_Addon_Lares_GetRangerArmor_weapons );

};
func void DIA_Addon_Lares_GetRangerArmor_weapons ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_weapons_15_00"); //��� ������ ������?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //������������ ������ ������ �������� ������ - ������ �����, ������ ������ ����� ������������ �� ������, ������� ��� ��������.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //��� ���� �� ����� �������. � ��� � �� ���� �� ��������, �� ����� ���� ���� �� ����������.
	CreateInvItems (self, ItMw_RangerStaff_Addon, 1);									
	B_GiveInvItems (self, other, ItMw_RangerStaff_Addon, 1);		
};
func void DIA_Addon_Lares_GetRangerArmor_end ()
{
	B_MakeRangerReadyToLeaveMeetingALL ();
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //� ������ ����.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //���������, �� �� ����� ���� �����������.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //����������� � ������� � ������� ��� ���� ���� ���� ������ �������.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //������! ������ ����� ��������� � ����� ������.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //��������� �������� ��� ��� ������������. �� ������ ������������� ��� ������.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //�� �������� ������ ���������� ������ ����.
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter );
};
func void DIA_Addon_Lares_GetRangerArmor_weiter () 
{
	AI_StopProcessInfos (self);
	B_RangerMeetingParking ();
	B_LogEntry (TOPIC_Addon_RingOfWater,"�� ������� � ������� ������ � ������� ���� ����� ������ ����. ������ � ������ ����������� � ��������, ������� ���� ��� ��� ������ �������." ); 
};

func void DIA_Addon_Lares_GetRangerArmor_Learn ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //��� �� ������ ������ ���?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //� ���� ������� ���� ����� ������.

	if ((Npc_IsDead(SLD_805_Cord))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //���� ���� ����� �������� ���� ���������� �������� ���, �������� � ������. �� ������ ������.
	};
	if ((Npc_IsDead(BAU_961_Gaan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //���� ������ ���� ��������� ����������� ��������.
	};	
	if ((Npc_IsDead(Mil_350_Addon_Martin))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //������� ���� ��� ���������� ���� � ���������.
	};	
	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //�������� ����� ������� ���� ��������, ��������� ���������� ������� � �������� �� ����.
	};
	if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //� ������ ������ �������� ��� ���� ������ ������� � ������ �������.
	};
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //� �� ����, ��� �������� �����, �� ������ ���������� �� �������.
};



// ************************************************************
// 							Teleporter
// ************************************************************
instance DIA_Addon_Lares_Teleportstation		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_Teleportstation_Condition;
	information	 = 	DIA_Addon_Lares_Teleportstation_Info;

	description	 = 	"���� ���������� ������������ �����������?";
};
func int DIA_Addon_Lares_Teleportstation_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)//SC war schon bei den Wassermagiern
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
	&& (MIS_Lares_BringRangerToMe != 0) 				//hat Aquamarinring von Lares bekommen. -> f�r Orlan
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Teleportstation_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //���� ���������� ������������ �����������?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //���, �� � � ��� ������. ���� ���� ���� ���� �� ������� � �� ����������.
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //� ��� �������� ����� ��������.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //(�������) �� �������! �� �� ������ ������ �� �������, �� ��� ��?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //�� ��� �, ���� ���� �� ������� ��� ������������, ������� ����������� ������ �������� ���� � ��� ������.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //� ��� ������� ���� �� ���������� ����� ����. ������ ��������� ���������� �� ��� �������.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //������ ����� ��������� ��������� ������ � ��� �� ������ �����. �� ������������.
	
	B_LogEntry (TOPIC_Addon_TeleportsNW,"����� ��������� ���, ��� ���������� �� ������� ������ ������� ��������."); 
	Orlan_Hint_Lares = TRUE;
};



// ************************************************************
// 							Ornament
// ************************************************************
// ------------------------------------------------------------
// Ornament von Vatras
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ornament		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_Ornament_Condition;
	information	= DIA_Addon_Lares_Ornament_Info;

	description	= "������ ������ �������� ���� ���� ��������.";
};
func int DIA_Addon_Lares_Ornament_Condition ()
{
	if (Npc_HasItems (other,ItMi_Ornament_Addon_Vatras))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ornament_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Ornament_15_00"); //������ ������ �������� ���� ���� ��������. �� ������, ��� ��� ����� ������� �����.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_01"); //(��������) �� �������! ��� ������, ������ ��������� ���. � ��� � ����.
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_02"); //������ ��� �������� �������� ����� ���-�������, ����� ������ ��� ��������� ����� ����.
};
// ------------------------------------------------------------
// Ornament BringJob
// ------------------------------------------------------------
instance DIA_Addon_Lares_OrnamentBringJob		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_OrnamentBringJob_Condition;
	information	= DIA_Addon_Lares_OrnamentBringJob_Info;

	description = "� ���� ������� ��������!";
};
func int DIA_Addon_Lares_OrnamentBringJob_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_OrnamentBringJob_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //� ���� ������� ��������!
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //(���������) ��-�... ���, ����� � ������� ���� ���. �������, �� ������ ����� �� ����.
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //�� ������ � �� ���� ����. � ������ ��������� �� �������.
	
	B_LogEntry (TOPIC_Addon_KDW,"� ������� ������ �������� �������. �� ����� ������� ��� ����� ���� � ������ ���� ������������ ���."); 
	
	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
};
// ------------------------------------------------------------
// Hol Abl�sung
// ------------------------------------------------------------
instance DIA_Addon_Lares_YourMission		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_YourMission_Condition;
	information	= DIA_Addon_Lares_YourMission_Info;
	permanent 	= TRUE;
	description = "��� ������ �� ����������� � �����?";
};
func int DIA_Addon_Lares_YourMission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Lares_BringRangerToMe == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_YourMission_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_YourMission_15_00"); //��� ������ �� ����������� � �����?
	
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_01"); //� �� ���� ���� �������.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_02"); //������ ���� �����...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_03"); //� ����� ��, ��� ������ �� ���. �������� �������, ������� ���� ��� ���� ����.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_04"); //��������� �� ��������� ����� ���� ��������. ��� ������� ������ �� ������ �������.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_05"); //������� � �������� ����� � �������� �� �������. ���� ���-�� ��� ����������, � ��� ������.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_06"); //�� �� ������ ��� ������.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_07"); //� ��� ���� ���� ������������� ������. ��� ����������, ��� ��� ���������� ����������� � ������ ����.
		
		CreateInvItems (self, ItRi_Ranger_Lares_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;		
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_08"); //���� �� ������ ������ ��� ������, �� ������ �������� ����� ����, ��� �� ���������� �� ����� �����.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_09"); //����� ����-������, ��� ������ ����, ����� � ���� ������� ��������.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_10"); //�� ����� ��������� ������� ���-������ �� �����. �� � �� ����, ��� ������ �����.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_11"); //���� ����� ���������� �� �����, ��� ��� �����. ����� ��� ������� ������ ������������� ������, �� ��� ���� ���������.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_12"); //����� ���, ��� ��� ����� ���-��, ��� ������ ���� � �����.

		B_LogEntry (TOPIC_Addon_RingOfWater,"����� ��� ��� ������������� ������ - ������ ���� ������ ����. ���� � ���� ��� ������, ������ ����� ������ ���� ������ ��� ���������."); 

		Log_CreateTopic (TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BringRangerToLares,"����� ����� �������� ������. � ������ �������� �� �����, ����� ������������� ������, � ����������� ����� ����-��, ��� ������ ����� ������."); 

		MIS_Lares_BringRangerToMe = LOG_RUNNING;
	};
};
// ------------------------------------------------------------
// Baltram Abloese
// ------------------------------------------------------------
instance DIA_Addon_Lares_BaltramAbloese		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_BaltramAbloese_Condition;
	information	 = 	DIA_Addon_Lares_BaltramAbloese_Info;

	description	 = 	"� ������� � ����������.";
};
func int DIA_Addon_Lares_BaltramAbloese_Condition ()
{
	if (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	&& (Baltram_Exchange4Lares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //� ������� � ����������. �� ������ ���� ������.
	AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //����� ������! � ����� ������, �� ����� ������������.
	if (SC_IsRanger == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //��� ������ ���� ������ �������� ����.
		
		if (Npc_KnowsInfo (other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //(���������) �����, ��� ���� ��� �������.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //(���������) ��� �����, �����, �� ������ ����� ����� �� ���...
		};
	};
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};



// ************************************************************
// 						Missing People
// ************************************************************
// ------------------------------------------------------------
// About Missing People
// ------------------------------------------------------------
var int Lares_PeopleMissing_PERM;
// ------------------------------------------------------------
instance DIA_Addon_Lares_PeopleMissing		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 3;
	condition	= DIA_Addon_Lares_PeopleMissing_Condition;
	information	= DIA_Addon_Lares_PeopleMissing_Info;
	permanent 	= TRUE;
	description	= "������ ��������� �����...";
};
func int DIA_Addon_Lares_PeopleMissing_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (Lares_PeopleMissing_PERM == FALSE)
	&& ((SC_IsRanger == FALSE)||(MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_PeopleMissing_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_15_00"); //������ ��������� �����...
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice (DIA_Addon_Lares_PeopleMissing, DIALOG_BACK, DIA_Addon_Lares_PeopleMissing_BACK);
	if (MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "��� ������� ������ ��������� �� ���������� �����.", DIA_Addon_Lares_PeopleMissing_SAVED );
	}
	else if (MIS_Lares_BringRangerToMe != 0)
	&& (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "� ����, ��� ��������� � ���������� ������!", DIA_Addon_Lares_PeopleMissing_Success );
	}
	else
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "����� ���� ����� �� ������ ���������� ���������?", DIA_Addon_Lares_PeopleMissing_MIL );
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "�������� ���, ��� ���� ��������.", DIA_Addon_Lares_PeopleMissing_TellMe );
	};
};
func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_TellMe_15_00"); //�������� ���, ��� ���� ��������.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //������ ������ ������, ���� �� ��������� �������. � ���� ���������� ���� �� ������ �� �������� �� ��������.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //������� �� ��������, ��� ��� ������ � ��� ������ ������ ������� ������� ��������.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //�� ����� ��������� ����� ������ ��������� ������ ����, ��� ��������, ��� � ������ ����������.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_04"); //����� ���� ������ �� �������. ������ �� ��, ��� ��� �������� ������ �����, ���� ���-������ �� ��������� �� �����-������ �����.

		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	SC_HearedAboutMissingPeople = TRUE;
};
func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_MIL_15_00"); //����� ���� ����� �� ������ ���������� ���������?
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_01"); //�� ��� ������, ��������� ����� �������� ����������.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //���� ��������� ���� ������ ������. ���, ��������� ����� �� ����������.
};
func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //� ����, ��� ��������� � ���������� ������!
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //(���������) �������������?
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //�� ������� ������ ������ ����� �����. 
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //�� ������? � ����� ������ �� ������ ���������� ��.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //� ��� ���� �������.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //����� ������. � �� �������, ���� ���� ����������� ��� ������...
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //...�� � ����, ��� ���� �����. ��� �������.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_SAVED ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //��� ������� ������ ��������� �� ���������� �����.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //� ����, ��� �� ����������. ������ � �������-�� ����� �������� ������ ������.
	B_GivePlayerXP (XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};



// ************************************************************
// 								Hilfe
// ************************************************************
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;
// ------------------------------------------------------------
instance DIA_Addon_Lares_RangerHelp		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_RangerHelp_Condition;
	information	= DIA_Addon_Lares_RangerHelp_Info;
	permanent	= TRUE;
	description	= "��� ����� ���� ������.";
};
func int DIA_Addon_Lares_RangerHelp_Condition ()
{
	if 
	(
		   (Lares_RangerHelp == TRUE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	)
	|| (Npc_IsInState (Moe, ZS_Attack))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RangerHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RangerHelp_15_00"); //��� ����� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //��� ������ ���� �����?
	
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice (DIA_Addon_Lares_RangerHelp, DIALOG_BACK, DIA_Addon_Lares_RangerHelp_nix );
	
	if (Npc_IsInState (Moe, ZS_Attack))
	{
		Info_AddChoice (DIA_Addon_Lares_RangerHelp, "���� ������ ��� ���������...", DIA_Addon_Lares_RangerHelp_Moe);
	};
		
	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "��� ����� ������ ������.", DIA_Addon_Lares_RangerHelp_waffe );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "��� ������ ������ �����?", DIA_Addon_Lares_RangerHelp_ruestung );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "��� ����� ������.", DIA_Addon_Lares_RangerHelp_geld );
	};
};
func void DIA_Addon_Lares_RangerHelp_ruestung ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_00"); //��� ������ ������ �����?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_01"); //��-�. ����� ������� ������. �� �� ������ � ���� �� ��� ��� �����.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //�� �� ������ �������� ������� ���������, ����, �������, �� �� ������ ����, ����� ������� �������� �����...
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //��� �� ������ � ����?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //����� � ����� ������ ���� ��������� �������� �����. �� ��� ����������� ��� ������ ���� ������������ ����������.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //����������� �� ����� � ���� � ������ ���������� ���. ��� �������� ���� ������� ���������.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //������, ��� ����� ����� ������ �� ������� ���� ��������� �����...
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //��� ����� ������ ������.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //�����, ��� ��� � ���� ������ �� ����. ������ �� ���� �� ������� �� �����?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_geld ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //��� ����� ������.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //� ���� ��� �� �����? ������, �� � ��� ������������. �������, ��������� ����� ���-��� ��� ������.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_02"); //����������� � ���� � ������ �������, ������� ���� �����. �� ��������� � ����������. ��� ������ ��������� �� ������� ����� � ������� �������� ������.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
func void DIA_Addon_Lares_RangerHelp_nix ()
{
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
// ------------------------------------------------------------
// Moe
// ------------------------------------------------------------
func void DIA_Addon_Lares_RangerHelp_Moe()
{
	AI_Output (other, self, "DIA_Addon_Lares_Moe_15_00"); //���� ������ ��� ���������...
	AI_Output (self, other, "DIA_Addon_Lares_Moe_09_01"); //������, ��� �������...
	Info_ClearChoices (DIA_Addon_Lares_RangerHelp);
	AI_StopProcessInfos (self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Moe, AR_GuardStopsFight, 0);
};



// ************************************************************
// ***														***
// 							Gothic II
// ***														***
// ************************************************************



// ************************************************************
// 			  			Paladine und GILDE
// ************************************************************
// ------------------------------------------------------------
// Paladine
// ------------------------------------------------------------
instance DIA_Lares_Paladine	(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_Paladine_Condition;
	information	 = 	DIA_Lares_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"��� �� ��� �� �� �� ����� ����� ���������� � ����������!";
};
func int DIA_Lares_Paladine_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Lares_Paladine_15_00"); //��� �� ��� �� �� �� ����� ����� ���������� � ����������!
	AI_Output (self, other, "DIA_Lares_Paladine_09_01"); //��� ���� ����� �� ���?
	AI_Output (other, self, "DIA_Lares_Paladine_15_02"); //� ��� ���� ������, ���� ������. � ������ ���������� ���.
	AI_Output (self, other, "DIA_Lares_Paladine_09_03"); //� �� �������, ��� ������� ��� ����? ���� ������� �� ������� � ������� ������� ������.
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		AI_Output (other, self, "DIA_Lares_Paladine_15_04"); //� ���-������ ��������.
		AI_Output (self, other, "DIA_Lares_Paladine_09_05"); //�������, ���� �� ������� �������� �������� ������� ��� ������� ��������� �� ���������� � ���������...
	};
	
	//AI_Output (other, self, "DIA_Lares_Alternative_15_00"); //Hab' ich eine Alternative?
	//AI_Output (self, other, "DIA_Lares_Alternative_09_01"); //Wenn ich du w�re, w�rde ich zu Onars Hof gehen und mit Lee reden.
	//AI_Output (self, other, "DIA_Lares_Alternative_09_02"); //Ich bin mir sicher, wir finden einem Weg, dich ins obere Viertel zu bringen.
};	

// ------------------------------------------------------------
// 			  			Warum Paladine hier?
// ------------------------------------------------------------
instance DIA_Lares_WhyPalHere		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_WhyPalHere_Condition;
	information	 = 	DIA_Lares_WhyPalHere_Info;
	permanent    =  FALSE;
	description	 = 	"�� ������, ����� �������� ������� ����?";
};
func int DIA_Lares_WhyPalHere_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		if (Npc_KnowsInfo (other, DIA_Lares_Paladine))
		|| (RangerHelp_gildeMIL == TRUE)
		|| (RangerHelp_gildeSLD == TRUE)
		|| (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Lares_WhyPalHere_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhyPalHere_15_00"); //�� ������, ����� �������� ������� ����?
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_01"); //����� ����� �� ����� �����... ����������� ������, ��� ��-�� �����, �� ��� �������, ������� ������ � ������.
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_02"); //������ �����, ��� ����� ��������� � ������ �������.
};	

// ------------------------------------------------------------
// 			  			Guild Bypass
// ------------------------------------------------------------
instance DIA_Addon_Lares_Gilde (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Lares_Gilde_Condition;
	information	 = 	DIA_Addon_Lares_Gilde_Info;
	permanent    =  TRUE;
	description	 = 	"������ ������, ��� �� ������ ������ ��� �������������� � ������ �� ���������.";
};
func int DIA_Addon_Lares_Gilde_Condition ()
{	
	if (Lares_RangerHelp == TRUE)
	&& (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Gilde_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_15_00"); //������ ������, ��� �� ������ ������ ��� �������������� � ������ �� ���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_01"); //(�������) ���, ����� ���� ��������� ������� �����?
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_02"); //�����, � ��� �������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_03"); //���� �� ������ �������������� � ��, � ���� ������������ ���� ������� ����� ���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_04"); //������, ��� �� ����� ������ ����� ������� ������ ���������� ���� � ���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_05"); //�� ����� �����, �������, ���� ����� �������� � ���� ���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_06"); //����, ��� �� �������������?
		
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "� ������� ������ �����...", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "����� ����.", DIA_Addon_Lares_Gilde_KDF );
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "���������.", DIA_Addon_Lares_Gilde_SLD );	
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "���������.", DIA_Addon_Lares_Gilde_MIL );
};
func void DIA_Addon_Lares_Gilde_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //��� ����� ��������...
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_SLD ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //� ������, ��� �� ���� ������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //�� ������� ���� �������� ������ ���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //����������� �� ����� ����� � �������� � ������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //�� ������� ����.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //����� ���, ��� �� '��� ���� ������'. �� ���� ������.
	RangerHelp_gildeSLD = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"����� ������, ��� ������� ���� ����� ������� ��� ����� ����� ��������� �����."); 
	
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //(������) � ��� �������, ���� ��� ����������. ������� �� ����������� �������, � �� �� ����� ������� �������� �������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //�������� �������� � ������ ����� ����� �������. �� ��������� - ��� ������� ����.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //�����, �� ������ ���� ������. ��� ����� ������.

	Log_CreateTopic (TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"����� �������, ��� ��������� ������ ����� ������ ��� ������ �������������� � ���������. ������ ������� ����� ����� � ������, ��� �� ���������� ��������� ���������."); 
	
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_KDF ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //����� ����.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //(�������) ������, ������ �� ��������� ���� �����. ����� �� �� �� ������ ���� �� ���.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //���� � ���������� ������� �����.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //���� �� �� ���������, ���� ������ �� ������ � ���������.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //������������, ��� ����� ��� ���� ������, - ��� ��� ������. ��� ��� �������� � ���.

	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"����� ������, ��� ������ ����� ������ ������ ������� � ���������."); 

	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};


// ------------------------------------------------------------
// 			  					About Sld
// ------------------------------------------------------------
var int Lares_WorkForLee;
var int Lares_WayToOnar;
// ------------------------------------------------------------
instance DIA_Lares_AboutSld (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_AboutSld_Condition;
	information	 = 	DIA_Lares_AboutSld_Info;
	permanent    =  TRUE;
	description	 = 	"�������� ��� ��������� � ���������.";
};
func int DIA_Lares_AboutSld_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Lares_WayToOnar == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_AboutSld_Info ()
{
	AI_Output (other,self,  "DIA_ADDON_Lares_AboutSld_15_00"); //�������� ��� � �� � ���������...
	AI_Output (self, other, "DIA_ADDON_Lares_AboutSld_09_01"); //��� �� ������ ������?
	
	Info_ClearChoices (DIA_Lares_AboutSld);
	Info_AddChoice (DIA_Lares_AboutSld, DIALOG_BACK, DIA_Lares_AboutSld_BACK);
	Info_AddChoice (DIA_Lares_AboutSld, "� ������ �� �� � �� � ����������?", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice (DIA_Lares_AboutSld, "�������� ��� ��������� � ���������.", DIA_Lares_AboutSld_Sld);
	Info_AddChoice (DIA_Lares_AboutSld, "��� ��� ����� ����� ���������?", DIA_Lares_AboutSld_WayToOnar); 
};
func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices (DIA_Lares_AboutSld);
};
func void DIA_Lares_AboutSld_Sld()
{	
	AI_Output (other,self,  "DIA_Lares_AboutSld_15_00"); //�������� ��� ��������� � ���������.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_01"); //��, ���� �� ��� �� �����, ��� ��� � ������, �� � ���� �� ������ ���������� ������� � ����.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_02"); //����������� �� ��� ��������� ����������, � ���� �� �� ������� ���� �� �����, �� ������ �� �� ������������.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_03"); //(�������) ���� �� �������� ��������, � ���� �� ����� ������ �������������� � ���...
};	
func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output (other, self, "DIA_Lares_WhyInCity_15_00"); //� ������ �� �� � �� � ����������?
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_01"); //� � ����! ������ � ������ �� �� �����.
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_02"); //����� �������, � �� �������� � ������. �� �� �����, ����� ������� ����� ��� ���.
	//AI_Output (self, other, "DIA_Lares_WhyInCity_09_03"); //Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;
	
	Info_AddChoice (DIA_Lares_AboutSld, "� ����� ������� �� ��������?", DIA_Lares_AboutSld_Schiff);
};
func void DIA_Lares_AboutSld_Schiff()
{	
	AI_Output (other,self , "DIA_Lares_Schiff_15_00"); //� ����� ������� �� ��������?
	AI_Output (self, other, "DIA_Lares_Schiff_09_01"); //�� ����� � ������ �����, �� �������. �� � ����� ��� ����� ����� ����� �������� ������.
	AI_Output (self, other, "DIA_Lares_Schiff_09_02"); //�� ��� ����� ������ ��������� �����...
	AI_Output (other,self , "DIA_Lares_Schiff_15_03"); //������?
	AI_Output (self, other, "DIA_Lares_Schiff_09_04"); //���� ����� �������� �� ���� ��, ���� ��������� ���... � ���� ���� ����.
};
func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output (other,self, "DIA_Lares_WegZumHof_15_00"); //��� ��� ����� ����� ���������?
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //��� �������� ������. �� �������� �� ������ ����� ��������� ������, � ����� �������� �� ������ �� ������.
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //���� ������, � ���� ���� ���������.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_01"); //Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_02"); //Hier im Hafen gibt es zwar f�r gew�hnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht sch�pft ...
	Lares_WayToOnar = TRUE;
};	



// ************************************************************
// 			  			GuildOfThieves
// ************************************************************
// ------------------------------------------------------------
// About Thieves
// ------------------------------------------------------------
instance DIA_Lares_GuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	14;
	condition	 = 	DIA_Lares_GuildOfThieves_Condition;
	information	 = 	DIA_Lares_GuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"�� ������ ���-������ � ��������� ������� �����?";
};
func int DIA_Lares_GuildOfThieves_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Lares_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_GuildOfThieves_15_00"); //�� ������ ���-������ � ��������� ������� �����?
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_01"); //�� � ������� �� �������...
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_02"); //�������, ����� ���� ������� �����. ��� � � ����� ������� ������.
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_03"); //� ������ �����-����� ������� ���, ��������, ���-�� ������ � ����.
};	
// ------------------------------------------------------------
// Wo finden?
// ------------------------------------------------------------
instance DIA_Lares_WhereGuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	15;
	condition	 = 	DIA_Lares_WhereGuildOfThieves_Condition;
	information	 = 	DIA_Lares_WhereGuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"�� ������, ��� ��� ����� ������� �����?";
};
func int DIA_Lares_WhereGuildOfThieves_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GuildOfThieves))
	&& (DG_gefunden == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_WhereGuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //�� ������, ��� ��� ����� ������� �����?
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //(�������) �� ��������, �� ���� ���� �� ����, �� ������ ��.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //��� ���� ������ ����� ������ ��������� �� ����� ����.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //���� �� ����������� ��������� � ����, ���� ����� ���� ������������.
};
// ------------------------------------------------------------
// Meersalz Schl�ssel
// ------------------------------------------------------------
instance DIA_Lares_GotKey (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	16;
	condition	 = 	DIA_Lares_GotKey_Condition;
	information	 = 	DIA_Lares_GotKey_Info;
	permanent    =  FALSE;
	description	 = 	"� ����� ����� ���� ����. �� ���� ������� ������� �����...";
};
func int DIA_Lares_GotKey_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_WhereGuildOfThieves))
	&& (Npc_HasItems (other, ItKe_ThiefGuildKey_MIS))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_GotKey_Info ()
{
	AI_Output (other, self, "DIA_Lares_GotKey_15_00"); //� ����� ����� ���� ����. �� ���� ������� ������� �����...
	AI_Output (self, other, "DIA_Lares_GotKey_09_01"); //�?
	AI_Output (other,self, "DIA_Lares_GotKey_15_02"); //� �����, �� �������� ���� � ������ ��������� �������...
	AI_Output (self, other, "DIA_Lares_GotKey_09_03"); //��, ��� ����� ���� ���� �� �����������.
};
// ------------------------------------------------------------
// Kanalisation
// ------------------------------------------------------------
instance DIA_Lares_Kanalisation (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	17;
	condition	 = 	DIA_Lares_Kanalisation_Condition;
	information	 = 	DIA_Lares_Kanalisation_Info;
	permanent    =  FALSE;
	description	 = 	"��� ��� ����� �����������?";
};
func int DIA_Lares_Kanalisation_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GotKey))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_Kanalisation_Info ()
{
	AI_Output (other,self, "DIA_Lares_Kanalisation_15_00"); //��� ��� ����� �����������?
	AI_Output (self, other, "DIA_Lares_Kanalisation_09_01"); //��������� � ����... ����������� ������ ������� � �����.
};

// ************************************************************
// 		  			Important f�r andere Gilden
// ************************************************************
instance DIA_Lares_OtherGuild (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_OtherGuild_Condition;
	information	 = 	DIA_Lares_OtherGuild_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lares_OtherGuild_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (other.guild != GIL_NONE)
	&& (SC_IsRanger == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Lares_OtherGuild_Info ()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_00"); //������ �� � ���������!
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_01"); //(�������) �� ����� �������� ����� - ������ ��������� � ���������...
		}
		else //GIL_PAL
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_02"); //��� ������ �� ���� �� ��������� ������!
		};
	
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_03"); //(������) ������ �� ��� ���������� �����...
	
		if (Lares_WorkForLee == TRUE)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_04"); //(����������) �� ���� ������ �� ����������, ��� � ������� �� ��, ������?
			AI_Output (other,self , "DIA_Lares_OtherGuild_15_05"); //�� �� ������ ����...
		};
	};
	
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_06"); //� �� �������. �� �������� � ���������? ��� ��� ����?
		AI_Output (other,self , "DIA_Lares_OtherGuild_15_07"); //��-�������.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_08"); //�����������.
	};
		
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	{
		//AI_Output (self, other, "DIA_Lares_OtherGuild_09_09"); //Ich hab geh�rt, du bist aufgenommen worden.
		AI_Output (self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //� ������, ���� ������� � ���� ��������� ��?
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_10"); //����������.
	};
};



// ************************************************************
// ***														***
// 							Die Latscherei
// ***														***
// ************************************************************
instance DIA_Addon_Lares_Forest (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	9;
	condition	 = 	DIA_Addon_Lares_Forest_Condition;
	information	 = 	DIA_Addon_Lares_Forest_Info;

	description	 = 	"�� ������ ��������� ���� ����� ��������� ���?";
};
func int DIA_Addon_Lares_Forest_Condition ()
{	
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //�� ������ ��������� ���� ����� ��������� ���?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //�������. �� ��� ���� ��� �����?
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //�������� ������� ��� ����� ����������� ���������.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //���� �� ��������� �� ���� ��������� ��� ��� � ���� ����.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //�������. ���� ���� ���� ���� ������ ���� �� ������� ������.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //������. ����� �� ������ ����� ������������, �����.

	RangerHelp_OrnamentForest = TRUE;
};


// ------------------------------------------------------------
// Lass uns gehen...
// ------------------------------------------------------------
instance DIA_Lares_GoNow (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_GoNow_Condition;
	information	 = 	DIA_Lares_GoNow_Info;
	permanent    =  TRUE;
	description	 = 	"������, �����.";
};
func int DIA_Lares_GoNow_Condition ()
{	
	if (
		(Lares_WayToOnar == TRUE)
	 	|| (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	 	|| (RangerHelp_OrnamentForest == TRUE)
	 	)
	 	&& ((LaresGuide_ZumPortal == 0)||(LaresGuide_ZumPortal == 8))
	 	&& ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS))
	 	&& ((LaresGuide_OrnamentForest == 0)||(LaresGuide_OrnamentForest == 3))
		&& (Kapitel < 3)
			{
				return TRUE;
			};
};

func void DIA_Lares_GoNow_GoingConditions ()
{	
 	AI_Output (self, other, "DIA_Lares_GoNow_09_01"); //�����... ��� �� ����.
	AI_StopProcessInfos (self);
	
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if (Npc_KnowsInfo (other, DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk (Moe,30);
	};
};

func void DIA_Lares_GoNow_Info ()
{
	AI_Output (other, self, "DIA_Lares_GoNow_15_00"); //������, �����.
	
	if (Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_03"); //� �� ���� ���� ������, ���� �� �� ������ ������ � ��������� ����� ��� ���� ���� ���-������ �� ������.
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) //bleibt am Hafen w�hrend RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
			AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_04"); //����?
			
			
			Info_ClearChoices	(DIA_Lares_GoNow);
			Info_AddChoice	(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte );
		
			if (Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				Info_AddChoice	(DIA_Lares_GoNow, "�� ����� �����.", DIA_Lares_GoNow_Onar );
			};
		
			if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "����� ������ �������� �������.", DIA_Lares_GoNow_Maya );
			};
			
			if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "� ��� �� �������.", DIA_Lares_GoNow_Forest );
			};
	};		
};

func void DIA_Lares_GoNow_Maya ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //����� ������ �������� �������.
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine (self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Onar ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //�� ����� �����.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine (self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Forest ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //� ��� �� �������.
	LaresGuide_OrnamentForest = 1;
	Npc_ExchangeRoutine (self, "GUIDEMEDIUMWALD1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_warte ()
{
	Info_ClearChoices	(DIA_Lares_GoNow);
};

// ************************************************************
// 			  					Angekommen 
// ************************************************************
instance DIA_Lares_GUIDE		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_GUIDE_Condition;
	information	 = 	DIA_Lares_GUIDE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lares_GUIDE_Condition ()
{	
	if (LaresGuide_ZuOnar == TRUE)
	&& Hlp_StrCmp 	 (Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05")
	{
		return TRUE;
	};
};
func void DIA_Lares_GUIDE_Info ()
{
	if Lares_Guide > (Wld_GetDay()-2)
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_00"); //������.
	}
	else
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_01"); //��� �� ���. � � �� ����� ������, ��� ���� �������� �����.
	};
	AI_Output (self, other, "DIA_Lares_GUIDE_09_02"); //��� �, ���������� ����� ���� �� ������� ������ ���. � ��� ����� ������������ � �����...
	AI_Output (self, other, "DIA_Lares_GUIDE_09_03"); //������ ������� �� ���� ������. �� ����� - ����� �������� �� ����, �� ������� ����� � ��� ����� � �������.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZuOnar = LOG_SUCCESS; //Joly: schluss mit Onar guide
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter1		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter1_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11")
	&& (LaresGuide_ZumPortal == 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //������, ����� �� �������� ����� � ��� �� ����� ����������, � ���� ���� ���-��� ����������.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //��������, ������� �� ��� �����, ����� ������� ��������. �� �� ������� ��������, �� ��� ��?
	
	
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "�������.", DIA_Addon_Lares_ArrivedPortalInter1_ja );
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "�������? ��� ��� �����?", DIA_Addon_Lares_ArrivedPortalInter1_wer );

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2 ()
{
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //��, ������ �� ������� ������ ������, ��������� ������� ��������� � ������ ����.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //���� �� ����� �������� ����� ���� �� ����� ���������, ���� ������ ��� ����� � ��� �����.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //����� ������������ ����� � ������, � ����������� ��������� �������� � ������, ������� ������ � ��������.
	B_MakeRangerReadyForMeeting (self);
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //� ����� ������� ������ ���� ���� ������� �� ���. ����� �������� ������ ���� ������ ����� ����� ��� �� ����� � ������.
	
	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //� ��� �� ����� ����� ��������� ��������? ��������� � ����, � ����� ������ �� ����� ����� �� ���������.
		AI_Output (self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //�� ����. �� ���� ���������� ������, � ���� � �� ����, ������� ������ ��� ������ �����������.
	};

	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //�� ��� ����� ����. ����� �� ������� �������� �� ������, �� ������ ���������� ���.
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //�������? ��� ��� �����?
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //�� ��� ������� � ����� ���� � ����� ������ � ������ ��������, ����� ������ ��� �� ��� ��������.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //�� � �� ����� ��������� � ������ ���� ����.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //�������. �� ��� ������������� ����� ���� � ����� ������.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02")
	&& (LaresGuide_ZumPortal == 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00"); //� ��� ����? ������ �� ��������������?
	
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	&& ((Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03")<1000))
	&& ((Npc_IsDead(Erol))==FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //� ����� ����� �������� � ���������.
		AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02"); //�������. � ���������, ������ � ��� ��� �� ���� �������.
	};
	
	LaresGuide_ZumPortal = 3;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14")
	&& (LaresGuide_ZumPortal == 3)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00"); //�� �������� ����.
	LaresGuide_ZumPortal = 4;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58")
	&& (LaresGuide_ZumPortal == 4)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //���� ���� ��������� ��������� � ������. ��� ��� ��������� ������ ����������� �����-�� ����� �� ������-�������. ����� �� �����, ��� ��� �������� ��� �����.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //��� �������� � �������������, �����, ����� ������ � ������ ��� �������.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //��-��� ����� ��������� ������� �������� ��������, ��������� �������, ��� �������� � ��� �����, ��� �� �������� ������.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //���� ���� ����� �������� � ���� ���� � ���������� ��������. � ������ ��� �������� ��������, ������� ����� ���������� ���� �������� ��������.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //�� �� ����� ��� ��� �������.

	LaresGuide_ZumPortal = 5;
	B_LogEntry (TOPIC_Addon_KDW,"����� ��������� ��� � ��������� ����� ����. ���� ���������� �������������� ��������� �������, ������������ � ��������� ����� - �������� ������������� � ��������� ��-��� ����� ���������� �������� �������."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter3
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter3		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) 	
	&& (LaresGuide_ZumPortal == 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00"); //�� ����� ������?
	LaresGuide_ZumPortal = 6;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter4
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter4		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02")
	&& (LaresGuide_ZumPortal == 6)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00"); //����� ������. ����� ����� ���� ������.
	LaresGuide_ZumPortal = 7;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortal		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortal_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortal_Info;
	important	 = 	TRUE;

};
func int DIA_Addon_Lares_ArrivedPortal_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41")
	&& (LaresGuide_ZumPortal == 7)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_ArrivedPortal_Info ()
{
	B_MakeRangerReadyToLeaveMeeting (self);
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //�� �� �����.
 	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //������ ��������. ���� ���� ������ ���� ���-�� �����. ������ �������� ��.
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);					
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //���� ����� �� ��������� �����-������ ����� ������, � �������� �� ������� ����������, ���� � ��������.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //�� � ���� ����������. �� � ��� ����� ������������.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //��, � ��� ����. �� ����� ������� �� ������ � ���� ����������. ����� �� ����������� � ��������.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //�� �������.
	
	B_LogEntry (TOPIC_Addon_KDW,"����� ��� ��� ���� ��������. �� �����, ����� � ������� ��� ���� ���� ��������."); 
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZumPortal = 8; //Joly: schluss mit guide Portal
	
	Lares_Angekommen = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	ALBERN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Albern	(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Albern_Condition;
	information	= DIA_Addon_Lares_Albern_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_Albern_Condition ()
{
	if (Lares_Angekommen == TRUE)
	&& (Npc_GetDistToWP (self, "NW_TROLLAREA_RUINS_41") > 1000)
	&& (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output (self, other, "DIA_Addon_Lares_Albern_09_00"); //(������) �������� ����������! ���������� ������ �������� ��������!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOFORESTPRE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFORESTPRE		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFORESTPRE_Condition;
	information	 = 	DIA_Addon_Lares_GOFORESTPRE_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFORESTPRE_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") 
	&& (LaresGuide_OrnamentForest == 1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_GOFORESTPRE_ja ()
{
	B_MakeRangerReadyForMeeting (self);
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_ja_15_00"); //��.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //���������, ���� ���. � ����� ������, ������ �� ����. ����� ����� ���� �����������.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2; 
};
func void DIA_Addon_Lares_GOFORESTPRE_nein ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //���, ������ ����.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //� ��� �������, �������� �������� ���� �����? �����, �������� �����.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Start");
	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit Guide
};

func void DIA_Addon_Lares_GOFORESTPRE_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_00"); //�� ��� ��� ������ ����� �� ���� � ���?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //�� ��� ������� � ������ � ���? �� ������������� ������ ���� �����������?
 	};
	Info_ClearChoices	(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "���, ������ ����.", DIA_Addon_Lares_GOFORESTPRE_nein );
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "��.", DIA_Addon_Lares_GOFORESTPRE_ja );
};


///////////////////////////////////////////////////////////////////////
//	Info GOFOREST
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFOREST		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFOREST_Condition;
	information	 = 	DIA_Addon_Lares_GOFOREST_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFOREST_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_FOREST_PATH_62") 
	&& (LaresGuide_OrnamentForest == 2)
	&& (Npc_IsDead(Stoneguardian_Ornament))
	{
		if (ORNAMENT_SWITCHED_FOREST == FALSE)
		&& (Npc_IsInState (self,ZS_Talk))
			{
				return TRUE;
			};	
		if (ORNAMENT_SWITCHED_FOREST == TRUE)
			{
				return TRUE;
			};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{	
		B_MakeRangerReadyToLeaveMeeting (self);
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //�� ���. ������ �� ������� ���. � � ����������� �������.
	 	AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine (self,"START");
	 	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit guide Forest!
 	}
 	else
 	{
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //����������! � �� ���� ���������� ����� ������, ��� ����������.
	 	AI_StopProcessInfos (self);
 	};
};

///////////////////////////////////////////////////////////////////////
//	Info PortalInterWEITER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_PortalInterWEITER		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_PortalInterWEITER_Condition;
	information	 = 	DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent	 = 	TRUE;

	description	 = 	"��������� ������.";
};

func int DIA_Addon_Lares_PortalInterWEITER_Condition ()
{
	if (LaresGuide_ZumPortal != 0)
	&& (LaresGuide_ZumPortal != 8)//Joly: schluss mit guide Portal
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info ()
{
	if (LaresGuide_ZumPortal == 4)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_00"); //�������� �������.
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //(�����������) ��, ��.
	};

	AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //��������� ������.
	
	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //������ ������� �����.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //������� �� ��� �������.
	};
		
	AI_StopProcessInfos (self);

	if (LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL2");
	}
	else if	(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL3");
	}
	else if	(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL4");
	}
	else if	(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL5");
	}
	else if	(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL6");
	}
	else if	(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPELEND");
	};
};

// ************************************************************
// 			  				  LEHRER
// ************************************************************
// ------------------------------------------------------------
// Wanna Learn
// ------------------------------------------------------------
instance DIA_Lares_DEX		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_DEX_Condition;
	information	 = 	DIA_Lares_DEX_Info;
	permanent 	 =  FALSE;
	description	 = 	"�� ������ ������� ���� ����-������?";
};
func int DIA_Lares_DEX_Condition ()
{	
	return TRUE;
};
func void DIA_Lares_DEX_Info ()
{
	AI_Output (other, self, "DIA_Lares_DEX_15_00"); //�� ������ ������� ���� ����-������?
	AI_Output (self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //�������. � ���� ������ ���� ����� ����� ������� � ������.

	Lares_TeachDEX = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"����� ����� ������ ��� �������� ��� �������� � ����.");
};
// ------------------------------------------------------------
// 			  				   TEACH 
// ------------------------------------------------------------
var int Lares_MerkeDEX;
var int Lares_MerkeSTR;
//-----------------------------------
instance DIA_Lares_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_TEACH_Condition;
	information	 = 	DIA_Lares_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"�������� ����.";
};
func int DIA_Lares_TEACH_Condition ()
{	
	if (Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lares_TEACH_Info ()
{
	//AI_Output (other, self, "DIA_Lares_TEACH_15_00"); //Ich will geschickter werden!
	AI_Output (other,self ,"DIA_Addon_Lares_Teach_15_00"); //�������� ����.
	
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output (self, other, "DIA_Lares_TEACH_BACK_09_00"); //�� ��� ���� ����� ������.
	};
	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //(����������) ����� ������. �� ���� �������.
	};
	
	Info_ClearChoices (DIA_Lares_TEACH);
};
func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};


//#################################
//##
//##	Kapitel 2
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap2_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap2_EXIT_Condition;
	information	= DIA_Lares_Kap2_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#################################
//##
//##	Kapitel 3
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap3_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap3_EXIT_Condition;
	information	= DIA_Lares_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		Gibt's was Neues?			 
// ************************************************************
INSTANCE DIA_Lares_AnyNews(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 5;
	condition	= DIA_Lares_AnyNews_Condition;
	information	= DIA_Lares_AnyNews_Info;
	permanent	= TRUE;
	description = "���� �������?";
};                       
FUNC INT DIA_Lares_AnyNews_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lares_AnyNews_15_00"); //���� �������?
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_01"); //�������� ������� ������� � �����. ������� ���������, � �� ������������ �� �����.
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_02"); //��� � ����, � �����, �� ����� ������������� ���� �����.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_03"); //����� ������� � ���. �������� ���������� �������, ������ �������.
		
		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_04"); //� ������. �������� ��� ����.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_05"); //��, �� ��� ��� ���������.
		}
		else
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_06"); //��� ��� ���������?
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_07"); //������ ������ � ����� �� ���������. �� ��������� ��� ���� �� �������.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_08"); //���� ������ ������ ������, ��������� �������, �� ��� � ������ ������ � ��������.
			
			MIS_RescueBennet = LOG_RUNNING;
		};
	};
};

// ************************************************************
// 		Hast du was von Bennet geh�rt?			 
// ************************************************************
INSTANCE DIA_Lares_NewsAboutBennet(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_NewsAboutBennet_Condition;
	information	= DIA_Lares_NewsAboutBennet_Info;
	permanent	= FALSE;
	description = "���� ������� � �������?";
};                       
FUNC INT DIA_Lares_NewsAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_NewsAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_00"); //���� ������� � �������?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_01"); //��� ����� � ������� � ������� ��� �� �������.
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_02"); //��� ��� ��������� ��� ������?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_03"); //���� � ���� ��� ������� ����. � �� ���� ���������� � ��� ������ � ���������� � ���.
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_04"); //���, ��� ��� �������� - ��� ������� ���� �� �������, �����, ��� ������� ���-�� ������.
};

//#################################
//##
//##	Kapitel 4
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap4_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap4_EXIT_Condition;
	information	= DIA_Lares_Kap4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************
//	Wieso bist du nicht auf Drachenjagd?
//****************************************

INSTANCE DIA_Lares_Kap4_PERM(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_Kap4_PERM_Condition;
	information	= DIA_Lares_Kap4_PERM_Info;
	permanent	= TRUE;
	description = "������ �� �� ��������� �� ��������?";
};                       
FUNC INT DIA_Lares_Kap4_PERM_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lares_Kap4_PERM_15_00"); //������ �� �� ��������� �� ��������?
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_01"); //��� �� �� ���. ����� ���� ���������� ������.
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_02"); //��� ��, �������. ������ ������� ������ - ��� ���, ��� ��� ������ �����.
};

//#################################
//##
//##	Kapitel 5
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap5_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap5_EXIT_Condition;
	information	= DIA_Lares_Kap5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************
//	Lares anheuern
//****************************************************************

///////////////////////////////////////////////////////////////////////
//	Hast du Lust diese Insel zu verlassen?
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lares_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�� �� ������ �������� ���� ������?";
};
func int DIA_Lares_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lares_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //�� �� ������ �������� ���� ������?
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //��� ����� ������� ��� �������. � ��� �� �������?
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //� �������, ��� ���������� ���������� ��������. �� �� �������, �������� ������.
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //� ��������� ���������� �� ���� ��� � ��������.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //������ ���������. ���� � ���� �����, �� ������ �� ���� ������������.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //���� �� ����� ������� �������� ��� ��� ���������� ������� � ����� �����������?
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lares_KnowWhereEnemy_15_06"); //������� ��� �����, �� � ������� � ����, ���� ���-�� ���������.
	}
	else 
	{
		Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"�� �� ����� ���.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"� ����, ��� ���� ���������� �� ����.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lares_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_00"); //� ����, ��� ���� ���������� �� ����.
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_01"); //���������� � �������.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02"); //�� ������� �������� - ��� ��� ��������. �������� �����.
	
	Lares_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};

FUNC VOID DIA_Lares_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_No_15_00"); //� ���� ���� �����������, �� �������� �������� ����.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_No_09_01"); //�� ������ ������, ��� �� ������. ���� �������� ��������� � ����� �������, �� ������, ��� ���� �����.

	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};	
	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_LeaveMyShip_Condition;
	information	 = 	DIA_Lares_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"����� �����, ���� �� �� ��������� �� ����.";
};
func int DIA_Lares_LeaveMyShip_Condition ()
{	
	if (Lares_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lares_LeaveMyShip_15_00"); //����� �����, ���� �� �� ��������� �� ����.
	AI_Output			(self, other, "DIA_Lares_LeaveMyShip_09_01"); //��� ������, �� � ������� �����, ��� �� �������� � ����.
	
	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_StillNeedYou_Condition;
	information	 = 	DIA_Lares_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�� ��� ��� ������������� � ����� �� �������?";
};
func int DIA_Lares_StillNeedYou_Condition ()
{	
	if ((Lares_IsOnBOard == LOG_OBSOLETE)		
	|| (Lares_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lares_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lares_StillNeedYou_15_00"); //�� ��� ��� ������������� � ����� �� �������?
	
	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_01"); //������ � �� �������� ����� ��� ���������� �� ����, �� ��� ��� �� - ���� �� ���, �� ���� ��� � ���� �����.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_02"); //���������� �� �������.
		
		Lares_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_03"); //�� ��������, �� � �����, �� ��� ����.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_04"); //��� ����� �������� �����.
		
		AI_StopProcessInfos (self);
	};	
};


























