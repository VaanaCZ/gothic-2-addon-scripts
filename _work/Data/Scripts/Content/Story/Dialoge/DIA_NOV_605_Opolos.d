
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Opolos_Kap1_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap1_EXIT_Condition;
	information = DIA_Opolos_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//		Hello
//*********************************************************************
INSTANCE DIA_Opolos_Hello   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 1;
	condition   = DIA_Opolos_Hello_Condition;
	information = DIA_Opolos_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Opolos_Hello_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_Hello_Info()
{
	AI_Output (self ,other,"DIA_Opolos_Hello_12_00"); //������, ��, ������ ����, ��� ����� �������.
	AI_Output (self ,other,"DIA_Opolos_Hello_12_01"); //� ������. � ������������ �� ������.
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Opolos_Wurst(C_INFO)
{
	npc         = NOV_605_Opolos;
	nr			= 2;
	condition	= DIA_Opolos_Wurst_Condition;
	information	= DIA_Opolos_Wurst_Info;
	permanent	= FALSE;
	description = "� ������ ������� ������� ...";
};                       

FUNC INT DIA_Opolos_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Opolos_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Opolos_Wurst_15_00"); //� ������ ������� ������� ...
	AI_Output (self, other, "DIA_Opolos_Wurst_12_01"); //��, ����������! �������-��! ���������� ������� �������!
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//*********************************************************************
//		Seit wann bist Du hier?
//*********************************************************************
INSTANCE DIA_Opolos_HowLong   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 1;
	condition   = DIA_Opolos_HowLong_Condition;
	information = DIA_Opolos_HowLong_Info;
	permanent   = FALSE;
	description	= "�� ����� � ���������?";
};
FUNC INT DIA_Opolos_HowLong_Condition()
{
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_HowLong_Info()
{
	AI_Output (other,self ,"DIA_Opolos_HowLong_15_00"); //�� ����� � ���������?
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_01"); //��� ��� ����. �� �� ��� ��� ���� �� ������� � ����������. � ��� ��� �������...
	AI_Output (other,self ,"DIA_Opolos_HowLong_15_02"); //� ������?
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_03"); //��� ������ ����� - ����� ���� - � �� ������� �������.
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_04"); //� ���� ������ ������ �� ��������� ���� �� ���� �����������, ��� �� �������� ������ �������� � ����������.
	
	MIS_HelpOpolos = LOG_RUNNING;
	Log_CreateTopic (Topic_OpolosStudy,LOG_MISSION);
	Log_SetTopicStatus (Topic_OpolosStudy,LOG_RUNNING);
	B_LogEntry (Topic_OpolosStudy,"������ �������� ����. � �� ����� �� ������� ������ � ����������.");
};
//*********************************************************************
//		Auf was muss ich hier im Kloster achten?
//*********************************************************************
INSTANCE DIA_Opolos_Monastery   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_Monastery_Condition;
	information = DIA_Opolos_Monastery_Info;
	permanent   = FALSE;
	description	= "��� � ������ ����� ���� � ���������?";
};
FUNC INT DIA_Opolos_Monastery_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Monastery_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Monastery_15_00"); //��� � ������ ����� ���� � ���������?
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_01"); //������� �� ��� �����. ������ ����� ������� �� ������.
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_02"); //������ ������������� ���������. ���� �� �������� ��� �������, ���� �������� �������� ����� �������� ��������.
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_03"); //������ �����, � ���� ������������ ���� ���� ���������� � ������. ���� �� �� ������ ����������, �� ������ ������� ��� ����.
};
//*********************************************************************
//		Kannst du mir was beibringen?
//*********************************************************************
INSTANCE DIA_Opolos_beibringen   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_beibringen_Condition;
	information = DIA_Opolos_beibringen_Info;
	permanent   = FALSE;
	description	= "�� ������ ����-������ ������� ����?";
};
FUNC INT DIA_Opolos_beibringen_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	&& ((other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_beibringen_Info()
{
	AI_Output (other,self ,"DIA_Opolos_beibringen_15_00"); //�� ������ ����-������ ������� ����?
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_01"); //�������, ��� ����� ����������� �������. � ���� ������� ����, ��� ����� �������.
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_02"); //�� � �� ����� ������ ���-������ � ������, �������� � ����������.
	AI_Output (other,self ,"DIA_Opolos_beibringen_15_03"); //��� � ���� ������ ���� � ����?
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_04"); //��, ���� �� ��������� �� �������, �� � ���� ��������� ����� ����������� '��������������' ��������� ���� �� ��� ��������.
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_05"); //���� �� ��������� ��� ���, ����� � ��� ������� ���, �� � ���������� ����.
	
	Log_CreateTopic (Topic_OpolosRezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept,LOG_RUNNING);
	B_LogEntry (Topic_OpolosRezept,"������ ����� ��������� �� ������ ������������� ����� ����. �������� ��� ������� �������������� ���, ������� �� �������.");
};
//*********************************************************************
// rezept
//*********************************************************************
INSTANCE DIA_Opolos_rezept   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_rezept_Condition;
	information = DIA_Opolos_rezept_Info;
	permanent   = TRUE;
	description	= "������ ������� ...";
};
//-----------------------------------
var int DIA_Opolos_rezept_permanent;
//-----------------------------------
FUNC INT DIA_Opolos_rezept_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_beibringen)
	&& (other.guild == GIL_NOV)
	&& (DIA_Opolos_rezept_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_rezept_Info()
{
	if (Npc_HasItems (other, ItWr_Manarezept) >= 1)
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_00"); //� ������ ������, ��� �� � �����.
		AI_Output (self ,other,"DIA_Opolos_rezept_12_01"); //������, ��� � ������ ���.
		B_UseFakeScroll ();
		AI_Output (self ,other,"DIA_Opolos_rezept_12_02"); //���... �� ... �� ... ������� ... ���, ��� ...
		B_UseFakeScroll ();
		AI_Output (self ,other,"DIA_Opolos_rezept_12_03"); //������. �������� �������. ���� ������, �� ������ ��������������� �� ����.
		
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		
		Opolos_Rezept = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
		
		Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry (Topic_KlosterTeacher,"������ ����� ������ ��� ����� �������.");

	}
	else if (MIS_NEORASRezept == LOG_SUCCESS)
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_04"); //� ��� ������ ���� ������ �������.
		AI_Output (self ,other,"DIA_Opolos_rezept_12_05"); //��, ���� - ���, ��������, ������� �� ������� ��������� ����-������ �����. �����. � ��� ����� ���������� ����.
		
		Opolos_Rezept = LOG_FAILED;
		
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		
		Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry (Topic_KlosterTeacher,"������ ����� ������ ��� ����� �������.");
	}
	else 
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_06"); //�������� � ����� �����.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_STR
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_TEACH_STR		(C_INFO)
{
	npc			 = 	NOV_605_Opolos;
	nr 			 =  99;
	condition	 = 	DIA_Opolos_TEACH_STR_Condition;
	information	 = 	DIA_Opolos_TEACH_STR_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ���� ����� �������.";
};
func int DIA_Opolos_TEACH_STR_Condition ()
{	
	if (hero.guild == GIL_KDF
	||  hero.guild == GIL_NOV) 
	&& (Opolos_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Opolos_TEACH_STR_Info ()
{
		AI_Output (other, self, "DIA_Opolos_TEACH_STR_15_00"); //� ���� ����� �������.
		
		Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
		Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
		Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
		Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
FUNC VOID DIA_Opolos_TEACH_STR_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_MED)  
	{
		AI_Output (self, other, "DIA_Opolos_TEACH_STR_12_00"); //�� ���� ����� �������. ��� ������ ������ ����� ����.
	};
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
};
FUNC VOID DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
	Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
FUNC VOID DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
	Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
//*********************************************************************
//		Wer ist Agon?
//*********************************************************************
INSTANCE DIA_Opolos_Agon   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 4;
	condition   = DIA_Opolos_Agon_Condition;
	information = DIA_Opolos_Agon_Info;
	permanent   = FALSE;
	description	= "� ��� ����� ���� � ����?";
};
FUNC INT DIA_Opolos_Agon_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Opolos_Monastery))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Agon_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Agon_15_00"); //� ��� ����� ���� � ����?
	AI_Output (self ,other,"DIA_Opolos_Agon_12_01"); //���� �������� �����. �� ���� ���������, �� ����� ���� ���, ��� ����� �� ��� ���������.
	AI_Output (self ,other,"DIA_Opolos_Agon_12_02"); //���� ������ � ��������� ��������� �� ����. � ������� �� ������� ����� � ����.
	AI_Output (self ,other,"DIA_Opolos_Agon_12_03"); //������, ��� ���-�� ��� �� ��������, � � ��� ��� ���� ��������� ����.
	AI_Output (other,self ,"DIA_Opolos_Agon_15_04"); //�� ������, ��� ���������?
	AI_Output (self ,other,"DIA_Opolos_Agon_12_05"); //����� �� ����. ���� ����� ������ �������� ��. �� ����� ����� ����� ������� ���, ��� ����� ������ ������� ����������, ������ ��� �� ��������� �����������.
};
///////////////////////////////////////////////////////////////////////
//	Info SHEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_LIESEL		(C_INFO)
{
	npc			 = 	NOV_605_Opolos;
	nr			 =  2;
	condition	 = 	DIA_Opolos_LIESEL_Condition;
	information	 = 	DIA_Opolos_LIESEL_Info;
	permanent	 = 	TRUE;
	description	 = 	"������, � ������ �����.";
};
func int DIA_Opolos_LIESEL_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (Liesel_Giveaway == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Opolos_LIESEL_Info ()
{
	
	
	AI_Output (other, self, "DIA_Opolos_LIESEL_15_00"); //������, � ������ �����. ���� � �������� �� � �����?
	
	Npc_PerceiveAll (self);
	
	if  Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 800)
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler; 
		
		Liesel_Giveaway = TRUE;
		AI_Output (self, hero, "DIA_Opolos_LIESEL_12_01"); //��, �������. ����� �������� ������. � ���������� � ���.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (other, self, "DIA_Opolos_Add_15_00"); //��... ���� �� ��� � ��� �������. � ����� �����.
	};
	
	
	
};
//*********************************************************************
//	Wegen der  Biblothek... 
//*********************************************************************
INSTANCE DIA_Opolos_Biblothek   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 98;
	condition   = DIA_Opolos_Biblothek_Condition;
	information = DIA_Opolos_Biblothek_Info;
	permanent   = TRUE;
	description	= "������ ���������� ...";
};
FUNC INT DIA_Opolos_Biblothek_Condition()
{
	if (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other, DIA_Opolos_HowLong)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_Biblothek_Info()
{
	AI_Output (other ,self,"DIA_Opolos_Biblothek_15_00"); //������ ���������� ...
	
	if (Parlan_Erlaubnis == FALSE)
	{
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_01"); //��� �������� ������� �����, ����� � ��������.
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_02"); //���� �� ��� ����� �������� ������ �����, ����� ������ ������ �����, ��� �� ����� ������� �������.
	}
	else
	{
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_03"); //�� ��������! �� ������� ���� �� ����������, �� ������ ��� � ���������� ����.
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_04"); //�� ������ ���� ���� ������� ������� �������!
	};
	
	
	AI_StopProcessInfos (self);
};
//*********************************************************************
//		Sc hat Opolos das Studieren erm�glicht (Kap. 2)
//*********************************************************************
INSTANCE DIA_Opolos_HelloAgain   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 2;
	condition   = DIA_Opolos_HelloAgain_Condition;
	information = DIA_Opolos_HelloAgain_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Opolos_HelloAgain_Condition()
{
	if (other.guild == GIL_KDF)
	&& (MIS_HelpOpolos == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Opolos_HelloAgain_12_00"); //������. �������, ��� ����� ���. ������ � �� ����� ���� ����.
	AI_Output (self ,other,"DIA_Opolos_HelloAgain_12_01"); //�� � ����, ���������, ������ ��� ������� �� ��������� � ������� �����������, ������.
	
	B_GivePlayerXP (XP_Ambient); 
	AI_StopProcessInfos (self);
};

//*********************************************************************
//		Sc hat Opolos zum Einkaufen geschickt (Kap. 2)
//*********************************************************************
INSTANCE DIA_Opolos_HowIsIt   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_HowIsIt_Condition;
	information = DIA_Opolos_HowIsIt_Info;
	permanent   = TRUE;
	description	= "��� ����?";
};
FUNC INT DIA_Opolos_HowIsIt_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_HowIsIt_Info()
{
	AI_Output (other,self ,"DIA_Opolos_HowIsIt_15_00"); //��� ����?
	
	if (MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_01"); //�������. � ��� ���, ��� ��� ��������� �������� ����������, ��� ������ �����������.
	}
	else
	{
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_02"); //� �������� �������� ���, ��� ��� ��������, ������.
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_03"); //������ ���� ����� ���������� ���� ����� ����������. � ���� ���������� �������� ��� �����.
	};
	
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 2
//##
//##########################################

INSTANCE DIA_Opolos_Kap2_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap2_EXIT_Condition;
	information = DIA_Opolos_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 3
//##
//##########################################

INSTANCE DIA_Opolos_Kap3_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap3_EXIT_Condition;
	information = DIA_Opolos_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*************************************************************
//	Was amchen die Schafe?
//************************************************************

INSTANCE DIA_Opolos_Kap3_PERM   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 39;
	condition   = DIA_Opolos_Kap3_PERM_Condition;
	information = DIA_Opolos_Kap3_PERM_Info;
	permanent   = TRUE;
	description = "��� ���� ����?";
};
FUNC INT DIA_Opolos_Kap3_PERM_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_15_00"); //��� ���� ����?
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_12_01"); //� ��� �� �������? ��� ����� ������ � ���� �����.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_12_02"); //����� �� � �����, ��� ���������� �������. ����, ������, ����� ����������.

	Info_ClearChoices (DIA_Opolos_Kap3_PERM);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,DIALOG_BACK,DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,"� ������ �������� ��������� �������.",DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,"����������� � ������ ����� ����� �� ������ �����������.",DIA_Opolos_Kap3_PERM_DMT);
	
	if (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Opolos_Kap3_PERM,"����� ������ ���.",DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

FUNC VOID DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices (DIA_Opolos_Kap3_PERM);
};

