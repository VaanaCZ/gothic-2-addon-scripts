// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Dexter_EXIT   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 999;
	condition   = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_Dexter_Hallo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 1;
	condition   = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Dexter_Hallo_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Hallo_Info()
{
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//����������, ��� ������. ������� ������������. ��� �, �����, ��� �� ������� �����?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//� ���� �������� ������ �� ��������� ��������.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//�� ������ �, ��� �� ������� ���� �����������.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//��� �� ������ � ����?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//� ���� � ����, ��� � ���������� ����. ������� ���� �� ���������� ��� ���������� � �������?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//�� ��� ���������� ���� ����. ��-��, ���� �������� �����������. ����� �� �� ����?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//���-�� �������������� ������ ������ � ���� ������������. ���-��� ������ ���, ��� ��� ��.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//���-�� ������� ����� �������.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//�������, �� ����. � ������������� ���������� � �������. � ����� ���� - � �� ������.
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das w�re mein Ende, aber dann tauchte pl�tzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske �berm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldst�cke f�r deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt h�tte, dann h�tte er mich get�tet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//����, ��� ���� �� ���� ����?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//���? ��������� ������. �� ��� ������ ������ ���������� ������ ����� ������.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//������� �� �������� ��� ����� ���� � ��������� ��� ���� ������.
};

// ************************************************************
// 			Glaube 
// ************************************************************
INSTANCE DIA_Dexter_Glaube   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent   = FALSE;
	description = "� �� ���� �� ������ ������ �����.";
};
FUNC INT DIA_Dexter_Glaube_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Glaube_Info()
{
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//� �� ���� �� ������ ������ �����.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//��������, ��� ��� ������. ������� ������� ����� ������!
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_Patrick_Condition;
	information	 = 	DIA_Addon_Dexter_Patrick_Info;

	description	 = 	"� ��� �������� ������� �� ����� ������?";
};

func int DIA_Addon_Dexter_Patrick_Condition ()
{
	if (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Patrick_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //� ��� �������� ������� �� ����� ������?
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //������? �� �������, � ��� �� ��������.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //� ���������� ������-�� ���������� ��������, ������� ������ ����� ��������� � ������ � ��������.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //�� � �� ����� ��� ��� ���� ����� ������� �������.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //��������, �� � ����� ������ �������� �� ������������. ��� ��� ����������.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"������� ����������, ��� �� ����� �������� �������."); 

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP (XP_Addon_Dexter_KnowsPatrick);
};
///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Dexter_Greg_Condition;
	information	 = 	DIA_Addon_Dexter_Greg_Info;

	description	 = 	"���� ���� ������� � �������� �� �����!";
};

