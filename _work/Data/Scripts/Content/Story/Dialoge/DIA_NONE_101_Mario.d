
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_None_101_Mario_EXIT   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 999;
	condition   = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Was machst du hier? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_Job (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 4;
	condition   = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent   = TRUE;
	description	= "��� �� ������� �����?";
};

FUNC INT DIA_None_101_Mario_Job_Condition()
{
	if (Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == FALSE)
	&& (Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe)== FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_Job_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_Job_15_00"); //��� �� ������� �����?
	AI_Output (self ,other,"DIA_None_101_Mario_Job_07_01"); //�������, ����� ������ �����-������ �������, � � ������� �� ����.
	AI_Output (self ,other,"DIA_None_101_Mario_Job_07_02"); //��� ������� ��� ���� ��� ��������� ��� �� �����.
};

//*********************************************************************
//	Du suchst doch Leute? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_YouNeedMe   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 4;
	condition   = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_None_101_Mario_YouNeedMe_Condition()
{
	if (Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output (self ,other,"DIA_None_101_Mario_YouNeedMe_07_00"); //� ������, ��� �� ��������� ������� �� ���� �������?
	AI_Output (other,self ,"DIA_None_101_Mario_YouNeedMe_15_01"); //�?
	AI_Output (self ,other,"DIA_None_101_Mario_YouNeedMe_07_02"); //� �����!
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	
	B_LogEntry (TOPIC_Crew,"����� ������ �����, ��������� �� ���� � �������� �������. �� ����� ����� �� �������.");
};

//*********************************************************************
//	Warum sollte ich dich mitnehmen? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_WhyNeedYou   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 5;
	condition   = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent   = FALSE;
	description	= "������ � ������ ����� ����?";
};

FUNC INT DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_WhyNeedYou_15_00"); //������ � ������ ����� ����?
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_01"); //��� ������. ������ ��� � ����� ����.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_02"); //�... � ��� ����������� � ����������� �����.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_03"); //� ������ ������� �� '������ ������' � '�������� �������'.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_04"); //� ����� � ���������� ���������� � ��������������� �������� ���� �������� ����� ����� � ������� �������.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_05"); //� ���������, ��� �������� ������� ����, ����� ��� ������� ������� � ��� �������� ���������.

};

//*********************************************************************
//	Wieso bist du dann hier? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_WhyHere   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 7;
	condition   = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent   = FALSE;
	description	= "� ��� �� ������� �����?";
};

FUNC INT DIA_None_101_Mario_WhyHere_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_WhyHere_15_00"); //� ��� �� ������� �����?
	AI_Output (self ,other,"DIA_None_101_Mario_WhyHere_07_01"); //����� �������� ������, � �� �������� ���������.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyHere_07_02"); //����� ����� �������� �� ����� � ������� � ���� ����, � ��� ������ ��� ����� �����.
};

//*********************************************************************
//	Was kannst du?
//*********************************************************************
INSTANCE DIA_None_101_Mario_Abilities   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 8;
	condition   = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent   = FALSE;
	description	= "��� �� ������ ������?";
};

FUNC INT DIA_None_101_Mario_Abilities_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_Abilities_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_Abilities_15_00"); //��� �� ������ ������?
	AI_Output (self ,other,"DIA_None_101_Mario_Abilities_07_01"); //� ������ �������� � �������� ���, � ���� �� � ����� ������� �� ����������� �����.
	AI_Output (self ,other,"DIA_None_101_Mario_Abilities_07_02"); //� ������, ��� � ����� ������� ���� ����-������ �� ����� �����������.

	B_LogEntry (TOPIC_Crew,"�����, ������, ������ ���� � ���, ��� ��������  ������� ����. ��������, �� ������ ������� ���� ���-����.");
};

//*********************************************************************
//	Was verlangst du?
//*********************************************************************
INSTANCE DIA_None_101_Mario_YourPrice   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 9;
	condition   = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent   = FALSE;
	description	= "��� �� �� ��� ������?";
};

FUNC INT DIA_None_101_Mario_YourPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_YourPrice_15_00"); //��� �� �� ��� ������?
	AI_Output (self ,other,"DIA_None_101_Mario_YourPrice_07_01"); //��� � ����? �� � ���� ��� ������ �������� ������.
	AI_Output (self ,other,"DIA_None_101_Mario_YourPrice_07_02"); //� ������ ����, � �� �������� ��� ��������� �� ���� ����.
};

