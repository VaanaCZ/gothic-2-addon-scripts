///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Coragon_EXIT   (C_INFO)
{
	npc         = VLK_420_Coragon;
	nr          = 999;
	condition   = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Coragon_PICKPOCKET (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr			= 900;
	condition	= DIA_Coragon_PICKPOCKET_Condition;
	information	= DIA_Coragon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen (40, 45);
};
 
FUNC VOID DIA_Coragon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Coragon_PICKPOCKET);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_BACK 		,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};
	
func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_HALLO_Condition;
	information	 = 	DIA_Coragon_HALLO_Info;
	permanent    =  FALSE;
	description	 = 	"���� � ������ �����?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //���� � ������ �����?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //���� � ���� ���� ������, �� ����� ������ ���� ������.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"� ���� �������� ��� � ����� � ����������� ��������.");
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_Trade_Condition;
	information	 = 	DIA_Coragon_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"������ ��� ���� ������.";
	trade 		 =  TRUE;
};
func int DIA_Coragon_Trade_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Trade_Info () //FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //������ ��� ���� ������.
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  3;
	condition	 = 	DIA_Coragon_WhatsUp_Condition;
	information	 = 	DIA_Coragon_WhatsUp_Info;
	permanent    =  FALSE;
	description	 = 	"��� ���� ����?";
	
};
func int DIA_Coragon_WhatsUp_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_WhatsUp_Info ()
{
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //��� ���� ����?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //�, �� ���������. �� ��������� ������� �� ������� ����� ����� ������� ���������� ����.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //�� ��� ����������� ����� �� �������. ��, ����� ���� ������� �� �������� ��������.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //� ��� � ���� �� ���?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(�������) ��������� �� ���� ������� ������ ��������� �� �����.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //����� ���� �� ���������. � ��� ������ �� ��������.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //�� �������� ��� �������� �� ����������. ������ ��� ������ ������ �������.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //���, ��� ��� ������� �������, � ���� ������ ������ � ���� ��������.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_420_Coragon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Coragon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Coragon_MissingPeople_Info;

	description	 = 	"��� �� ������ � ��������� �����?.";
};

func int DIA_Addon_Coragon_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Coragon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //��� �� ������ � ��������� �����?.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //�� ������, ��� ������ �� ��� ������� � ������ �����. �������������, ���� ���������, ��� ��� ��������. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //������� ���� ������ �������� ������� �� ������ ����� ������.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //������, ���� �� �������� ���������, ��������� ��� ����� �������� �������. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //��� �������, ��� ������ ���� ����� �� �������� ������ �����, � ����� ��� ������ ����� � ���� �����. ����� ���� ��������� � ���������. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //��������� �������� ����������. �� �������, ������ ��� ����������. �����, ��� ��� ������.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //������ � �������� ���������, �� �� �������� ��� �������.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //��, ��� �� �������� � ������, ���� ��� ������ ������� � ���� � �������� ��� � ���� � ����� ��������. ��� ������.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"�����, �������� �� �������� �������, � ������� ������ ����� ���-�� � ��������� �����."); 
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  4;
	condition	 = 	DIA_Coragon_Bestohlen_Condition;
	information	 = 	DIA_Coragon_Bestohlen_Info;
	permanent    =  FALSE;
	description	 = 	"���� ��������?";
	
};
func int DIA_Coragon_Bestohlen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Bestohlen_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //���� ��������?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //��, ��������� ����� �����. ��� ������� ���� �������� �����, � � ������ � �����, ��� �������� ����.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //�� ������ � ������� �� ���������, �� ���� �������� ������� � ���������� �������.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //� ��������� � ����� ���������, �� ���, ������� ��, ������ �� �����. ��� ������ ������������ ������������ ���������� �����.
	
	MIS_Coragon_Silber = LOG_RUNNING;
};


// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------	
	
