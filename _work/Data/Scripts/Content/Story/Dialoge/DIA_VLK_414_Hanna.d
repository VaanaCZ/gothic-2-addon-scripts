// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //��, ������ - ��� � ���� ������� ��� ����?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "� ���� ����� �������.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //� ���� ����� �������.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //�� ��������� ��� ��� �� ������.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //���� �� ��������� ������ ���, ��� � ���� �������� ���� ����� ���������...
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //������� ����� ������� �� ����?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //��� ������ ��������� ���������.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //�������� ���������� ������ ���� ����������������.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //�� ����, � ���� ������������ ����� �� ���� ���������?!
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //��, ��.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //������ ��������� ����� �� ��������.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //���� ���� ��� ��� ��������.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "� ������ �������� ������ �� ���?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //� ������ �������� ������ �� ���?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //� �� ���� �����, � ��� ��� �������.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //� ����� ������� � �����, ��� �����, ����� ����� �� ��������� ����� �� ������. ��� ���������� ��� ����.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //�� � � ������ - ��� ����� ��������� ������������ ������������� ���������.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //������, ����� ������� ������� ���������, ��� �������� ���������� ������ �� ��������� � �������� ����������� ������ ���������������.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //����� ����, � �����, ��� ����� ������� ������� ��������� ��� � ������.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //���� ����� ���� �������� ��������� ���������� ���� �� ������� ����������.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "��� ����� ����� ������?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //��� ����� ����� ������?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //� �������� ������������� �������� � �����.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //���.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //���� �� �����, ����� �������� � �� ��������! ��� �� ����� ����� ��������!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "��������� �������� � ������...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //��������� �������� � ������...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"��� � ���� ������ ���-������ �����?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"�������� ��� � ������.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //��� � ���� ������ ���-������ �����?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //����� ��������� ����� ����� �������� ������  � �����. � �����, �� ������� ��� ���, ��� ���� �����.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //����� ���� ��������� ����� ������������� � ������ ����� ������. ����������� �� ��� ��������� �������� �� ��������� �����.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //����� � ����� �� ������� �������� �����. ��� ����� ������� ����� �� ������.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //�������� ��� � ������.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //������� - ���� �� ����� ������� ������� �����������, ���� �������� �� ��, ��� ������ �� ������ �� ������� �����.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //�� � ��� ���, ��� �������� ����� � ������, ��������� �������� ����������� ������. ������ ������������ ���� �������� ���� ��� ���� �����,
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //� ������ � ��� ���� ������� ����������� �� �������. ������� �������� ������� ����� ����������, � ������ �������� ����� ����������� ����.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //����� �� �����, ��� �������� ��� �������. ��� ������ �� ��������, ����� ��� ����� � ��������� �� ������. ���� �� � ����� ����� ���� ���-�� ��������.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht�s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "��� ����?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //��� ����?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //��� ������-�� �������, ��� ���� �� �����-�� ������� �������� ������ �����.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"�� ����������.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"��, ��� �������...",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"� �����-��, ���.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //� �����, ��.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //��, ������ � �����. ������ ��� ������ ������ � ����. ��� ��� ���� �����?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //��, ��� �������...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //��� ������� �� ����, ������� �� ���� ����� ����������, �� ������ �������?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //� �� ����� �����, ��� ��.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //�� ����������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //��, ��������� ����� ����... � ��������� ������� � ���� ������ ���� � ������� ����� ������ ���� ��������, ���������� � ������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //�� ����� � ��������, ��� � ���� �� ������� ������ ���������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //� �����, �� ��� �������� ��������� � ������ ���� ����.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //�� �� ��� �� ������� ��� ���?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"� ����� ������ ��������. ������, �� ������ � ������, ���, ��� ����� ��������� �������."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"� ���� �� ������� �� ����������.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"� ��� ��� � ����� �����?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"� ��������.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //� ���� �� ������� �� ����������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //������� - �������� ������� ������� ������� �������� ��� ����. ������, ���� �������� �������� ���� �����.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //��� � �� ��� ������?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //���, � ����� - �� �� �����, ��� ���� ���� ��������� �������� �����.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //��� ��� �� ������ �������� � ������ �������?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"�����, ������.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"��, �� ����� �� ���� ������� ���������� �� ����... ��� �������...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"������.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //�����, ������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //��, ���� ������� ������� � ���� ��� ����. ���� �� ��������� ��� ���� ��������, � ��� ���� 75 �������.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //��, �� ����� �� ���� ������� ���������� �� ����... ��� �������...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //��, �� ���! �... �������� ������! ����������� ������!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //���� ����� ���� ���������� ������? ����� - � �������� ���� �������� � 50 �������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //���� �� ������� ������� ��� ���� ��������, � ��� ���� 50 ������� �����.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //� ��������.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //�� ����� ��������. � ����� ���� �����!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //���� �� ��������� ��� ��� ������, ���� ���� �������.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftst�ck?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "�� ���� �������� ����� � ����?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //�� ���� �������� ����� � ����?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //��, ������ ���. �������.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //��� ������ ���� �������?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //�� ��� ������. ��� ���� ������.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //������... �� ������?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //� ����� ���-��� ���������� � ����� �������...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //��� �� ����� � ���� �������?!
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //�� ��������� ������ ���!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(�������) � �� ����, ��� �� ��������...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(�����������) �������� �� ����! �� ������ ����� ������? �?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(��������) �...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(�������) � ����!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(������������) �� ������ ���. � ��� ����.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //���� � �� �����, ����� ������� ���-������ �����, �����?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //�� �� ����� ���� ��������� ���������� �������� � �����.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "��������, ����� � ���� ���� �����!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //��������, ����� � ���� ���� �����!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //�������� ������. ��� ���� ��� �������?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //��...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //��, ��� ����� ������� ������ ��������� - ��� ������. �� �����, ���� �� ����� � ����...
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "��� - ������ ��� �����.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //��� - ������ ��� �����.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //�������.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //������ ��� � �������� �������.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //��� ��� ����� �� ���� ���?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //��� ���� �� ����, ������� � ���������.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //� ������ ��� � �������?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //� ����� ��� �� ������ ��.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //�, �������, ����� ����, ����� � ���� ����� ����� � �������, ��� � ��� ����.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //��. �� ���� ����� �� �������� �� ����...
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //�� ����� � ������ �����?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(����� ���������) � �� �������, � ��� �� ��������...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //����� ���� ���������... ���-�� ������ ���� �������!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //��� ��� ������ �� ������ ����������, �� ������ � �� ���� ������!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //� �������, ��� ��� ��...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //� ������ ��� ���������� ��� ����.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //��� �������� ��� � ����������� �����. �� ��� ���� ������ �� �����, ������...
};	

	
