///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //����, � ��� ����� ���������. � �������, �� ��� ������� ������� � ������� �������.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(������ �����������) �� �� ������, ��� ��� � �������� ���� ������ ��������� ���� ����������� �������� ���� ������.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "� ������ ���������� � ����������. ��� ������.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //� ������ ���������� � ����������. ��� ������.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //�� ������ ���, � ��� �� ����������� �������� � ����?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //� ���� ��� ��� ������ ���������.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //��� ��� �� ���������?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //����� ��� ���������� � ������ ��������. �� ����������� �������! �� ������ ���������� ��, ���� ��� ��� ��������.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //��. �� ������ �������� ���� �����, ���������. ����� ������ �����, �� ����� ���� �����, ��� �� ����� ������ ����� �����.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //� ����, ���� ����� ������� ����� ����������� �������� ����� ������������ ����������.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //�� ������ �� ����� �������� ���� �� ������ - �� ������ ����.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "� ��� ���� ������.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //� ��� ���� ������.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //�����, ��� ��������, ��� �� ����� �� ������ ����� ���� ��������� ������, �� ����� � ������ ��� - �����.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //���� ������ ��� �������� ������ ������� - ������ ���, ��� ������� ������������ ��� �����, �������� ������ ���.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //� ��� �� ����� �� �����������.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //����������� ���������� ��������� �������� - �� �������.
	
 	B_LogEntry (TOPIC_INNOSEYE, "� �� �����, ��� ��� ����� ��� ��������, �� ������� �� ������ ���� �����������, ����� �� �������� ��� ������ ���������.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //��� �, �� ������ �� ����� �������� ���� �� ������ - �� ������ ����.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"������ �������� ������������ ������� ��������.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //������ �������� ������������ ������� ��������.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //��� ��� ��������, � � ������� �������� ����� ��������������. �� ���� ����� ���������� ���� ����.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //��� �� �������� �������� ������� �������� �������������, ������������ � ������-��������� ����� ��������.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //�� ��� ��� ��� �� ������ ��� ������, ��� �� ��������� ���� ������. ������� �� �� ������������� ������� ��������.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //��, ��...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //������� '��'! �� ����� ��������� ���, ��� ������� ������, � � �������, ��� �� ��� �������.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"���� ���� �������� �������������� �������. ������, ��� �������, ��� ��� ���� ������ ���������� ���� ����. � ��������� ��� �� ������� ����� ������ �� ����� �������."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(�����������) �������� - �����������, ������� ���� ��� ��������� ���������. ��� ��� �����.
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"� ���� ������ ��������� �����.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //� ���� ������ ��������� �����.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(���������) ��� �� ������ �... �� ������ ������ ��������� �����?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //��, � �������� �� ����� ����, ������� ������...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(����� ���������) �� ����� ����� ����. �� ����� ������, ��� ��������� ����������� ������� ��� ����������� ����� ���������. �� ������ ������������ ���� �������.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //� ���� ������ ��� ��������� - � � ������ ���.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(��������������) ���� �� ������������� �����������, ������ ����� ���������� ���� ����� ���������.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //� ��������� �� ����������� ��������� �����.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //� ����� ������ - ��� ���� � ����. ����� �� ������ �����, ������ �� ����� ������� ������ ���� ���� �������, ������� �� ������ ������ ���������.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //�� �������� ����� ��� ����� �����.
	
	B_LogEntry (TOPIC_FireContest,"� ���������� � �������� ������ ��������� �����. ������ � ������ ��������� ��� ������� ������� ������.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"� ����� ������ ���� ���������, ������.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //� ����� ������ ���������, ������.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //� ������ ������ ������ ������, �������� �� �� ���. �� ������ ���������� ���� �� ���������, ��� � ��������� ����������.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //��������� ������. (��������) ��, ��������, ������, ��� ������ ���� �� ����������� ������ ������ ��� ���������.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //�������. � ��� ��� ���������?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //����� � ����� �������� ������ ����� �����������, ������� ������ ������������� ����� ���������: ����, ������ � ����. ��� ��� ���������� � �������.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(���������) �� ������ �� ����! ������ ����� ����� ���������: '������ ������ ������ � ������� ��, ��� �������� ������� � ����� ����'.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //���� ����������� ���� ����.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //��� ���, ��� �� ����� ������� ����.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"������� ���� ��� ��������� ������. ��� �� �� ����� ���������, ��� ������ ������ ��������� ���������� ����, ������ � ����.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"� ������ ��������� ������ ������ � '�������� ��, ��� �������� ������� � ����� ����'. ����� �� ��� ��� ����.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //���� �� �� �������� ��� ���������, ��� ������ ������� ����.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //���� �� �����? ���, ������� ���������!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //������ ����� ����������� ���� ������� ����� ������. ���� ��� �� �������, ���������?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"� ����� ������ ������.";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //� ����� ������ ������.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(�����������) ��... ������ ���?! �� �������� ������ � ����� ������� ������...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //... � ����� ����� ������� ���� ��� ��������, ��� ��� ������� ���� ����� �������.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //� ������ ����������? ��� ������ �����? ��� �� ��������� ����?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //��� �� ������. � �����, �� ���� �� ������� ������ ��� ���������.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //��� �, � ����� ������, �� ���������, ��� �� ������ ��� ���������. � ���� ������ ������ ������ ����.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Pr�fung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //�� ������ ���������, �������� ������� ���� �.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //��...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //... ���� ��� ���������� ������ ��������� �������.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //... ���� ��� ���������� ��������� ������� ����������.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"������ � ���� ������ � ������� �����?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //������ � ���� ������ � ������� �����?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //�� ������ ���. �� ������ ��������� �����. �� � ������ ������ ���� �������, ��� �� ���������� � ����.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(����������) �� ����� �������, ��� �� ���������� ��������� ��� ������, ����� ����� ��������� ������ ������.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //����, ���� �� ����� ������� ������ ����, �� ������ ������ � ���� ����.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"� ����� �������� � ���� ����.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //� ����� �������� � ���� ����.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //������, ����� ������� ������ ����.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(������������) ��������� �� ��, ����� ����� ������ �����������, ��� ���� � ���������� ����...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //... ��� � ����� ������� � �� ����� ���� ��� ����� ���� ����� ����� � �����...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //... �� ��� ��� ���� ���� ���� � ���� �� ������ ����� � ���� ��������� �������� � ����� ����� ����� �� �������?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //�������.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //��������� ����� ���� ������, �� ������������� � ���������� ����.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //���� ��� ���� � ���� ���� ������ ��.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//f�rs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //������, ����� �� ��� ������ � ���� ����, �� ������ ���������� � ������ �������, ����������������� ���������.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //��� ����� ����� ��������� �����, ��� �� ��������� ��������. ��� ��� �� ������ ������ ������������ � �������.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //�� �������, ��� �� ��������� ��� ����� ����������.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"��� � ���� ������� ������?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //��� � ���� ������� ������?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //������ �����, ������ �� ������ ����� ������� ����� �����. ��� ����� ���� ������ ��� ������.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //��� ���� �� ������ ����������� � ����� ������ �����, ��� ����� �������� ������������ �� ������� ��������.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //�� ������� ������ ������� ���������� � ����� ������� � ���������. ������ �� ��� ���������������� � ������������ �������.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //������, ��������, ������ ������, � ������ ������ ���� ����� ����.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //����� �� ����� ������ � ����� ����, ��� ������. ������ ����� ������� ���� ������ ��������� ����������� - � �� ������ ���� � ������ �����.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //�� ������ �� ��� ����� ����� ���� ������ �������� - ���� �� ������ ������ ��������� ���.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"������ ������ �������� ���� � ������ ����� �����.");
	
	B_LogEntry (Topic_KlosterTeacher,"���� ������ ������� �������� ������.");
	B_LogEntry (Topic_KlosterTeacher,"���� ������ ����� ��������� ���� � ����� ����.");
	B_LogEntry (Topic_KlosterTeacher,"���� ������ ����� ��������� ���� � ����� ���� � �����.");
	B_LogEntry (Topic_KlosterTeacher,"���� ������ ������� ��������� ��������� ������.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"� ����� �� ��������� ���������...";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //� ����� �� ��������� ���������...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //����� �������� � ���� ����, ������ ��� �������� ������ �� ������ ���.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //����, ����� �� ����� ���� ������ ��� � �������� ����?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"�������.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"������� ���������� ���� ���������� ������������ ���.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"������� ���������� ������� �������� ������ � ����������.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"������� ���������� ������� �������� � ���������.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //�������.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(���������) �� ����� ���. ����� ��� ������������ �� ������� ����.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //������� ���������� ������� �������� � ���������.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //�� ����� ���.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //����� ���������� ����� ��������� �������� � ���������, � �� ������ ����� ���������, ������� ������ ��������.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //������� ���������� ���� ���������� ������������ ���.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //�� ����� ���.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //� ���� �������, ��������� ���� ����� �������� �� ������������ ���.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //������� ���������� ������� �������� ������ � ����������.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //�� ����� ���.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //� ���� ������� ���������� ������� ����� ��������� ������� ������� ������.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"� ������ ������� �� ����� ������ ...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //� ������ ������� �� ����� ������. �� ����� �������� �������������� ����������� �������� � ����� ���.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //������� � ������ ����������� � ������ �������� � ��������� ��� ��� ��������������.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //������. �� ��������� ���� ������. ������� ������ ���������� ���� � �������.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //�� ������ ���� �����.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //� ����������� � ������ ��������.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //������. ��� ��� �� ��� ������ ���� � ������, ���� �� ����� ������.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //������� ��� ������� ����� ������ - �� ������ ���� �����.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"����� ���� ���������� ����� �����.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //����� ���� ���������� ����� �����.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //����� ������� ������ � ��� ���, ��� �� ������ ���� � �����. ������ ��������� � ��� ���, �� ����� ��� ���.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //�� ��������� ������. � ���� ����������� ��� ���� ����, ����� �������� � ���� �����.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //� �������� ����, �, ���������. �� ������� � ������ ���� - �� ��������� �� � ����� ���� � �������� ����.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //������ �� ������ ������ ������� ����� ���������� ����� �� ����, ���� �� ���� �������.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //�� - � ��� ����. ��� ������������ ��������� �����, ����� �������� ����.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //�� ������� ��� ������ �� ����, ����� ��� �������� ���� �� ������.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //��, �� ����� ������� ������� ���� �� ������ �������� �����.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //� �� ��������� ������.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //������ �� ������ ��� �������������, � ���������!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //�����, ���� ������ � ����� ������, ���������� ����� ��������, ������ ���������� �����.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //��� ��� ��������, ���� � �������� ��������� �� ����, ������� �� ������������ ���.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //����� ��� ����� ��� �� ������. ����� �� �������� ���� ������ �� ����, ������� ����� ������� ����, � ����� ����.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"����� ���� (�������� ���)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //����� ����.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //��� ������ ������ ����� ����.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"���� ������� ������ ...";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //���� ������� ������. � ���� �������� ��� ���������� �����������.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //��� �, �� ������ �����, � ���� ���� �������. � ����� �������, �� ������ ������� � ����.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ���� �������� ��� ���������� �����������.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //� ���� �������� ��� ���������� �����������.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //� ��������, ��� ���������� ������� ����� ����� ����, �� ���� �������. ���� � �� ���� �������� ����, ��� �������� �� ��� ������.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(�������������)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //���������� ����, ������.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //��� ������ �������������? ��� ��� �� �������� ��.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //�� ���������� ������� ���� ��������� ����� ������ ������ ��������� �����. �� �������� � ����� �����.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //�� ������� ����� ����� ����� � ����� �� ���� ���������� �����, �� ������� ���� ������� ������.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"� ������ �� ������ ������ ��������.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //� ������ �� ������ ������ ��������.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //��� �� ������ ��������?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //���� ����������� ��� ����� �� ����� � ��������.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //�� ��� ������ ��� �� ������� - �� ��� ������ ������������ ����� ����?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //�����, � ������� ���� ������ � ������, �� ����� ������������� ����������� ������.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //��� ���������� ������, � ���� ������ ��� �������.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //�� ���� ������ ���� � ������ �����.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //� ����. ��� ������. ����������� ������� �� �����������. ����������� ��. ��� ���������� �������� �����.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //������ ���������, �� ������ �� ������ ����� �����. ������ �����, � ��������� ������� �� ����� ������. ��� ��� ���� ���������.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"������� ��������� ��� �� ������, ����� � ������ �����. ��� ����������� �������. �� ����������� ����, ��� ��� ����� ������� ���� ���������. ���� ��� ����������, � ������ ���������� ������������ � ���������."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //� �������� ������� �������� ���� ��������. ��� ��������� ����� ������� ����� ������ ��� ��������, ��� �������� ��� ������ �����.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"������� �������� ������� ������������� ������, ��������� �� ������."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //��� - ��� ���� ������ ��������� ���� ����� � ���������, ���� ���� ����������� ������.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //�����, �� ������ ��������������, ����� ��� ���� �������� �����.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"� ������, ����� ������� ���� ������.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //� ������, ����� ������� ���� ������.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //� ����, �� ������� ���������� ����� �� ����� ������ ������ ���� ������.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //�� �����, ��� �������� ������������ ����. �� ����� �������� ����������� ����� �����.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //���� ������ ��� ����� ������� �� ���� ��������� ����.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "��� ��� ��������� ����� ������� ��������, ������?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "��� ������ ���?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //��� ��� ��������� ����� ������� ��������, ������?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //��� ������ ���?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //��� �������, � ������ ��������� �����. ������ ����� ����� ������, ��� ��� ��������� �� ���� �����, ����� ������� ��������� � ����� ���� ���������.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //�� � ��� ��� ��� ����� ��-�������. ���� ������ ��������� � �������� �� ������ �����, � ������ ���� � �� ������ �������.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //��� ����� �������� ������, ��� �� ������ �� ������ ������ ����������, � �� ���������� ��������� �� ����� ���.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //���� �� ����� ����� ������ ��������������, �������� �� ��������� ���� ���� ����, ���������� ������� ���� ���� � ������ ��� � ��������� ����������� ������. ��� �����.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //���� ������� ��, ������ ��� ����� ������� ��������� ���� ���.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //����� ������ ���� ������ ����� � ���� ����� ��������� ����� � ����� ����.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //� �����, ��� �� ������ ������� ����� ������� �������� �������, �� �������� � ��������� ������� ���������, �������� ��� ���������� ������� ����.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschu� freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist f�r den SC nun als Traitor bekannt. Mu� hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "����������. ���� � ������ ����-�� ���������. � �������, ��� ������ �� ��������� ��������� ������-�� ���������� ������� ����, � ������ ��� �������� ������� �� ���������� ����� � ���������, ��� �� ��� �� ������ ���� ����-������.");
 	B_LogEntry (TOPIC_TraitorPedro, "��������� ����� ����� ���� ������ �� ���������. ��� � �������, ���� ���� ������ �� ���� ��� �����, ����� ����� ����� ���������.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"���� ������� ���� ���?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //���� ������� ���� ���?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //����� ���� ��������� �����������, ���������� ���������� ���, � ����������� � �������� ������.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //������ ���������� ��������� �� ��� � ������, ����� ������� ���� �����, �� ��� �������� �����.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //���� �� ������ ������� ��, �� ����������, ���� ����� �� ���� ������������.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"� ����� ���� ������.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //� ����� ���� ������. �� ���������.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //��... ����� �� ����� ����. ��� ���������?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //��� ���������� � ���� ���� ��������� ������ ��������������� ����. ��� ����������, ��� � ������ ������� ������.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //��� ��������� �������� ����� �� ���������� � ����� ���������� � ������� ����.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //�� �������� � ���� �����! ��� ���������� ��� ���� ������.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //���� � ����� ������ �������� �� ��� � �����������, ��� ��� �������� ����� �����.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "��� �� ������ ����� �������?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //��� �� ������ ����� �������?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //���� ���� ����� �����. �� ��� ��, ���� ������� �������� ����������� ��������� ������ ��� ����.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //�� ������ �������� ���� � ������������ ��� ����� ����. �� ����� �������� ������ ���.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //� ���� ����������� ���� �� ����, ��� ������ ���� ���� ���. ��� ������ �����, �� ���������� � ��������� ��������� � ����� �����.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //��� � �����, � �������, ���� ����. � ���� ������� ��������, ������ �� �����, ��� ����� ������. ������ ���� ���, � ����������.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "������ ������?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "��� ����� ���� ������?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "������� �����, ����� � ������� � ���� ���� �������, ������������ � ������,  ������ � ���, ��� ����� ������� � ������������ ������.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //������ ������?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //���������� ������� ���� ���� �� ���� ���� ����� ��������� ��� �������, ����.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //������ ����� �������. ������ ������ ����� ���� ����� �������� ��� ���������� � ���� ������� ���.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //��� ���, ��� ���� ����� �����.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //��� ����� ���� ������?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //������ ��� ��� ���� � ���������� ��������� ������������ � ����� ����� �� ����� �������������, ����� �������� ������ ������ �����.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //��� ����� ����������� ��������� ����� ������.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //� ���� ������� ���� ����� ����� �� ����������, ��� ��� ���� ����� ��������. � ��� �� ��� ���������.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"� ������� � ��������.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //� ������� � ��������.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //��, ������. ��� ��?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //�� ������� ������ � ����� ������, ����� �������� ���� ������.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //���� ��� ������, ��, ����� ����, � ��� ��� �� ���� �������.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //������ �����, ����� ������� � �� ������� ��� � ����.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //���? ������� ���� ����� ���? �� ���� ��� �� ��������.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //��������. ��� �� ��� �������. ������ ����������.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //������ � ����� ���� �������. � ����� �� �����. ������ �� ����� ���� ����.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //������ ��� �����, ��� ���� ������� �� � ����� � ����� ������?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //� �� ���� �������� ��������. � �� �����, ��� �� ��� ��������� � ���.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //������, �� � �� ���� ������ ������� ��� ����� ��������.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"��� ���� ������ �� ��������� ...";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //��� ���� ������ �� ���������. ������ �� ������ �������� ���� ������.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //�� ������ ���������� ��������.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //� ������ �� ���� ��������, �� �������? � ���� ��� �� ��������� ��������������, ��� ������� �� �������� ������ ���. � �� ���� ������� ���.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //� ��� ���� � ������� ���� ��������������?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //�����, ��� ����������. ��� ������ ����  ���-��, ��� ������������� �������� ����.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //��� �������� ��������, �� � ���� ������� �������� ������ ����, ��� �� ������ ����� ���������� �� ���� �����������.

	B_LogEntry (TOPIC_INNOSEYE, "�������� ����� � ����� �������, ����� �� ������ � ��������. � ������ �������� � ���������, ��� ��������� �������� ������� ������� � ������� � ����� ������.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"� ������ ��� ����� �� ��������.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //� ������ ��� ����� �� ��������.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //��� ���� ��� �������.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //������.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(���������) �� ��� ����������! �� ������ ���� �������� ������������� � ���, ��� �� ������ ��� ��� ���?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //����. ���.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(�������) ��� �������, ����� ���������� ��� �� ����� ��������� ����.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //�� ��� ������, ��� �� ������ ��������, � ������ � �����, ��� ������� ��� ��� ����� ����, ��� ������� � ���.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //��� �� ������ �������������� �� �������?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //��, � ����������� � ���� ������, ��, �������, �� ������, ��� � �������� � ������ ���������� ��������.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //�� ����� ����, � ��������� ��������� ����� ������ ���������, ��� �� ������ ��� ����� ������� ������ ���. �� ���� ��� ��, �����������, ����� ������� ������.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //�������� � ����� ������.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "�������, �������, ���������� ����������� � ����� ������.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"�� �������, �� ������� ������������ ����?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //�� �������, �� ������� ������������ ����?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //������ �������. ������� - ������.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"�� ������� ���. ���� ������ �������.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //�� ������� ���. ���� ������ �������.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //� ����� �� �����, ��� ��� ��������.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //��, ������.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //�� ��� ������������ �������, ��� ����� � ���������� � ������ ����� ����� ����.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //� ����� ��� �� ��������� ������ ������ � ������ ������������ ��� ����� �� ����� �����. ������ �� ���� �� ������ ����� ����.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //���� ��� ��������� ���� � ������������ � ���� � ��� �������, ����� � �����, ���� ���.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"��� ��� �������� ������� �����?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //��� ��� �������� ������� �����?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //�� ����� ���� ����� �� ����������� ����. ��� � �������� ��������. ���, ������ ����.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //�����, ��� ���� ����� ������� ���������� � ��������, ������ ��� �� ������� ��������� ���.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es f�gt ihnen auch unertr�gliche Schmerzen zu, wenn du es bei dir tr�gst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //���� ����� �������� �������� �������� � �����, � �������� ������.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //����� ����, �� ���� ������ �� �� ����.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //������, ��� ���� �� �����. ���� �������� ����� ��������� ��� ���������� ��������.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //��� ����� ���� ����������� �������� �� ������ �������, ������� ����� ���������� � ������ �� ������������ �����.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //������ ����� �� ������� ������������ � ���������� �������.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //�������. � ������� ���.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //������ � ���� ���� ��� �����������. ��� ��. � ���� �� ��� ����� �������.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"������ � ����� � ������� � ���������. ���� ������ ������� ��� ���������� ��. �� ������ ��� �������� � ����� � ���������, � ������ �� ������ ������ ���. � ������ ���������� � ���������, ������ ��� �������� ��������. �������� ������� � ���, ��� ���� ������ ���� ���� ������ ���, ����� � ������������ � ����� �� ���. ����� ������������ ���� ����� �������, ��� ���������� ������ ������� � ������ ��������. � ������ ���������� ����������� ������ � �������� �� ���������� ������ �� ������������ �����, ������ ��� ������������� ������� �������."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"� ����� �������� ��������.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //� ����� �������� ��������.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //��? ��� ��� �� ��������?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //� �� ������. � �����, �� ������ �����, ��� ������ � ���.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //��������, ��� ����� ��������� ����. � ���, ��� �� ������ ��� ���. ��� ���� �����.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //� �������, ��� �� �� ������������. ��� � ����� ��� ��� ����� ���������.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //� ����������, ��� ��� ���������� ������.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //��� ���������� ���, ����� �������������� ���������� ���� ����� �����.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //���, ��������, ���������� ����� ���, ��� ��� ��������� ��������, � ��� �����.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //��������. � ��� ���� ��� ���������� ������. ��� ������� ���� �����, ���������� � ���� ������.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //����� ���� ����� � ������� ��� �� �����. � ��������� �� ���.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //�� ������� �� ������ �������� ���� �� ���� �� ��� �������. �����, ��� ������� ��� � ��� �������������.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //� �� ������ ������, ����������� ���������� �� ��������������. �� ��� �� ����� ��������� �� ����.

		B_LogEntry (TOPIC_DEMENTOREN,"������� �����, ����� �������� ��������� �� ������ �����. �� ��� ��� ������ ����, ���� ������ ��������� ������� ����������. � ���� ������ �������� ������� ����� ��������� ����� �����."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //�� ����������� � ������, ����� ��� �������� �����.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //���� �� ��� �� �������, ��� �� � ��������� �������������� �� ����, ����������� �� ��� ��� ����� ������.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //������ �����, � ���������, ���� ���� ����� ���� �������.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //� �� �� ���������� ���� ��� ������� ������?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //������ ��������. ������ ����� ����� ���-������ �� ����.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"������ ������ ������ ��� ����� ������ �� ���������� ���� ������."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(�������� �����������)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //������ ����, ������, ��� � �������.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //�� ����� ���! ������ ��� �����. ��� ������� ���� �� ������ ��������.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //�� ������� ���� ����� �� ���� �������.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //�������� �� ��� ����� � ����������� ������� ������� �����.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //�� � ������������� ���� - ���� �� ������ �������� � �� ���� ������� �����, ����� ������� ���, ��� �������� ��� �� �����. ������ ����� �� ����.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //� �����, � �������. �� ������ �������� ����?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //��� ������� ���������� ������ �������� � ����� ���������, ��� ���. 300 �������.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "��� ������� �����.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "�������. ��� ������.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //�� �� ������ ��� ������� ���������� �����. �������� �� ���, ������ ���� ���� ������������� ����������� ������.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //�������. ��� ������.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //���, ����� ���. �� ������� ���� ����� �� ���� �������.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //������� ��� ������, � � ����� ������ ����.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //��� ������� �����.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ���� ���������� ��� ���-��� �� ���� ���������.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //� ���� ���������� ��� ���-��� �� ���� ���������.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //������, ����.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold f�r einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //� ����� ��� ���� ��������.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //� ����� ��� ��������� ���� ������.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //��� ������. �����, �������, ��� ��� ������ �� ���. ��������� ������.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //������ �� ��� ��� �������. �� � �� �����, ��� �� ������ �� ���.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //�� ��� ������ ����� ���� ���� ��������� ����.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //� ���� �������, ���� ���� ������� ����� ���.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //���, ������. ��� ��� �� ���������, ������� ������� ���� ������������� ���.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //� �� ������� ����� �� ������� ����������� � ��� ���������� ������.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //��������, ��� ���������� ��������� ��� � �������, ��� ����� ���� ��� �� ������� � ���������.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"��� ������� ������.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //��� ������� ������.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //��� �������� ������� �������. �� ��� ���������� �� ������ ���� ���������, ������� ������� �����������.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //������ ��� ��� �� ����. ������ ��������. � ����� ��� ������ � ������ ��������� � ���, ��� �� ��������� ��������� ����, �� ����������� ���� �����������.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //����������� �������� ������� ����� ��������� ����, �� ����� ������������. ��� ����� ������� ��� ��� � ������.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"� ������� � ���������.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //� ������� � ���������.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //��� ��� �������?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //��� ��� ����� �������� � ���� �� ������� � � ���, ��� �� ��������� � �������� ��������.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //�� �������� � ���� �����. ������ ���� ����������� ���� ���� � ������ ���������� ����� ������������ � ��� ���.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"��� ����� ��� ������� ��������?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //��� ����� ��� ������� ��������?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //��������� ���� ������ ���� �������. ����� �� ����� ������� �� ������. �� ����, ��������, ����� ������� ���� �� ����.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //����� 40 ��� ����� �������� � �������� ����� ����� �������� �������� ���� ����������.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //������������ ������ ���� ������� ������ ���, ����� �������� ��� �������������� ���������� � ������.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //����� ������ ���� ����� ���� ��������� ������ ������������� �� ��������� � ������ ������� � ���������.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //���� �� �������� ���������� � ���������� ��� �����, ����� �������� ����� �� ��� ��������...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //... �� ����� ���� ��� ��� ������ ����, ��� ������ ������������.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(����������) �����������. ����� ����. ��, �����.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //�� ������. �������� ���������. ������� �������� ������������� ������������ ���� ����, � ������ ����� ����� �������� ����� ������.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //�������, ������� �� ������ ����� ���� ����, � � �����, ��� ����� ���� ��������� � ����� ������� ������.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //���������.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"�������� ��������, ������� �������� - ��� ������� ���� ������ ���� �������. � ������ ����� ���� ����."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"����� ��������, ������� ������� ���������� - ��� ���?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //����� ��������, ������� ������� ���������� - ��� ���?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //� ������, ��� �� �������� ���. ��, �����, ��� ����� ����������� ��� ����.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //��� ������� ��� ������ �����. � ����� �� � ���� �� ����� ��������, �� ������� �� �� �������� ������� �� - ��� ������.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //���� ��������� ������� ������ � ���� ������� �����.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //���� � ������� ��� �����?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //���� ���� ������. �� � ����������� ���� �� ����, ��� ���� ������� ��������� ���, ��� ��������� ��������� ���������� ���� ������ ���������.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //�� ��� �� �� ������ ����������, ������� �� ����� �������������� ����.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"����� �������� '������� ��������' ��������� � ������ �������� ���������. �� �������� �������. ���� �� ������ ������� ��� �����. ��� ������� �� ��� ������ ����� � ��� �������� � ���� ��������."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"� ���� ������� ����� ��������.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //� ���� ������� ����� ��������.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //���?! ��� � ���� ��� ����������? ��� ��� ������ ���� � ���!


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "������� ��������� ��� ������.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "������ ������ �����, � �����.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //������ ������ �����, � �����.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //�� ������ ������. �����!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //���� ���� � �� ���� ������� ��� �����, � ����� �������� ���-�� ����� ���� � ������� ��������� ��...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //... ��� ������� ���� �� �������� �����������...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //�����. ��� ��� ��, ��������, ������������, ��� ���� ������� ��� �����, �� �, �������, ������� ���� ������� �� � ����. �� ������� ����, ���� �� �� ��������� ���� ������.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //������� ��������� ��� ������.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //��, ��� ��� ���. ��� ���������. ��� �������� ������ ���������, ��� �������� ������� �������� �� ������� ���� ����.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //� ������������� ����. �� ���������� �� ������ ����� ������� �������. �� ������ �������� �� ����.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"� ���� ����� ����������� ��������� ����������.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //� ���� ����� ����������� ��������� ����������.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //� ��� ��� ��?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //� ����������, ����������� ��� ����� �������. ���� ��� �� � ��� �� �������?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //���. ��� ��� ���������� ������ ����, �� ������?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //�������. �� ������ �� ������ � ���. ���.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"������� ������ �� ����� � ������ ����������. ������, ������ ������� ����� � ���."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"� ����, ��� ����� ������ ������� ��������.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //� ����, ��� ����� ������ ������� ��������.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //���� ���� ��������� �� �������. � ����� ������� �����, ������� ������� ����.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //��� �����������. ����� ���� ����������� ������� � �������, ����� ��������� �� ����� �����.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //�� �����, ��� �� ������ ������ �������������, ���� ������ ���������� ���������� ��������.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //��� ��� ����� �������?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //���� ������� ������ �������� �� �����, ������� �� ������ ��������.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //�������� �� ������ �������� � ������� � ���, ��� ����� ���� ������� ���� �� ���� �������.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //���� ���, ���������, ����������� ���. ��, � ���������, � �� ���� �������� �� ������ �������� �� ���������.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //���� �������� �������� ���� �� ��������� ����� ����.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"������ - ������� �����.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //������ - ������� �����. �� ��� �� ������ ��� ��������� �� ������� �������.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //�����, ��� ����� �� ��� �� ������.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //�� ���������� �������� � ����� ���������. �� �� �� ������ �������������� ������ � �� ������ ����.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //������ ������ ������� ��������� ���� ������, � ����� �� ������ ������� ���, ���� ���������.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //������� ������� ��� ������?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //�� � ������ �� ���� ���� ����� ���� ���������. ���� �������� �������� ���������� ������� �� �� ��� ������.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //������� � �� ���� ��������� ���, ���� �� �� ���������� ��� ������ � ����� �����.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"� ��� ����� �������, ����� � ��� ������� ������� � ����� ������?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //� ��� ����� �������, ����� � ��� ������� ������� � ����� ������?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //���. �������������, ���� ���-���, ��� �� ��� �� ������� ��� ����. ���� ������� ��������� � ��������� ����� �� ������ ���� � ����.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //��� �������� ��������� ��, ��� ��������� ��������� ���� � ��� ����� �������� �������� ����.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //����� ����� ������� ������� ����� � ����, ��������� ������, � ������ �������� ����, �������� ��� ���� ������.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //������ ����� ��� ��� �� �������. ���, ������� ��� ��� ���������� � �������� ��� ����������.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //����� �� ������� ������� �������.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"�������� ���� �������� � ������ ��������. ���� � �������� ��������, ��� ��� ����������, � ���� ����� � ����� �������.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"����� �������� ������ ������ �� ����� ����������.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //����� �������� ������ ������ �� ����� ����������.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //��� ��� ��� ����... ���, �������, � �� ���� ���� �����.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //���� ������ ���� ��� ��� �����, ������ ������� ��� �� ���������.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //�� ������ ���� �����.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ����������� ����������� ��������� ���� ������.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //� ����������� ����������� ��������� ���� ������.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //���� ������ - ��� ������, ������� ����� ������ ������ ���������� ���� ���� ������ � �������.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"���� � ����� ���?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"��� ������ ���� ������?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //���� � ����� ���?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //���? ��� �� � ��� ����������� ������?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //��������� ������ ��������.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //��, �������. � ��� ���� ���� ������, �� ��������� � ��� �������.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //��, �������.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //� �� ����, ����� ��� ����� �������� �������� ��� ����� � ������-������ ��������.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //��������� ��� �������, � �� ������ ���� �����.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //��� ������ ���� ������?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //�������, ��� ����� ��������� ������� ��� � ������� ������������.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //�� �������� ������ ��������� �� ���� ����� �����.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"��� ����� ����� ������?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //��� ����� ����� ������?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //����� ������ - ��� �� ����� ��� ������ ������� ������. � ��� ���������, ��� � ������ ������ ����������� ����� ����� ������� � ��������.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"�������.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"� ����� ��� �����.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //�������.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //� �� ����, ��������� �� �� ��� ����������� ����� ��������, �� � ����� ����������, ��� ������ ����� ����� �������� ��� ������ ������� ������.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //� ����� ��� �����.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //����� �� ����� ����! �� ���� �������� � ���!
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //� ��� ����?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //���� ��� ������������� ��������� ����� ������, ��...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(���������) ���� ��.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //�� �������� ����. ���� ��� ������������� ��������� ����� ������, �� �� �������� ������� ������ ������ �����.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"��� ��� ����� ��� ����� ������?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"��� �� ������ � ���� ��� '�������'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //��� ��� ����� ��� ����� ������?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //����� ����� �������, ��� ��� �������� ��������� � ��������, ����� ����������� ������, ����� ��������� ���������, ��� ������ ���� ������.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //����� ������� �� ���� ��� � ����� � ��� ���. �� ���� �����, ��� ������ ��� ���� ����������� �������, � ������ �� 13 ���.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //����� � ����.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //����, �������� ��� ����� � ������������� ��, �������� ������������������ ���� � ������� ���. ��� ���������� �������� ������, ���������, � �������� ������� ���.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //��� ����� ������� ������� �������� ����. ��� ����� ������ �� ����, �������� � ��������. �� ��� ���� ������-�����, � ������ ��� ����� 250 ��� � ��� ���, ��� ��������� ��� ������ ����� ������.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //��� �� ������ � ���� ��� �������?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //������� ������, ��� ��� ������������ ���� ����������, ����� ������ ����� ������� ����� ������������������ ����.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //�� ���� �������� ���������, � ��� �������� ����� ���� ��������.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //���������� ����������� ������� ������� ���� ����� �������� ������ ��������� ������ ������.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //�������.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //�� ��� ����� ����� ����� ��������� ��������� � ������. ������ ����� ������ ������ ����� ���� ��.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //������ ������� - ���� �������� ������ ������� - ������� ����������� ������.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































