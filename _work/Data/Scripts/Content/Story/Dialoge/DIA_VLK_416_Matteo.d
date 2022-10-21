// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //��� ���� ������?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "��� �� ��������?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //��� �� ��������?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //� ���� ���������� ���, ��� ����� ������������ � ����� �����������. ������, ������, ��������... ���� �������.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //� ���� ���� ����� ������� ��������� �� ������.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //������� ��������� ������� �� ���� �������� - ������ �����. ���� ��� ���������?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"����� ������ ��������� � ����� ����� ������. �� ������� ����������, ������ � ������ ������.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "������ ��� ���� ������.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //������ ��� ���� ������.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //� ��� ���, ��� �������� ���������� ������, ��������� ��������� ����� ����������� ���� ��������.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //� �������, ��� ����������, ����� ����� ������ �������.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //������, �������� ������������� �������� ��������� �� ���� ���. ��� ���� ��������� ������ �� ����� �������.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //��� ������, ��� �� ����� ���������� ���� ������, ��� �����, ����� �� ��� ������������ ���� ����� �� ��������� ������.
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"������ ������� �������. ������: ������ 25, ������ 20. (250 ������)";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //������, ����� ��� ��� �������.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //��� ���� ����������. (����������)

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //��� ������� ����� �������� - �� ���, �����������, ����� ����� �����. ��� ��� �����������, ����� � ���� ����� ���������� ������.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "��� �� ������ � ���������?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //��� �� ������ � ���������?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //� ��� ���, ��� ��� ������� ������� � �����, � ���� �� ��� ���� ��������.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //��������� ���, ����� � ��� � ������� �������, ��������� ���������� ��� ������ � ������ ��������, ��� ��� ��� �����!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //�?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //������� ��, ��� ���������� ����!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //�� � ���� ��� ���� ����� � ���� ������, ����� ��� ���������� ������� ��� ������ ��� ���� ������!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //� ����� ��� ������� ������ � ������������ �������� ���� �������!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "�������� ������� ���� ������?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //�������� ������� ���� ������?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //���, ��� � ���� ��������� �� ������ �����.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //��� ������ ��������� ��������� ����� ������ �� ����.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //��� ��� �������, ��� ��� �� ������� ���. ���� �� ������� ��������.
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "�� ������ ������ ��� ������� � ������� �������?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //�� ������ ������ ��� ������� � ������� �������?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(�����������) ���? � ��� ���� ����� ���?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //� ���� ������ ���������...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //���-���... � �� ������� ����� ���� ����������?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(������� ����) ��, ������ �� ����!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(�������) ��� ��� ������� ��� ���� �����!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //� �� �������, ����� ��� ���� ��������.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //��������, �� ����.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //� �� ���� ��������� ������ � ���� ��������� - ��� ���� �� ��������.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //�� ���� ���� �� ������� ��, ��� �������, ������� ������, �������������� � ������, ��� �� ������ ����.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //������ ��� � ��� ���� ������.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //������, ��� ����� ����� ��� ����.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(������) ������ � ���: ��������� ��� ����� ��� ����?
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //�� ��� �� ���������?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //� ���� ������ ���� - � ����, ��� ��, ���� �� ����� ����������� ����� �����.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //�� ��� ���� ��������� � ��������� �����.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "��� �� ������ ������ ��� ������� � ������� �������?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //��� �� ������ ������ ��� ������� � ������� �������?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "������ ��� ����� �������� ������ �� ��������.";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //������ ��� ����� �������� ������ �� ��������.
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "��� �� ������ �� ���� ������?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //��� �� ������ �� ���� ������?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 ������� �����.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "��� ��� ���������...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "�� ��, �������!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //����������� ��� �����! ��� �� ���� ������ � ���� � ����.
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //� ���?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //� ��������, ��� ��� ������.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //������, ���������� ��������, ��� ����� �� ������ ��� ����.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //�� ��� ��������� ������������ ��������� ���������� � ����� ������� - ��� ��������, ��� ������ � ��� ����.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //� ����, ����� �� ����� �� ��� ���� ����. �� ������ ������ - ������� - ���� ����� ����������� �������.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //������� ��� ��� ������, � � ������ ����.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"���������� �������� ������� ������ ������ ������ 100 ������� �����. ���� � ����� �� ���, �� ������� ��� ������� � ������� �������.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //�� ��, �������!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //��� ��� ���������...
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "��� ��� ����� ��� ������?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //��� ��� ����� ��� ������?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //��� � ��� ������� - ��� ���������� �������� - ��� ��� ��������� ���� ��� �����, ������ �� �������.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "��� ���� 100 �������!";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //��� ���� 100 �������!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //�� ���� ������ ����� ������! � �� �������, ��� ����� ������� ��!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //� �� ���� ����� �������� ��������� � ����� ����. �� ������ ������ � ����� ������! �� ���� ���� ���������� �� ����!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //�? ���� �����-������ ��������?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //������ ������, � ��� ������ �� ��������.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //������! �� �������� ���� ����� ������.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //�� ������ ��������� �� ���? �� - � �� ���������, ����� �� ��������� ��� ������ �� ���!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //�� ��� �� - 100 ������� ���� 100 �������.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //�� �������� ���� ����� ������.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //� ���� �������� �� ������? � �� ���� 100 ������� �����.
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "������ ��� ����� �������� ������ �� ��������!";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //������ ��� ����� �������� ������ �� ��������!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //�� ��������, � ������� ���� ��������.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //������ ������� ������� �� ���� � ���� ������ �������.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"������ ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //����� ���� �������. ������� ������� ���� ����� ������ � ������� ��� ������!
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "��� ������ �� ����������� ������ ���?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //��� ������ �� ����������� ������ ���?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //��� ������. � ��������� ���� �������, ����� ������� ������ ������� �������� ����� ���� � �������.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //���� ��������, �� ������������� ������� � ����������� ������ � ������� ������� � ������� �������. ������ �����, �� ������� ���-������ ����������.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"������ ����� ������ ��� ����� �������� ������ �� ����������.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "� � ���� � ���� ��������� � �������?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //� � ���� � ���� ��������� � �������?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //� ������ ������� �� ���� �����.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //��� ����� ���� ������ �����, ������-������ ������, ������� ������ ��� �������  �����������.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //���� �� ��� ����������� ������� ����.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //�� �����, ����� � ���� ���� �������� ������ �������. ����� ������ ��������.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"� ���� ����� �������� �������-������� �������, ������� ������, �������� ������� ��� �������� �����������.");
	B_LogEntry (Topic_Lehrling,"������ ��� � ����� ��������, � ������ �������� ��������� ������ ��������.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "��� ��� �������� ��������� ������ ��������?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //��� ��� �������� ��������� ������ ��������?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //�� ������ ������ ������� ��. ��� � �������� � ����.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //�� ���� ���� �� ���� �� ��� ����� ������ ����, ���� �� ��������� � �������! ��� ��� ���������� ����������� ��!
	
	B_LogEntry (Topic_Lehrling,"� ����� �������� ��������� ��������, ������ ���� � ������� ���� � ������ ������� ����� ����.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "� ������ �� �� �������� ���� � �������?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //� ������ �� �� �������� ���� � �������?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //� �� ���� - �� ������ ������� �� ����������.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //� ������ ������� ���� ��� ������ �������.
};	

// ************************************************************
// 			  				Andere M�glichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "� ���� ������ ������ ������� � ������� �������?";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //� ���� ������ ������ ������� � ������� �������?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //��������... ���� � ���-������ ��������, � ��� ���� �����.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "� ���� ����� ������ ������� ���� � ����� ��������������� ��������.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //� ����, � ���� ����� ������ ������� ���� � ����� ��������������� ��������. ��� ������ �� ����?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(������) �����? ��. � ������ ��� �������? ������� �� ����, ��� � ���� ��. �������, ���� �����.
	B_GivePlayerXP (XP_Ambient);
};	





































