///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //��� � ���� ������� ��� ����, ���������?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //��� � ���� ������� ��� ����, ����?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //����������� ����� ������ ����� ��������������� �����.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //��� � ���� ������� ��� ����?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(�����������) ��� �� ������� �����?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"� ������ �������� �������.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //� ������ �������� �������.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //�������. ���� ���� ������� �������� ����� ��� �������� �������, �������� �� ���.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //���� ���� ������, � ������� ��� �� �������� �� ������ ��������������� ����������.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"� ���� ���� ��������� ��� ����?";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //� ���� ���� ��������� ��� ����?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //��. ��� �������� ��������� ������. �� ����� �  �������� � ���������������� � ���������� ������� � ��������� ����������. �� ����� �� ���������� ����������� ������������.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //� ��� ����� ��������� ����. � ����� ���� ������ - � ������ �� ��� ����� ������?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //����� ��������� ���, ��� �������� �� ���������� ��������� �� ��� �������.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //� ����, ����� �� ���������� � ����� � ����� � ���� ��� ������ ��� ����.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //�� ������ �� ����� - �������?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //�������.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //��� 150 ������� �����. ��� ������ �������������� ���� �������.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"������ ������ �������� ���� � �����. �� �����, ����� � ������ ��� ��� ������ � ������������, ������� ������������� � ������� �����.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"��� ������, ������� �� ����� ��������.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //��� ������, ������� �� ����� ��������.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //�������, ��� ���� ����.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //������ �� ������ ��������� ��������� ���� �������� � ����������.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //� ������ ���� ������ � �������� �������.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"������ ��� ���� ������.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //������ ��� ���� ������.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"� ��� ������ �� �����������?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //� ��� ������ �� �����������?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //� ������� �� �������� ����� ��������� ������������ ����������.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //��� ��� ��������?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //��, � ������ �� ������ ������� �� ������ ��������� ��� ����.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //��� ������ ���������� ������ �������, ���� ��� ����������� ������������ ����� �������� ���� ��������� ������ ����.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //����� ����, � ���� ���� ����� ���������� ������, ������� ��� ���� � �������.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //�� � ���� ������� �� ������ ������ ������ ������.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"������ ������ �� ��������� ����� ������� ��� ������ � ������������. �� ��� ����� � ������ ���� ����� ����.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"����� ���� (�������� ���).";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //����� ����.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //� ��������� ������ ��� ������ ����� ����.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ���� ������� ��������� ���� �����.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //� ���� ������� ��������� ���� �����.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //������. ��� ����� �� ������������ ���� �����������. ����� �� � ��������� ����, �� �������� � ����� ���� ���� ����� �����.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //�� ����� ������ ������, � ����� ����� ���������� �������� ���� ����.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //�� ��� ������ �� ��������.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ���� ������� ����� ���� �����.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //� ���� ������� ����� ���� �����.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //����� �� � ����� ���� �����. ���� ������ ���������� �������������� �����, ����������� � ���, ��� �� ������ �����.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //��������� ��� ���� �� �����, ���� - ���� ��� ������, � ������ ���� �����.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //� �� ���� ����������� ���� �� ���� � ������� � ���������� ����� �����. ��� ������� ������ ���� � ����, ����� ������ �����.
			
			B_LogEntry (Topic_KlosterTeacher,"������ ������� �������� ���� � 6-� ���� �����.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //����� ��� �� ������.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //����, ���� ������ ������ �������. �� ������ ����� ����� � ������� ���� ������ ���������.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //���� ���� �� �������, �� ��� ��������.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //��� �� ������� �����? ����� �� �� ������ ������ ������ ��������� ��������� �����?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"��� ��������. ���� ������, ����� ������ ����.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"��� ��� ����� ������ �� ����.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //��� ��������. ���� ������, ����� ������ ����.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //�� �� �������������, ��� ��� ������ �������� ��� ���������? ���� ������ - ������� ������.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //����� �� � ��������� �����������, ��� ���� ������������ ������� � ���� ��������, �� �� ���-�� �������, � �� ������ ������������� ��� ����.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //��� ����������� �� ���������� �� ������ � ����� ����� ����!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //��� ��� ����� ������ �� ����.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //� ����� ������� �� ���, ���� ������ �� �����. ���� �� ��� ������� ���� ��-�� ����, ��� �� ���������� �����, � ����� ���������� � ���, ����� �� �������� ����� ����������.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //� � ��� ���� ����� ��������?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //� �������� � ������. �� ����� �������� �����������, ����� ����������� ���� ��������� �� ����� ������������.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //� ������ �� ����� ������� �������. � ��������� ������, �����, ��� ��������� ����� ������� �� ������ ������ �� ������.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //�� ������, ��� ���� ����� ������. ��� ��� ��!
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"� ������ ����� ���� ������.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //� ������ ����� ���� ������.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //� ��� ���, ��� ���� ������� ������� ���� �� ��� �����.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //�� ��������� ��� ��� �������� ��� ����. ���� ������������� ����� ����� � ���������� �� � ����� � ����������� ��������������.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //� ��� ������������ ��� �� ����� �����.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //������ �� ����� ��� �����. �������� ��������. ����� ��������. ������ �� ���� �� �����, ���� ����� ��������, � ���� ���.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //���� ��� �������� � ��������� ���������� �����. �� ����� ��������� � ���� � �� ������� �������.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "��� ������������ ���� ������������?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //��� ������������ ���� ������������?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //� ���� �������� ���-��� �� ������.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //� ��� ��� �����?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //��� ����� ��������� ������������ �������������. ��, �� ������� ����, ��� ��������� ��� ���������� ��� �������� �������.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //���� ��������� ��� ������� � ����.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //���� ��! ����� ������ ���������!
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //� ������� ���� ���������, �� � ���� ������������ ���������, ����� ������� ����� ��������� �����������.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //�� �� ��� �� �������� ��� ���-������, ������������� ��, ��� ��������...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"����� ���������� ���� ������������, ������� ����� ���-������, ��� ���� � ������ �������� � �������."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"� �������� ���-������ �������.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"����� ����� � ����� ��������� ������?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"��� ������ ���� �����?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //� ��� ��� ������� ��� �������������� ������ �� ������.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //��� ������ � ���-������ ������, �, ������� ��, ���������� ���������� ����.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //� ����� ����� �������. ����� �� ��� ������������ ���������� ��������� ��� ��������� - ����������� ������ ����������.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //����� ����� � ����� ��������� ������?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //� ������ � ������. ��, ������ �� ��������� � ���� ����������, � ������ �� ���� ������� �� ����.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //� ���� ����� ����� ��������� ������������ ���������� �������, � ����� �� ��� ����� ���� ���������.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //�� ������, ����� � ������ ���� ����, ��� ��?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //���! �� � ��� �����?! ���������, �������������� ����������� ������������ �������� � ������ ���������, ������� ������.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //����� ����������, ���� �� ������� �����-������ ��������, �������� ��� ���� ��������.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //������� ������������ ����, ��������� � ���, ������ ���� ���������� ���������� ��� ��������.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //��� ������ ���� �����?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //������ � ����? ����� �������, ������� ����������� ������ ���� ���������.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"�� ������, ����� � ������ ���� ����?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //� �������� ���-������ �������.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //��� ���� �� ����� ��������. � ���� � ������� ������ �������� ��������������.
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "� ������ �������� ���������.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //� ������ �������� ���������. ����� ����, �� ���-������ ���� �������.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //������.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //��, ��� ����� �������. � ������ ������� ��� �����.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //�� � ��� ������ � �����.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //�� ����� ������, ������ - ��� ������ ����������� ��������� �����, ��������� ��������.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //��� �������� ����� �������� ������������ � �������� ������������ �������.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //������ � ���� �� ���� �������, ����� �� �� ���� � �������� ������������� ������������ ��� � ������ ���������� ��������.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //������ �������. ����� � ����������� ����� ������� ������.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"������ ���� ������������ �������� ��������� ��� ����������� ����� ������������. � ������ ��������� � ���� �����."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "������� ���-������ ����� �� ������?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //������� ���-������ ����� �� ������?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //��. ������ � ����, ��� ��� ��� ��� ������ �������� � ����������������.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //����������!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //�����-�� ��� ���� ������, ��� �� ��� �. ��� ������� ����������� ������, �������� ���� �������� ����� ����� �������� ����������.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //��� �������� ����� ����������, � ����� ����� ������� ����������, ������������ ����� �� ������������� ����� �������� ���, � �� �������� �� �� ����� �������� �������� ���� ����.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //������� ��, ��� �� ����� ��� ������ ���, �� ���������� ����������� �����, � ��� ������� �� ���������� ��������� �� �������������� ������.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //�� ������ ��������� ������������. ������, ��� ������ ���� ��������� �������� ������.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //������, ���� �� ���� ��������� �����, � �� ����� ����������, ��� �� ����� ����� � ������������.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //�������. ��� ��� ���� ����� �����������.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //������? ��� �������, ��� ��� ��������� ������ ��� ������ ��������. ��������, ��� ��� ���� ������, � ����� ��������� ������ �� ���, ��� ��� ���� ������?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //� ���� ���� �������. ��� ��� ������ �� �������� �������. � ���� ���� ������.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //�������, �� ���������, � ��� ������ ����. ���� ���������, ����.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //��, ������� ��! ��� ���� ��������. ��� �� ������ �� �����.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"������������ ������� ����������� �������. ������, ���� ����� ����� ������� � ��������� �������."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //� ������� ��� ����. ������ �����.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "���� �� ������ ���������� �� ���������� ���� ������?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //���� �� ������ ���������� �� ���������� ���� ������?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //�������. ������, ������������� �� ����� � �������������� �����, ��� �� ������� �������� ��������.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //� ���������, � ���� �� �������� ����� ������.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //��������� �� �������, ����������� ����, ������� �� ����� ������.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //������. � �������� ��������� ����� ������.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //��, ������ ���. �� ���� �� �����, ����� ��������� �����-������ ������, �� ������� ����?
		B_LogEntry (TOPIC_DEMENTOREN,"������ ����� ���� ��� ��������� ������ �� ���������� ���� ������. ��� ����� ��� ����� ������ �� �������������� �����. ��������� ������ ������� �� ����� ������."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //������� �� ����. � ���� ���� ������� ����, ����� ���� ����� �� ���� ������. ����� ��� ��� ��� ��� �������.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "� ������ ��������� ������ � �������������� �����.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //� ������ ��������� ������ � �������������� �����.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //��� ������. �������, ��� ������ ��-�������� ����� �� ����� ������.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //������. � ������ ��� ���� ������, ���������� �� ������� ������� ������.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //��� ��� ������� �������. ��� ���� ����� ����������.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"������ ���� ��� ������, ������� ����� �������� ���� �� ���������� ���� ������. ��� ������ ������ ��������� ��� �����."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "��� ��� ������ ��������� �������, ��� �� ������ ���?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //��� ��� ������ ��������� �������, ��� �� ������ ���?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //� ��������. ���, �������. �� ��������� ����� �������.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //���� ���, �� ������, � ������ �� ������ �������� ���� � ���� ���������� ��������.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //�������.
		B_LogEntry (TOPIC_DEMENTOREN,"������ ��� ��� ������, ������� ����� �������� ���� �� ������� ������� ������."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //�����������. � ��� ��� ������� ��� ���.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};


