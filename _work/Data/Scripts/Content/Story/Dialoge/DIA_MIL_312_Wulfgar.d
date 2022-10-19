// *************************************************
// 						EXIT
// *************************************************
INSTANCE DIA_Wulfgar_EXIT   (C_INFO)
{
	npc         = Mil_312_Wulfgar;
	nr          = 999;
	condition   = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *************************************************
// 						Hallo
// *************************************************
instance DIA_Wulfgar_Hallo		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	1;
	condition	 = 	DIA_Wulfgar_Hallo_Condition;
	information	 = 	DIA_Wulfgar_Hallo_Info;
	permanent	 = 	FALSE;
	description	 = 	"������ ���� �����������?";
};

func int DIA_Wulfgar_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Hallo_15_00"); //������ ���� �����������?
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_01"); //(������������) ��� ����� ����� ������, ��� ���������.
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_02"); //(���������) �� ����� ��� ������� �������� ��� ���� ������������, ������ �� ��� ������ ��������� ������.
};

// *************************************************
// 						WannaJoin
// *************************************************
instance DIA_Wulfgar_WannaJoin		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	2;
	condition	 = 	DIA_Wulfgar_WannaJoin_Condition;
	information	 = 	DIA_Wulfgar_WannaJoin_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ���� �������� � ���������!";
};

func int DIA_Wulfgar_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_00"); //� ���� �������� � ���������!
	AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_01"); //��? � �� ��������� ����� ������?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_02"); //���.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_03"); //����� ���� ����� �� ������ ����.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_04"); //�������, �� ������ ���������� � ���, �� � �� �����, ��� �� ������� ��� ���� ����������.
	}
	else
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_05"); //��.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_06"); //����� �������� � ������ �����. �� ������, ���� ����� �������, � ���� ���.
	};
};

// *************************************************
// 						AboutMiliz
// *************************************************
instance DIA_Wulfgar_AboutMiliz		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	3;
	condition	 = 	DIA_Wulfgar_AboutMiliz_Condition;
	information	 = 	DIA_Wulfgar_AboutMiliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"������ ���, ������� � ���������?";
};

func int DIA_Wulfgar_AboutMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_AboutMiliz_15_00"); //������ ���, ������� � ���������?
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_01"); //������ ���� ��������� ���� �����.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_02"); //������ ��������� ����������� �����������. (�������) �� ������� �� ����, ��� �� ���������� �����.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_03"); //�� ���� ����� ����� ���� ����. �� ��������� � ����� �����.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_04"); //������, ��� �������� � ���������, �������� �������� ������� � ������� ������.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_05"); //� ���� �� ���������� ���� ������ ������, �� ������ ������������ �� ���������. ���� ����� ���� ������� �� ������� ���������� �����������.
};

// *************************************************
// 						CanYouTrain
// *************************************************
instance DIA_Wulfgar_CanYouTrain		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	4;
	condition	 = 	DIA_Wulfgar_CanYouTrain_Condition;
	information	 = 	DIA_Wulfgar_CanYouTrain_Info;
	permanent	 = 	FALSE;
	description	 = 	"�� ������ ������� ���� �������� �� �����?";
};

func int DIA_Wulfgar_CanYouTrain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild != GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_00"); //�� ������ ������� ���� �������� �� �����?
	AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_01"); //�� ������� ����� ����� �� ��������� ����, ��� � ��������� �������� �����.
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_02"); //�������, ��� �� �������� ���������. ������ �� ����.
	}
	else
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_03"); //�� ��� �������� ������ ������� ��������. ��� ��������� ���� �������� ������������� ������ ��� ���������.
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_04"); //� �� ���-�� ������ ��������?
		AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_05"); //�����, ��� ��...
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_06"); //(��������) ������, �� ������ ����������, ����� ���������.
		Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
		B_LogEntry (Topic_CityTeacher, "��������, ��������� ��������, ����� ������� ���� ��������� ��������� � ���������� � ��������� �������.");
		Wulfgar_Teach1H = TRUE;	
	};
};

// *************************************************
// 						Advantage
// *************************************************
instance DIA_Wulfgar_Advantage		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	5;
	condition	 = 	DIA_Wulfgar_Advantage_Condition;
	information	 = 	DIA_Wulfgar_Advantage_Info;
	permanent	 = 	FALSE;
	description	 = 	"������ ������������ ���������� ������?";
};

func int DIA_Wulfgar_Advantage_Condition ()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Advantage_15_00"); //������ ������������ ���������� ������?
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_01"); //��� ������. � ���������� ������� �� �������. ��� ����� ����� ������������ ������������� � ���.
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_02"); //��������� ������ ����� ����������� � ��������� ����. ��� �������� �� ����� ������������ ���� �������� �� ��� ������, �� ��� ������� ������� ����.
};