var int Opolos_Dragons;

FUNC VOID DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00"); //� ������ �������� ��������� �������. ������ � ������ ����� ��� �������� ����������� ������.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01"); //������� - � ������ �����, ��� ��� ���������� ������ � ������� �������.
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02"); //��� �����, ������ ���.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03"); //�� ����������� �������� ���������� � ����, ����� ���?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04"); //���������.
	
	if (Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_Dragons = TRUE;
	};	
};

var int Opolos_DMT;

FUNC VOID DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_00"); //����������� � ������ ����� ����� �� ������ �����������.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DMT_12_01"); //��� �� ������ � ����? ����� ��� �����������?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_02"); //����� �� �����, ������ ��� �������. ��� ����� ������� ������ ���� � �������� ���� ����.
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_03"); //������, ��� �����-�� ����. �� ������� ����, ��� ������� ������.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DMT_12_04"); //��� ��� ����� ��������, �� � ������, ��� ������ ����� ����� ��� ��������.
	
	if (Opolos_DMT == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_DMT = TRUE;
	};	
};

var int Opolos_Pedro;

FUNC VOID DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_PEDRO_15_00"); //����� ������ ���.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01"); //� ������ �� ����, �� � �����, ��� � ���� �� ���� ��������. ��� ������ � ������ �� ������.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02"); //������� ���� ������� ��� - �� � ���� �������, ������ �� �� �������� ���?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_PEDRO_15_03"); //�� ��� �� ������.
	
	if (Opolos_Pedro == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_Pedro = TRUE;
	};
};
//##########################################
//##
//##	Kapitel 4
//##
//##########################################

INSTANCE DIA_Opolos_Kap4_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999; 
	condition   = DIA_Opolos_Kap4_EXIT_Condition;
	information = DIA_Opolos_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 5
//##
//##########################################

INSTANCE DIA_Opolos_Kap5_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap5_EXIT_Condition;
	information = DIA_Opolos_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Opolos_PICKPOCKET (C_INFO)
{
	npc			= NOV_605_Opolos;
	nr			= 900;
	condition	= DIA_Opolos_PICKPOCKET_Condition;
	information	= DIA_Opolos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Opolos_PICKPOCKET_Condition()
{
	C_Beklauen (54, 70);
};
 
FUNC VOID DIA_Opolos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Opolos_PICKPOCKET);
	Info_AddChoice		(DIA_Opolos_PICKPOCKET, DIALOG_BACK 		,DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Opolos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Opolos_PICKPOCKET);
};
	
func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Opolos_PICKPOCKET);
};


