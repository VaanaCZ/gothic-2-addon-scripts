///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_AngarDJG_EXIT   (C_INFO)
{
	npc         = DJG_705_Angar;
	nr          = 999;
	condition   = DIA_AngarDJG_EXIT_Condition;
	information = DIA_AngarDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	5;
	condition	 = 	DIA_AngarDJG_HALLO_Condition;
	information	 = 	DIA_AngarDJG_HALLO_Info;

	description	 = 	"� ���� ����?";
};

func int DIA_AngarDJG_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_00"); //� ���� ����? �� ��� �����. �� ��� ����������� � �������� ������.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_01"); //(��������) ���� ���� ������ �������. � ������� ���� �����. �������� ������� ������ ���.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_02"); //�������, �� ��� �������, ��� � ���� ���� ����. �� � ����� �� ����� ������.
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_03"); //��� � �����?
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_04"); //��. � ��� ����� ��� ��������� �����. ��� ���������� �������...
	B_LogEntry (TOPIC_Dragonhunter,"� ����� ������ � ������ ��������.");
};


///////////////////////////////////////////////////////////////////////
//	B_SCTellsAngarAboutMadPsi
///////////////////////////////////////////////////////////////////////
func void B_SCTellsAngarAboutMadPsi ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00"); //�������� ������� ���� ���������� ����.
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01"); //���� ������ ������ �� ��������� ������ ��������� �����, �������� � ������ ����, � ������� ���, ��� ��������.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02"); //� ��� �� ��������?
	};
};

func void B_SCTellsAngarAboutMadPsi2 ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00"); //������ ��� ������ ����� � ����� ���������� ������� ���.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01"); //���� ���������! � ������ � ��� ��� ����! �� ���� ������� ������ ������ �� ����������, �������.
		B_GivePlayerXP (XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Wiekommstduhierher
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WIEKOMMSTDUHIERHER		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	6;
	condition	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Info;

	description	 = 	"��� �� �������� �����?";
};

func int DIA_Angar_WIEKOMMSTDUHIERHER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_15_00"); //��� �� �������� �����?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_01"); //����� ��������� ����������� ������� � ��������� � �����. ����� ������ ����� ���-�� ������.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_02"); //� ��������� ���� ������ ���, ���� ���������� �� ������� � �����. �� ��������� ����, ��� ���������. � �� ����.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_03"); //� ��� ��� ����, � ����� ������� ������, ������� ��� �� ���� ������ ����. � ����� � ���, ���� �� ����� ���.

	Log_CreateTopic (TOPIC_AngarsAmulett, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett, LOG_RUNNING);
	B_LogEntry (TOPIC_AngarsAmulett,"����� ������� ���� ������ � ������ � �������� �������� ����� ���."); 


	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, DIALOG_BACK, DIA_Angar_WIEKOMMSTDUHIERHER_gehen );
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "� ��� ������ �� ������� ���� ������?", DIA_Angar_WIEKOMMSTDUHIERHER_amulett );

	if (SC_KnowsMadPsi == TRUE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "�������� ������� ���� ���������� ����.", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	}
	else
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "� ��� ��������� � ������� �� ��������� ������?", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	};

	if (DJG_Angar_SentToStones == FALSE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "��� �� ������ ������ ������?", DIA_Angar_WIEKOMMSTDUHIERHER_nun );
	};
};
func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00"); //� ��� ������ �� ������� ���� ������?

	if (DJG_Angar_SentToStones ==FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01"); //���-�� �� ���, ������ ����� ����, ��� � ������� � �����.
		B_LogEntry (TOPIC_AngarsAmulett,"���� ������ ������ ���� ���-�� �� ���. ����� ���������� ����������� �� ��� ������."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02"); //�� ������ ���� ���-�� ���.
		B_LogEntry (TOPIC_AngarsAmulett,"������ ��������� ����� �������� � ����� �� ��� ������ ��������."); 
	};
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03"); //� ����������, ��� �� ��� �������. ��� ������ ���������� ������� ��� ����.
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_andere ()
{
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi ();
	}
	else
	{
		AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00"); //� ��� ��������� � ������� �� ��������� ������?
	};
	
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01"); //���������, ��� � �����, - ��� ��������� �������, ���������������� ��������������� ������.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02"); //��� ������� ���������� �����. �� ����� �� �����, ������� �� ����. ���� �����... �� ���������� ��� ������.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03"); //� ����� ����� ��� ���������, ��� �������� ��� �������� � ������� � ����, ���� ��������� ��������.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04"); //� ������ � �� �� �����.
	
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2 ();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00"); //� ��� �� ������ ������ ������?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01"); //� ������� ������� �������, � ����� �������� ������ ����� �������.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02"); //� ������ ���-�� � ��������.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03"); //����� �������, ��� � ������ �������� ������ ����� ������ - ��������� �� ���.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04"); //� ����� �������������� � ���.

	Angar_willDJGwerden = TRUE;

};

