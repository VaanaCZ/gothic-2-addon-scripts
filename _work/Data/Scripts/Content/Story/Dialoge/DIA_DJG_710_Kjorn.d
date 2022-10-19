
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kjorn_EXIT   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 999;
	condition   = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Kjorn_Hello   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;	
};

FUNC INT DIA_Kjorn_Hello_Condition()
{
	IF (Npc_GetDistToNpc (self,hero) < 300)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_Hello_Info()
{
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //��, ��� ����!
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //���� ����?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //��� ������ - ������� �����, � ��� ����������� ���������� �� ����� ������ ������� ���� ������.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //� �������, ��� � ���� ��� ��� ���������� ����������.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //������. � � ���� ���� ������� ��� ����.
};

//*********************************************************************
//	Info TRADE 
//*********************************************************************
INSTANCE DIA_Kjorn_TRADE   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	Trade		= TRUE;
	permanent   = TRUE;
	description	= "��� �� ������ ���������� ���?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //��� �� ������ ���������� ���?

};

//*********************************************************************
//	Verkaufst du auch Informationen? 
//*********************************************************************
INSTANCE DIA_Kjorn_SellInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent   = FALSE;
	description	= "� ����������� �� �� ��������?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //� ����������� �� �� ��������?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //����� ����. ���� ���� ����������, � �������� ���� ���, ��� � ����.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //������� �� ������?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //���... ������ �������. ��, �����, 50 ������� �� ������ ����������, ��� �� ��������, ����� ���������.
};

//*********************************************************************
//	Ich brauche Infos �ber.. 
//*********************************************************************
INSTANCE DIA_Kjorn_BuyInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent   = TRUE;
	description	= "��� ����� ���-����� ����������.";
				
};

FUNC INT DIA_Kjorn_BuyInfos_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //��� ����� ����������.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 �������!
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"��� ������� ������ ��� ����.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"��, �����.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //��� ������� ������ ��� ����.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //���, �����.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //������ ����� ���...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zur�ck -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... ������ ��������.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... ��� � ��������.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... � ������ ��������.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... ��� � ������ ��������.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... � �����.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... �� �����.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... ��� �� �����.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zur�ck -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //������, ����� ��� ��� ������, � ���������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //��� ������.
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //�������� ��� � ��������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //������� - ��� ������� ���������� ������� ��������. �����-�� �� ���� ������ ������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //�� ��� ������ ����� ��� �� ������ �� ��� �� ���� �����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //�� ����� ������, ��� ������� �����. ���� ��� ��������� � ���� �����, ���� ������ ��������� � ������. ��, ��� � ������...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //�������� ��� ��������� � ��������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //��� ������� ������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //��������� �� ��� ����� ������� ����� ����� ���� ��������� ����� ��������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //������ �� ������������ ���� � ���������� ��������� ��� � ��������.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"������� �� �������� ����� ��������, ��� ������� ������ ��������� �����. ��������� �� ��� ������������ ��������, ����� �����, � ������, �� ��� ������, ������ �������� �����."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //�������� ��� � ������ ��������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //������ �������� �������� �������� ���� ������ ��-�� ����� ���������� ����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //��� ���� - ������������ �����, ��� ����������� ���������� ����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //������, ���������� �� ���� ����, ������� �� �������� � ����� ������� ���� ����� ������� �����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //�� ���������� ������� ��� ������ ���� �������� ���������� ��������. �� ��� �����������, � ����� �� ��� ����� ������.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //�������� ��� ��������� � ������ ��������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //������ ������ ���������� �� ��������� ��������� ����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //����� ������ ����, ������ � ���� ��������� � ������ ������� ��������, ������ �� ������� ������ ������� ����� �� ������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //�������, ��� ��������� ���������-�������� ��� ��� ��������� � ������, �� � �� ������, ��� ��� ��� ����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //��������� �����������, ��� ��� �������� ������� ����� ������� �������� � ��� ������.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //�������� ��� � �����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //�� ��������� � ����� ������ ������ ��������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //����� ������ ��� ���� �������, ������ ������ �������������� ��� �������� ����� ������.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //�������� ��� �� �����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //���� ��������� ����� �������. �� ������� ����, �� ����, ��� ������ ����� ������.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //�� ��� �����������, ��� ������������� ��� ���� �����. ���� ������ ������� �����, �� ������ �� �� ���.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //� ��� ���� �������� ����������� �������. ��� ����, �� �� �� ����� ����.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //�������� ��� ��������� �� �����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //����� ����������� ������� �����. ��� ����� ����� ������ � �������� � ������� �������. �� ����� ���������� �����.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //� ���-�� �����, ��� ���� �� ��� ������ ������� ��� ����� ������ ������ ������.
	
	KjornToldOrks = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kjorn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "� ���� ���� ��������!";
				
};

FUNC INT DIA_Kjorn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //� ���� ���� ��������!
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(�������) �������, � � �������.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //��������, �� ���� ������, �� ����� ����? ���, ����� ������, ������� ������� ����.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kjorn_PICKPOCKET (C_INFO)
{
	npc			= DJG_710_Kjorn;
	nr			= 900;
	condition	= DIA_Kjorn_PICKPOCKET_Condition;
	information	= DIA_Kjorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kjorn_PICKPOCKET_Condition()
{
	C_Beklauen (47, 75);
};
 
FUNC VOID DIA_Kjorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_BACK 		,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};
	
func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};


