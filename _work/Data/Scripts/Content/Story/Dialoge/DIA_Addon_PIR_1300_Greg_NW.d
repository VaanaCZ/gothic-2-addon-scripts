// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_NW_EXIT(C_INFO)
{
	npc			= PIR_1300_Addon_Greg_NW;
	nr			= 999;
	condition	= DIA_Addon_Greg_NW_EXIT_Condition;
	information	= DIA_Addon_Greg_NW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_NW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	PlayerTalkedToGregNW	= TRUE;
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//1. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info HalloW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Greg_NW_Hallo_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_Hallo_Condition ()
{
	if (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Hallo_Info ()
{

	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_00"); //���! ��, ��! �������-�� ����.
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Hallo_15_01"); //� ��� ����?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_02"); //�� ����� � �����? � ���� ��� ����?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_03"); //��������, �� ��������� ��������������� ������. ������, �� � ����� ������ �������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_04"); //�� �� �����, � ���� ��� �� ����� ������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_05"); //��������� �� ������ ���������� ��������� ������� �����, �� ��� ��?

	PlayerTalkedToGregNW	= TRUE;
	SC_MeetsGregTime = 1; //Joly: erste Mal getroffen.

	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "� ������ ����.", DIA_Addon_Greg_NW_Hallo_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "�������� �������. ������, ���� �� ������.", DIA_Addon_Greg_NW_Hallo_schleim );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "�� ������, ����� � ���� �������� ������.", DIA_Addon_Greg_NW_Hallo_vorsicht );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "�� �� ����-�� ���������?", DIA_Addon_Greg_NW_Hallo_hide );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "������ �� � ���?", DIA_Addon_Greg_NW_Hallo_ja );

};

func void DIA_Addon_Greg_NW_Hallo_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_weg_15_00"); //��� ���� ����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_weg_01_01"); //����, �� ������������� ��� ��������, �����? ������, � ��� �������. �� ��� ����������!

	AI_StopProcessInfos (self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_ja_15_00"); //������ �� � ���?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_01"); //�� ������ �������� ��������������� ������� ������! � ����� � ����� ����� � �� ���� ������� �������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_02"); //������� ��� �������� �� ����� ����� ��������, ��� ��������� ��������� � ���� ������ ������� ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_03"); //� ��� ������ ��� ����� ������� � �����, � � �� ����, ��� ��� �������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_04"); //� ������ � ���� ����������� ������ ����. ��� ������ �� �������� �������� ���� �� ����!
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_05"); //�� �� �������� ��� ������ ���� ����������, ������?
	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	
	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"�������� ������� � �������� �� ����� �����, ����� � ����� ��� ������� � �����. � ������ ����� ��� ���� ������ ������ ���� ����������."); 
	
	MIS_Addon_Greg_BringMeToTheCity = LOG_RUNNING;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_vorsicht_15_00"); //�� ������, ����� � ���� �������� ������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_01"); //��, �������, � �� ��������, ������� ����, � ������ ������ ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_02"); //�� �� �� �� ���������� ��������� ���� ��������� �� ��������� �����, ������� � ��� �� ���� ����?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_03"); //��, ��� �������? � ���� �� ���� ������������?

};

func void DIA_Addon_Greg_NW_Hallo_schleim ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_schleim_15_00"); //�������� �������. ������, ���� �� ������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_01"); //��� ������, ��� ������ ��, ��� � ���� � ����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_02"); //���� �������� ����� ������ ���� �� ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_03"); //� ����, ��� ���� ���� � ��������� ������� ���������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_04"); //� �� ��������� ���� ������� ������� �� ��������� �� ���������� ��������������?
};

func void DIA_Addon_Greg_NW_Hallo_hide ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_hide_15_00"); //�� �� ����-�� ���������?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_01"); //���, ������� ���! ��� �� ������?! ��� ������ �������� ������ ����� �������� - ��� ��� ����� �� ���� � ����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_02"); //�� ����� ����� ��������� � ����. �� ������ ������?
};

///////////////////////////////////////////////////////////////////////
//	Info Stadtwachen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Stadtwachen		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information	 = 	DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent	 = 	TRUE;

	description	 = 	"������ ��������� ����������...";
};

