///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Martin_EXIT   (C_INFO)
{
	npc         = Mil_350_Addon_Martin;
	nr          = 999;
	condition   = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Martin_PICKPOCKET (C_INFO)
{
	npc			= Mil_350_Addon_Martin;
	nr			= 900;
	condition	= DIA_Addon_Martin_PICKPOCKET_Condition;
	information	= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen (65, 77);
};
 
FUNC VOID DIA_Addon_Martin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};
	
func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Martin_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Martin_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //����, �� ���������? ����� ���������� � ��������, ���� �� ������.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //������� �� ������ ������� � �������. ��������, ����� � ���� �������� ��� ���� �����.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Hallo_Condition;
	information	 = 	DIA_Addon_Martin_Hallo_Info;
	
	important	 = 	TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //��, ��! ������ ���� ����� ������. ����� ����� ���������� ������ �������� � ���� �� ���������.
};


///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Martin_WasMachstDu_Info;

	description	 = 	"� ��� ��� �� �����?";
};

func int DIA_Addon_Martin_WasMachstDu_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //� ��� ��� �� �����?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //����� �������� ������ ����������� ������� ���������.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //� - ���������, � � ������� �� ��, ����� �� ������� ������ �� ������������ �����. � ���� ����� �� �����.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //��� ��� �� ������ ����� ������, ����� ���������� ��� ���.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_PreTrade_Condition;
	information	 = 	DIA_Addon_Martin_PreTrade_Info;

	description	 = 	"�� ������ ��� ������� ���-������ �� ����� ���������?";
};

func int DIA_Addon_Martin_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_PreTrade_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //�� ������ ��� ������� ���-������ �� ����� ���������?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //��-�... ������ ���, ���� �� ������������� ��� �� ������������, ������� � ���� ���������, ����� ������� �����������, �� �� ����� ������������.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //� ����� ��������� ������� �����?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //���, ���� ��������� �������, ��� ��� � �������.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //�������.
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Farim_Condition;
	information	 = 	DIA_Addon_Martin_Farim_Info;

	description	 = 	"� ������ ������ �������� � ����������. � ���� ��������� �������� ���� ����.";
};

func int DIA_Addon_Martin_Farim_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Farim_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //� ������ ������ �������� � ����������. � ���� ��������� �������� ���� ����.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //� ������ ���� ��� ������ ������������?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //��, � ���� ���� ������������ ������� ����� ���������.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //������ ����� ���� ������. �� ����� �������� ���� �� ��� ����� �����.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //� �������, � ��� �� ��������.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //����! ��� ����� � ���� ��� ����� �� ������� �����!
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //����� ������ ��������, ����� �� ������ �� ��� � ���������, ��� ������ � ���� ��������� � ����������.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //� ��������� � ���� �����.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"��������� ������ ����������� �� ����."); 

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP (XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	80;
	condition	 = 	DIA_Addon_Martin_Trade_Condition;
	information	 = 	DIA_Addon_Martin_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"��� �� ������ ���������� ���?";
};

func int DIA_Addon_Martin_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};
var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info ()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader, LogText_Addon_MartinTrade); 
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //��� �� ������ ����������?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //��� �, ������ �����������.
};


///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Rangerhelp_Condition;
	information	 = 	DIA_Addon_Martin_Rangerhelp_Info;

	description	 = 	"���� ������ �����. �� ������, ��� �� ������ ��� ������.";
};

func int DIA_Addon_Martin_Rangerhelp_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};		
};