func void DIA_Angar_WIEKOMMSTDUHIERHER_gehen ()
{
	Info_ClearChoices	(DIA_Angar_WIEKOMMSTDUHIERHER);
};

///////////////////////////////////////////////////////////////////////
//	Info SCTellsAngarAboutMadPsi2
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_SCTellsAngarAboutMadPsi2		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Info;

	description	 = 	"�������� ������� ���� ���������� ����."; //Joly: falls erst nach DIA_Angar_WIEKOMMSTDUHIERHER  (SC_KnowsMadPsi == TRUE)
};

func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition ()
{
	if (SC_KnowsMadPsi == TRUE)
	&& (Angar_KnowsMadPsi == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info ()
{
	B_SCTellsAngarAboutMadPsi ();
	B_SCTellsAngarAboutMadPsi2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_FOUNDAMULETT		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_FOUNDAMULETT_Condition;
	information	 = 	DIA_Angar_FOUNDAMULETT_Info;

	description	 = 	"� ����� ���� ������.";
};

func int DIA_Angar_FOUNDAMULETT_Condition ()
{
	if 	(Npc_HasItems (other,ItAm_Mana_Angar_MIS))
		&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void B_AngarsAmulettAbgeben()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_15_00"); //� ����� ���� ������.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_04_01"); //�������. � �� �����, ��� ������ ������� �� ����� ���.

	B_GiveInvItems (other, self, ItAm_Mana_Angar_MIS,1);
	
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP (XP_AngarDJGUndeadMage); 
};

func void DIA_Angar_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();

	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "� ��� �� ����� ���������?", DIA_Angar_FOUNDAMULETT_besonders );
	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "��� �� ���������� ������ ������?", DIA_Angar_FOUNDAMULETT_nun );
};

func void DIA_Angar_FOUNDAMULETT_besonders ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_00"); //� ��� �� ����� ���������?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_besonders_04_01"); //��� �������.
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_02"); //�������.


};

func void DIA_Angar_FOUNDAMULETT_nun ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_nun_15_00"); //��� �� ���������� ������ ������?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_01"); //���������� �� ���� ��������� ������.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_02"); //����� ����, �� ��� ����������. ������.

	AI_StopProcessInfos (self);
	if 	((Npc_GetDistToWP(self,"OC_TO_MAGE")<1000) == FALSE) //Joly: Damit Angar nicht am OC Tor rumkronkelt, wenn er noch im OC ist.
	{ 
		Npc_ExchangeRoutine	(self,"LeavingOW");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DJG_Anwerben
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DJG_ANWERBEN		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	8;
	condition	 = 	DIA_Angar_DJG_ANWERBEN_Condition;
	information	 = 	DIA_Angar_DJG_ANWERBEN_Info;

	description	 = 	"����� ����, � ����� ������ ���� ����� ������.";
};

func int DIA_Angar_DJG_ANWERBEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DJG_ANWERBEN_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_15_00"); //����� ����, � ����� ������ ���� ����� ������.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_04_01"); //������ �� � ���. ������ ������� �� ��������.


	if (DJG_Angar_SentToStones == FALSE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "� ������ ����.", DIA_Angar_DJG_ANWERBEN_gehen );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "��� �� ����������� ������?", DIA_Angar_DJG_ANWERBEN_wo );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "����� �� ������������� � ����?", DIA_Angar_DJG_ANWERBEN_wann );
		};
	
	if (Angar_willDJGwerden == TRUE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "��� ������ ��������� �� ��������?", DIA_Angar_DJG_ANWERBEN_DJG );
		};
};
func void DIA_Angar_DJG_ANWERBEN_DJG ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_DJG_15_00"); //��� ������ ��������� �� ��������?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_DJG_04_01"); //� �������� � ���� �����. �����, �� ���������� ������� ����.

};