func int DIA_Addon_Greg_NW_Stadtwachen_Condition ()
{
	if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Stadtwachen_15_00"); //������ ��������� ����������...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Stadtwachen_01_01"); //��? � ���� ���� �����?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "� ������ ��� ��������.", DIA_Addon_Greg_NW_Stadtwachen_nochnicht );

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "�� �� ����� � �������?", DIA_Addon_Greg_NW_Stadtwachen_geld );
	};

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE)
	&& (Npc_HasItems (other,ItWr_Passierschein))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "� ���� ���� ������� � �����.", DIA_Addon_Greg_NW_Stadtwachen_Schein );
	};
	
	if (MIS_Addon_Lester_PickForConstantino != 0)
	&& (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "�� ������ ������� � �����, ������, ��� �� ������� ����.", DIA_Addon_Greg_NW_Stadtwachen_constantino );
	};

	IF	((Npc_HasItems (other,ItAr_BAU_L)) || (Npc_HasItems (other,ItAr_BAU_M)))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "��� ��������� ����, ���� �� ���� ����� ������ �����������.", DIA_Addon_Greg_NW_Stadtwachen_klamotten );
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00"); //��� ��������� ����, ���� �� ���� ����� ������ �����������.

	if (Npc_HasItems (other,ItAr_BAU_L))
	{
		B_GiveInvItems 		(other, self, ItAr_BAU_L,1);
	}
	else //ITAR_BAU_M
	{
		B_GiveInvItems 		(other, self, ITAR_BAU_M,1);
	};

	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01"); //��� ��� ��� ��, ��� ��� �����! � ����, ��� ���� �� ���� ����������, ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02"); //���� � ���� ���� ��� ������� ����������� ������, ����� �� ����� �������� �� ���� ��������.

	if (Npc_HasItems (self,ItAr_BAU_L))
	{
		AI_EquipArmor 		(self,ItAr_BAU_L);
	}
	else //ITAR_BAU_M
	{
		AI_EquipArmor 		(self,ITAR_BAU_M);
	};
	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03"); //�������! ��� ���� �������.
	
	CreateInvItems (self, ItMi_Gold, 50);									
	B_GiveInvItems (self, other, ItMi_Gold, 50);	
	B_GivePlayerXP (XP_Greg_NW_GiveBauArmor);				
	
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04"); //���? ������ 50 ������� �����? ��, ������ ����, ������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05"); //������ - ��� �� ����� ������ �� �����, ���� ���. ������ ���� ��, ��� � ���� ���������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06"); //� ���� ���� ������������, ��� �� ����� ���������� �����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07"); //� ��� �����, ����� ����, � ���� ����� ����������� ��������� ���� ������� �� ������. ������ ����!
	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Markt");

	B_LogEntry (TOPIC_Addon_Greg_NW,"� ��� ��� ������ �����������. � ��� �� ����� ������ � �����."); 

	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};
func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00"); //� ������ ��� ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01"); //������. �� �������, � ���� ���� �������.
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Greg_NW_Stadtwachen_Schein ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00"); //� ���� ���� ������� � �����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01"); //(�������������) ���. �� ������ �������, ��� � ������ ������ ���� �� ����������?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02"); //�������� �� ����, �������! � ��� �� ������� ���� ��������� �����.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_constantino ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00"); //�� ������ ������� � �����, ������, ��� �� ������� ����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01"); //���? � ���, ����� �� ��������, ������� �������� � ����� ��������?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_geld ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_geld_15_00"); //�� �� ����� � �������?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_geld_01_01"); //���� �� � ��� ��������� ����������, � ��� �� ��� � ������.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PERM		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_PERM_Condition;
	information	 = 	DIA_Addon_Greg_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� ���-���...";
};
func int DIA_Addon_Greg_NW_PERM_Condition ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)||(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Greg_NW_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PERM_15_00"); //��� ���-���...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_01"); //��������, �����. � ���� ���� ���������� ����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_02"); //�� ��������� �������. �������?
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//2. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info MeetGregSecondTime
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_MeetGregSecondTime		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_00"); //�� ������ ����������!

	if (MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_01"); //�������-������.
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_02"); //�������, ������� ��� ����� ��������� ��� ������. ����, �� ����������� �����...
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_03"); //(���) � �����, ��� �� ������ ��� ������! � �� ������ ������.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_04"); //�� �����, � ��� ��� � ��������, �����?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_05"); //��� �, ��� ��������� ��� ����������, ��� ����� �� ������� ����, ����� ���� ������. �� �� ���� ��� �� �� ���� ������ ��� �� ������.
	};

	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_06"); //�� ��� ��� �������.
	SC_SawGregInTaverne = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_wer		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_wer_Condition;
	information	 = 	DIA_Addon_Greg_NW_wer_Info;

	description	 = 	"� ��� �� ������ �����?";
};

