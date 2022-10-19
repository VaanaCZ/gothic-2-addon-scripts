
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Canthar_PICKPOCKET (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 900;
	condition	= DIA_Canthar_PICKPOCKET_Condition;
	information	= DIA_Canthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Canthar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 25);
};
 
FUNC VOID DIA_Canthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Canthar_PICKPOCKET);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_BACK 		,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};
	
func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Canthar_EXIT(C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 999;
	condition	= DIA_Canthar_EXIT_Condition;
	information	= DIA_Canthar_EXIT_Info;
	permanent	= TRUE;
	description = "��� ����� ����!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //��� ����� ����!
	AI_Output (self, other,"DIA_Canthar_EXIT_09_01"); //��� ������.
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Personal CRIMES
// ************************************************************

INSTANCE DIA_Canthar_PersonalCRIMES (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_PersonalCRIMES_Condition;
	information	= DIA_Canthar_PersonalCRIMES_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

func INT DIA_Canthar_PersonalCRIMES_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Canthar_PersonalCRIMES_Info()
{	
	// ------ Spieler hat mich besiegt ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //��� ���� ����� ����� � ����� ������� ��������� ����.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(����������) �� �����, ��� ��� ������ ������� ���������� �� ����?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //���� �� ������ ����������, ���� � ����������, ����� �� ������ ������� � ���, ��� ������!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //� ��� ������ �� ���� � ����?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "� ���� ��� �������!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "��� ���� ������ - ����� ������� �� ����!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //��� ���� ������ - ����� ������� �� ����!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //����� ������� � ����� �������!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //� ���� ��� �������!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //����� ����� �� ������� ������� ��� �����?
	
	AI_StopProcessInfos(self);
};


// ************************************************************
// 			  				 Hallo 
// ************************************************************

INSTANCE DIA_Canthar_Hallo (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_Hallo_Condition;
	information	= DIA_Canthar_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Canthar_Hallo_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_Hallo_Info()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	// ------ OHNE R�stung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //����������, ��� � ��� �����!
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //�� ���� ����� � ����� - � �� ����?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //����� ����.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //��! (�������) �� ����� �� �������! ��� ������� ������������ � �����.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //��������, �� ���� ������ ��������� �� �������.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(���������) ���� �� �������, ������ �� ������. �� ��� �������, � ���� ���� ���������� ����������� ��� ����...
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//��� ���� ������, ����������?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "� ����� �� �������?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "��� �� �� ��� ����������."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen R�stungen (h�chst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //��� � ���� ������� ��� ����?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//��� �� �� ��� ����������.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//���� � ���-������ ������� ��� ����?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //� ����� �� �������?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //�� ��������� ��� ������. �� �������� ������ �� ���, ��� ���!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(� ���������) ���� � �� � ��� �� ��������, � ���� ���� ���������� ����������� ��� ����...
	
	Canthar_GotMe = TRUE;
	
	Info_ClearChoices	(DIA_Canthar_Hallo);
};


// ************************************************************
// 		  				 	WhatOffer				//E3
// ************************************************************

INSTANCE DIA_Canthar_WhatOffer (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_WhatOffer_Condition;
	information	= DIA_Canthar_WhatOffer_Info;
	permanent	= FALSE;
	description	= "��� �� ������ ���������� ���?";
};                       

FUNC INT DIA_Canthar_WhatOffer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_WhatOffer_Info()
{	
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //��� �� ������ ���������� ���?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //���� �� ����, ��� �� ���������, ������ ������� �� ������ ���� � �����.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(��������) ���� �� ������ �������� ��� �� '�����������' �� ������� � �����, ��� �������� �� ����, ��� ������� �� ������ ���� � �����.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //� ���� ������ ���� ������� � �����.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //� ���� ���� ��� ���� ������ ������. � ����������� ������� � �������� �����������. �������.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //� ���� ��������� � ������� �� ������� �������� ����� � �����, � ������ �������� ���������� ����.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //���� ��� ���������?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "���! ������ ��� ������ ����!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "��� �� ������ �� ���� �������?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "� ��� �� �������� � �����?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "��� ������ �� ������..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //� �������� ��������. � ������ ����.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"������ ������� ��������� �������."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //��� ������ �� ������...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //���! �������� �������. �� ������ ������� ��� ������.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //� ��� �� �������� � �����?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //������ ����� ����. � ������ ����� ��, ��� ������� ��� �������.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //��� �� ������ �� ���� �������?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(��������������) � ����, ��� �� ������ � ����!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //��������. �� �������� �� ���� �������. ����� ������!
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //������ ���?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //��. ��: ���� � ������� ���� � ������, �� ������ ������ ������� ��� ������.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //�� ���, ������������?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "�������. ����� ���� ��� ������.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //�������. ����� ���� ��� ������.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //�����. �� ��������� � ��� ���������, ��� ����� ������.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //� ��� ����: ���� � �� ����� �������� ���� �����!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //� �������� � ���� ����� ������� ������� � ������ - ������ ��� ��� ���� � ��� �� ������, �� ������ ���!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"� ������� ������� � �������� �������, ������� �������� ��� ������� � �����. ������, � ������ ������� ��� ������ � ��������� ���, ����� ����� ��� � ������.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //���! ������ ��� ������ ����!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //��. ������, � ���������� ����, �?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //�����. ���� ����� ���-������ ���? ����� ���� �������� ��� ������?
	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
};


// ************************************************************
// 		  				 	TRADE				
// ************************************************************

instance DIA_Canthar_TRADE		(C_INFO)
{
	npc		 	= Vlk_468_Canthar;
	nr 			= 888;
	condition	= DIA_Canthar_TRADE_Condition;
	information	= DIA_Canthar_TRADE_Info;
	permanent	= TRUE;
	description	= "������ ��� ���� ������!";
	trade		= TRUE;
};

func int DIA_Canthar_TRADE_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //������ ��� ���� ������!
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //�������.
	
	
};



// ###########################################
// ###########################################

// 				In der Stadt 

// ###########################################
// ###########################################
/*
		-->
		Aber ein H�ndler namnes Canthar hat das erz�hlt. 
	*/

///////////////////////////////////////////////////////////////////////
//	Info PayPriceInCity
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_PAYPRICEINCITY		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_PAYPRICEINCITY_Condition;
	information	 = 	DIA_Canthar_PAYPRICEINCITY_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};

