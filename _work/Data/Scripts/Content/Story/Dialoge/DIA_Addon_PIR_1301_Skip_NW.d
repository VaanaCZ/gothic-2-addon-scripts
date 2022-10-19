
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //�� �������-��! ������� ���� ����� �����?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(���������) ���������, �� �� �� �������� �� ������, �����?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //� ��� ��������?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"��� ��?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //�� ��� �����?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //�� ����, ������ ��� ������ ���� ��������. �� ���� �� ���� ��� ���������, �� ���� ����� ����. ���� ������� ��� ���?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //���-��� ���� �����?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //������� �� ������� �� ������ � �����? �� ���, ����� �� ����������� �������, ��������?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //� - ���� �� ����� ������� ������������ ��������. ������ �� ������ �������� � ������� ���� �� �������, ������� � ���� �����. 
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //�� ���, �� ������ ��� ��� ��� �������.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "�� �����?", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "� ������ ���� �����?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "�� �������! ������ � ���������!", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //�� �������! ������ � ���������!
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //������? �� ������������� ��� ��� ������?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //� �-�� ����� ��������� � �����.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //������, ��� � ����� �� ������.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //���� �� ����� �� ������� �� �������.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //������, �� �� �� ������������ ���� ������?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //��-�...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //��� � ����� �� ���������. ������� �� �������� ������ - � �� �������.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //� ������ ���� �����?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //����� �� ����� ������, ��������, ����� ������� ����� �������� ���� ��������.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //�� �����?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //��, ���� ������. ��� �� ��������. �����, � ������ ����������.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //�� ������ ��� ��� ������, ��� � ����� ������� ���� �����.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"��������? �� ����� ��������?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //��������? �� ����� ��������?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //���������� �������.
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //� �� ������ ��� ��� �� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //���� ��������� �������� ������ ������, ������, ����� ��� ���� �������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //���� �� � ������ ��� �� ���� ���������...
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"����� ���� ������� ���, ��� ��������� �������� �������� ������������ � ��������."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"� ���� ��� ���� ������� �� ���������.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //� ���� ��� ���� ������� �� ���������.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //���? �� ������ �� ��� �������� �� ����������?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //�����, �� ������ ������ �� ���� �����������. ��� ��� ������� �� ����� ������� ������?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //�� ������, ��� ��� ����� ��� ������� ����.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(�������) �� �������! ������� �� ���������� ���� �����, ����� �� �������� �� �������, � � ���� ��� ������� �������� ����-�� ���������.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //���, ������� ��� ��� �������. ������ � ����.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"������ ��?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //������ �� �������?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //�� ������ �����, ��� ���� �������?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //��� ���������, ��� � ������ �� ������� ���������.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //� ����� �� ������� � ���� ��� ����� � ������� ���������.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //� ���� �� ����� �������� ��������� ���, ��� ��� ����� ���� �� �������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //������ ������� �������� ����� � ����� � ������� �� ������� ����, ���� ��������� ��. ����, �������, ��� �� ������ �������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //����� ��� ����� ����� ���������� ����� �����, � ��� ����� �� �������, �� ���� ���������� �������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //������ ����� ������ ��� ��������, � �� �� ����� �� �� ������ �� ���.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"�� �� ������ ������ � �������� �� �����?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //�� �� ������ ������ � �������� �� �����?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //� ���� ����� �����, � ������� ������� �� �����.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //���-��� ������������ �� ������ �������� �, ������, ������� ����� ����.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //��� ����� �� �������� � ������. � �� ���� ������� ��� � ������, �������� �� ����.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //��...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //��������, ��� ��� �� ���������.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"������� ����� �����.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //������� ����� �����. � ��� ����� ��������� �� ��, ��� �� ������� � ���� ����.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //���... ���������, ��� �� ��, ��� �� �������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //� ���, ����� �� ������������? ���, � ����� ���� ��������� ���������� �������. ��� ��� �� ������ � ������ ��� ������� - ���� ���������� �� ��������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //�� ��������� ��������� ������ ��� ���� ������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //������� ��� ���� ������� ������. ��, ������, ����� ����, ������� �����������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //�� ����� ��� ����� �������� ������� ������. � �� ���� �� ��������� �������������, ��� ��� ���������� � ���� ������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //�� ����� ���� ���������� ��.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"� ��� �� ��������?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //� ��� �� ��������?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //� ��������, �������. � ��� �� ���? ������� �������, ������� ����������� �� ����� �������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //� �� ������ �����, � �� ����� ��������.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //� ��������, ��� ����� �������! �������. ��, ��� ����� ��� �������.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"����� �������� �� ������� ������������ �������� ��������. ����� �������� ����� � ��� �� ����� �����."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"��������� '�������' ���� �� ����������. ��� ����� ���...";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //��������� '�������' ���� �� ����������. ��� ����� ���...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //���? �� ������ ������, ��� �������� ������������� ��������? ����, ��� �� ����� ����� �������...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //���. ����� �� ���� ��������� ��� ���. ���� �� ������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //�� � ���� �������� ����, ��� ����� ��������, ������� �������� �������� ����� � ���� ����� ��������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //� ���� ���� �����?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //��, ����.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //�� ���-�� ��� ������� ��. ����� ������� �� ��� ������?
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //���.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //� ����� ������ � ����� ���� ��� �����.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //������ �� ������� ������ ��������� ����� ������� �����. �������, �������, ����� ����.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //�� ������� ��������� �������. � ��� �� ��� ����� ��������� ��������� �������� �� ������� �����.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //��� �� � ������� ����, ��� ���� �����.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"���. � ���� ���� ����� ��������.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //���. � ���� ���� ����� ��������.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //������. ��� � ������� ���� ��� ��������������.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //����� �����.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"���� �� �������� ���� �����?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //���� �� �������� ���� �����?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //� ��� ������ ����, � �� ��������� ������������, ��� ��������� ��� ����.
};