func void DIA_Addon_Martin_Rangerhelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //���� ������ �����. �� ������, ��� �� ������ ��� ������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //��? � ��� �� ���� �� ���� �����?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //� ���� �������������� � ���������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //(�������) ����, �� ������ �������� � ���� ����? ��, ������ ��, �� ����� ������ ��� ����� � �����.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //����, ��������, ��������...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //������ ���� ����������� ��� ����. ������ �����, ��� ����� ������� ��� ��, ����� �������� � ���������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //(���������) �� ������. ����� ������ ���� �����������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //���� �������, ��� ������ ���������� - �� ��� �������. ����������� �� ����� ����� ������� � ������� ������ �� ������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //� ������ ���, ����� � ����� ������ ������������ � ������� �������, ���-�� �������� � ������ � ��������, � ������ � �����������, ��� ���-�� �������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //(�������) �������� �������, ��� ��� �������� ������ �� ��������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //� ��� ������ �������. �� ���� �� � ��� ���� ������� �����, ��� ��������� �����.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //��, � ������ �������...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //� �����. �� ������, ����� � ���������� �����, ���� �� ����� � �������.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //���������� ��� �����.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"� ������ ������� �� ������� ���������� �������. ���� � ������ ��������, ������� ������ ���� �� ������, ������ ������� ��� �������� � ���������."); 

}; 

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Auftrag_Condition;
	information	 = 	DIA_Addon_Martin_Auftrag_Info;

	description	 = 	"������, � ��������� �� ������ �������.";
};

func int DIA_Addon_Martin_Auftrag_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //������, � ��������� �� ������ �������.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //�������.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //����� � ����� � �������. � ���� ����, ���� � ���� ���-������ ��������.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //����������� ������� � �������� �� ������. � � ��� ����� ���� � �������.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(���)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartOtherRoutine	(MIL_321_Rangar,"PalCampKlau");
};



// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_FromVatras_Condition;
	information	= DIA_Addon_Martin_FromVatras_Info;

	description	= "�� ����� ��������, ������� ������� ������ ��������?";
};
func int DIA_Addon_Martin_FromVatras_Condition ()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_FromVatras_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //�� ����� ��������, ������� ������� ������ ��������?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //��� ���� ��� ������?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //������.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //����. �� � ��� �� ������ �� ���� ����?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //�������, �� � ���������� �������� ������.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //����?..
};	
///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_TellAll_Condition;
	information	= DIA_Addon_Martin_TellAll_Info;

	description	= "�������� ���, ��� ���� �������� � �������� �������?";
};
func int DIA_Addon_Martin_TellAll_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_TellAll_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //�������� ���, ��� ���� �������� � �������� �������?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //�� �����, ��� �� ���� ����� ���� �� ����������� ���������, ������� � ������� ��������.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //����� ���������� ������ ���� ���� ����� �� ������� ���������.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //�� �� ��� ��� �� �����, ��� ������ ���������� ���������.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //���� ���� ������ �������� ����������� � �������, ��������� �� ������� ���� �� ���� ��������, �� ��������, �� ������� �����-���� �����...
	B_LogEntry (TOPIC_Addon_BanditTrader,"������ ����������, ��� ��������� ������ - ���� �� ����������� �������, ������� � ������� ��������."); 
};	
///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_AboutBandits_Condition;
	information	= DIA_Addon_Martin_AboutBandits_Info;

	description	= "������ �������� � ���������?";
};
func int DIA_Addon_Martin_AboutBandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_AboutBandits_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //������ �������� � ���������?
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //�� �����, ��� ��� ���������� ������ �� �������, ����������� ����� � �������.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //��� ��� ��������, ��� ��������� ���� ����� ��� �������� ������� ������ ������.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //�����, ������ ����� ����� ��� ������ ����, ����������� �� �������� ��������������� � ���� ��������.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"������� ���������� ������ �� ������� ����� ������� � �������. ��������, ��� � ����� �����, ����������� �� ���������� ������."); 
};	

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Fernando_Condition;
	information	 = 	DIA_Addon_Martin_Fernando_Info;
	permanent	 = 	TRUE;

	description	 = 	"������ �������� �������...";
};