// *************************************************
// 						HowToBegin
// *************************************************
instance DIA_Wulfgar_HowToBegin	(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	6;
	condition	 = 	DIA_Wulfgar_HowToBegin_Condition;
	information	 = 	DIA_Wulfgar_HowToBegin_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ���� ��� ����� ������? � ����������� ��� ���������� ������?";
};

func int DIA_Wulfgar_HowToBegin_Condition ()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_HowToBegin_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_HowToBegin_15_00"); //� ���� ��� ����� ������? � ����������� ��� ���������� ������?
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_01"); //������� ���.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_02"); //�� ���� ���� �� ����������������� ������ � ����� ���� ������, �� �������� �� ������� ������������� ������� � ������ ���.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_03"); //����, ��������, �� ������ ���������� ���������� �������, �� ��� ��� ������� � ������������� ����������...
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_04"); //...���� ����� �������� ��������� ������� ���������� ������ ���, ����� �� ������������ � ����������...
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_05"); //������, � ���� ������ �������� ���������� �������, ��� ����� �� ������������ � ��������� ����� ������ �� �������.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_06"); //���� ����� ������ ������ - � �� ��� �������, � ��� � ������.
};

// *************************************************
// 						TRAIN
// *************************************************
INSTANCE DIA_Wulfgar_Teach(C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 7;
	condition	= DIA_Wulfgar_Teach_Condition;
	information	= DIA_Wulfgar_Teach_Info;
	permanent	= TRUE;
	description = "������ ��������.";
};                       

FUNC INT DIA_Wulfgar_Teach_Condition()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild == GIL_MIL)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Wulfgar_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Wulfgar_Teach_15_00"); //������ ��������.
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_Add_04_00"); //� �� ������ ���������!
	}
	else
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Wulfgar_Add_04_01"); //�������, ���������.
		};
		
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))		,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};

FUNC VOID DIA_Wulfgar_Teach_Back ()
{
	Info_ClearChoices (DIA_Wulfgar_Teach);
};

FUNC VOID DIA_Wulfgar_Teach_1H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))		,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};
FUNC VOID DIA_Wulfgar_Teach_1H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};	
};

FUNC VOID DIA_Wulfgar_Teach_2H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};
FUNC VOID DIA_Wulfgar_Teach_2H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};	
};

// ************************************************************
// 			  				Als Miliz
// ************************************************************

INSTANCE DIA_Wulfgar_AlsMil (C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 1;
	condition	= DIA_Wulfgar_AlsMil_Condition;
	information	= DIA_Wulfgar_AlsMil_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Wulfgar_AlsMil_Condition()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Wulfgar_AlsMil_Info()
{	
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_00"); //������, ���� ����� ������ ����!
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_01"); //� �������, �� ������ ��������� ������������� �����.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_02"); //���� ������ ���� ������������ ���������, � ������ ������� ���� ����� �������.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_03"); //�� ����� ������ - ��� ��������� ��������� ������� ���� ���.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_04"); //� ��� ������ �� ���� ��������� �����!
};

///////////////////////////////////////////////////////////////////////
//	Info Bonus
///////////////////////////////////////////////////////////////////////
instance DIA_Wulfgar_Bonus		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	2;
	condition	 = 	DIA_Wulfgar_Bonus_Condition;
	information	 = 	DIA_Wulfgar_Bonus_Info;
	permanent	 = 	FALSE;
	important	 = 	TRUE;
};

func int DIA_Wulfgar_Bonus_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (Wld_IsTime (05,02,06,54))
	{
		return TRUE;
	};
};
func void DIA_Wulfgar_Bonus_Info ()
{
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_00"); //������ ������? � ������ ���� � ��� ����� ���. �� ��� �� �� �����, �� ����� ���������������.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_01"); //���� ������������. �� ������ �������� ��������� �����������, ���� ���������� �� �����, � ����� �������� � ���������� ������.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_02"); //����� �� ���� � ����� ��������� ���!
	
	B_RaiseFightTalent (other, NPC_TALENT_1H, 2);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wulfgar_PICKPOCKET (C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 900;
	condition	= DIA_Wulfgar_PICKPOCKET_Condition;
	information	= DIA_Wulfgar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wulfgar_PICKPOCKET_Condition()
{
	C_Beklauen (58, 80);
};
 
FUNC VOID DIA_Wulfgar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice		(DIA_Wulfgar_PICKPOCKET, DIALOG_BACK 		,DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wulfgar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wulfgar_PICKPOCKET);
};
	
func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wulfgar_PICKPOCKET);
};