func int DIA_Addon_Dexter_Greg_Condition ()
{
	if (SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Dexter_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //���� ���� ������� � �������� �� �����!
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //���� ��� ����. �� ��� �� ����.
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //���� ����� �������� ����, ��� �������, �� ����� �� �������� ����.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_missingPeople_Condition;
	information	 = 	DIA_Addon_Dexter_missingPeople_Info;

	description	 = 	"�� ��������� ������� ��������!";
};

func int DIA_Addon_Dexter_missingPeople_Condition ()
{
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Dexter_missingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //�� ��������� ������� ��������!
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //����, �� ��� �������. ������� ������, ��������.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //� �-�� �����, � ������� ������� ��� �����.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "��� ������ ���� �������?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "���� �������� ���������� ����? �������� ���-�� ����� � ��������?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //���� �������� ���������� ����? �������� ���-�� ����� � ��������?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //(�������) ���-���, ��� ������ �� ������-�������. ���� ���� �� ���������.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //� ��� �� �������� ����, ��� ������, �� ��� ���������� �� �������.
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //��� ������ ���� �������?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //������. ����� ������� �������. �������, �� ��� ������. ��� �����, ���� �� ������ ������ ������� �� ������ ��������.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //��� ���� ����� ��� ��� ���������� ��� ������. � ��� ���, ��� ���� ����� �����.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "����� ������? ���������...", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "������ ����� �����, � ��������?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //����� ������? ���������...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //(�����������) �� ��� ���� ��������? �� �� ������ ���, ��� � ����.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //(����������) ����� �� ������������� ��� ������ �������, �� ������...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //����� ������� ������� �� ���������. �� ��� ���� ����� ������ ����.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //(�� �������) ���� ������� ����� �������� ��� � �����, ��� ������ ������� ����, ��� ����� �������.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //� ��� ���� ���� �����. ���� �� ��������. ����, ���� ��� �� ������� ������.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //(������) ����� ���� ���� ���� ������ ������.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"� �������� ���� ������. ����� ��� �����. ����� - ������ ������ �����. ������, ��� ������ ����� ����� �� ����� ����� ����������� �����. ������ ��� ����� ������ �������� �������������� �����."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //������ ����� �����, � ��������?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //�� ������ �� ������ �����. � ���� ���� �����, � ����� ������� ����� � ��� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	3;
	condition	 = 	DIA_Addon_Dexter_Boss_Condition;
	information	 = 	DIA_Addon_Dexter_Boss_Info;

	description	 = 	"���� ������? ��� ��� �����?";
};

func int DIA_Addon_Dexter_Boss_Condition ()
{
	if (Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Boss_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //���� ������? ��� ��� �����?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //(�������) ����, ���������, �� �������� ��� ������? �������.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //(��������) �� ���� �� ����� �������, �� ������� � ������ ���� ��� �������.
};

// ************************************************************
// 			Vor 
// ************************************************************
INSTANCE DIA_Dexter_Vor   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent   = FALSE;
	description = "� ��� �� ����������� ������ ������? ����� ����?";
};
FUNC INT DIA_Dexter_Vor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Dexter_missingPeople))
		{
			return TRUE;
		};
};
FUNC VOID DIA_Dexter_Vor_Info()
{
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//� ��� �� ����������� ������ ������? ����� ����?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//��. �� �� ��������� ��� ����. ��� ������ � ��� ���� ��� ���� ����. �������� - �������, �������� ���������. ����� � ������ �� ��������� ��� �� ����.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//� ������ ������, ���� �� �������� �����.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//(�������) �� ��� �� ����������� ����� ��������� ���� ��������...
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//(���������) �����, ���� ����� ����.
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//���� � ����� ���� ��� ���, �� ��� ��������� ����!
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Kill
// ************************************************************
INSTANCE DIA_Dexter_Kill   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 2;
	condition   = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dexter_Kill_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Dexter_Add_09_02"); //�� ��� ����������...
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//��, ���� �� ������ ������������ �����. �� �������� �� � �� ����� � �� � ��� �����.
	};
	
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter ();
	Info_ClearChoices	(DIA_Dexter_Kill);
	Info_AddChoice	(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE );
};
func void DIA_Dexter_Kill_ENDE ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor	(Greg_NW, ITAR_PIR_H_Addon);	
	};
};


// ************************************************************
// 			Mein Kopf? 
// ************************************************************
INSTANCE DIA_Dexter_Kopf (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent   = FALSE;
	description = "���� ����� ��� ������? ��� �, �������� �� �����!";
};
FUNC INT DIA_Dexter_Kopf_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kopf_Info()
{
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //���� ����� ��� ������? ��� �, �������� �� �����!
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //��, ���� �� ��� ������...

	DIA_Dexter_Kill_ENDE();
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dexter_PICKPOCKET (C_INFO)
{
	npc			= BDT_1060_Dexter;
	nr			= 900;
	condition	= DIA_Dexter_PICKPOCKET_Condition;
	information	= DIA_Dexter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen (96, 370);
};
 
FUNC VOID DIA_Dexter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dexter_PICKPOCKET);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_BACK 		,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};
	
func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};





/*
// ************************************************************
// 			Wo
// ************************************************************
INSTANCE DIA_Dexter_Wo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 3;
	condition   = DIA_Dexter_Wo_Condition;
	information = DIA_Dexter_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich diesen Mann?";
};
FUNC INT DIA_Dexter_Wo_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE) 
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Wo_Info()
{
	AI_Output (other, self, "DIA_Dexter_Wo_15_00");//Wo finde ich diesen Mann?
	
	if (Kapitel < 3)
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_01");//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle �berall unterwegs! Und die suchen dich.
	};
};
*/
