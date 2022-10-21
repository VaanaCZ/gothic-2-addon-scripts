///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_EXIT   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 999;
	condition   = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kardif_EXIT_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Kardif_PICKPOCKET (C_INFO)
{
	npc			= VLK_431_Kardif;
	nr			= 900;
	condition	= DIA_Kardif_PICKPOCKET_Condition;
	information	= DIA_Kardif_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kardif_PICKPOCKET_Condition()
{
	C_Beklauen (55, 85);
};
 
FUNC VOID DIA_Kardif_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kardif_PICKPOCKET);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_BACK 		,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
	
func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hi		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hi_Condition;
	information	 = 	DIA_Kardif_Hi_Info;
	permanent    =  FALSE;
	description	 = 	"��� ����?";
};
func int DIA_Kardif_Hi_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hi_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //��� ����?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //���� �� ������ ���-������ ������, ���������.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"������ ������� ��������� � ������� � ������.");
};	
	
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hallo		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hallo_Condition;
	information	 = 	DIA_Kardif_Hallo_Info;
	permanent    =  FALSE;
	description	 = 	"����� �������� �� ������, �� ������ ����� �������...";
};
func int DIA_Kardif_Hallo_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Kardif_Hi)
	&& (Kardif_Deal == 0)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //����� �������� �� ������, �� ������ ����� �������...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //� ���� ����� �� ����� ����?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //��� ��� ������ ������� ��� ��������.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //� ������� � ���� ���� ������?
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //������ ����������, ������� � ������ ����, ����� ������ 10 ������� �����.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"������, �������� ������ � ������, �������������� �����������.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"� �� ����� ������� �� ���������� ������ 5 �����.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"������ �� ���� - � ����� ������ ��� ���������� � ������ �����.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"������, ������������.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //������, ������������.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //�� �������� �������� ������ (����������). � ������ � ����� �������.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //� �� ����� ������� �� ���������� ������ 5 �����.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //���, 5 ������� �����? �� ������ �������� ����? (������ ���������� ���) - ����� �������� �� 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"���, ��� �� ������. ����� ����� 6!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"������������, 7 ������� ����� - �������� ����.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //������ �� ���� - � ����� ������ ��� ���������� � ������ �����.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //������, ������... � �������� � �� 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"������������, 7 ������� ����� - �������� ����.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"���, ��� �� ��� �� ������ ����� ���� ����������.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //������������, 7 ������� ����� - �������� ����.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //(����������) ������ �������. ��, ���� ���� ����� ����� ���-�� ������, ��������� �� ���.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //���, ��� �� ��� �� ������ ����� ���� ����������.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //��, �������... (��������) - ������, 5 ������� �����. �� ��� ��� ��������� ����!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"� ������ ������ ���� ����� ������� �� ����?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //� ������ ������ ���� ����� ������� �� ����?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //��, � ������ ������ �� � ������ �����. ��, ��� �� �� �� ���� - ������ ���� ������.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //���, ��� �� ������. ����� ����� 6!
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //�� ����������� �������, ����� � ����. ��, ���� �� ��� �����������, ���������� ���� ��������� � 6 ������� �����.
	Kardif_Deal = 6;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TRADE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TRADE_Condition;
	information	 = 	DIA_Kardif_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"��� ��� ���-������ ������.";
};

func int DIA_Kardif_TRADE_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //��� ��� ���-������ ������.
};
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TradeInfo		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TradeInfo_Condition;
	information	 = 	DIA_Kardif_TradeInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"��� ����� ����������.";
};