func int DIA_Canthar_PAYPRICEINCITY_Condition ()
{
	if (Canthar_InStadt == TRUE)
	&& (Npc_IsDead(Sarah) == FALSE) 
	&& (Canthar_GotMe == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_PAYPRICEINCITY_Info ()
{
	if (Canthar_Gefallen == TRUE)
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //�� ����� ������. � ������ ����� ������� ���.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //��, ��, � ���� ���� ����������� ��� ����.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //��� �� ������?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //� ���� ������� ��� ������ �������� �� �������� �������. ���� ����� ��� � ����.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //� � ����, ����� ��� ������� ��� ���� �������� �����.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //� ��� ���� � ���� �����?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //� ��� ���� ������, ������� �� ������ ��������� � �� ������.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //����� �� ������� � ����� � ������� ���, ��� ���� ������� ������ �����.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //�� ������� � ������, �� �������� �������, � � ���� ��������.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //� ���� ���� ��� ��� �� ���������� �����.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //� ��� ��� � ����� �����?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //����� � ����� ���� ��������, �� �������� ������ �� ���� - ����� ������� ������.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "���, � �� ���� ����������� � ����.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "������, � ������ ���.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "� ��� �����, ���� � ��������?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //� ��� �����, ���� � ��������?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //��� ����� ����� ����� � ����� �������. ���������, � ����, ��� �� ������ ���������.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //���� �� ���� �������� ���������, ��� ������� ������������ ���� ����� ��������� � ������...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //���, � �� ���� ����������� � ����.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //��� ���� �������� �������, ��� �������. �� �� ��� ���������.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //������, ������, � ���� ��� ������.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //�� ��������������� ������. ���, ����� ������.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //� ��� � ������� �� ��� ������?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //����� ��� ������� ���� ���� ������ - � ���� ��� ����� ������ ���, �� ��������� �� ������.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //� �����, � ����� ����������� �������, ��� ��� �� ������� �������� ����.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"������ �����, ����� � ������ ��� ������, ��� ������.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"������ �������� ���� ��� ������, ������ �� ��������� ��� ������.");
	};
	B_LogEntry (TOPIC_Canthar,"� ������ ��������� ������  �������� ����, ������� ���� ����� ����������� �� � ���, ��� ��� ������� ������ �����. ����� � ������ ����� � ����� ����� � ��������� �� ���.");
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};
///////////////////////////////////////////////////////////////////////
//	Info SarahErledigt
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_SARAHERLEDIGT		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_SARAHERLEDIGT_Condition;
	information	 = 	DIA_Canthar_SARAHERLEDIGT_Info;
	permanent	 =	TRUE;
	description	 = 	"������ ���� ...";
};
func int DIA_Canthar_SARAHERLEDIGT_Condition ()
{
	if 	(MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Canthar_SARAHERLEDIGT_Info ()
{
	if ((Npc_IsDead(Sarah)) == FALSE)
	{
		if (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay()+ 2))
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //� ���� ��� ������ ��� ����?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //������� ������� ������ ����, � ����� ����� � ����� � ������ ��.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //������ �� ���. � �� ������� �������� ����, �� ��������� �� ����.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //�� ������� ������� ���� ����������� �����. �� ����!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //���� ������.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //������? �����������. ������, �� �������� ���� ����� ����� ��������� ������.
			
			MIS_Canthars_KomproBrief = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
			Npc_ExchangeRoutine	(self,"MARKTSTAND"); 
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Success		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Success_Condition;
	information	 = 	DIA_Canthar_Success_Info;
	permanent	 =  FALSE;
	description	 = "������ ���� ...";
};
func int DIA_Canthar_Success_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& ((Npc_IsDead(Sarah)) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Success_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //�������. ���� ����������� ����, ��� �� ����� �����.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //� ������ �� ������, ��� ���, ���� ���� ����� ������, ������ �� ���.
	
	if (Kapitel == 1)
	{
		CreateInvItems (self,ItMw_ShortSword3 , 1); 
		CreateInvItems (self,ItMw_ShortSword4 , 1);
		CreateInvItems (self,ItMw_ShortSword5 , 1);
		CreateInvItems (self,ItMw_Kriegshammer1, 1); 
		
		CreateInvItems (self, ItMw_1h_Vlk_Sword, 1); 
		CreateInvItems (self, ItMw_1h_Nov_Mace, 1); 
	};
	if (Kapitel == 2)
	{
		CreateInvItems (self,ItMw_Stabkeule , 1);
		CreateInvItems (self,ItMw_Steinbrecher, 1); 
		CreateInvItems (self,ItMw_Schwert2 , 1); 
		CreateInvItems (self,ItMw_Bartaxt , 1); 
	};
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //�� ��������� ���� ��� ������.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //���������. ���, ��� ������ - ������������ ���������� ���������.
				
		B_GiveInvItems (self, other, ItMW_Schiffsaxt,1);
	};
	B_GivePlayerXP (XP_Canthars_KomproBrief);
};

//---------------------------------------------------------------------

				//Canthat hat seinen Marktstand OHNE Spieler Hilfe 

//---------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info Canthar hat den Stand 
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Again		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Again_Condition;
	information	 = 	DIA_Canthar_Again_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Canthar_Again_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Again_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //��, ����� ��.
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //������ �� �� � ������?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //���� ���������. ��� � ��� ������� ���� - � ����� ����������� ������� � ���� ������.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //������, � ���������� � ����� ���. �� ������ ������ �� ���� ���� � �������.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //����� � �� ������������ ����? ���� �� �����, ���� �� �� ����� ��, ��� � ������.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //������ ��� �������� ������, ��� �� ������ ���������.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //����� ������� - ������ �� �� ������� ������ �� �������� ������� ���� ����� �����.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //� ����, ������� ��, ������� ��� �������� ��� ����, ��� ����� ������, ������...
	B_Say_Gold 	(self, other, Canthar_Gold);
	
	AI_StopProcessInfos (self);
	
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Pay		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_Pay_Condition;
	information	 = 	DIA_Canthar_Pay_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Canthar_Pay_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Canthar_Again)
	&& (Canthar_Sperre == TRUE)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Pay_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //�� ����� ���������?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"������, � ������� ...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"� ���� ��� � ����� ������� �����...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"������� ��� �����?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //������, � �������, �� �� ���������� ��� ������.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(����������) ������. � ������ � ����������, ����� ���� ��������� ����� ��������� ������� �����.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //� ���� ��� � ����� ������� �����...
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //����� ������ ��.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //������� ��� �����?
	B_Say_Gold 	(self, other, Canthar_Gold);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Canthar im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_CANTHARANGEPISST		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_CANTHARANGEPISST_Condition;
	information	 = 	DIA_Canthar_CANTHARANGEPISST_Info;
	important	 = 	TRUE;
	permanent	 =  TRUE;
};
func int DIA_Canthar_CANTHARANGEPISST_Condition ()
{
	if (Canthar_Ausgeliefert == TRUE)  //SC hat Canthar bei Andre verpfiffen!
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	&& Npc_IsInState  (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_CANTHARANGEPISST_Info ()
{
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //� ������������ ����, �� �� �� ������. �� ������� ���� ������ �����.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //� ������ ����������, � ���� ���������.
	
	AI_StopProcessInfos (self);	
};
///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_MinenAnteil		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 = 	3;
	condition	 = 	DIA_Canthar_MinenAnteil_Condition;
	information	 = 	DIA_Canthar_MinenAnteil_Info;

	description	 = 	"�� �������� ���������� �����!";
};

func int DIA_Canthar_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
		{
				return TRUE;
		};
};

func void DIA_Canthar_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //�� �������� ���������� �����!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //��? � ���?! ���� �� �, ��� ������.
	B_GivePlayerXP (XP_Ambient);
};