func void DIA_Angar_DJG_ANWERBEN_wann ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wann_15_00"); //����� �� ������������� � ����?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wann_04_01"); //��� �������, ��� �����.
};

func void DIA_Angar_DJG_ANWERBEN_wo ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wo_15_00"); //��� �� ����������� ������?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_01"); //� ����� �� ��, ����, ��� � ��� �������.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_02"); //��� ���� ����� � ������, ���������� ����� �������.

};
func void DIA_Angar_DJG_ANWERBEN_gehen ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_gehen_15_00"); //��� ����� ����.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_gehen_04_01"); //���� ���������.
	
	AI_StopProcessInfos (self);
};




///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WASMACHSTDU		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	9;
	condition	 = 	DIA_AngarDJG_WASMACHSTDU_Condition;
	information	 = 	DIA_AngarDJG_WASMACHSTDU_Info;

	description	 = 	"���-�� �� ���?";
};

func int DIA_AngarDJG_WASMACHSTDU_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01")<8000) 
		&&	(Npc_KnowsInfo(other, DIA_Angar_DJG_ANWERBEN)) 
		&& (DJG_AngarGotAmulett == FALSE)
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_00"); //���-�� �� ���?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_01"); //�� ������� ���? � ����� ������� �� ������ ������ �������� ����!
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_02"); //��� �� ������ � ����? � ������ �� �����!
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_03"); //��� ����� ��������� ������� � ������������. ������� ����� �������� ���� � ����� ����� ����.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_04"); //��� ��������� �����-�� ��������, ��� �������� ����� ����������� �� ����������� ����� ����.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_05"); //� ����� ������, ��� ��� ������ ��� ������� ���-�� �����.

	if (Angar_willDJGwerden == TRUE)
	{
	Info_AddChoice	(DIA_AngarDJG_WASMACHSTDU, "�� ������� � ���������� �� ��������?", DIA_AngarDJG_WASMACHSTDU_DJG );
	};
};
func void DIA_AngarDJG_WASMACHSTDU_DJG ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_DJG_15_00"); //�� ������� � ���������� �� ��������?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_01"); //��. �� � ������, ��� ��� ����� ��������, �������� ����, ��� ���� � ��� � �������� ������.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_02"); //� ��� ����� - ������ ����� ������� ����� �������. ��� ������ � ���� ������.
};


///////////////////////////////////////////////////////////////////////
//	Info WhatsInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WHATSINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	10;
	condition	 = 	DIA_AngarDJG_WHATSINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WHATSINTHERE_Info;

	description	 = 	"��� ���������� � ���� ������ � ������?";
};

func int DIA_AngarDJG_WHATSINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WASMACHSTDU))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WHATSINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WHATSINTHERE_15_00"); //��� ���������� � ���� ������ � ������?
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_01"); //���-��, ��� �� ��������� ��� ������������ � �����!
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_02"); //��� �������� ���������� ��������. � ����� ��� �����, �� ��� ������. �������������� ��������.
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_03"); //�� ������ ����� ���������, � � ���� ���� �����������, ��� �� ���������� ��� ����� ������ � ��������� ��, ��� �����.

	//Log_AddEntry (TOPIC_Dragonhunter,"Ich habe Angar im Minental gefunden. Er vermutet, da� sich in der Felsengruft, wo er sich aufh�lt, ein Drache befindet, der hier seine untoten Helfer an die Oberfl�che entsendet.");
	B_LogEntry (TOPIC_Dragonhunter,"� ����� ������ � ������ ��������.");
};

///////////////////////////////////////////////////////////////////////
//	Info WantToGoInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WANTTOGOINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	11;
	condition	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Info;

	description	 = 	"������ ������.";
};