func int DIA_Addon_Greg_NW_wer_Condition ()
{
	if (GregLocation >= Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_wer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_wer_15_00"); //� ��� �� ������ �����?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_01"); //��� �� ���� ����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_02"); //���� �� � ����� ���� �������������, � ��, ��������, ��� ��� ������, �� ��� ��?

	
};

///////////////////////////////////////////////////////////////////////
//	Info was
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_was		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_was_Condition;
	information	 = 	DIA_Addon_Greg_NW_was_Info;

	description	 = 	"����, ��� ���� �� ���� ����?";
};

func int DIA_Addon_Greg_NW_was_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func VOID B_Greg_Search_Dexter ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_00"); //��� ����� ����� ������ ��������. � ������ ��� ���, � ��� ��� ������, ���� ����� �� �����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_01"); //�� �����, ������ � ���� ������, � �� ����� ������� �������� �����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_02"); //��������� ��� ��������, �� ��� ����������� � �������. � ��� ��� ����� �� ���������� � ����� '�'.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"������� � �������� �� ����� ���� ����-��, ��� ��� ���������� �� ����� '�'."); 

	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_00"); //��� ���� �� ���� �����?

	if (MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_01"); //� ���� ��� ��� �������� � ��������� �������?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_was_01_02"); //(���������) ������ � ���� �������� ��������, ��������.
	};	

	B_Greg_Search_Dexter ();

	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "�� �������� � �����?", DIA_Addon_Greg_NW_was_Diego );

	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_was, "���� ����� �������?", DIA_Addon_Greg_NW_was_Dexter );
	};
	
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "�� ���� ������, ��� �������� ��� ��� ��������.", DIA_Addon_Greg_NW_was_no );
};

func void DIA_Addon_Greg_NW_was_GregUnsicher ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_00"); //����� ����, � ���. � �� �����, ��� ��� �����...
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_01"); //��� ����� ������� ���, ����� ������.
};

func void DIA_Addon_Greg_NW_was_UnNun ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_UnNun_15_00"); //���-������ ���?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_01"); //��, �������� ������. ���� ���-��� ���.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_02"); //��� ����� ������. ��� ����� ��������. ������ ��� ���� �� ��������.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "� �� ���� ���� ������.", DIA_Addon_Greg_NW_was_NoHelp );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "��������? �� � �������!", DIA_Addon_Greg_NW_was_Orlan );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "������? ������ ����� ������ � ���������.", DIA_Addon_Greg_NW_was_SLD );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "��� ���� 10 �������.", DIA_Addon_Greg_NW_was_HierGold );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "� �� �� ��� ������ ������ � ������?", DIA_Addon_Greg_NW_was_Waffenhaendler );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "������? ���� ��� ����� ������.", DIA_Addon_Greg_NW_was_Gold );
};

func void DIA_Addon_Greg_NW_was_NoHelp ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_NoHelp_15_00"); //� �� ���� ���� ������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_01"); //(���) ���, �� �� ������ ��� ������.
	
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_02"); //������ ��� �� ������������� ��������� ��� �������.
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_03"); //��� ���� �����: ���������� ������� ���, ����� � ���� ������ �� �����.
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_04"); //� ������� ���, ���� ������.
	};	
	
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_00"); //������? ���� ��� ����� ������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_01"); //��������. �� ��� �� �� ������, ���� �� ��� � ���� ����? ������, �� ������� �� ��� �� ������� � ��������.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_02"); //� � ����, �������, ���� ����� �������...
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_03"); //�� �� �� ����� �� ������ ��� ������, ���� �� �����, ��� � �����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_04"); //��� ��� �������� �������, ��� � ������ ���� ����������� ����.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Waffenhaendler_15_00"); //� �� �� ��� ������ ������ � ������?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Waffenhaendler_01_01"); //�� ������? ��������� �������� ������� ���� ����!
};

