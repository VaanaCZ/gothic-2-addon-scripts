// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //��� ���� �����, ���������? ���� �� ������ ������� ���������, � ��������� ������������ ����. � ������ �����.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //���� ����� ������. � ��� ���, ��� ���� ��� ���, � ����� �� ����� ����� ����, �������.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "���� ������� ������. �� �������, ��� �� ��������� ���.";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //���� ������� ������. �� �������, ��� �� ��������� ���.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //�� ����� �������� ������? �� ���? ��, ��� �� ��� �������, �� �� ��� �� �������. ����� ��������������, � ��� ������������ ����� �� ������.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //� �� �����, ������ ��� �����? ��� �� ��� ����, ��� � ����������. ��� ��������������!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //��������, ���� �� ��� ��� ��� ���, �� �� �� ������ �������� �����. ��, ��� ������ ���...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //...�� ��� ����� ������� ���������. ��������, ���������, ��������� ����������. � ��� ���� ���. ���������, �������...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //...������ ��� ���� ���������� � ������ ����. �� ���������, ��� ����� ���� ������������ ������� � ���������...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //...�� ������ �����... ����� ��� ���� ������ ��-�������. ����� ����� �� �� ��������� ������� ������ ����� ������...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //...�������� �����������. � ��� ��� ������ ������? ��� ������ ��� ��������� ������� ����� � �������, � ����� ���������� ��� ������� � �������. �� �� ��� ��� ������ ������...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //...����� ���������� ��������� � ������ ���������� �����. ��� ����� ������ �� ���� ������� �� ������� � �����. ��� ��� ��� ��������� ��������� ������� - �� ����� ����, �� ���� ������ ���� ��������...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //...�� ����� ������ �������� �� ������ �������� ��� ������� - ���������� ����� � ��������, ������� ������ �� ����� �����...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //...����������� ���� �� ������� � ����� �����. �� �������, � �������� ��������, ��� ������ �������� - ��� ��������� ���� �������, ��� ��� ������ ��� ��� ��...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...����� �� ���. � ������� � ��������, ����� ����� ���� ������� ������ � ���� ����������. � ���������, � ����� �������� � ���, �� ��� ��� ������� ���� ��������...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //...�� ������������� ����� ��� ��� �����. ����� �� ���� ��������. � ��� ��� ��� ���������� ���� ��� � ���� �������� ��������. � ������ ���� ���������, ������������ ������...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...����� ������ � ���� ��������� ����������. ����������, ������� ��� ������ ��������. ���� �� ��� ��� ��� ���, ������ �� ������ �� ������� ���. ��, ��� ������ ���...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"������. ��� ������?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"���������� ...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //������. ��� ������?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(���������) �� � ���� ��� ������, � ������ �����!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"���������� ������, ��� ��� �������� �������� ����!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"������, ��� �������� ������� ���� ���� ...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"� ��������� ��������� ��� ����� �� ����.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //����� �� ������ �������� ��������� �� ����� ������. � ������, ��� � ����� ������� �� ����� �����...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //��� �� ������, �����������! �����, ���, ������ ������.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(����������) ������, ��� ���� �� ��� �� ������.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(�����������) � ������, ����������, ������ ��� ���.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //� ��������� ��������� ��� ����� �� ����.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //�� �������� ��� ���� ����? ��, � �����, ��� �� �� ����� ������ ��� ���� ������!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //��, ��, �� ����� ��������������.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //�����������, ����� ������� ������ ������ - � ���� ������������� ����.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(���������) ���������� ������, ��� ��� �������� �������� ����!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(���������) �� �� ������ ������� ������. �����, �������� ���� ������, � � ������ ������!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //��� ���� ����� ���������� � ����� ������� ��������� �� ����. � ���� ������������� ����.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //��� ������� ����, ������� ��� ���, �� ������� ����� ��� ����, ������ � ����� ��������.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //����� � �������� � ���� ����! �������-�� � ������ �������� �������, ��� �����������...
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //��-��, �� ����� ��������������.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //���� � ������ ���� ����� ���� ��� ��, ���� �� ��������� �������, ��� ��� ��� ����� ������.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //�����������, ����� ������� ������ � ������.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //��� �� ��������� �� ���� ��� �����? �� ��� ����� �� ���������� ������� ����!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //��� ��� ���� �����? �� ������� ��� ������! ��������!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "��� ����?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //��� ����?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //��� ����� ������� � ���������. ���� �� ���������, ����� ���� ������������ � �������. ������ ���������, ������� ����� ���� ��������!
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"��� ����� - ���� ���. ����� ���������.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"��� ����� ������.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"��� �� �������?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //��, � ��� �����������. ���� ����� ��������� ����� ��������.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //� ����� ��� ����� ��������� � ����?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //�� �� ��� �������. �� ������, ��� �������� ������ ��, ����� ����, ����� �� �������� ���������� ��������?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //��� �� ���������� ���������� ���, � ��������� �� ����� �����. ��, ����� ������, ��� ����������� ������.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //�������� � ����-�� ���������. ������, ��� ���������� ������� �� ������.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //��� ��� ������, �� � �� ���� ����������.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //��� ����� - ���� ���. ����� ���������.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //��, ����� ����� ��� ������� �����. ��� �������� �� ���. �� ���� ����, ��� �� ������� ������� ����� � �������.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //������ � ��������� ����, ��� �� �������, ����� ��������� ����� ��������� �� ������.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //��� ����� ������.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //�� ��������� ���������� ����. ��� ����.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //��� �� �������?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //������ ��, ��� ������� �� ������.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //� �������, ��� ������ ��� �������, �� � �� ����, ������ ��� ��� ���.
};












