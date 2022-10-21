///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_EXIT   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 999;
	condition   = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Halvor_PICKPOCKET (C_INFO)
{
	npc			= VLK_469_Halvor;
	nr			= 900;
	condition	= DIA_Halvor_PICKPOCKET_Condition;
	information	= DIA_Halvor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Halvor_PICKPOCKET_Condition()
{
	C_Beklauen (78, 150);
};
 
FUNC VOID DIA_Halvor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Halvor_PICKPOCKET);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_BACK 		,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
	
func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Hallo		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Hallo_Condition;
	information	 = 	DIA_Halvor_Hallo_Info;
	permanent    =  FALSE;
	important	 =  TRUE;
};

func int DIA_Halvor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Wld_IsTime (05,00,20,00))
	{
			return TRUE;
	};
};
func void DIA_Halvor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Hallo_06_00"); //��, ���� ����� ����? � ���� ����� ������� ���� - � ����� ������ ����!
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"������ ������� ����� � ������.");
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_TRADE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_TRADE_Condition;
	information	 = 	DIA_Halvor_TRADE_Info;
	permanent	 =  TRUE;
	trade		 =  TRUE;
	description	 = 	"������ ��� ���� ����.";
};

func int DIA_Halvor_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Halvor_Hallo)
	&& (Wld_IsTime (05,00,20,00))
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Halvor_TRADE_15_00"); //������ ��� ���� ����.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Night
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Night		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Night_Condition;
	information	 = 	DIA_Halvor_Night_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};
func int DIA_Halvor_Night_Condition ()
{
	if (Wld_IsTime (20,00,00,00))
	&& Npc_IsInState (self, ZS_Talk)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_Night_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Night_06_00"); //��, ���� �� ������ ������ ����, ������ �� ��� ������. ������?
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Halvor_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_469_Halvor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Halvor_MissingPeople_Condition;
	information	 = 	DIA_Addon_Halvor_MissingPeople_Info;

	description	 = 	"�� ������ ���-������ � ��������� �����?";
};

func int DIA_Addon_Halvor_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	&& (Halvor_Ausgeliefert == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Halvor_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Halvor_MissingPeople_15_00"); //�� ������ ���-������ � ��������� �����?
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_01"); //��������� �����? ��� ����, ��������. ����� ������� ����� �� � ���������.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_02"); //���� �������. ��� ������� �������� ������������ �����.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_03"); //� ������� ������, ����� ��� �������, �������� ������� �������� �������� �������� ��� ���������� �������.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_04"); //� ���� ��� �� ������� ������������, ����� ����� �������� �� ������� � ������ �� ����. ��� ��� � ��������.
	
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, DIALOG_BACK, DIA_Addon_Halvor_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "�� ��� ��� ��� ���� �� �������?", DIA_Addon_Halvor_MissingPeople_schiff );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "�� ������ ����-������, ��� ������?", DIA_Addon_Halvor_MissingPeople_wer );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "� � ���� ���-������ ������?", DIA_Addon_Halvor_MissingPeople_you );
};
func void DIA_Addon_Halvor_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
};
func void DIA_Addon_Halvor_MissingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_wer_15_00"); //�� ������ ����-������, ��� ������?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_wer_06_01"); //���. �������� �������� � �������������.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"������������, ��� ���� ��� ������������ �������� ����� ������ - ��� ���������� � �����������������."); 
};
func void DIA_Addon_Halvor_MissingPeople_schiff ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_schiff_15_00"); //�� ��� ��� ��� ���� �� �������?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_schiff_06_01"); //������� ������. �� ����, � ��������� ����� ������� � ������� �� �������.
};
func void DIA_Addon_Halvor_MissingPeople_you ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_you_15_00"); //� � ���� ���-������ ������?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_you_06_01"); //� ����? ���.
};

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_MESSAGE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_MESSAGE_Condition;
	information	 = 	DIA_Halvor_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"� �����, ���� ������ ������ ����� ��������� � ����...";
	trade		 =  FALSE;
};