func void DIA_Addon_Greg_NW_was_HierGold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_HierGold_15_00"); //��� ���� 10 �������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_01"); //(�������) ������ �������� ���� ���� ������ ����������. � ���� ���� ����� �������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_02"); //���������� ������ ���� ������. ��� ���� �� ��� ����, ��� � �����-�� ����� ���� ���������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_03"); //������ ��� ���� ������� ������. � ����, ����� �� ��� �����.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"� ��������� �������� � �������� �� ����� ������, �� �� ���������. � ������ ����� � ��� � ��� ������."); 

	MIS_Addon_Greg_RakeCave = LOG_RUNNING;
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_SLD_15_00"); //������? ������ ����� ������ � ���������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_01"); //���������. � ��� ������, ��� ������� ���� ����� ����� ��� ������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_02"); //������� ��� ���������� �����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_03"); //��, ���� �������. �����, � ������������� ������ �� �����.
};
func void DIA_Addon_Greg_NW_was_Orlan ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Orlan_15_00"); //��������? �� � �������!
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Orlan_01_01"); //�����-���������� �� ���� ���� �� ������, ���� �� ��� �� ���������.
};

func void DIA_Addon_Greg_NW_was_no ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_no_15_00"); //�� ���� ������, ��� �������� ��� ��� ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_no_01_01"); //� ��� � ����.
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Diego ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Diego_15_00"); //�� �������� � �����?
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Dexter ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Dexter_15_00"); //���� ����� �������?
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveLos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCaveLos		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Info;

	description	 = 	"������ � ���� ������.";
};

func int DIA_Addon_Greg_NW_RakeCaveLos_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveLos_15_00"); //������ � ���� ������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveLos_01_01"); //������ �� ����.
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"RakeCave");
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveThere
///////////////////////////////////////////////////////////////////////
	func void B_Greg_GoNow()
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_03"); //�� � ���� �� �����? ��� ������ � ������� ����.
	};
// --------------------------------------------------------------------

instance DIA_Addon_Greg_NW_RakeCaveThere		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_RakeCaveThere_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_00"); //�� ���, ��������, ��� � ������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_01"); //��� ���� �����.
	B_GiveInvItems (self, other, itmw_2h_Axe_L_01, 1); //Spitzhacke	
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_02"); //� ������� ���� ���� ���-�� ������. ����� �������� �������.
	B_Greg_GoNow();
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveThere_15_04"); //� ��� �� ��?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_05"); //���-�� �� ������ �������� ���. � ������ - ��� ������.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"���� ������ �����, ����� � ������ �� ������ ��� ����. �� ������� ��, � ����� ������� �������. ��� ������ �� ��� ��� �����."); 

	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay(); 
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCavePlundered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCavePlundered		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition ()
{
	if ((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay()-2)) || (RAKEPLACE[Greg_FirstSecret] == TRUE))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_01_00"); //��� �� ��� ��� ����� �����? ����� ��, ��� � ���� ������?
	
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "��, � ������� ������� � �������.", DIA_Addon_Greg_NW_RakeCavePlundered_gold );
	};
	Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "���.", DIA_Addon_Greg_NW_RakeCavePlundered_No );
};
func void DIA_Addon_Greg_NW_RakeCavePlundered_No ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00"); //���.
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01"); //����������� ��� ��������, �����?
		AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02"); //�-�... ��� ������ �� ����.
	};	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03"); //������ ������! � ��� � ����! ���� ����� ���������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04"); //�� �����. ��� ����� ����. ��������.
	AI_StopProcessInfos (self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};
