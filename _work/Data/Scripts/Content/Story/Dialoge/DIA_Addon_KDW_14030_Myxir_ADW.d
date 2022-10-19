
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"���� ����� �������?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //���� ����� �������?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //������ ������ �������� ����!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //����, ��� ��� ��� ������, ��� � �� ����.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //���� �� �������������� ������� � ���� ������� �� ����� ������ ��.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //���� �������?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //������ ���� � ������ ����� � ����� �����.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //���� � ��������� �����, ��� ������, ��� �� ������ ������������ � ���� ���������� �������.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //��� ��������� ��������� �������, ����������� �����. ���� ������ �� ������ � �������� ������� �����������.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "��� �������� ��� �������?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "�� ������, ��� ��� ���������� ���������, ���� �� �����-�� �������������.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //��� �������� ��� �������?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //������� ������� ���� �������� ������ ����������, ������� �������������� ��� ������������� �����.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //�������, ��������, ������� � ����� ������, ������� ������ �����������. ����� ����� ��� ������� ����� ������ ����� �� ������������ ���� ������.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //�� ������, ��� ��� ���������� ���������, ���� �� �����-�� �������������.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //�� ������ ��������� �� ������� ��������� ��������, ����� ��� ����� ��� �������.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //�� ��������� �������� ����� ������� ������, ������ � ����������.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //� �� ����������, ��� ��� �� ����� ���� ������������.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"���� � ������� ����, �� ����������� ���� ������.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //���� � ������� ����, �� ����������� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(�������) ��, � �� ���� ���������.
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"���� ������ �������.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //���� ������ �������.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //����� ������ � ���� � ������ ��� ����� �������.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //������� �������, ��� �� ����� � ���, ��� ������� � ����, � ����!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(���������) �, ������!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //������ ����, ����� ������, ��� ������� ������, �� ������� ���������� ����� ���������.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //���� �� �������, ��� �������� ���� � ������� ��� ���������!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //�� ������ ��������� ��� ��.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //�� ��������� ���� ������� ��� �� �������...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //�� ������ ������ ��������� �������� �����������, ������������ ������.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //�� ������ �������� ��... � ��������� �����������.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //����� ��������, ��� ���, ��� ����� � �������, ����� ������� ����.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //�� �������, ��� ��� ���������?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //��� � ���� ���������� ��������� ������������� ������������.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //��������, ������ �'�������, ������������ �������� �������.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //�� ������ ���� ������� � ����.
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "�� ��������?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "������ ����������? ������ �� ��������� ���� ��������?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "�������� ������� �������������� �� ���� ���� ����.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //������ ����������? ������ �� ��������� ���� ��������?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //����� �������� ����� ��������� �������� ���������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //��� ��� ���� �������� ����� ������� ����.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //�������� ������� �������������� �� ���� ���� ����. ������ �� ����� ���� �����������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //�� ��, � ��� ��� ��������, ���������� ����������� � �� �����������, � �� �����, ������� ��� ������������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //���� ������ �������� ���� ��������� � ���������. �� ����� ��� ��������� �������� ������, ������� ��� ������ ��� ���������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //� ����� �� ���� �������� ������� ��������� � �������� ���������. ��� �������� ���� � ����������� ��� ����.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //�� ��������?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //�� ������ ������������ ����� �����������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //���� ���� � ��� ���� ���� ���������� ���� ����������� � ����� �� ������, �� ������ ��� ������������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //� ����� ������, ������-�� ��� �������.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "� ��� �� ��� ����� �������, ����� ������� ����� ����?", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //� ��� �� ��� ����� �������, ����� ������� ����� ����?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //����� �������� �����������. ��� ��������� �� ������ ������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //���� ������� ����� ��� ������ ���������� ������� �������. ���, � ������� ��� .
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //��� ���. ������ ���� ����� ���� �������� ��������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //�����, ��� ���!

	B_LogEntry (TOPIC_Addon_Quarhodron,"������ �����, ����� � �������� ��� �������� ������ ������ ����������� � �������� � ���� ������. �� ��� ��� ������ � �����������, ������� � ������ ��������� � �������� �����������. ��� ��������� �� ������."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"�������� ��� ��� ��� � ���, ��� ������� ��� �����������.";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //�������� ��� ��� ��� � ���, ��� ������� ��� �����������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //����� ��� �������� � �������� � ��� ���������� ������� �������.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //� ������� �����. �� ������ ������ ��������� �� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"� ������� � ������������.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //� ������� � ������������.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(����������) ���� ������������� ������� ��������� ��� �� ��������� ���?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //����������! ���� ��� ������ � ������ ��������� ��� ������.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //��� �����, ���� �� ��� ����� ��������, ���� �� �� ����������� �� �������...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //� ��� �� ������ ���?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //�� ��������� ��� � ���, ��� ������� � ���� �������.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //����� ������ ��� � ��������. ���, ����������, ������������ ��, ��� �� ��� ����������.

		B_LogEntry (TOPIC_Addon_Quarhodron,"� ������ ������� ��������, ��� �������� �����������."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"����� ���� ����� �����.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};

