func int DIA_Halvor_MESSAGE_Condition ()
{	
	if (Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_MESSAGE_Info ()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_15_00"); //� �����, ���� ������ ������ ����� ��������� � ����...
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_01"); //���?.. ��� ��������.
	B_UseFakeScroll 	();
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_02"); //(� ��������) �-�... ������, ����� ��������� �������� �� ���� - �-�... ��������. � ���������� ������, ���������� �� ��������.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_03"); //(���������) �� ��� ������������� �������� �� ���� ���������, ������? � ������, �� ����� ������ � ���������������, ����� ���?
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"��, �������� ������� ��� �����������.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"������, ���� ������ ������.",DIA_Halvor_MESSAGE_PRISON);

};
FUNC VOID DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_OFFER_15_00"); //��, �������� ������� ��� �����������.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_01"); //������. �������� ����. � ���� ������� ���� �� ������ ����.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_03"); //���� �� ������ ��� ���� ������ ������, �-�... � �������� �� ����, �� � � ����� ����� ��������� ��������� ����������.
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"������, ������������.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"������, ���� ������ ������.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"�� ��?! � ��� ��� �� ������?",DIA_Halvor_MESSAGE_DEAL);
};	
FUNC VOID DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_00"); //������, ���� ������ ������.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_01"); //���, �������, �� � ������ ��������� ���! ���� �... �... �� �� ���������... � ������ �������.
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_02"); //���� ������ �������� �� ���� ������. � ������ � ��������� �������� � ���� ����� �����.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_03"); //�� ��������� �� ����.
	
	Betrayal_Halvor = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_00"); //�� ��?! � ��� ��� �� ������?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_01"); //��, � ��� �� ���������� ����... ��������� ����, ���������? �� ������� �������, ������� ������� ������ ��� ���.
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_02"); //�� ������ � ���� ���-�� ����� ����, ���������� ���� ������ ��������?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_03"); //�� ��� ��������� ���������. � ���� ���� ��������� �����... ���.
	
};
FUNC VOID DIA_Halvor_MESSAGE_Okay()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_Okay_15_00"); //������, ������������. � �����, �� �������� ��� ��� � �����.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_Okay_06_01"); //�������. ������, ����� ����� ������ ����������. � ���������� ����� ���������� ������� ��� ����.
	
	B_GiveInvItems 	   (other, self, ItWr_HalvorMessage,1);
	Npc_RemoveInvItems (self, ItWr_HalvorMessage,1);
	
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
	//------------------------------------------------------
	CreateInvItems 	   (self,ItSe_ErzFisch , 1);
	CreateInvItems 	   (self,ItSe_GoldFisch, 1);
	CreateInvItems 	   (self,ItSe_Ringfisch , 1);
	CreateInvItems 	   (self,ItSe_LockpickFisch , 1);
	//------------------------------------------------------
	Info_ClearChoices (DIA_Halvor_MESSAGE);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Zeichen   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent   = FALSE;
	description = "(�������� ������ �����)";
};

FUNC INT DIA_Halvor_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (Betrayal_Halvor ==  FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_00");//�������. �� ������ �� ������ ������ ����.
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_01");//(����) � ����� ������� ���� �����������. ���� � ���� ���� ���������� ������� ��� ����, � ������ �� �� ������� ����.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
	
	Log_CreateTopic (Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"������ ����� ���������� ������� � ����� �� ����� ������� ����.");
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Hehlerei   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent   = TRUE;
	description = "(������� ��� ������� � �����)";
};