var int B_Greg_RakePlaceBriefing_OneTime;
func void B_Greg_RakePlaceBriefing ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_00"); //���, ���������... �� ����� � ����� ���������� ���� ��������� ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_01"); //�� ������� ��������� ���� ��� ��� �����, ��� � ������� ���������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_02"); //���� - �� ����������� ��� ������, � ������ - ����� � ������ � ������, � ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_03"); //�� ������� ������� � ����� ����� ����� ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_04"); //� ������, � ������� ��� ����������, ���� ��� ���� ������.

	if (B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_Addon_Greg_NW,"������� ��������� ���, ��� ���� ��������� ����, ��� �� ������� ���� ����: 1) �� ��������� ������� �� ����� � ����� ����������. 2) �� ������� �������� �� ������. 3) � ��������� ���������� �� ����� �������. 4) � ������ ��� ���������, ������� �� ������� ������� � ����� ��������������. � ������ ����� ��� ��� ���������� ����. �� ����� ����� ���� � ����������� �� �����.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};                                                                                             
                                                                                               
func void DIA_Addon_Greg_NW_RakeCavePlundered_gold ()                                          
{                                                                                              
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00"); //��, � ������� ������� � �������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01"); //(�����) ����� ��� ����.

	if ((Npc_HasItems (other,ItSe_GoldPocket25))||(Npc_HasItems (other,ItMi_Gold)>= 25))
		{	
			if (B_GiveInvItems (other, self, ItSe_GoldPocket25,1))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02"); //�����.
				}
			else if (B_GiveInvItems (other, self, ItMi_Gold,25))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03"); //� ��� ������, ������ ���� 25 �������. ��� ���.
				};
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04"); //����� ������.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05"); //�� ����, �����������, ����� ���� ���� �����-�� ����.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06"); //�����, ������ �����������. ���� ��� ��������� ����, ��� � ������� ���� ����. � � ����, ����� �� ��� �� ������.
			B_Greg_RakePlaceBriefing ();
			Greg_SuchWeiter = TRUE;
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07"); //� ���� ����� ���� � ����������� �� ����� �����. �� ������� ���� - �� �� ���� ���������.
			AI_StopProcessInfos (self);
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_GivePlayerXP (XP_Addon_RakeCavePlundered);
		}
	else
		{
			AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08"); //� ���� ��� ������ ���.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09"); //������ �������! ��� ���, ��������� ���� ������ ��� ���� �����?
			AI_StopProcessInfos (self);
			MIS_Addon_Greg_RakeCave = LOG_FAILED;//Joly:SC hat Greg angeschissen.
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_Attack (self, other, AR_NONE, 1);
		};
};

///////////////////////////////////////////////////////////////////////
//	PERM vor LakeCave
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_LakeCave	(C_INFO)
{
	npc		 	= PIR_1300_Addon_Greg_NW;
	nr		 	= 100; //alle anderen importants wichtiger
	condition	= DIA_Addon_Greg_NW_LakeCave_Condition;
	information	= DIA_Addon_Greg_NW_LakeCave_Info;
	permanent	= TRUE;
	important 	= TRUE;
};

func int DIA_Addon_Greg_NW_LakeCave_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 	
	&& (Greg_SuchWeiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info ()
{
	B_Greg_GoNow();
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WhereTreasures
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhereTreasures		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent	 = 	TRUE;

	description	 = 	"�������, ��� �� ����� ���� ����?";
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhereTreasures_15_00"); //�������, ��� �� ����� ���� ����?
	B_Greg_RakePlaceBriefing ();
};

///////////////////////////////////////////////////////////////////////
//	Info PermTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PermTaverne		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Greg_NW_PermTaverne_Condition;
	information	 = 	DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� ���-���...";
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition ()
{
	if 	(
		(GregLocation == Greg_Bigcross)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross) == FALSE)
		&& (((Npc_GetDistToWP(self,"BIGCROSS")<1000) == FALSE)||(MIS_Addon_Greg_RakeCave == LOG_SUCCESS))
		)
	|| 	(
		(GregLocation == Greg_Dexter)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_WasWillstDu))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PermTaverne_15_00"); //��� ���-���...

	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_01"); //������� ������� ��� ��� ��� ����. ����� �� ���������.
	}
	else if (MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_02"); //�������, � ����������, ��� �� ��� �����. �� ��� �� ������ ��� ��������. ���������, � ��� �?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_03"); //�� � ��� ������� ����� �������.
	};
};


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//3. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info Bigcross
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Bigcross		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Bigcross_Condition;
	information	 = 	DIA_Addon_Greg_NW_Bigcross_Info;

	description	 = 	"��� ����?";
};

