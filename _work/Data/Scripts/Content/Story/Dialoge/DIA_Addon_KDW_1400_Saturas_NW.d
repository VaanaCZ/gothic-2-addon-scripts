///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_EXIT   (C_INFO)
{
	npc         = KDW_1400_Addon_Saturas_NW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Saturas_EXIT_Info()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //��, ��� ������� ������ ������� ���� ������ ��������� �������� � ����� ������ �����, �������� ���� ���� �������.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //������ ���������, ��� � ��� ���.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //�� ������� ��� � ������ ����� ���������.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"������� �����, ����� � ������� � ���� ���� ��������. �� ������ ���� � ������� ����� ������."); 
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nefarius
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Nefarius		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Nefarius_Condition;
	information	 = 	DIA_Addon_Saturas_Nefarius_Info;
 
 	description	 = 	"� ������ ������ ��������� � ����� ���������� ����� ���������. ";
};

func int DIA_Addon_Saturas_Nefarius_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Nefarius_Info ()
{
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //� ������ ������ ��������� � ����� ���������� ����� ���������. 
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //���? ���� ���� �� �����! �� ����� ������������?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //�� ���� ������������. ��� �������� ��� ����. 
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(��������) �� ���� ������, ��� �� �����?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //��, �������� ��� ��� ��� �����...
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //������ �� ���!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //��. � ������� ���� ����������� ������. �� ������� ������������ ���� ������.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //����� ����-������ � ��������, ��� �� ��� ����� � �����. 
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //�� �� ����� � � ���� ��������, �� ������� ����� ������ �������� ������ � �����.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //��� ���� �����...

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"������� ����������� ��� �� ������������ �� ������ ����� ���������, ������� ��������� � ����, � ��������. � ������ ����� � �������� ����-������, ��� ������ �� ����."); 
	};
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Hallo		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Hallo_Condition;
	information	 = 	DIA_Addon_Saturas_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition ()
{
	Npc_PerceiveAll (self);
	if (Wld_DetectNpc (self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Hallo_wei�tdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_00"); //�� ���� ������ ������������� � ���, ��� �� �������?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_01"); //�� ��������� ������ �������� ������� ��������� ����������� ��������, ��� � �������� ��� ���� �� �������.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_02"); //����� �������, ��� ������� ������ ���.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_wei�tdu_15_03"); //��� �� �� ���������, ������? ��� ���� ��������� ��� ����.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_04"); //(�����������) ������� �� ������, �����!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_05"); //(�����������) ���, �� ��� ���� ������, ���� ����� �����? 
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //�� ������? ���!
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //��� ������� ����� ����� ������� ������ ��� ����������� �������� �����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(�����������) �� ������, ����� � ���� �� ����? ��, �������! ��������� �������...
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(�����������) �� ������� �� ��, ��� � �����, ��� �� ������ ��� ����� � ����� ������? 

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(��������) �...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(�����������) �� �����-�� ������� ������� ��� ���������� ������� �� ����� ���� ����, � ����� ������ �����!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(�����������) � ����� ������ ���� ��� ������������!

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "��� ����� ����. � �� �������, ��� �����.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "��� ���� ��� ����� �� �������� ��.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "��� ���� ����������.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //������ �����. ��� ���� ����������� ���� ����, � �� �� ���� ������� �������.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(������) ��� �� ���� �� ������?! ������? ������� �������?!
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //��� ���� �� �������� ��, ��� �� �����. ��-��, �������� ���� ����, ����� ������ ������... ����, �� � ������. 
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //���, �� ��� �� ��� ������� �����, ��� ��� �������� �� ������ ������ � ����� ������� � ��� �������� � �������. 
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(������) ��� ������� ��� ������� ������! ��� ��� ���� ����� ������ ��� � ���� ���������? 
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //���� �� � �� ����������� ���� ���������, ��� �������... ������, ���� �������.
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //��� ������ ����� ����. � �� �����, ��� ������.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //�, � ��, �������, ���������, ��� ������ �� ���� ����� ������?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};



///////////////////////////////////////////////////////////////////////
//	Info keineAhnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_keineAhnung		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_keineAhnung_Condition;
	information	 = 	DIA_Addon_Saturas_keineAhnung_Info;

	description	 = 	"���������� �� �����������.";
};

func int DIA_Addon_Saturas_keineAhnung_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_keineAhnung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //������� �� ����. ������ ��������. ������? 
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //�� ������� ��� ����������� �����. ����� ����� � ���� ����. 
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(��������) � ��������� � ����� �����.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"� ����� ����� ���� �� ����� ��������. ��� ����� ��������, ��� ��� ��� ����������. ������� ���� ������ ��� �� �������. �� ��� ����� �� ����� ������ �� ������� � �������."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info raus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_raus		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_raus_Condition;
	information	 = 	DIA_Addon_Saturas_raus_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Saturas_raus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_keineAhnung))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Saturas_raus_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //�����, ���� � ����� ������ �� ���������.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lares
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Lares		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Lares_Condition;
	information	 = 	DIA_Addon_Saturas_Lares_Info;

	description	 = 	"� ������ ���� � �������.";
};

