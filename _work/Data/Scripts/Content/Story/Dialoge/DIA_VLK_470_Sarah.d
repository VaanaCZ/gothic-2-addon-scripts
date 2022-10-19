///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //��! ����� ��!
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"��� ��������?";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //��� ��������?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //����� ������ ��������, � ������� ������, ��� ��� ������ ��� �������.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //�� ������ ����� ������ ��� ��� ������, � �� �, �� ����� ��� �� �������� �� ��� �� ����� ������.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //�, ��� ��� ����, ������� ������ �� ���������� ��� ��������������, � ���� �� ��� �������� �� �����.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //���� ��������� �������� - �������� ���������� ��� ������� � �����.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"���� ������� ������� �� �������� �������.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"� ��� �� �������� � ���������?";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //� ��� �� �������� � ���������?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //��� ������������ ���������� ��� ��������������.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //������, ����� ������� ������ �� ������� � ��� ����, ����� ��������� ������� �� ���������, ������������ ������ ���������.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //� ����, ����� ������� ������, ����� ���������, ����� �������� ���� ����� �� ��������� ������. �� ����� ��� �������� � ���� ��� ���������.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //�� �������� �� ������ �������� ����� �����.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //��� ��������� ���� �� ��������� ���� � ������, � ���������� �� ����������.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //� ������ ��, ����� ������ �� ����� �����. �� ������ �� � ������ ��������� �� ��� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"��� ��� ����� ����� �����?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //��� ��� ����� ����� �����?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //���� ������� �� ��������� ����� � ������� �� ������ �������, ����� �� ������� �������� ��������.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //��� ����� ����� � ����� �����.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //�� � �� ������ ���� �� �������� - ��� �������� ��������� ��� ��� ���.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"������ ��� ���� ������.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //������ ��� ���� ������.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //��! �� ��������� ��������� �����! �, ������� �� ���� �������� �����, �� � ������ ����������, ��� ��� ����� ��� ����!
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //��� �� �������, ��� � �����. �� � ���� ��������� ������ - �� ������� ��� �����!
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"������ ������� ���������� ���� ...";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //������ ������� ���������� ���� � ���������� ���� ��������. �� � ���� ��� ��������� ������.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //�� ���� ����� ���� ����� �������� �����. � ����� ���� ����� �������. � �� ������ ����� ���������� ��� ��������.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //������ ��� ������ � ���� ���� �������������.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