func int DIA_Kardif_TradeInfo_Condition ()
{
	if (Kardif_OneQuestion == FALSE)
	&& (Kardif_Deal > 0)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_TradeInfo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //��� ����� ����������.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//�����������, ����� � ���� ����� ���������� ������.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"��� ��������� ������������ ������ � ���� ������?";
};
//-------------------------------------------
var int DIA_Kardif_Buerger_permanent;
//-------------------------------------------
func int DIA_Kardif_Buerger_Condition ()
{	
	if (DIA_Kardif_Buerger_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Buerger_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //��� ��������� ������������ ������ � ���� ������?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //�����, � �����, �� ������ �� ��� �� �������. ������������ ����������� ������� ����� - ��� �����.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //���� ��������� �� ����� ���������, �� � ���� ���� ������, � ������ ����������� �������� ������ ��� ������.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //�������� � ������� ���� ����� ����������� ���� - � ���� �������, ���� ���� ��������� ��� ������.
		
		
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

// *****************************************************
//						Lehmar
// *****************************************************

instance DIA_Kardif_Lehmar	(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lehmar_Condition;
	information	 = 	DIA_Kardif_Lehmar_Info;
	permanent    =  TRUE;
	description	 = 	"��� ������ ������?";
};
//-------------------------------------------
var int DIA_Kardif_Lehmar_permanent;
//-------------------------------------------
func int DIA_Kardif_Lehmar_Condition ()
{	
	if (DIA_Kardif_Lehmar_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Buerger_permanent == TRUE) //(Knows perm Info)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lehmar_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //��� ������ ������?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //(�������) ���� �� ������ ������ ���, ���� ����� ��������� � ��� ��������.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //������ ��� ����� ����� �������� ������� ���������.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //��������� ��� ��������, �� ������ ����� ��� � �����...
		
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};



///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Arbeit		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Arbeit_Condition;
	information	 = 	DIA_Kardif_Arbeit_Info;
	permanent    =  TRUE;
	description	 = 	"��� � ���� ����� ������?";
};
//-------------------------------------------
var int DIA_Kardif_Arbeit_permanent;
//-------------------------------------------
func int DIA_Kardif_Arbeit_Condition ()
{	
	if (DIA_Kardif_Arbeit_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Arbeit_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //��� � ���� ����� ������?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //�� ���� �� ������� ������ �����, � �����. ���� ����� ���������� � �������� � ������ ����� ������.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //�� ���� � ���� ���� ��������� ���, �� ������ ������� ������� �� ��������. �� ������� ��� �� �������, �� ��������� �� ������.
			
	DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Kardif_MissingPeople		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Addon_Kardif_MissingPeople_Condition;
	information	 = 	DIA_Addon_Kardif_MissingPeople_Info;
	permanent    =  TRUE;
	description	 = 	"��� �� ������ � ��������� ���������?";
};
//-------------------------------------------
var int DIA_Addon_Kardif_MissingPeople_permanent;
//-------------------------------------------
func int DIA_Addon_Kardif_MissingPeople_Condition ()
{	
	if (DIA_Addon_Kardif_MissingPeople_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Kardif_MissingPeople_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //��� �� ������ � ��������� ���������?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //���, ��� � ����, - ��� ��, ��� �� ��������� ��� ������� ��������� �����.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //�������, ��� ������ ����� ��������� �����, � �����. �����, ���� ����� ����������� �������.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //� ������ ����� ������ ���� �������� ����.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //���� ������ ����� ������, �������� � ���������.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //� ���� ������ � ������ ����� ������, � �����, ��� �� ��� ��� �� ���������� ����� �������.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //������, �������� ����� �� ����� �� ��������, ���� ����� ���-�� ����� - � ���� ������� ����� �����.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"������ �������, ��� ��� ����� ���������� � ��������� ����� � ���������, ���������� �������� � ������ ����� ������, � ����� � ��������, ��������� ����� � ������."); 

		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Lernen		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lernen_Condition;
	information	 = 	DIA_Kardif_Lernen_Info;
	permanent    =  TRUE;
	description	 = 	"� � ���� ����� ����� ��������� ����-������?";
};
//-------------------------------------------
var int DIA_Kardif_Lernen_permanent;
//-------------------------------------------
func int DIA_Kardif_Lernen_Condition ()
{	
	if (DIA_Kardif_Lernen_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lernen_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //� � ���� ����� ����� ��������� ����-������?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //�����, � �������� �������� ���� ��������� ������� �����.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //����, ������, - ������� ������. �������, �� ������ ������ ���� ����� �������.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //������ ������ � ������ ����������. � ����� - ��������, ����� ���� �� �������. �� ���� ������� ������ � ����.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //� ���� �� ��������� ����� �� ���, ����� ����� � ������� ������ - �� ����� ���� � �����... �����... ������.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //� ��� ��� ����� ���� ���� �����?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //(������) ����, ������ ������ �������� ����� ������ �����, ������ ��� � ���� ������� ��� ���.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //������ ��������� � �������� ��������, �� ����������� ������� ��. � ���� �� ������ ����� ��������������� �����, ����� � �������� � ���� � ���� �����.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //��� ������ ����� �����. �� ����� � �������� ���� ������� �� ����� ��������. (��������) � ������ ��� ����� � ��� ���� ������ �� ��� ����������.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"����, ������ � �������� ��������, ����� ������� ���� �������.");
		B_LogEntry (Topic_CityTeacher,"����� ����� ������ ��� �������� ��� ��������.");
		B_LogEntry (Topic_CityTeacher,"������ ����� ������� ���� ��������� �������� ���������� �������. �� ��������� �� ������� � �������� ��������.");
		B_LogEntry (Topic_CityTeacher,"����� ����� �������� ��� ������� ������������� �����. �� ����� � �������� ��������.");
	
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"������� ������ ����� � ������� �� � ������.");
		
		
	DIA_Kardif_Lernen_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk_Condition;
	information	 = 	DIA_Kardif_Diebeswerk_Info;
	permanent    =  TRUE;
	description	 = 	"� ��� �� ����� �����-������ '������' ������ ...?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk_Condition ()
{	
	if (DIA_Kardif_Diebeswerk_permanent == FALSE)
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	//&& (other.guild == GIL_NONE) 
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //� ��� �� ����� �����-������ '������' ������, ��� �� �������� ��������� ���������� �����?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //����-������ �������, ��������? ���...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //...�������� ���������� � �������. ��������, �� ������ ������ ����.
	
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk2		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk2_Condition;
	information	 = 	DIA_Kardif_Diebeswerk2_Info;
	permanent    =  TRUE;
	description	 = 	"���� ���-������ '���������' ��� ����?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk2_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk2_Condition ()
{	
	if (DIA_Kardif_Diebeswerk2_permanent == FALSE)
	&& (DIA_Kardif_Diebeswerk_permanent == TRUE) //andere Info
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	&& (other.guild != GIL_KDF) 
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk2_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //���� ���-������ '���������' ��� ����?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //��, ���� ���-��� - �� ��� ������������ ����, ������ ���� �� ������� ��������������� ���������.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //����������, ��� ��� � ����?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //��, � ������, �������� ������� �� �����, ������ ������ �����, ��� ����.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //�?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //��� ��� ���� ����� ��������, ��������� ���������� ��� ���� �������� ���������.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //�������, ��� ���� ����� ����� � ����� ��������� ���������. �� �� ������ �� ������ �� ����, �������?
		
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's ich will doch keine Info kaufen 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zurueck		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Zurueck_Condition;
	information	 = 	DIA_Kardif_Zurueck_Info;
	permanent    =  TRUE;
	description	 = 	DIALOG_BACK;
};
func int DIA_Kardif_Zurueck_Condition ()
{	
	if (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Zurueck_Info ()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices (DIA_Kardif_Zurueck);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DOPE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_DOPE_Condition;
	information	 = 	DIA_Kardif_DOPE_Info;
	permanent    =  TRUE;
	description	 = 	"��� ��� ����� ������ ������?";
};
var int DIA_Kardif_DOPE_perm;
func int DIA_Kardif_DOPE_Condition ()
{
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&&  (DIA_Kardif_DOPE_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_DOPE_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //��� ��� ����� ������ ������?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //������ �� ����� - � �� ���� ���� � ��������� ������.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //������ �� �����.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //�����, ����� ���?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //� �� �� ����� ����� ��������� � �������� - �� ����� ��� ����� ��������.
		
		DIA_Kardif_DOPE_perm = TRUE;
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Paket		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  3;
	condition	 = 	DIA_Kardif_Paket_Condition;
	information	 = 	DIA_Kardif_Paket_Info;
	permanent	 =  TRUE;
	description	 = 	"�� ���-������ ������ � ���� �������� �����?";
};
var int DIA_Kardif_Paket_perm;
func int DIA_Kardif_Paket_Condition ()
{
	if 	(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Paket_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Paket_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //�� ���-������ ������ � ���� �������� �����?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //���, ��� ������� ���� ����� - ������� �������. �, ��������, ������ ������������� �����!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //�� ������� �������� ����. �� ���-�� ������. �����, ����������!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //������, ������ - ���� ������ ������� ������� � ��� �������. �� �� ���������.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //�� ������, ��� ������ ��� �������� ����� � ������, ��, ������� ��, �� ��� ���������� � ����. ��� ���, ��� � ����.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"������ ������� � ���������. � ����� ����� ���� ��� �������� �����, ������� �� ����� �������.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info SendAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_SENDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_SENDATTILA_Condition;
	information	 = 	DIA_Kardif_SENDATTILA_Info;
	important	 = 	TRUE;
};

func int DIA_Kardif_SENDATTILA_Condition ()
{
	if (MIS_ThiefGuild_sucked == TRUE)
	|| (Diebesgilde_Okay >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kardif_SENDATTILA_Info ()
{
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //��, ��, ��� ����. � ���� ���-��� ���� ��� ����.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //���� ������ ����� ����� ���������� � �����.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //��� ��� �� �� ����� ���� �����, �� �������� ���� �������� ���� �������.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //�� ����� ����������� � �����. �� ������ ������ �������.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //��� ���������� ��������� - �� ��� ����������! ���� �� ��� ��������� �������� �������.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //��� �������� ���� ������?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //� ��� �� ������� ���� - �� ���� �������� ��������� �� ���, ��� ����. (����������)
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //������ ����������, ������� � ������ ����, ����� ������ 10 ������� �����.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc (VLK_494_Attila, "NW_CITY_ENTRANCE_01");
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Kerl		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_Kerl_Condition;
	information	 = 	DIA_Kardif_Kerl_Info;
	permanent    =  TRUE;
	description	 = 	"��� �������� ���� ������?";
};
//----------------------------------
var int DIA_Kardif_Kerl_permanent;
//----------------------------------
func int DIA_Kardif_Kerl_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_SENDATTILA)
	&& (Attila.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //��� �������� ���� ������?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //��, �� �������� �������, ���������� � ������� - �� �� �� ����� ��������. �����-�� ��... ��������.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //� ��� ����?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //��� ����? ����� �� ������ �� ����, � ��� ���, ��� �� ������ �� �� ����.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //� ��� ������ ���� ���-�� �������� - ��, ��� �� �� �� ����, � �����, �� ������ �����, ���������� � ���. ��� ������ ���� ���������.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //��... ���� ������ � ���, ��� ����...
		
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DEFEATEDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_DEFEATEDATTILA_Condition;
	information	 = 	DIA_Kardif_DEFEATEDATTILA_Info;
	permanent    =  FALSE;
	description	 = 	"���� ������� ������� ����� ����!";
};

func int DIA_Kardif_DEFEATEDATTILA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info ()
{
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //���� ������� ������� ����� ����!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //��, ������ ��� ���� �����? � ������ ������� ����������.
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //���� ���-�� ����� �������� ����, � �����, � ���� ���� ������ �������.

	B_GivePlayerXP (XP_Kardif_Blame4Attila);
	
	B_KillNpc	(Attila);
	Npc_RemoveInvItem	(Attila, ItMi_OldCoin);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Zeichen   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 2;
	condition   = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent   = FALSE;
	description = "(�������� ������ �����)";
};

FUNC INT DIA_Kardif_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//��, �� ������ ���� � ������. ������. � ����� ������, � ���� ���-��� ���� ��� ����.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//(���������) ���� ���� ����������� �������, �������. � ������ ��������� �� ������ ������. ������ ������� ���� ������ ���� �������.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
};

//###########################
//##
//##	Kapitel 5
//##
//###########################

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Crew   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 51;
	condition   = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent   = FALSE;
	description = "��� ��� ��� ����� �������.";
};

FUNC INT DIA_Kardif_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Crew_Info()
{
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//��� ��� ��� ����� �������.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//������� ������ �������, �������. �� �� ������� �������� �� ���� ��������. ����������� �� ��� ����� �������� �����.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//�� � ������� ��������� ����� �������� ������� ��������� ���������� ������, � �������� ������ ������� �� ��� �������� �������.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//��� � ���� ����� ��������?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//�� ����������� �� �� ������. � ������� ����������.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"������ �������� ���� � ������� �����. ��������, �� ������ ������ ���");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//���, �������� �� ������ ������. �� ��������� � ���� �����, ������� � ���� �����. � ���, ��� �������� �������� ����, ��� ��� �������, ��� ���� �����.
	};
};




