func int DIA_Addon_Saturas_Lares_Condition ()
{
	if (Lares_Angekommen == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Lares_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //� ������ ���� � �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(���������������) �����? ������? ��� ��?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //� ����. ����� �������� � �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //���? � �� �������� ���� � ��� ������? � ��� �� �����?
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Ornament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Ornament_Condition;
	information	 = 	DIA_Addon_Saturas_Ornament_Info;

	description	 = 	"��� ��, ��� ��� �����. ��������.";
};

func int DIA_Addon_Saturas_Ornament_Condition ()
{
	//if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Lares))
	//&& (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	if ( Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE) )
	|| ( (Lares_Angekommen == TRUE) && Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares) && Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //��� ��, ��� ��� �����. ��������.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //�� ��� ���� ����� ������, ��� ��� ��� ������ �������? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //��� ��� ���� ���? ������ �� ������, ��� ����� ������ ������ ��� ����.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //��, ������ ���, ������. � ���� ������ ��� ���, ���� �� ����?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //�������. ���� ������ �������, ��� �� ����� �������� � ����� ���� ������ ����.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //������ �� ��� ��� ��� ���������� ��-�� ��� ����?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //���� � ����� ��� ������� �� ���. �� ���� ����� ���� ����������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(��������) � � ���� ��� ��� �������, ������? ��-�, ���� �� �����, ��� � ���� �������...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auff�llen, die bei Lares gest�rt haben
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc 	(Giant_Bug, 	"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
  	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITY_TO_FARM2_02"); //auf Treppe
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
};

///////////////////////////////////////////////////////////////////////
//	Info geheimbund
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_geheimbund		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_geheimbund_Condition;
	information	 = 	DIA_Addon_Saturas_geheimbund_Info;

	description	 = 	"� ����� ����� ������ ������ ����.";
};

func int DIA_Addon_Saturas_geheimbund_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_geheimbund_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //� ����� ����� ������ ������ ����.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(�������) ���? ��� �� ����� �� ����? ���?.. �����... � ���� ���!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //�� ������� ���� ������� �������. � ������ ���� �������� ���������!
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(���������� �������) �� ����, ��� ��� ��������� �� �������. ������ � ������� ����, ���� �� � ���� �� ������.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //� ������ ��� ������ ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(��������) ���? ������? (�������������) �������! �� ���� ����� ����, ������� ���� �� �������, �� ������������ ������ � ���, ������� ���� �� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //������������, � ���� ��� �� ����� ���������.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(����) ����������...
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"������� �� ����� ������ ���� � ������ ����. �� ������, ��� ��� ������� ������� ������ ������."); 

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_wasmachstdu		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_wasmachstdu_Condition;
	information	 = 	DIA_Addon_Saturas_wasmachstdu_Info;

	description	 = 	"��� �� ����� �������?";
};

func int DIA_Addon_Saturas_wasmachstdu_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_wasmachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //��� �� ����� �������?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(�����������) � ���� �������� ������� ������� �����. ���������� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //�� �������� � ������� �����, ��� ��� ����� ������� ��������.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //��� �������, ������� �� ������ ������� �� ���������� ����������� ��� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //�� ������ �������� ������� ��� � ������������ ���� ����� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info Erdbeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Erdbeben		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	6;
	condition	 = 	DIA_Addon_Saturas_Erdbeben_Condition;
	information	 = 	DIA_Addon_Saturas_Erdbeben_Info;

	description	 = 	"��� ��� �� �������� ��������� ������?";
};

