var int URSHAK_SUCKED;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Urshak_EXIT   (C_INFO)
{
	npc         = NONE_110_Urshak;
	nr          = 999;
	condition   = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HALLO		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	5;
	condition	 = 	DIA_Urshak_HALLO_Condition;
	information	 = 	DIA_Urshak_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (URSHAK_SUCKED	== FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Urshak_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //(����������) ������ �������!!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //����! ��� ����� ����. �� ���� ������� � ������ �������.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //���� ������� ����� ������ �������.
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"� ����� ������ ������� �����-���� - ��-����."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "��� �� ������� �����?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "��������� ���?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //��������� ���?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //���� �������� ��-���? ��� �������� ����.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //��-��� �������� ����� ����� ���� ������ �������� ���-���� ��� ������ � ��� �������. ���� ������� �����, � ���� �� ������� �� ���� �����.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //���� ����� ������ � ���� ����� � �������� ����� ������. ����� ���� ������. ���� �� �������?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //�� ������ �� ������ �����, ����� ������ � ���� �� ����. � ���� �� ���� ����. ��� �� ������� �����?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //��-��� �������� �� ����� � ������, ��� ����� � ������ � ��� �����.
	Info_ClearChoices	(DIA_Urshak_HALLO);
};



///////////////////////////////////////////////////////////////////////
//	Info WasmachenOrks
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASMACHENORKS		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	6;
	condition	 = 	DIA_Urshak_WASMACHENORKS_Condition;
	information	 = 	DIA_Urshak_WASMACHENORKS_Info;

	description	 = 	"������ ���� �������� �� �����?";
};

func int DIA_Urshak_WASMACHENORKS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASMACHENORKS_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //������ ���� �������� �� �����?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //��-��� ������ �������� ����� �����, ��� ���� �� ��� � � ���� ���� �������.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //�� ����� �� ������� ��-���. ��-��� � ��������� � ���� �����.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //������� ��-��� �� ����� ����� � ������� ���� ����� ������ �����.
	B_LogEntry (TOPIC_Urshak,"�� ��� ��� ����� �� ����� ��������� ���� ����� ��������� ���. �� ��� ��� ���������."); 
};


///////////////////////////////////////////////////////////////////////
//	Info soviele
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_SOVIELE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	7;
	condition	 = 	DIA_Urshak_SOVIELE_Condition;
	information	 = 	DIA_Urshak_SOVIELE_Info;

	description	 = 	"������ ��� ����� ��� �����?";
};

func int DIA_Urshak_SOVIELE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_SOVIELE_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //������ ��� ����� ��� �����?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //���� ��������� � ���, �� ������ ���������� �� �������� � ������ ������� �����.
};


///////////////////////////////////////////////////////////////////////
//	Info Zaun
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_ZAUN		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	8;
	condition	 = 	DIA_Urshak_ZAUN_Condition;
	information	 = 	DIA_Urshak_ZAUN_Info;

	description	 = 	"��� ���������� �� ���� ���������� ����� �� �������?";
};

func int DIA_Urshak_ZAUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_ZAUN_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //��� ���������� �� ���� ���������� ����� �� �������?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //���� ������ ������ ������� ����� � �������� ������ � �����.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //����� ������ ��� �����. �������� ���� ����� � �������� �����.
};



///////////////////////////////////////////////////////////////////////
//	Info washastduvor
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASHASTDUVOR		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_WASHASTDUVOR_Condition;
	information	 = 	DIA_Urshak_WASHASTDUVOR_Info;

	description	 = 	"��� �� ���������� ������ ������?";
};