func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //���, ������ ��� � �������� �������.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //��� ������ ����. ���� ������� �������.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //��������� ��������� �����!
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  5;
	condition	 = 	DIA_Coragon_BringSilber_Condition;
	information	 = 	DIA_Coragon_BringSilber_Info;
	permanent    =  FALSE;
	description	 = 	"� ������ ���� �������.";
	
};
func int DIA_Coragon_BringSilber_Condition ()
{	
	if (MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_CoragonsSilber) >= 8)
	{
		return TRUE;
	};
};
func void DIA_Coragon_BringSilber_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //� ������ ���� �������.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //������?
	B_GivePlayerXP (XP_CoragonsSilber);
	B_Coragon_Bier();
	
	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  6;
	condition	 = 	DIA_Coragon_Schuldenbuch_Condition;
	information	 = 	DIA_Coragon_Schuldenbuch_Info;
	permanent    =  FALSE;
	description	 = 	"��������, ��� � ���� ����...";
	
};
func int DIA_Coragon_Schuldenbuch_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Schuldenbuch_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //��������, ��� � ���� ����...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //��-�... (���������) �� ��� �� �������� ������!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //��� �� � ��� ����������� ������?
};


// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  7;
	condition	 = 	DIA_Coragon_GiveBook_Condition;
	information	 = 	DIA_Coragon_GiveBook_Info;
	permanent    =  FALSE;
	description	 = 	"��� ���� �����.";
	
};
func int DIA_Coragon_GiveBook_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_GiveBook_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //��� ���� �����.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //�������! �� ���� ����. ������ ����� ���� ����� ���������� ���������. 
	B_GivePlayerXP (XP_Schuldenbuch);
	B_Coragon_Bier();
};


// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  9;
	condition	 = 	DIA_Coragon_ToOV_Condition;
	information	 = 	DIA_Coragon_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"��� ��� ������� � ������� �������?";
	
};
func int DIA_Coragon_ToOV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Coragon_ToOV_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //��� ��� ������� � ������� �������?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //�� ������ ����� ����������� ������. ����� ���� ������!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //����� ����� ������� � ������ �� ������������� �� ������ ����� ������. ����� �� ������� �����������.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //� ���� ����� ����� ������������, ����������� � ������� � �������� � ������ �����.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //��������, �� ������ ���� � ���� ���������. ��� ������� ���� ���� � ������� �������.
};


// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  8;
	condition	 = 	DIA_Coragon_Valentino_Condition;
	information	 = 	DIA_Coragon_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"� ��� ��� ������ ���������?";
	
};
func int DIA_Coragon_Valentino_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Valentino_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //� ��� ��� ������ ���������?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //�� ����� �� ����������, � ��� �� ���������� ��������. � �� ������������ �� ���� ���� ������.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //������ �� ��� ������� ��� ���.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //�� ���� ��� ���� � ������ �������� �� ������ ����. � �����, �������, ������������ �����, � ������� �������.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //��� ���������� ������ ����.
	
	
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 1;
	condition	= DIA_Coragon_News_Condition;
	information	= DIA_Coragon_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
	
};
func int DIA_Coragon_News_Condition ()
{	
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{	
			return TRUE;
		};
	};
};
func void DIA_Coragon_News_Info ()
{
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //������� ����� �� �� ���� ������������ �� �����.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //�� ������ ���-�� � ���, ��� ��� �������� � ��� �� �������� ��� �����. ��� ��! 
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //������ ��� �� ��������� � ���, ��� ����� � ���� �����.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //� ��� �� ��������� ���� � ������, ������ ������ ���� � �������, ��� ��� ��������...
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //�? ��� �� ������?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //�? ����� ��� ������� ������, ��� �� ���?
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 10;
	condition	= DIA_Coragon_Ring_Condition;
	information	= DIA_Coragon_Ring_Info;
	permanent   = FALSE;
	description = "��� - ������ ��� ������.";
	
};
func int DIA_Coragon_Ring_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_News))
	&& (Npc_HasItems (other, ItRi_ValentinosRing) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Ring_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //��� - ������ ��� ������.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //���? �� �������...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //��� ������������ ���������.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //�� ������ �������� ��� ����������, ��� ��������� ���...

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