func int DIA_Addon_Saturas_Erdbeben_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_wasmachstdu))
	&& (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Bedrohung))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Erdbeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //��� ��� �� �������� ��������� ������?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //��� ���� �� �������, ������� �  ��� ������� ���������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //���-�� �������� ��������� ����� ���-�� ��� ����� ������.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //��������, ���-�� �������� ����� ������ ������ ��������� ������� �����.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //�����, ��� ���������� �� ����, ��� ���� ������ ����� ����������� �� ���� �������.
};
///////////////////////////////////////////////////////////////////////
//	Info WhatsOrnament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_WhatsOrnament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_WhatsOrnament_Condition;
	information	 = 	DIA_Addon_Saturas_WhatsOrnament_Info;

	description	 = 	"������ ��� ���� ��� ����� ���� ��������?";
};

func int DIA_Addon_Saturas_WhatsOrnament_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsOrnament == FALSE)
	&& (RitualRingRuns == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //������ ��� ���� ��� ����� ���� ��������?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(�����������) ��� ���� � �������.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //������ � ������ ���� �� �����.
};
///////////////////////////////////////////////////////////////////////
//	Info ScRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ScRanger		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_ScRanger_Condition;
	information	 = 	DIA_Addon_Saturas_ScRanger_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ���� ������ �������� ������ ����.";
};

func int DIA_Addon_Saturas_ScRanger_Condition ()
{
	if (SaturasKnows_SC_IsRanger == FALSE)
	&& (SC_IsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ScRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //������ � ���������� � ������ ����.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC tr�gt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese R�stung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //� ����, �� ������ ������� ����� �����.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //� ����, �� ���� ��� ������ ����. ������������� ������.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //� ��� �� ����� ������ � ����, ��� �� �������� ������.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(�������) ������. � ����� ���� � ���� ����.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //�� �����, ��� ��� �������� �� ���� ������� ���������������.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //� � �������, ��� �� ������ ��������� �� ��������������. ���� ������������ �� �����.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"������� ���������� � ���� ����������� � ������ ����."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //� ��� � ���� �������, ��� ������ �� ���� �� ���?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //������������� ������, ������� �� ������, ����������� ������. � ����.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // �� ��������� ���� ��������? � �� ������ ������ �������.
			AI_StopProcessInfos (self);		
		};
};

///////////////////////////////////////////////////////////////////////
//	Info OpenPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_OpenPortal		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_OpenPortal_Condition;
	information	 = 	DIA_Addon_Saturas_OpenPortal_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� ��� ������. � ������ ������.";
};
var int DIA_Addon_Saturas_OpenPortal_NoPerm;
func int DIA_Addon_Saturas_OpenPortal_Condition ()
{
	if (RitualRingRuns == LOG_SUCCESS)
	&& (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_OpenPortal_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //��� ��� ������. � ������ ������.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(������) ������! ��� ���� �� ����� ����� �����, �� ������ ���� �������� ���� �����.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //������ � ��-�������� ��� ������ �� �������. �� ������ �� ������, ���� �� �������� ��.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //� ���� ���� ��� ���� �������� �� �������.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(�����������) ����. �, ������� ��, �� �� ��������� � ��������� ������ ���?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //��, �-�...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(������) �������, ��� � ��� ������� ������� � ���� �� ���������� ������������. ���� ������ �� �����.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(���������) ���������. ������.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //���, ������ ������. �� ���������� � ������� � �������� ����.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //���� �������� ����, ������ ���������, ��� ������ � ���� ������� ������.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"������� ��� ��� ���������� ������. � ������ ������� ������, ������� ������ � ��������, � ����� ������ ����� ������."); 

			AI_StopProcessInfos (self);		
			Npc_ExchangeRoutine	(self,"OpenPortal");
			B_StartOtherRoutine	(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos (self);		
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //���� ������ �� ��� ��� �����, ��� ���� ����� �������� ���������, ������ ������� � ����.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"������� �� ���� ��� ������, ���� �� �� ������� �� ������� ����, ����������������� � ���, ��� ��� ����� ��������."); 
		AI_StopProcessInfos (self);		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PERM		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Saturas_PERM_Condition;
	information	 = 	DIA_Addon_Saturas_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"�� ������ ������� ���� ����-������ �� ������� �����?";
};

func int DIA_Addon_Saturas_PERM_Condition ()
{
	if (MIS_Addon_Saturas_BringRiordian2Me != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //�� ������ ������� ������� ���� �����?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //����� �� ����� �������� ���?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //���. � ���� ��� ������� � �������� ������.
};