//*********************************************************************
//	Die Reise kann gef�hrlich werden.
//*********************************************************************
INSTANCE DIA_None_101_Mario_CouldBeDangerous   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 10;
	condition   = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent   = FALSE;
	description	= "����������� ����� ���� �������.";
};

FUNC INT DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YourPrice))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_CouldBeDangerous_15_00"); //����������� ����� ���� �������.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_01"); //� ������ � ���������. ����� �� ����� �� ����, ������ ���� ��� ���� ����� ����������.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_02"); //����� ����� ����� ����� ��� ���� ���������, � ������� � ������ ����� ���������� ���� ������� �������.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_03"); //�� ������ ��� � ������� �����. ������ ���, � ������ �� �����. ������, ������� ������, ������� �� ������.
};

//*********************************************************************
//	Kein Bedarf!
//*********************************************************************
INSTANCE DIA_None_101_Mario_DontNeedYou   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 13;
	condition   = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent   = FALSE;
	description	= "�� �� ����� ���.";
};

FUNC INT DIA_None_101_Mario_DontNeedYou_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_DontNeedYou_15_00"); //�� �� ����� ���.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_01"); //� ������ ������, �������� ����� ����� �����.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_02"); //��� �������, �� �� �����-�� ������������ � ���������.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_03"); //��� ��� ������ �������, ������ ��� ���������� ����-������.
};

//*********************************************************************
//	Gute Leute kann ich immer brauchen.
//*********************************************************************
INSTANCE DIA_None_101_Mario_NeedGoodMen   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 2;
	condition   = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent   = FALSE;
	description	= "� ������ ����� ����� ��� ������� �����.";
};

FUNC INT DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_NeedGoodMen_15_00"); //� ������ ����� ����� ��� ������� �����.
	AI_Output (self ,other,"DIA_None_101_Mario_NeedGoodMen_07_01"); //�������, �������� �� �������.
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	Mario_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	AI_StopProcessInfos (self);
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_LeaveMyShip		(C_INFO)
{
	npc			 = 	NONE_101_MARIO;
	nr			 = 11;
	condition	 = 	DIA_Mario_LeaveMyShip_Condition;
	information	 = 	DIA_Mario_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"� ���-���� �� ���� ����� ���� � �����!";
};
func int DIA_Mario_LeaveMyShip_Condition ()
{	
	if (Mario_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Mario_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Mario_LeaveMyShip_15_00"); //� �����, ��� �� ��� �� �����!
	AI_Output			(self, other, "DIA_Mario_LeaveMyShip_07_01"); //��� �������. �� ������, ��� ������ ����!
	
	Mario_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_StillNeedYou		(C_INFO)
{
	npc			 = 	NONE_101_MARIO;
	nr			 = 	11;
	condition	 = 	DIA_Mario_StillNeedYou_Condition;
	information	 = 	DIA_Mario_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�� ��� ���-���� �����!";
};
func int DIA_Mario_StillNeedYou_Condition ()
{	
	if((Mario_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man nat�rlich nur eine variable abfragen
	|| (Mario_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Mario_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Mario_StillNeedYou_15_00"); //�� ��� ���-���� �����!
	
	if (Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Mario_StillNeedYou_07_01"); //� ����! �������� �� �������!
		
		Mario_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
		AI_StopProcessInfos (self);
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Mario_StillNeedYou_07_02"); //�� �� ������ ��� ���������� �� ����. ������� � �� ���� �����!
	
		AI_StopProcessInfos (self);
		
		B_Attack	(self,other,AR_NONE,1); 
	};	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MARIO_PICKPOCKET (C_INFO)
{
	npc			= NONE_101_MARIO;
	nr			= 900;
	condition	= DIA_MARIO_PICKPOCKET_Condition;
	information	= DIA_MARIO_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_MARIO_PICKPOCKET_Condition()
{
	C_Beklauen (71, 220);
};
 
FUNC VOID DIA_MARIO_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MARIO_PICKPOCKET);
	Info_AddChoice		(DIA_MARIO_PICKPOCKET, DIALOG_BACK 		,DIA_MARIO_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MARIO_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_MARIO_PICKPOCKET);
};
	
func void DIA_MARIO_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MARIO_PICKPOCKET);
};


