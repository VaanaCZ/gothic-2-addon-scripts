FUNC VOID B_DaronSegen ()
{
	Daron_Segen = TRUE;

	var string concatText;
	
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX]
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
		};
	}	 	
	else if (Daron_Spende < 250)
	&&		(Bonus_1 == FALSE)
	{
		B_RaiseAttribute (other, ATR_MANA_MAX, 2);
		
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];
				
		Bonus_1 = TRUE;
	}
	else if (Daron_Spende < 500)
	&&		(Bonus_2 == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if (Daron_Spende >= 750) 	
	&&		(Daron_Spende < 1000) 	
	&& 		(Bonus_3 == FALSE)
	{
		other.lp = (other.lp + 1);
		
		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else 
	{
		other.attribute[ATR_HITPOINTS] =  other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);
		
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
	};
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Daron_EXIT(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 999;
	condition	= DIA_Daron_EXIT_Condition;
	information	= DIA_Daron_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Daron_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Daron_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Daron_Hallo(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Hallo_Condition;
	information	= DIA_Daron_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Daron_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//��� � ���� ������� ��� ����? �� ����� ��������� ��������?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//�� ������ ���������� ������ ������� ������, ���, �����, ������ ������������ ������ ��� ������?
};

// ************************************************************
// 			  	Oberes Viertel - Paladine 
// ************************************************************
INSTANCE DIA_Daron_Paladine(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Paladine_Condition;
	information	= DIA_Daron_Paladine_Info;
	permanent	= FALSE;
	description = "��� ����� ���������� � ���������� ...";
};                       
FUNC INT DIA_Daron_Paladine_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//��� ����� ���������� � ����������. �� ������ ������ ��� � ����?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//��, ��� ����� �� ������ ����� ������ � ������� ������� ������. ������ ������� ���� ��������� ������ ��������� � ��������� ������.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//�� �, ������� ��, ���, ����� ����.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//��� � ���� ����� ����� ����?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//�� ������ �������� � ��� ����� � �������� ����������. � �� ���������� ���������� �������, ��������, �� ������ ������ � ���� �����.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//������, ���� ���� �����, ����� ������� ������ � ������������� ��������.
};

// ************************************************************
// 			  				About Segen 
// ************************************************************
INSTANCE DIA_Daron_AboutSegen (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_AboutSegen_Condition;
	information	= DIA_Daron_AboutSegen_Info;
	permanent	= FALSE;
	description = "� ������, ����� �������� ���� �������������!";
};                       
FUNC INT DIA_Daron_AboutSegen_Condition()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_AboutSegen_Info()
{	
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //� ������, ����� �������� ���� �������������!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //��� ������ - ����� ��, ��������, �������� ������������ ������ ������ ������ ������, ������?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //������-��, � ����� �������� ���� �������������, ����� ��������� � ������� � ������ �� �������� � ������ ����� ������...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //�� � ��� ��� ���� ��� �������������, ��� ���.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //������ � �������, ��� ���!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //��, ��� ���! ��� ��������� ������������� ������ � �� ������ ��� ���� ��������� ������������ ����.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //��� ��� ���� � ��������� � ����� ������ ���������� �� ��������� � ������ ������ ������?
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
INSTANCE DIA_Daron_Spenden(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 3;
	condition	= DIA_Daron_Spenden_Condition;
	information	= DIA_Daron_Spenden_Info;
	permanent	= FALSE;
	description	= "� ����� ������������� ������ ��������� �����������?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//� ����� ������������� ������ ��������� �����������?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//��, ��� ������� �� ����, ��� �� ������������. ����� ���������, ��� � ���� ����.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//(������� � ������� � ��������) �-�-� ���...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//��, �� ���� ������, ��? ������ ���� �� ��������, ��� � ���� ����.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"��� ���� ����� �� ����������� ����. ��� �������, ��� ��������, ��� � ������ ������������ ��� ������� ������. ��� ����� �� �� ����������� ����.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//��, �� �� �����, �� � �� �����. 10 ������� ��� ������ - �� ����� �������� ������.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//� ���� ������ 50 ������� �����. ��������� 25 ����� ������ � ������ ��� �������������.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//� ���� ������ ��� ������� ����� - ������� �������: '������, ���� ������'.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//������� ������ ���� ������ ����������.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//������������ ���� �� ����� ������. �� ����� � ���� ��� ���� � ��������������.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"��� ���� ����� ����������� ����.");
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
INSTANCE DIA_Daron_Woher(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Woher_Condition;
	information	= DIA_Daron_Woher_Info;
	permanent	= FALSE;
	description	= "������ ��?";
};                       
FUNC INT DIA_Daron_Woher_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Woher_Info()
{	
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//������ �� ������?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//� ������ �� ��������� �����, ������������ � �����.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//�� ��������� � ���� ����, ��� ���� ������� � ������� ������� ������� ������ ����������� ������� ������.
	};
};

// ************************************************************
// 			Innos
// ************************************************************
INSTANCE DIA_Daron_Innos(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Innos_Condition;
	information	= DIA_Daron_Innos_Info;
	permanent	= FALSE;
	description	= "�������� ��� �� ������.";
};                       
FUNC INT DIA_Daron_Innos_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Innos_Info()
{	
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//�������� ��� �� ������.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//�����, ��� ���������� �������, - ��� ���� � �����.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//�� ������� ����� � �������� ����������� ����� ���� �� �����. �� ���� �� ����� � ������.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//�� ������� � ��������� �� ��� �����. �� ������������ ���������� �������� ��� ���� � ����������� ��� �����.
};

// ************************************************************
// 			  Kloster
// ************************************************************
INSTANCE DIA_Daron_Kloster(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Kloster_Condition;
	information	= DIA_Daron_Kloster_Info;
	permanent	= FALSE;
	description	= "�������� ��� ��������� � ���������.";
};                       
FUNC INT DIA_Daron_Kloster_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	|| Npc_KnowsInfo (other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Kloster_Info()
{	
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//�������� ��� ��������� � ���������.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//�� ������� ����� ��������� ���� ������ �����. �� ���� ����� ���� �� �������������� ������ ������.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//�� ����� ������ ����������� � ��������� ������� � �������� ���.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//��� �� ������ ������������ ����.
};

// ************************************************************
// 			 Stadt
// ************************************************************
INSTANCE DIA_Daron_Stadt(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 99;
	condition	= DIA_Daron_Stadt_Condition;
	information	= DIA_Daron_Stadt_Info;
	permanent	= FALSE;
	description	= "� ��� �� ������� � ������?";
};                       
FUNC INT DIA_Daron_Stadt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Stadt_Info()
{	
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//� ��� �� ������� � ������?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//� ��������� ��������� � ����������� ������� ������ �������� � ����������� �������.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//� ��� ������� ������� ��� ���� ���� ����� ������ � �������� ������.
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_GuildHelp_Condition;
	information	 = 	DIA_Addon_Daron_GuildHelp_Info;

	description	 = 	"� ������, � ��� ������� ������ ���������.";
};

func int DIA_Addon_Daron_GuildHelp_Condition ()
{
	if (MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Daron_Stadt))
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //� ������, � ��� ������� ������ ���������.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //�������? �� ���� ���� ������ ��� ���� ������.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //� ��� ��������?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //� ���������� � ��������� ���� ���������� ����������� ���������. �� �� ��� ��� ��� � �� �����.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //������� ��� ��������?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //���. �� � ������� � ����������� ������ � �������. � �������� ��� � ������ ���������.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //�� ����� � ����������� � ���������, �� ���� ������ ������� � �������� �� � ����.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //(�������) � �� ���� �� ���� ��� ��������. ����, � ������ ��������, ���� ����.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "������, ������ ��� � ��������?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "��� ������ �� ������� ���������?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "�� �� ������� ������� ���������?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //�� �� ������� ������� ���������?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //�������, �������! � ����� �� �����. �� ���, ��������������.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //������, ������ ��� � ��������?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //����� ��� ��������� � ��� � �����, ��� �������� � ����������.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //������ � �� �� �����. ��������, ��� ����� � �����-������ ������.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //��� ������ �� ������� ���������?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //�� ���� � ���������, ���������� �� ������� ������.

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "� ������� ����������. � ����� ���������.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "������� ������? ��� ��� ���������?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //������� ������? ��� ��� ���������?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //���� �� ������� �� ������ ����� ��� ������ � ������� ����� �� ������, �� ������� �� �������� �������� ����.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //��� � ���� ������� ������, '������� ������'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //� ������� ����������. � ����� ���������.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //�� �������� ���� �����, � �� ������� �� ���� �� ����������, �������������� ���� �� �������� ������.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"����� ��� �������� �������� ���������. � ���� ������� ������ ���������, ������� �� ������ ��� ��������� � ���������. ��� �������, ������, ���������� � ������ ����� ������� '������� ������'."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_FoundStatue_Condition;
	information	 = 	DIA_Addon_Daron_FoundStatue_Info;

	description	 = 	"� ����� ���������.";
};

func int DIA_Addon_Daron_FoundStatue_Condition ()
{
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_FoundStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //� ����� ���������.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //����� ������!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //��� �� ������ � ��� ������?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //�? ������. �� ��� ��� ��� ��������� ��� ���� ���������.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //�� �������� �� � ���������, �����.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //�������, ���� �� ��������� ������, ���� �� �� ����������� ��������� ���������� ����� �������� ���������.
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //�� � ������, ��� �� �� ����������. ���� �� ������ ������� ������ ���, �����?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //������, �����! �� �������� � ����� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Daron_ReturnedStatue_Condition;
	information	 = 	DIA_Addon_Daron_ReturnedStatue_Info;

	description	 = 	"� ����� ���� ��������� � ���������.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_ReturnedStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //� ����� ���� ��������� � ���������. ������ ���� �������.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //��� ���������� �������! �� ������ ���� �����.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //����� ��� ��� � ���� ���� �������������.
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;		
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
INSTANCE DIA_Daron_arm(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 10;
	condition	= DIA_Daron_arm_Condition;
	information	= DIA_Daron_arm_Info;
	permanent	= FALSE;
	description	= "� ��� ��� ������!";
};                       
FUNC INT DIA_Daron_arm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Stadt)
	&& (Npc_HasItems  (other, ItMi_Gold) < 10) 
	&& (other.guild == GIL_NONE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_arm_Info()
{	
	AI_Output (other, self,"DIA_Daron_arm_15_00");//� ��� ��� ������!
	AI_Output (self, other,"DIA_Daron_arm_10_01");//��, �� ������� �� ������. ��� ������������� � ��� ������� �������. ������ ��� ������, �������, ��� ������� ����.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//�� �� ������ ����� ���� ������, � ����� � ���� �� ����� ���������� � ������. � �� ������� ������������ ��� ������ ������ ������, ����� � ���, ��� ��� �������� ����.
	
	B_GiveInvItems (self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden 
// ************************************************************
INSTANCE DIA_Daron_Spende(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 990;
	condition	= DIA_Daron_Spende_Condition;
	information	= DIA_Daron_Spende_Info;
	permanent	= TRUE;
	description	= "� ���� ������� �������������...";
};      
//-------------------------------------
var int DIA_Daron_Spende_permanent;
//-------------------------------------                 
FUNC INT DIA_Daron_Spende_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo (other,DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spende_Info()
{	
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//� ���� ������� �������������...
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"�� � ���� ������������ ������ ... (�����)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50  ������)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 ������)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 ������)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//�� ��� ����������� ��� ����� 1000 ������� �����.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//������������� ������ ������ �������� � �����.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //�� � ���� ������������ ������...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //��� �� ����� ��������, ��� ���. �� ������ �������� ������������� �����.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//������������ ���� �� ����� ������. �� ����� � ���� ��� ���� � ��������������.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"��� ���� ����� ����������� ����.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//�� ������ ���������� ��������� ��� ���������, ���� � ���� ������ ������������ ������.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//�����, �� ����, ��������� ���� �����������.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//� ������������ ����� �������� �� ������ �����. �� ����� ���� ���� ����� ��� ��� �����.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"��� ���� ����� ����������� ����.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//����� ������� - ���� ������ ��������, ������ ���� ����. � ���� �� ������ ������������, ������� ���� ���.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//�����, ���������� ����� ��������. �� ����� ���� ���� ����� ��� ��� �����.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//������ ��� ���� ���� ��������� ������.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"��� ���� ����� ����������� ����.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//���� �� ������ ������������ ������� ������, ��� � ���� ������ ���� �� ����.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};


	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Daron_PICKPOCKET (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 900;
	condition	= DIA_Daron_PICKPOCKET_Condition;
	information	= DIA_Daron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen (47, 80);
};
 
FUNC VOID DIA_Daron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Daron_PICKPOCKET);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_BACK 		,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};
	
func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};