func int DIA_AngarDJG_WANTTOGOINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WHATSINTHERE))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WANTTOGOINTHERE_15_00"); //������ ������.
	AI_Output			(self, other, "DIA_AngarDJG_WANTTOGOINTHERE_04_01"); //� ��������. �� ����� ���� �����������.

	AI_StopProcessInfos (self);  

	if (Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine	(self,"Zwischenstop"); 
	}
	else
	{
		Npc_ExchangeRoutine	(self,"Angriff");
		DJG_AngarAngriff = TRUE; 
	};
		self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageDead
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UndeadMageDead		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UndeadMageDead_Condition;
	information	 = 	DIA_AngarDJG_UndeadMageDead_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UndeadMageDead_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02")<1000) 
		&& (DJG_AngarAngriff == TRUE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UndeadMageDead_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UndeadMageDead_04_00"); //(������ �����) ����� ������ ������ � ����������. � ������ ������� ������.
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"RunToEntrance");
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageComes
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UNDEADMAGECOMES		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UNDEADMAGECOMES_Condition ()
{
		
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_13")<500) 				
		&&	(Npc_KnowsInfo(other, DIA_AngarDJG_WANTTOGOINTHERE))
		&& ((Npc_KnowsInfo(other, DIA_AngarDJG_UndeadMageDead))==FALSE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UNDEADMAGECOMES_04_00"); //(������) ���, �����! �� ������� ���?
	
	AI_StopProcessInfos (self);   
 	
 	Npc_ExchangeRoutine	(self,"GotoStonehendgeEntrance"); 

};

///////////////////////////////////////////////////////////////////////
//	Info Wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WASISTLOS		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	14;
	condition	 = 	DIA_Angar_WASISTLOS_Condition;
	information	 = 	DIA_Angar_WASISTLOS_Info;

	description	 = 	"� ��� ����?";
};

func int DIA_Angar_WASISTLOS_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_STONES")<1000) 				
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)	
			{
					return TRUE;
			};
};

func void DIA_Angar_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WASISTLOS_15_00"); //� ��� ����?
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_01"); //� �� ���� ���� ������ � �����.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_02"); //���-�� ������������ ���, ��� ��� �� ��������� ������ �����.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_03"); //� �� ���� ��������� ���, ��...
	
	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_04"); //� ������ ������� �� ���� ��������� ����� ��� ����� �������, ����� ���� ���� �� �� ������, ��� � ���� �������.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_05"); //������ ���, ����� � ���� ������ �� ����... ������� ���, � ���� ���������� �������, ��� � �������� ������ �����.
	};

	AI_StopProcessInfos (self);

	B_LogEntry (TOPIC_Dragonhunter,"����� ������ ��� ����. ��-�� ���� ���� ������ � ���� ��������� �������, ��� �� ��������� ������ ����� �� �����.");
			
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"LeavingOW");
};

///////////////////////////////////////////////////////////////////////
//	Info Whyareyouhere
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WHYAREYOUHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 15;
	condition	 = 	DIA_Angar_WHYAREYOUHERE_Condition;
	information	 = 	DIA_Angar_WHYAREYOUHERE_Info;

	description	 = 	"�����? ��� �� ������� �����?";
};

func int DIA_Angar_WHYAREYOUHERE_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_CAVALORN_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_Angar_WHYAREYOUHERE_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WHYAREYOUHERE_15_00"); //�����? ��� �� ������� �����?
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_01"); //� ��� � �������, ����� ���������� ��������� �� �����. � �� ���� ���������� �� ���.
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_02"); //� ������� �������, � ����� ����� ����� ������. �������� �� ������ �������!

	B_LogEntry (TOPIC_Dragonhunter,"� �������� ������ �����, �� ������� � ������ ��������.");
	B_GivePlayerXP (XP_AngarDJGAgain); 
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_PERMKAP4		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	condition	 = 	DIA_Angar_PERMKAP4_Condition;
	information	 = 	DIA_Angar_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"�� ������������� ���������� ����?";
};

func int DIA_Angar_PERMKAP4_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WHYAREYOUHERE))
		{
				return TRUE;
		};
};

func void DIA_Angar_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Angar_PERMKAP4_15_00"); //�� ������������� ���������� ����?
	AI_Output			(self, other, "DIA_Angar_PERMKAP4_04_01"); //�������. �� ������ ����. ��� ��������.

	AI_StopProcessInfos (self);	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Angar_PICKPOCKET (C_INFO)
{
	npc			= DJG_705_Angar;
	nr			= 900;
	condition	= DIA_Angar_PICKPOCKET_Condition;
	information	= DIA_Angar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Angar_PICKPOCKET_Condition()
{
	C_Beklauen (47, 55);
};
 
FUNC VOID DIA_Angar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Angar_PICKPOCKET);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_BACK 		,DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};
	
func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};

















































