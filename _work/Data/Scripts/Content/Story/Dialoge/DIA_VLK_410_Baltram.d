///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Baltram_EXIT   (C_INFO)
{
	npc         = VLK_410_Baltram;
	nr          = 999;
	condition   = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielflu� hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	1;
	condition	 = 	DIA_Baltram_Sperre_Condition;
	information	 = 	DIA_Baltram_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	&& ((!Npc_KnowsInfo (other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Baltram_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Str�fling aus der Minenkolonie. Mit dir mache ich keine Gesch�fte!
	AI_StopProcessInfos (self);	 
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_Hallo_Condition;
	information	 = 	DIA_Baltram_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	//&& (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Baltram_Hallo_Info ()
{
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //����� ����������, ���������, ���� ����� ��������. �� ������ ��������� ���������������?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //�����, ��� ��� �������� ������������ ����. � ��������� ������ � ���� ��� ���� ����������.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //�� ����� � ��� ����� ��������.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //���� �� ������ ������ � ���� �������� �������, �� ������ ��������.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //� �� ������ ������� ������ � ���, ���������! �� ��� ���� ��������.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese		(C_INFO)
{
	npc		 	= VLK_410_Baltram;
	nr		 	= 1;
	condition	= DIA_Addon_Baltram_LaresAbloese_Condition;
	information	= DIA_Addon_Baltram_LaresAbloese_Info;

	important 	= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //������ �� ��� ������������� �� ���� ��������?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //� ������� � ���� ���� ������ ����.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //�� ���� ���� ����� ��������?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //� ���, ���� ���?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //� ������ �������� ����, ��� ��������� � ����� ����� �����, ����� ��� �������.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //������. � ��������, ����� ��� �������.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //�������.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"��������, �������� �� �������� �������, �����������, ����� ������ �������� �� ��� �����. ����� ����� �������� ������ ����� ������."); 

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	3;
	condition	 = 	DIA_Baltram_Job_Condition;
	information	 = 	DIA_Baltram_Job_Info;
	permanent	 =  FALSE;
	description  =  "� ���� ���� ������ ��� ����?";
};
func int DIA_Baltram_Job_Condition ()
{
	if (MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Baltram_Job_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //� ���� ���� ������ ��� ����?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //���, � ���� ��� ���� ������� �� ����������. �������� ���������� � ������� ����������.
};
///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	4;
	condition	 = 	DIA_Baltram_Trick_Condition;
	information	 = 	DIA_Baltram_Trick_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Baltram_Trick_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Trick_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Trick_01_00"); //�� ����� ������?
	AI_Output (other, self, "DIA_Baltram_Trick_15_01"); //�������, � ��� �����?
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //��� ������� �� ���������� �� ��������, � � ��� �������� �� ������� �����.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //� �� ������� �� ���������� ��� ������?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //� ��� ���� 50 ������� �����.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //�������, � ��������.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //������, ������ ����� �����, ��� ���� ������ �. �� �������� ���� �����. ������� ��� ���.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"�������� ����� ���� � �������� �������� �� ����������. ������, � ������ ��������� ��� ������� � ����� �����.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "���� � ������� ��������� ��� �������, �� �������� ��� 50 ������� �����.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_WAREZ_Condition;
	information	 = 	DIA_Baltram_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"������ ��� ���� ������.";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //������ ��� ���� ������.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"�������� ������� ���������� �� �������� �������.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //�� �� ������ ���������, ����� ��� ����� ��� ������. ������ ��� ���� �� ��������� ���� ��������.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //���-�� �������� ����������� ������ ���� ���������!
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //����� ��� �� ������ �� ���� �� �������.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //������?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //������� �� �������� �������� � ���� ���������, � ����� ������ ���� ���, ��� ����� ������ �� ���������.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //������ ����������, �� ���������� ���� ���� ��������.
		
		MIS_BaltramTrade = LOG_FAILED;
		
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_Skip_Condition;
	information	 = 	DIA_Addon_Baltram_Skip_Info;

	description	 = 	"������, �� �������� � ��������?";
};

func int DIA_Addon_Baltram_Skip_Condition ()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_Skip_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_00"); //(���������) ������, �� �������� � ��������?
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_01"); //(���������) ���? ��� ���� ��� ������?
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_02"); //� ������� � ����� �� ���. ������, �� ���� ���� � ����� �����.
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //��� �� ��� ���� ������? ������� ������ �������. ������ �������������, ��� �����.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "�� �� ������, ��� ���� ����� ��������?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "�� �������� �� ��� ���������!", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //��� ���, ��� � ����� ������.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //�� �������� �� ��� ���������!
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //��������! ����� � �������� ���� ���, ��� � ����, � �� �� ������� ���� ��������, ������?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "� ��� �� �� ��������?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "��� �� ������ � �������?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //�� �� ������, ��� ���� ����� ��������?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //� �������, ��� ����� ��������. �� �� ���� �������, �����?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //�������, ��� �� ������ ������� ��� �� �����.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "� ��� �� �� ��������?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "��� �� ������ � �������?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //� ��� �� �� ��������?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //� ��������, � �������� �� ���.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //� �� ��� ������� �� ��� ������ ��� �� ��������.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "��� ���, ��� � ����� ������.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "� �� ��� ��������� ������ ������ ����.", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //(����������) � �� ��� ��������� ������ ������ ����.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //��� ���� �� ������������. � ������ �� ���� ������� �� ������.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //���, ������ ���� ����� � ������� �����, ��� �� ���� ��� ��� ����� ������ ����.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //��� ������� ��� �������.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"�������� ��� ��� �����. � ������ ������� ��� �����."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //��� �� ������ � �������?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //��� ����� � ��������� ����� �������.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //��������� � ����, ������� ���� ����� ������ �� �������. 
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //������ �������� �� ������. ��� � �������, ���� ������ - ��������� ����������.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //������ � ������, ��� ������� ��� ����.
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_SkipsRum_Condition;
	information	 = 	DIA_Addon_Baltram_SkipsRum_Info;

	description	 = 	"� ������ ���. �� ���� ��� ��� ����� ��� �������.";
};

func int DIA_Addon_Baltram_SkipsRum_Condition ()
{
	
	if (Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFo_Addon_Rum) >= 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_SkipsRum_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //� ������ ���. �� ���� ��� ��� ����� ��� �������.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //(�������) ���������� ����������... ��� �� � ���� ��������? �����, ����� �� ����.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //��� �, ����� ��������� � ���� �� ����. �����, ����� ������.
	CreateInvItems (self, ItMi_Gold, 10);									
	B_GiveInvItems (self, other, ItMi_Gold, 10);		

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  4;
	condition	 = 	DIA_Baltram_AkilsHof_Condition;
	information	 = 	DIA_Baltram_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"��� ��� ����� ����� �����?";
};
func int DIA_Baltram_AkilsHof_Condition ()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //��� ��� ����� ����� �����?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //��� ������ ������� �� ��������� �����, ������� ������, ������� �� ���-������.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //������ �� ������� �������� ��������. ����� �� ����������� �� ���, �� ��� ������� ������ ����� �����.
};
///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung	(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  5;
	condition	 = 	DIA_Baltram_Lieferung_Condition;
	information	 = 	DIA_Baltram_Lieferung_Info;
	permanent 	 =  FALSE;
	description	 = 	"� ������ ����� �� �����.";
};

func int DIA_Baltram_Lieferung_Condition ()
{
	if (Npc_HasItems (other, ItMi_BaltramPaket) >=1)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //� ������ ����� �� �����.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //�����������. ������ � ����� ����� ��������� ������� ����������. ��� ���� 50 ������� �����.
	
	B_GiveInvItems (other, self, ItMi_BaltramPaket,1);
	B_GiveInvItems (self, other, ItMi_Gold,50);
	
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP (XP_Baltram_ScoutAkil);
	
	Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	
	CreateInvItems (self,ItFo_Cheese	,  5); 	
	CreateInvItems (self,ItFo_Apple 	, 10); 
	CreateInvItems (self,ItFo_Beer  	,  5);
	CreateInvItems (self,ItFo_Bacon 	,  5);
	CreateInvItems (self,ItFo_Sausage	,  5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_LetUsTrade_Condition;
	information	 = 	DIA_Baltram_LetUsTrade_Info;
	permanent	 =  FALSE;
	description	 = 	"�����, ��� ����� ���������� ������?";
};
func int DIA_Baltram_LetUsTrade_Condition ()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info ()
{
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //�����, ��� ����� ���������� ������?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //��������, ���� �� ��������� ��� 10 �������� � 10 ������� ����, ����� � ����� ����� ����� � ����� ����.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //� ��������.
	
	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_HaveYourWarez_Condition;
	information	 = 	DIA_Baltram_HaveYourWarez_Info;
	permanent	 =  TRUE;
	description	 = 	"� ������ ��, ��� �� ������.";
};
func int DIA_Baltram_HaveYourWarez_Condition ()
{
	if (MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info ()
{
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //� ������ ��, ��� �� ������.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //������.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //�� ������������ �� 10 ��������. ����������� ����� �������� ��.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //� ��� ������ 10 ������� ����? �� ���, ����� ��� ���?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //����, ����� �� ������ ������� ��������, �� � ���� ����� �� ���������� ��������������.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //������ ����� �� ������ ��� ����� ����.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Baltram_PICKPOCKET (C_INFO)
{
	npc			= VLK_410_Baltram;
	nr			= 900;
	condition	= DIA_Baltram_PICKPOCKET_Condition;
	information	= DIA_Baltram_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen (76, 175);
};
 
FUNC VOID DIA_Baltram_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Baltram_PICKPOCKET);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_BACK 		,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};
	
func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};



















