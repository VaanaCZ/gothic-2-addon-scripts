///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "��� ����� ����!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //��! ��� ������ ���� �����?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //�� ��������� �� �������. � ������ �� ���� ���� ���������!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"������ ��� ���� ������.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //������ ��� ���� ������.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //�� �������� � ����� �����, ���������. ���� ���� ���-�� ����� ��� ����� ����������, �� ��������� �� ������.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //�� � ������������ ����: ���� �� ������ ����� ���-������, �� ��������, � ������ ������!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //�������. � ���, ����� �� ����?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(������������) ��! �� ������ �� ������, ��� ���-������ ���� � ���� �������.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"����� ������� ��������� ������� �� �������� �������.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"���-�� ������� ����?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //���-�� ������� ����?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //� �� ���� �������� ���. ���� ������ ��� ��������� �����. ������������ ��� ������� - ���� ��� ������������� ��� ���.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //�� ��� ��������� ���� ��������� �� �������� �������.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //� ������ ����� �� �������� � ������ ����� ���� �� �����. ����� ����������, ���� ������� ��������� ��� ������!
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //� ���������� ����� �� ���������, � ��� ������� ������!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //�������� - ���� �� ������� ������, ���������� ���� �������, � �������� ���� ���-���.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ��� �� ������� ���� ��� ������.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //� ��� �� ������� ���� ��� ������.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(�����������) ��? � ����� ���� ���?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"� ���� �������� ����� ������ � �������� ��������������!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"� ��� ������� � ������� �����!", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"��� �������... ��, �� ��� ��, ��������, ������ ��� ������� � ������� �������?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //��� �������... ��, �� ��� ��, ��������, ������ ��� ������� � ������� �������?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(�������) �� ��������� �� �� ������. � ���������, ��� � ����������� ��������� �� ���� �������.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //���� �� ������ ������� � ������� �������, �������� � �������� ���������� � ������ ����� ������.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //� ��� ������� � ������� �����!
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //��� � ��� �� ������ ����.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"� ��������.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"������� ������ ���� � ���� ��������?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"������ �� �� ������ ������?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //� ���� �������� ����� ������ � �������� ��������������!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //������� ����� ��� ��� �������. � ��� �� ��������� � ����� ��������������!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"� ��������.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"������� ������ ���� � ���� ��������?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"������ �� �� ������ ������?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //������ �� �� ������ ������?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //������ ���������, ������ ���� ��� ������ � ��������.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //� ����� � �������, ��� ��� ������� ������, ��� � ���� �������!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //������� ������ ���� � ���� ��������?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 ������� - ��� �������� ����� �� �������� ��������.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //� ��������, ��� ����� �������.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //���� ���������! ���� �� ������ �������� ����� �������, �� ���� ������ ���������� ������.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //��������� ����� ���������� ����� ����������� �����������. � ��� ���, ��� �������� ������� � �����, ������ ������������� �� ����, ��� �������� � �����.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //��� ��� �������� ���-������...
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //��������.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "������ �� ����� ������� ������� �������� �����. �� ���� ���� ������������� �� �����.");
	B_LogEntry (TOPIC_Jora, "� ������ ������� ���������� ������ �����.");
	B_LogEntry (TOPIC_JoraDieb, "������� ������� �������� �����. ���� � ������ ���, ��� �� ��� ���������� �������.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"������ ����...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //������ ����...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //��, ��� ������������ ����? �� ������ ���? � ��� ����� �����, �� ������ � ���� ��� ������?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"��, � ��� ��������� ���������� ������.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"��, � ������ ���.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"�� ������ �� ����.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"� ��� ��� ������� ��� ����!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //� ��� ��� ������� ��� ����!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //�� ������ �������� ��� ��� ������ �����!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //�� ������ �� ����.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //� ��� ������? �� ���� ��� � �����?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //��, � ������ ���. ����� ������� ������� �� ��������, ��������...
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //� ��� ������ ����� ������?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //��, � ��� ��������� ���������� ������.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //��, ���� �� �� ������ �� ������ ������ ���������! ���������� ������ ����������!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //��� ��� ������?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zur�ckbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"��� 50 �������, ��� �� ����� � ����.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //��� 50 �������, ��� �� ����� � ����.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //����� ������! ���� ��� ���������� � ���� ������.
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //��, ����� �� ��� 50 �������! �� ���, ���� ��������� ���� ���������?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"��� �� ������ � ������� �����?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //��� �� ������ � ������� �����?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //������ - � ����� - �� �� ������ �� ������ �� ����, ���� ���, �������?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //� �������� ������ ��������� ��������� �����-�� ������ ��������.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //����� ����������, ��� ������ ���-�� ����� �� ����...
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //���� �� ������ ��������� ���� �����, ���� ����� ���������� � ���.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //�� ������ ������������, ��� ����� �����-������ ������ ���������, ��������. �����, �� ������� �� ���.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //�� ���� ���������. � ����� ������ ����� �� ������.
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ���� �������� ����� ������ � �������� ��������������!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //� ���� �������� ����� ������ � �������� ��������������!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //�� � ��� ��� ���� ������ �����.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //����� ������ ������� � �������� ��������������.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //� ���� ���� ����� ������, �� ���������� ����� � ������� ������� �� �� ������ � ����� �����.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //� ������ ������, ���� ���� �������...
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"������ �������, ��� � ���� ��� ���...";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //������ �������, ��� � ���� ��� ���...
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //�� ������ � ���� ����� ���������, ��� ������ ��� ���� ������ �� ��������� ������� � ����� ����?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //��, ��� ��.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //��� ��� ��� ��� � ����.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //������� �� ������ �� ����?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //�� - ��� ����...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //�, �����! ������� ��� ���. ���� �� ����� ��� ������� ��� ������...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //�� - ������ ��� ���� - 50 ������� �����.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(�����������) � ���� ��� ������ ���! ���� ��� �����, ���� � ��� ������!
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"��� 50 ������� �����. ����� ��� ��� �������.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //��� 50 ������� �����. ����� ��� ��� �������.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - f�r 50 Goldst�cke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //���, ����� - (����������) ��� �������� ������.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //� ���� ������������ ������. �� �� �������� - � ���������� ���� ���� ���. ������ �����, ���� ������...
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};