func int DIA_Addon_Greg_NW_Bigcross_Condition ()
{
	if (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Bigcross_Info ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)||(MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_00"); //��� �� ��� �������� ������������!
	};

	AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_01"); //��� ����?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_02"); //��� ����. �� ��������� ��������� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_03"); //� ������, ��� ��� - ������� ������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_04"); //�� �� ������� ���������, ��� ��� ����� ���� ��������� ��������.
	
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_05"); //�� ���, �� ����� ��� ����?
		if (RAKEPLACE[1]==FALSE)
		|| (RAKEPLACE[2]==FALSE)
		|| (RAKEPLACE[3]==FALSE)
		|| (RAKEPLACE[4]==FALSE)
		|| (RAKEPLACE[5]==FALSE)
		{
			AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_06"); //���, ��� �� ���.
			AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_07"); //��� ����������! �� ��� �� ��� � ������.
		};
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WhatWantFromSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhatWantFromSLD		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Info;

	description	 = 	"��� ���� ���� ����� �� ���������?";
};

func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhatWantFromSLD_15_00"); //��� ���� ���� ����� �� ���������?
	
	if (SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter ();
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_01"); //� ���� ��� �������. � ��� �������� � ������� �����.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_02"); //�� ��� ������� ���� �� ������, � ��� � ������.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info DexterFound
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_DexterFound		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_DexterFound_Condition;
	information	 = 	DIA_Addon_Greg_NW_DexterFound_Info;

	description	 = 	"� �����, ��� ���� ����� ������� �� ����� �������.";
};

func int DIA_Addon_Greg_NW_DexterFound_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_DexterFound_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_DexterFound_15_00"); //� �����, ��� ���� ����� ������� �� ����� �������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_DexterFound_01_01"); //���� ������, ������ ��� ����� ��� ���?!
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "� ������ �����������.", DIA_Addon_Greg_NW_DexterFound_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "� ���� ������ ���� ��� �����.", DIA_Addon_Greg_NW_DexterFound_together );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "�����, � ���� ������ ���� ��� �����.", DIA_Addon_Greg_NW_DexterFound_wo );
};
func void DIA_Addon_Greg_NW_DexterFound_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_weg_15_00"); //� ������ �����������.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_00"); //�����, � ���� ������ ���� ��� �����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_01"); //�������������? � ��� �� �� ������?
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_02"); //�������� ������.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_03"); //������, �� ���� �������� ����� ��������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_04"); //��! ��, ������, ��� ��.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_05"); //� ����, ��� ���� ���� �������� ���-�� �����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_06"); //������ ���, ��� ��� �������� �������, - �������� ��� ������� � ������ ������� � ������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_07"); //� ����� ����� �������, � ���� ������ ��� �� �����.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_together_15_00"); //� ���� ������ ���� ��� �����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_together_01_01"); //���, � ����� ����. � ���� � ��� ���� ������ �����.
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//4. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_00"); //(������) �� � ��� ��� ������?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter_15_01"); //���, �������? ����� �����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_02"); //����� ����� � ���� ������!
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"DexterHouseRun");
};

///////////////////////////////////////////////////////////////////////
//	Info WodennNu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WodennNu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WodennNu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WodennNu_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
	&& (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10")<500) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WodennNu_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_00"); //� ���� �� �� �����?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WodennNu_15_01"); //��� �����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_02"); //�� ��� ����� � ����� ���!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter2		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_00"); //���. ������, ������� ���� �������?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter2_15_01"); //������, �� �����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_02"); //�� ���� �������, ��� ��� ��� �����. �������, ��� � ���� ���� � �����.
	Npc_ExchangeRoutine	(self,"DexterHouseWalk");
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info RavensLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RavensLetter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RavensLetter_Condition;
	information	 = 	DIA_Addon_Greg_NW_RavensLetter_Info;

	description	 = 	"� ����� ������ ��� ������.";
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_CaughtDexter2))
	&& (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_00"); //� ����� ������ ��� ������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_01"); //������.
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_02"); //���� ������! ��� ��� ������ �� �������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_03"); //������ ���� ��� ������ ��� �������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_04"); //�����, ��, ��������, �� ������, ��� ������� �� ������ ������ �� ������-������� ��������?
	
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_05"); //��������, ����� ������, ������� ���������� ���� ����.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_06"); //��� ��� �� ����?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_07"); //���� ����... � ����� ������� � ���� ����?
	};
	
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_08"); //���.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_09"); //(��������) ������, � ����� �������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_10"); //�� �������� � ���� ���� ��������� �������.
};

