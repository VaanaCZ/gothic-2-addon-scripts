// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rupert_EXIT(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 999;
	condition	= DIA_Rupert_EXIT_Condition;
	information	= DIA_Rupert_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rupert_PICKPOCKET (C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_PICKPOCKET_Condition;
	information	= DIA_Rupert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen (18, 10);
};
 
FUNC VOID DIA_Rupert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rupert_PICKPOCKET);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_BACK 		,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
	
func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Rupert_Hello(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_Hello_Condition;
	information	= DIA_Rupert_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //������, ���������!
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //��, ������ ����, ������� � ������ ����. �����, ���� ������������ ��� ������?
};	

// ************************************************************
// 			  				 Zu Pal 
// ************************************************************
INSTANCE DIA_Rupert_ZuPal(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_ZuPal_Condition;
	information	= DIA_Rupert_ZuPal_Info;
	permanent	= FALSE;
	description = "���������� ������, � ������, ����� ����������� � ����������...";
};                       
FUNC INT DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_ZuPal_Info()
{	
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //���������� ������, � ������, ����� ����������� � ����������...
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //� ���� ���� ������ �� ���. � ��� ���, ��� �������� ������������ � ������� ��������, ���� ����� ����� ������ �������.
};	

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
INSTANCE DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_HelpMeIntoOV_Condition;
	information	= DIA_Rupert_HelpMeIntoOV_Info;
	permanent	= FALSE;
	description = "�� ������ ������ ��� ������� � ������� �������?";
};                       
FUNC INT DIA_Rupert_HelpMeIntoOV_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_HelpMeIntoOV_Info()
{	
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //�� ������ ������ ��� ������� � ������� �������?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //�? ���, ��� ����� ���� ��� ������!
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //����� ��������� ����� � ������ ����� ������ ���������� ���������, ��� ����� ��������� ������ ���������� ����.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //������, ��� ����, - ���� �� ���. ��������, ���� ����� ���������� � ���.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"����� ������� � ������� �������, ��� ����� ������ ����������� ������� �� ������ ����� ������.");
	B_LogEntry (TOPIC_OV,"�������� ������ - ���� �� ����������� ������� ������ ����� ������.");
};	

// ***************************************************************
//							WoMatteo
// ***************************************************************
INSTANCE DIA_Rupert_WoMatteo(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_WoMatteo_Condition;
	information	= DIA_Rupert_WoMatteo_Info;
	permanent	= FALSE;
	description = "��� � ���� ����� ������?";
};                      
FUNC INT DIA_Rupert_WoMatteo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WoMatteo_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //��� � ���� ����� ������?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //�� ������ ����� ����� ��� ������. ������ ����� ������. �� ����������� ������ ���.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"����� ������ ��������� � ����� ����� ������. �� ������� ����������, ������ � ������ ������.");
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einflu�
// ***************************************************************
INSTANCE DIA_Rupert_WerEinfluss(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 2;
	condition	= DIA_Rupert_WerEinfluss_Condition;
	information	= DIA_Rupert_WerEinfluss_Info;
	permanent	= FALSE;
	description = "� ��� ������ ������ ����������� �������?";
};                      
FUNC INT DIA_Rupert_WerEinfluss_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WerEinfluss_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //� ��� ������ ������ ����������� �������?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //�������� � ������� ������������, �����, �� ������� ����� - ����� ����������� ������ � ������.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //�� ������ ���������� ����� �������� ������ �� ���, ��� �.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //� ��� ���, ��� � ������� �� ������, ���� � ������ ��������� �� ��� � ���������!
	
	B_LogEntry (TOPIC_OV,"� ������ ���������� ����� �������� ������ �� ��������.");
};

// ***************************************************************
//							Work
// ***************************************************************
INSTANCE DIA_Rupert_Work(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 3;
	condition	= DIA_Rupert_Work_Condition;
	information	= DIA_Rupert_Work_Info;
	permanent	= FALSE;
	description = "��� ����� ������ � � ��� ������.";
};                      
FUNC INT DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Work_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //��� ����� ������ � � ��� ������.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //� ������, ��� � ������� �������� � ������������. ��� ����� ��������� ��� ���.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //�������, �� ������ �������� ������.
};

// ***************************************************************
//							YourOffer
// ***************************************************************
INSTANCE DIA_Rupert_YourOffer(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_YourOffer_Condition;
	information	= DIA_Rupert_YourOffer_Info;
	permanent	= FALSE;
	description = "��� �� ������ ���������� ���?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //��� �� ������ ����������?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //������, � ���� ���� ��� ����.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //���� ������ �������� �� ���������� ������ ��������, � ����, ��� �� �������� � ��������� ����, ������������ ��� �������������� ������������ ������.
	};
};

// ************************************************************
//								Trade
// ************************************************************
INSTANCE DIA_Rupert_Trade(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_Trade_Condition;
	information	= DIA_Rupert_Trade_Info;
	permanent	= TRUE;
	description = "������ ��� ���� ������.";
	trade		= TRUE;
};                       
FUNC INT DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Trade_Info()
{	
	if (Npc_HasItems (self, itfo_cheese) < 5)
	{
		CreateInvItems (self, ItFo_cheese, 5);
	};
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //������ ��� ���� ������.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //� ������� ��������� �� ������� �����. ������� ������ ��������� ��������� ������ � �������.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Bauernaufstand_Condition;
	information	= DIA_Rupert_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "�������� ��� � ��������� ��������.";
};                       
FUNC INT DIA_Rupert_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Bauernaufstand_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //�������� ��� � ��������� ��������.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //��� �������� ������: ����, ������ ��������, ������ �� ������ ������ ������.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //������ ���������! �� ����� � ������, � ���� ������ ���� �������� ��� ����!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //������ ��������� ������ ��������� ������� ���� � ����� �������.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //�� ������ ����� ����������: �������, ��� ���� ����� ���������, ����� �� �� ���������� � ��� ����� ��������� ������!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //���������! ��� ��� �������� ������! ��� ����� ����� ����� �� ����������!
};

// ***************************************************************
//							S�ldner
// ***************************************************************
INSTANCE DIA_Rupert_Mercs(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Mercs_Condition;
	information	= DIA_Rupert_Mercs_Info;
	permanent	= FALSE;
	description = "��� �� ������ � ��������� �����?";
};                       
FUNC INT DIA_Rupert_Mercs_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Mercs_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //��� �� ������ � ��������� �����?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //� ������, ��� ����������� �� ��� ������ ���������� �� �������.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //� �� �������, �� ������, ��� ������� ������ ��� ������ - ��������� ��� ���-�� � ���� ����, - �������� ������� �� �������������!
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //������� �������!
};