func int DIA_Urshak_WASHASTDUVOR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASHASTDUVOR_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //��� �� ���������� ������ ������?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //��-��� �����, ���� ���������� ����� ��������� ��-��� � ���-���.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //��� ����� ���-���?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //����� ������� �����. ����� ������� ������� �� ������ � ������ ������� ����� ��� �����.

	B_LogEntry (TOPIC_Urshak,"��-��� ����� ����������� � ������� ����� ���-����� � ������� ��� ������� ��-���� ����� � ����� �������."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "��� � ���� ����� ����� ���-����?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "������ �� ����� �� ������� � ����?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //������ �� ����� �� ������� � ����?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //��-��� �������� � �������� �������� ����� ����� � ������ ����� � ����� �������.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //�� ���� ���-��� �� ������� ��-���. ���� ������� ��-��� ���� ������ ��� ��� �����������. ��-��� ������ �������� � ���-���.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //����� ����, ��� ��������� �������.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //��� � ���� ����� ����� ���-����?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //�� ��� ��� ����� ��������� �� ����� ����� � �������� � ������� ������, ����� ���-��� ���� �������������� �����.

};

func void DIA_Urshak_WASHASTDUVOR_weiter ()
{
	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);
};



///////////////////////////////////////////////////////////////////////
//	Info hoshpakDead
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKDEAD		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_HOSHPAKDEAD_Condition;
	information	 = 	DIA_Urshak_HOSHPAKDEAD_Info;

	description	 = 	"���-��� �����.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_WASHASTDUVOR))
		&& (Npc_IsDead(Hosh_pak))
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //���-��� �����.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //���-��� �����? ��������!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //��� ������ ������� ������. ��-��� ������� �� �������� ������� ��� ������ ��-��� �����.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //� �������. ���-��� ��� ����� ��������.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //��-��� ������ ������ ������ ���� ����, ������ ���� ���-��� ��������� �����. ��-��� ���� ����.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //���� ����� ������� ������. ������� ������ �����.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //��-��� ���������� ���� ������� ���� �������.

	B_LogEntry (TOPIC_Urshak,"���-��� �����. ��� ���� ��� ������������ � ������� ���-����. �� ������� �� ������ ����������. � ������ ��������� ���."); 

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	Npc_ExchangeRoutine	(self,"Start");
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");	
};


///////////////////////////////////////////////////////////////////////
//	Info geh
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_GEH		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_GEH_Condition;
	information	 = 	DIA_Urshak_GEH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_GEH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<1000) == FALSE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_GEH_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //���� ����� ������� ������.
	Npc_SetRefuseTalk (self,10);
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info HoshpakRache
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKRACHE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_HOSHPAKRACHE_Condition;
	information	 = 	DIA_Urshak_HOSHPAKRACHE_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HOSHPAKRACHE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<=1000))
		&& (URSHAK_SUCKED == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKRACHE_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //(����������) �������! � ��������, ��� �� ���� ����� ����� ���-��� �������. ���� ������ ������� ������, �����.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //� ����, �� ����� ���� ����� �����. �� ������� ����.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //���� ��������� ����� ����� ����� ����, ��� �� ��� �������. ������ �� ��� �� ����� ��� ���������� � ����� �������.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //����� ����. ��-��� ����������� ������ ��������� � ����� ������.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //��-��� ������ ������� ������ �������� ���� �������. ��-��� �������� ����� ������� ������ � �������� ��� �� ���� ����.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //����� ������ �������� ������ � ���� ������. ��-��� �� ����� ������� ����� ������. ����� ������ ������� ��-��� �� �������.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //��������� ��� �� ����������� �� �����. ���� ����� ������� ������.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"��-��� ��� ������ �����, � ����� ������� �����. ������ �� �� ������� ����� � ������� ��������. ����� ��� �� �������� � ���� �� ����, ���� � �� ���� ��� ���� � ������. � ���� �������, �� ������ �����������."); 
	B_GivePlayerXP (XP_UrshakBecomesShaman);
};


///////////////////////////////////////////////////////////////////////
//	Info keineWahl
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_KEINEWAHL		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_KEINEWAHL_Condition;
	information	 = 	DIA_Urshak_KEINEWAHL_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_KEINEWAHL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKRACHE))
	&& (Npc_IsInState (self,ZS_Talk))
		{
				return TRUE;
		};
};

func void DIA_Urshak_KEINEWAHL_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //���� �������. ��� ������ �� �������� � �����.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