///////////////////////////////////////////////////////////////////////
//	Info WasWillstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WasWillstDu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WasWillstDu_Info;

	description	 = 	"� ��� ���� ���� ����� �� ��������?";
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_RavensLetter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WasWillstDu_15_00"); //� ��� ���� ���� ����� �� ��������?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_01"); //� ������� ���� ��-�� ������-��������� ���. � � ���� ���� ���������.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_02"); //� ��������, ��� ��� ������� ��������� ���, ��� ��������� ���� ��� �������.

	Npc_ExchangeRoutine	(self,"DexterThrone");	

	Info_ClearChoices	(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "� ��� ��������� �� ����� ������?", DIA_Addon_Greg_NW_WasWillstDu_da );
	
	if (Skip_NW.aivar[AIV_TalkedToPlayer]==TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "�������� �� ������ � �������� ������ �� ����� ����.", DIA_Addon_Greg_NW_WasWillstDu_Skip );
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_da_15_00"); //� ��� ��������� �� ����� ������?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_01"); //�-�, ���� ���� �� ����� �������� ���� �������.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_02"); //����� ��� �������. ������ ��������, ��� ��, ����� ��� �� ���������.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00"); //�������� �� ������ � �������� ������ �� ����� ����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01"); //�, ���� �����. � ���� ��� ��� ���, ������ �� �� �������� ������?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02"); //������, � ��� ��� ������, ��� � ����.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundTreasure
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_FoundTreasure		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information	 = 	DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ����� ��� ���������� ����.";
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition ()
{
	if (RAKEPLACE[1]==TRUE)
	&& (RAKEPLACE[2]==TRUE)
	&& (RAKEPLACE[3]==TRUE)
	&& (RAKEPLACE[4]==TRUE)
	&& (RAKEPLACE[5]==TRUE)
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_FoundTreasure_15_00"); //� ����� ��� ���������� ����.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_FoundTreasure_01_01"); //����� � ���� ������ ���� ����� ��� �������, ������� ����, ���������� ����� � ������. ����� �� ����.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
	Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "� ���� � ����� �� ���.", DIA_Addon_Greg_NW_FoundTreasure_not );

	if ((Npc_HasItems (other,ItSe_GoldPocket100)) || (Npc_HasItems (other,itmi_gold)>= 100))
	&& (Npc_HasItems (other,ItMi_GoldCup))
	&& (Npc_HasItems (other,ItMi_SilverChalice))
	&& (Npc_HasItems (other,ItAm_Prot_Point_01))
		{
			Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "��� ���� ����.", DIA_Addon_Greg_NW_FoundTreasure_ja );
		};
};
func void DIA_Addon_Greg_NW_FoundTreasure_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_00"); //��� ���� ����.

	if (B_GiveInvItems (other, self, ItSe_GoldPocket100,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_01"); //������� �� ��� ��������.
	}	
	else if (B_GiveInvItems (other, self, ItMi_gold,100))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_02"); //100 �������.
	};

	if (B_GiveInvItems (other, self, ItMi_GoldCup,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_03"); //������� ����.
	};
	if (B_GiveInvItems (other, self, ItMi_SilverChalice,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_04"); //���������� �����.
	};
	if (B_GiveInvItems (other, self, ItAm_Prot_Point_01,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_05"); //� ������.
	};
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_06"); //����� ������. ����, ���� ������� ��� �� ����������� ���� ��� ����.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_07"); //��� ���� ����.

	B_GiveInvItems (self, other, ItMi_gold,30);
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
		
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_not_15_00"); //� ���� � ����� �� ���.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_not_01_01"); //����� ���������� � ������� �� ���, ���� � �� �����������.
	AI_StopProcessInfos (self);
};

