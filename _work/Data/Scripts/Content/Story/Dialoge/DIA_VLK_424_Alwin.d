// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alwin_EXIT(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 999;
	condition	= DIA_Alwin_EXIT_Condition;
	information	= DIA_Alwin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alwin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Alwin_PICKPOCKET (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 900;
	condition	= DIA_Alwin_PICKPOCKET_Condition;
	information	= DIA_Alwin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alwin_PICKPOCKET_Condition()
{
	C_Beklauen (20, 10);
};
 
FUNC VOID DIA_Alwin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alwin_PICKPOCKET);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_BACK 		,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
	
func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
//***************************************************
//		Schafe
//***************************************************
INSTANCE DIA_Alwin_Sheep(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 3;
	condition	= DIA_Alwin_Sheep_Condition;
	information	= DIA_Alwin_Sheep_Info;
	permanent	= FALSE;
	description = "��� ���� ����?";
};                       
FUNC INT DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Alwin_Sheep_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Sheep_15_00"); //��� ���� ����?
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //������������ ����, ��� ����������� ���, ���������� �� ��� ����. (�������) ��� ��� ���� - ����.
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //��� ���� ����������� ���������. ��� �������� �� � �������� � �������� �� ���.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_Fellan(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_Fellan_Condition;
	information	= DIA_Alwin_Fellan_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Alwin_Fellan_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Fellan_Info()
{	
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //��, ���� ���� ������� ����� ������������ ����� � ���� ������ � ���.
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //� ��� �� ��������?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //����� �� �� ������� ���� �������? ���, ��� �� �������, ������� ��� �������� � �������� ��������?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //� ���� � ���� ����� ����� �������. �� ������ �������� �� ����� ������ ������ ����.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_FellanRunning (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_FellanRunning_Condition;
	information	= DIA_Alwin_FellanRunning_Info;
	permanent	= FALSE;
	description = "� ���� ���������� � �������� ...";
};                       
FUNC INT DIA_Alwin_FellanRunning_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanRunning_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //� ���� ���������� � �������� ...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //�� ������ ������ ���? � ����� ���� ���?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //�� ����� ���.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //��, ��� �� ���! ������ - ���� �� ��������� ��� ��������� ��������, � ������� ���� 25 ������� �����.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //�� � ����� ���� ����� - �� �� ������� ��������� ����� �����. �� ����� � ���. ������������, ��� ����� ������, ��� ��������� ������� �������!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"����� �����, ����� � �������� ������� ��������� �������� ��������. �������, ������� ��� �� ��� �� �����.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "� ��������, ��� ����� ������� ...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "���� � ����� ���� ���, � ���� ����� �������� � ���������� ...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //� ��������, ��� ����� ������� ...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //������� �� ����. � �����, � ������� ���� 25 �������.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //���� � ����� ���� ���, � ���� ����� �������� � ���������� ...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //�����, � �����, ����� �� �������� �������� �� ����� ...
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //�� ���� �� �������� ���-������, ��� ������ ����, � ���� ����� ������� ��������.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du k�nntest h�chstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schl�gereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_03"); //Aber wenn du ihn dazu bringst, dass ER dich angreift, werden alle Leute, die den Kampf mitkriegen, auf deiner Seite sein.
};

//***************************************************
//		Fellan auf's Maul gehauen 
//***************************************************
INSTANCE DIA_Alwin_FellanSuccess(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 4;
	condition	= DIA_Alwin_FellanSuccess_Condition;
	information	= DIA_Alwin_FellanSuccess_Info;
	permanent	= FALSE;
	description	= "������ ������ �� ����� �������.";
};                       
FUNC INT DIA_Alwin_FellanSuccess_Condition()
{	
	if (MIS_AttackFellan == LOG_RUNNING)
	&& ((FellanGeschlagen == TRUE)
	|| Npc_IsDead (Fellan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanSuccess_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //������ ������ �� ����� �������.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //���� ��! ������ ��� ����� �����. �������-��. � �� �����, �� ������� �� ����������.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //�� ������ ��� ������� ������. ������ ���, � ��� ���� 30 ������� �����.
		
		B_GiveInvItems (self, other, ItMi_Gold, 30);
		
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient); 
	}
	else 
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};
//***************************************************
//		Perm Info
//***************************************************
INSTANCE DIA_Alwin_Endlos(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 8;
	condition	= DIA_Alwin_Endlos_Condition;
	information	= DIA_Alwin_Endlos_Info;
	permanent	= TRUE;
	description	= "��� ���� ����?";
};                       
FUNC INT DIA_Alwin_Endlos_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Alwin_Sheep)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Endlos_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //��� ���� ����?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //���� ����� ������� ������ �� � ���. ������� ��� ��� ����������.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //���� ���� � ���������� ��� ����� � �����. ����� ��� ��� ����. ������ (������ �������)
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //�, �������, ����� ���� �� ���. �� ���� ��� ��������� �������!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //��� ����?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //��� ��������, ������� ���� ��������. ������� ��, ��� ������.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //��� ������ ����� ������, ����� �� ��� ��������� �� �����.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //���� ����� �������, ��� ��� �������� � �����.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //� �����, ��� ���� - ��� ���� ����.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //���������, �� � ����� ������ ��� ���� ����. � ���� � ���� ����, ������� ���� ������������� ��� ��������� ������� �������.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //�� ��� ��������� ������. ���� ������ ���� ����.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //���������� ������, �������� �� ���, ��� ���� ���� - ����� �����!
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //� ������ �� - ��������. ���� ����� ��������, ����� ��� ���� ����� �� �������� ��� ��� �����.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //��, ������ � ���� �� ���� ��������� ������ ������� �� ����� �����.
	};
};