func int DIA_Addon_Martin_Fernando_Condition ()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //������ �������� �������...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //��� ���� ������� ������?
	
		var int FernandoHints;
		FernandoHints = 0;
		
		if 	(
			(Npc_HasItems (other,ItMw_Addon_BanditTrader))
			||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
			||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
			)
			{
				
				if (Npc_HasItems (other,ItMw_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //����� ����� � ����� � ��������. �� ����� ������������� ����� '�'.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //� �������� � ����� ��� ������. ��� ��������� �� �������� ��������.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //���� ������ ������ � ������ ������������ �������� ����� �������� ����� ��������.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //� ����� ����, ��������, ������ �������� �� �������� ��������, �������� � ���, ��� ����� ���� � ���������.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //�������� ������, ��� �������� �������� �������.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //�����, ����� ����������. ����, ��������... ��� �, �� ������� �� ��������.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //� �� ������ ��� �������� ���� ���, ����� ���� �������� �� ����.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //�� ������-�� ��� ��������� ������ ����� ����� �� ��������.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //������ �������, �� ������ ������� ����.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //������ ����� �������, ����� ������ ��� �������.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"������ ����������� � ���, ����� �������� ��� �������. � ������ �������� �� ���� �������."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //�? ��� ���?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //��� ���.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //������, �������, ��� �� ���������, �� ��� ������ ���� �� �� ������ �������� ��� �� �������.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //� �� ���� ���������� ���� �� ��������� ����� ������ �������. ���� �������� ����� ��� �����-�� ��������������.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //����� ������������. ���� ����� ����� ��������� ����������� �� ������ �������� �� �������� ��������.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //�����, ���� �������� ���������� ����������� �������� � ���������� ���� ��������� ���������� ��� ������ ������.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //����� ����, ���� ����� ��� ��� ���������� � ��������...
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //��� ���, ��� � ������ �������?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //�� ������ ��������, ��� ����� �� ���������� �������� ������, � �������� ��� �������������� ��� ����.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //�� ��� ������ ���� ������������� ������������ ��������������. ����� � �� ����� ���������� ��������.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Martin_Perm_Condition;
	information	 = 	DIA_Addon_Martin_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� ����� �� �����?";
};

func int DIA_Addon_Martin_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //��� ����� �� �����?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //(�������) ��������� ������, �� ������ ��� �������� ��� �����! ��� ��������� ����� �������!

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //����������� � ������ � ������ ���� �������, ������� ��� ������! �� ���� �����?
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //� ���� �����, ����� � ����, ���� ��������������!
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //�����, �����, ������. ���������� �� �� �������� ����� ���� �� �����, ������� ����������� �� ���� ���� �����.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //�������� �������� � ����� ������� ������� �����, ��� ��� ���� �� ������.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //������ �� ������, ����� � ������ ������. ���� ��� �������?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GotRangar_Condition;
	information	 = 	DIA_Addon_Martin_GotRangar_Info;

	description	 = 	"� �����, ��� ������ ����.";
};

func int DIA_Addon_Martin_GotRangar_Condition ()
{
	if (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GotRangar_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //� �����, ��� ������ ����.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //� ����� ������ ������� ������.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //�� �������-��. ������ �, �� ������� ����, ���� �����, �� ��� ��� �������������. ��� �������! ��, ���� � ��� ������...
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //� �-�� ������ ���������, ������ �������� ������ �� ��������.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //�? ������?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //��� �� ��������! ��� ������ �� ����� �������� ������ ������� ��������� �� �������. ��� ��� �� ��� �� ���� ����.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //������� ������, ��������.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //���� ���� ���-������ �����������, ������ �����.

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GetMiliz_Condition;
	information	 = 	DIA_Addon_Martin_GetMiliz_Info;

	description	 = 	"�� ������, ��� ��� �� ���� �����.";
};

func int DIA_Addon_Martin_GetMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_GotRangar))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GetMiliz_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //�� ������, ��� ��� �� ���� �����.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //�, ��. �� ������ �������� � ���������, �����?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //��� �, �� ��� ������� ���, �� ��� ��������.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //������ ���, � �� ������ ����� �� ������ ���� �� ����� �������, ��� �� ����-���� ���.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //������� � ������ ����. ������ ��� ���������������� ������ � ������ ��� �����, ������ ���������.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //�� ������� ��� � ��������. ������, �� ������ ����� ���� ����������.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"������ ��� ��� ���������������� ������ ��� ����� �����. �������� ���, ����� ������ ���� � ���������. ����� ����� ����� � ��������."); 
};


