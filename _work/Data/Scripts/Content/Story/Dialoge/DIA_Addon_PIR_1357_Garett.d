// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //���� �� ��������� ��� �������������� � ����� ������.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //��� �� �������, ��� ����� ��������, ���� � ����?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //�� ��� � ����� ����������� �� ��������� �� ������ �����!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //���, � ������ ���������� ����� � �������� ���� ������.
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //���-���. ����� ����. �������, �� �� ���� �� ���� ������� ��������?
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //��� ��� ������. ���� ���� ���-������ �����������, ������ � ����.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //� ���� ������� ����������� ��� ������. ����, ������ - ���, ��� ����� ���� ������������.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //����� ��������. ���� ���� ����� �������, ��� � �������.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "��� ����� �������?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //��� ����� �������?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //��� ����������. � ���� ���� ������ �� ������, �������� �� ������.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //������ ��� �� ������ �� �����, � �� �� �������.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //� �� ����������� ���� ��������� ������.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //�� ��� ���� ������ ���������� ��������� � ��������, �������, �� ���� ���������.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //� �������-������ ����� ����� ��������� ��������� ������!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "������ �� ��������� ���� ������?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //������ �� ��������� ���� ������?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //����� ���� ����� � �������, �� ������ �������� ������ ��������� �����.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //�� ��������� ������� ����� �� ��� �� �������� �������� ��������.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //�� ������ � ��� � ��������� �����, ��� ��� ��� ������ ����������� � ����.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "��� �� ������ �� ���� ��������?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //��� �� ������ � ��������?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //�� ���� ���� ����� �������� � �����.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //�� �������� ����� ������� � ���� ������.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //� ������ ���� �������� ��� ������� ������� �������, ����������� � ������.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "��� ������� ����. ����� ��?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //��� ������� ����. ����� ��?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //� ���� ������ ������� ������ ����� �� ������.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //� ���� �� �� ����� �� �������������.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //�������, ��� ��������, ������ ��� ����� �������, ������� �����, ����� �� �� ������� ����.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //� ���� ��� ���������� ���-������ ������������� ������, ������� ��� �� �������� ��� ����.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //������� �� ����������� ������� � ����� ������� ������.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //������� ��, ���� ������� ���� ������� ��� � ����.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //��������� �� ��� ���-������ �������. �� ��� ��������� �� ����� ������ �����������.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "� ��� �� ��� �������� ���� ������?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //� ��� �� ��� �������� ���� ������?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //������� ���� ������ ���, ��� ������ �������� ���� ������. � ����� �� ������������.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //���-������ ���?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //�� ��� ���� ��������, ��������� �� ������� ����� ������ �� ����.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //���� ������� ��� ������, ����� ����, ���� ������� ��� ���-������ �����.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //������� � ��� ��������� ����������� ��� �����, �� ���������, ��� ��� ����� ���������.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //���� �� ��� �� �������� ���� �����������, �� ������ �����.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"���� ������� � ������� ����������� ������. ������ ������, ��� ���� ������� ��� ���-�� �� ����� �����.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "��� ���� ������.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //��� ���� ������.
	
	//Patch m.f. - weil H�ndler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(��������) ��, ��� ��! ��� �� �� �����, ��� ����� ��� �����.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //�������, ��������!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //�� ���� ��� ���� ��� �� �������.
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //������ � ������� ���� ����. ��� ���� �� ����� ������ ���� �����.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //�������, �� ����� � ���� ����.
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //�� �������� �� ���� ���������� �����... ���, ������� �� ����� ���� �����. � �����, ������ ����� �� �������.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"������ ��� ����� ���, ����� � ������ ��� ������.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "��� �� ��� ������ ������� � ��������?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //��� �� ������ ��� ������� � ��������?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //����� ����� ���, �� �������� �� ��������.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //�� ������ ������, ����� �� ���� �������.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //�� ���� ������� �� ����� ��������� �������� ���� ������� ������� �� �������.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //���-�� �������� ������ ���������� ������ ����� �� ������ ��������.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //��������� �� ������ �������������.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //�������, ��� ���� ����� ��������.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //��-�� ������� ���� �������, ��� � ����.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "���� �������?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //���� �������?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //� ��� ��� ��� ���� �����, ������ ����������� �� ���������.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //����� ���� ��� ���� ��������, ��� ������ ��������� � �����.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};