FUNC INT DIA_Halvor_Hehlerei_Condition()
{
	if Npc_KnowsInfo (other,DIA_Halvor_Zeichen)
	&& (Betrayal_Halvor == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0; //resetten
	
	if  (Halvor_Day != Wld_GetDay())
	{
		
		if (Npc_HasItems (other,ItMi_SilverPlate) >= 1)
		|| (Npc_HasItems (other,ItMi_SilverCup) >= 1)
		{
			Halvor_Score =  (Npc_HasItems (other,ItMi_SilverPlate) * (Value_SilverPlate/2)) + (Npc_HasItems (other,ItMi_SilverCup) * (Value_SilverCup/2));
			
			if (Halvor_Score <=  1000)  //weil sonst kein B_Say_Gold mehr...
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_05");//�� ���� ������� � ��� ����...
				B_Say_Gold (self, other, Halvor_Score);
			
				Info_ClearChoices (DIA_Halvor_Hehlerei);
				Info_AddChoice (DIA_Halvor_Hehlerei,"������. �������!",DIA_Halvor_Hehlerei_Annehmen);
				Info_AddChoice (DIA_Halvor_Hehlerei,"� ������� ��� ����.",DIA_Halvor_Hehlerei_Ablehnen);
			}
			else 
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_06");//�� ������ ������� �����. � ���� ��� ������� ������ �����.
				Info_ClearChoices (DIA_Halvor_Hehlerei);
			};
		}
		else 
		{
			AI_Output (self, other, "DIA_Halvor_Zeichen_06_02");//������, ����� � ���� ����� ���������� ������� ��� ����.
			Info_ClearChoices (DIA_Halvor_Hehlerei);
		};
	}
	else if (Wld_GetDay() == 0)
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_03");//�� ������ ������ ��� ���� ������� ������. ������� ������� ����.
	}
	else 
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_04");//������, �� ������� � �� ����� ����� ����. ������ ������, ������?
	};

};
FUNC VOID DIA_Halvor_Hehlerei_Annehmen()
{
	/*
	CreateInvItems (other, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)));//F�r Textausgabe -> ist ziemlich dreckig, aber wie sonst? 
	B_GiveInvItems (other, self, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ); 
 	*/
 	
 	//--------- Patch 2.5a-----------------------------------------
 	var int amount;
 	var string concatText;
 	amount = (Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ;
 	
 	concatText = ConcatStrings(IntToString(amount), PRINT_ItemsGegeben);
 	AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
 	
 	//------------------------------------------------------------
 	
 	Npc_RemoveInvItems (other, ItMi_SilverCup,Npc_HasItems (other, ItMi_SilverCup));
 	Npc_RemoveInvItems (other, ItMi_SilverPlate, Npc_HasItems (other, ItmI_SilverPlate));
 	
 	B_GiveInvItems (self, other, ItMi_Gold, Halvor_Score);
 	
 	AI_Output (other, self, "DIA_Halvor_Zeichen_Annehmen_15_00");//������. �������!
 	AI_Output (self, other, "DIA_Halvor_Zeichen_Annehmen_06_01");//�� ��������� ��������� ������� ������ �������. ����� �� ������� �� ��� �� ������, ��� ����� ������� ����������, ���������?
	
	Halvor_Day = Wld_GetDay ();
	Info_ClearChoices (DIA_Halvor_Hehlerei);
}; 
FUNC VOID DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices (DIA_Halvor_Hehlerei);
};

//#############################################
//##
//##	Kapitel 5
//##
//#############################################

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Crew		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	51;
	condition	 = 	DIA_Halvor_Crew_Condition;
	information	 = 	DIA_Halvor_Crew_Info;
	permanent    =  FALSE;
	description	 =  "� ������� �������.";
};

func int DIA_Halvor_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
			return TRUE;
	};
};
func void DIA_Halvor_Crew_Info ()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_15_00"); //� ������� �������.
	AI_Output (self ,other,"DIA_Halvor_Crew_06_01"); //� ��� �� ���������� ������ ������?
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,"��� ��� ����.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice (DIA_Halvor_Crew,"����� ���� ���������� �������.",DIA_Halvor_Crew_StealShip);
	
};

FUNC VOID DIA_Halvor_Crew_MyThing()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_MyThing_15_00"); //��� ��� ����.
	AI_Output (self ,other,"DIA_Halvor_Crew_MyThing_06_01"); //��� ������. ��� ������������� �� ��� ����.

	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"������ ����� �� ����?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice (DIA_Halvor_Crew,"�� ������ ������ ���?",DIA_Halvor_Crew_HelpMe); 
};

FUNC VOID DIA_Halvor_Crew_StealShip()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_StealShip_15_00"); //����� ���� ���������� �������.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_01"); //��, �����. �� ��� ��������? �������� ������� �� ���� �������, ���� ��������� �� ����.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_02"); //�������� ��� ������, �� � �� ��������� ��������� ����� ������.
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"������ ����� �� ����?",DIA_Halvor_Crew_JoinMe);
	if (Npc_IsDead (JACK) == FALSE)
	{
		Info_AddChoice (DIA_Halvor_Crew,"�� ������ ������ ���?",DIA_Halvor_Crew_HelpMe); 
	};
};

FUNC VOID DIA_Halvor_Crew_JoinMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_JoinMe_15_00"); //������ ����� �� ����?
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_01"); //����, �������. � ���� � ����� ������ �������. ����� ����, ���� ������, � �� ���� ������������� � �������, ������ �����.
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_02"); //�� � ��� �� ����� ���� �����.
};

FUNC VOID DIA_Halvor_Crew_HelpMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_HelpMe_15_00"); //�� ������ ������ ���?
	AI_Output (self ,other,"DIA_Halvor_Crew_HelpMe_06_01"); //� �� ����� ������� ��� �����. ����� �������� � ������, �� ������ ��������� ���-�� �����, � ������. �� ����� �����, ��� ���� ����� ��� ����� �����������.
};

FUNC VOID DIA_Halvor_Crew_Back()
{
	Info_ClearChoices (DIA_Halvor_Crew);
};




