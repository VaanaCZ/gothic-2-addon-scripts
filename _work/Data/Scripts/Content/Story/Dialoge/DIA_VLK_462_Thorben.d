// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //�� ���� ��� ������. � ������� �� ����� ����. ����� � ���� ����, ������!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //��! ����� ����. �� ���� �� �� ��������, ��?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //������ �� ������ ����� ��� �����������. ������� �������, ������ ���, � ������ ��� � ������� ��������.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //����� ������ ���� ���� �������?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "� ��� ������.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //� ��� ������.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //�� ���-������ ������ � ���������� ����?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //������������, ��� � ���� �������� �� ������, - ��� �����.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //� ��� ������ ������?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //�����...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //������, �� � �� ���� ����� ����, ���� �� ������ �� ��������� � ���� �������.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //� � ���� ��� �����, ����� ������� �������.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "������ �� ������ ���� � �������.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "� ��� ���� � �������� � ������� � ������ �� ������ ������� ��������?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //� ��� ���� � �������� � ������� � ������ �� ������ ������� ��������?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //������, � ��� ���� ���������.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //�� ���� ����� ������� �������� ������������� �����.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //�����, �� �������� �������?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "��, ���� �� ��� ������ � ����, � ��������� ������...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "��. � ���������� ��������, ������ ������.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //����� ��� � �������, ����� �������, ����� �� ���� ���� �������������.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //�� ����� ��������� ����, ��� ����� ����� ������. �� ������ �������� � ��� �������������.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //� ����� �� �������� ������������� �����, � ���������� �� ����.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"������ ���� ��� ���� ���������, ���� ���� ������� � ���� ������ ����� ��� ���� �������������.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //��. � ���������� ��������, ������ ������.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //��, ���� �� ��� ������ � ����, � ��������� ������...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //�������!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //�������, ������� ���������� �������� ��� ������������� �����, ������� �� ������� ����� ���������.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //����� ����� � �������� ����� �����������.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "��� ������ ���������, ������?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //��� ������ ���������, ������?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //������ ��� ���� �������������?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //��.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //� ������������� ����� ������ �� �������?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //��, �������.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //����� �� �������� � ��� �������������. �� �����, ������ ���� �� ����� ���������, ������� ����� ��������, ��� �������!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"������ ���� ��� ���� ���������, ���� � ������ ����� ��������.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //���. ��� ���...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //�� ������ ��� �������. �� ������ ���������� �������� ������ � ������������� �����.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //��� ���...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //����� � �� �������, ����� �� ����� ������ �� ���. �� ������ ��� �������.
	};
};

// ************************************************************
// 		Was wei�t du �ber Schl�sser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "��� �� ������������ � ������?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //��� �� ������������ � ������?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //����� ����� � ������� ������� ��� �������� �����?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //� ����� ���� ����������� �����. ���, �� ������� ����, � ���� ���� ������, ��� �� ����� �������, ������� �� �� ���� �� ��������.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //����� ��������� ����� ����� �������. � � �������� ����� ����� �����. �������� � ��������� �����!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "� ���� ���� �������� ������...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //� ���� ���� �������� ������...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(�������������) ��� �� ���� ���?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //���� ������ ������������ �� ��� � ���� ���, � ��, ��� � ��� �������� ���� ���.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //��� ��� ����!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //� ��� �� ����� ���� �� ����?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //� ���� ��� �����. �� �� ������ ������������ �� ��� ��������� �������������.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schl�sser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "�� ������ ������� ���� ��������� ����� ���������?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //�� ������ ������� ���� ��������� ����� ���������?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //���� �� �� ��, � �� ������ ������ �� ����� ����� ����.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //� ����� ���� ����, ��� �� ������ �����.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //�� ������ ��� 100 ������� �����. ��� ������� ���� � ����� �������.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //��� ����� ������, �� � �������� ��������� � ���� ���.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //���� � �� ����� ���� ������ � ��������� �����, �� �������� �� ���� ����� �����������.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //��� ��� ��� 100 �������, � � ����� ����.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "������� �� ��������?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "�������. ��� 100 �������.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //�� �������� ���� ������ ������. ������, �� ������� �������. � ����� ���� ����, ��� �� ������ �����.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //������ � �� ���� ������� ��� ���������. � ����� ���� ������, � ��� ����� ������.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //������� �� ��������?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 ������� �����.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "������� �� ��������?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "�������. ��� 200 �������.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //���... � �� ����, ����� �� ���� ��������.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //�����, �� ������ ��������� ����� �� ���� ������������, ������� �������� � �����, ������ ����� ��������� ������� ������� �����.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //� ������ �� ���� ����� ����, ���� �� ���� ������, ��� �� ������� �������.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //�������. ��� 200 �������.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //��� ������ ����� ������� ���. �� ���������, ��� ������ �� ������ �����.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //� ���� ��� 200 �����. � ��� ����� ��� �����.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //�������. ��� 100 �������.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //� ����� ������, �� ����� ������, ����� �� ������ �����.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //��, � ���� �� ��� 100 �����.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //����� ����, �����...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schl�sser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("����� ���� ��������� �����!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //����� ���� ��������� �����!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //���, ��� ���� ����� - ��� �������. ���� �� ������ ��������� ������������ �� ����� � ������ � �����, �� ������� ������� ���.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //�� ���� �� ������ ������� ������� ������� ������ ��� ������� ������ � ������������ �����������, ��� ���������.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //��� ����� ������� �� ������ �����������, ��� ������ ������� ���� �����������. ���, �������, � ���, ��� ���� ����� �����.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "�� ������ ������� ��� �������?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //�� ������ ������� ��� �������?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //���� ��� ��������...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //������. �� ��� ����� �� ������� ����, ���� �� �� ��������� ������������ ���.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"������� ������ ������� �������."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"� ���� ������ ��� ������?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //� ���� ������ ��� ������?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //��, � ������ �������.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //� ��� ���������?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //��� ��� ������. �� ��� ���������.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //� ��� �� ����� �������, �� ������� �� ������ ���� � �� ������ �� ������.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"������, ������ �������� �������, ������."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "�� �� ��������� � ���������?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "��� ����� ��� �� ����?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "� ��� �� ������ ������?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //��� ����� ��� �� ����?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //����� ���� ������.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //� ��� �� ������ ������?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //������ ��� �����? � ��������� ����� �� ��������� ��������� � ����� �������� ������� � �����.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //�� ��������, ���� �� � ������ ������������ � ������� � �����-������ ������.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //�� �� ��������� � ���������?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //���������, �������. � �������� �� ������� ����� ������ � ����������, ����� �� �������� �� ������. �� � ��� �� ���� �����.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //����� ������ ���, ��� �����. ���� ��� ������ �� ������, ��� ��� ��������� ������ � �������� ������ ������.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(�������) �������?
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"������ ����� ����� �� ���� ��������.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //������ ����� ����� �� ���� ��������.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //����� ���������, ��� �� ������ �� ����� �������, ��� ������ ��������� ����� �������� �������� ����� ��� �����.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //������ ��� ������ � �������� ������� �� ����������� �������.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "��� �� ������ � ���������?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //��� �� ������ � ���������?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //��������. ��� ������� �� ������� � �������� ��� ������ �����.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //� ��� ���, ��� ��������� � ������� �������� ������.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //����� ������ �� �����, ����� ��� �������.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //������ ��������� ��������� �����.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //� � �����, ��� ��� �����, ����� �������� ��������� ��������.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "�� ������ ���-������ � ��������� ��������?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //�� ������ ���-������ � ��������� ��������?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //����� �����, ��� �������� ���� ����� ���������, ����� ��������� �� ����� ��� ����������� ������.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //��, ��������, ����� �������� ���� ���� ������ ��������� � ���������.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //�� � � ������ ����� ����� ����� ����� ���� �� ��������������.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //����� ����� ��������� ������ �� ������ ������. �� �� �����, ���� ��� �������� ��� ���.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //���� �� ������ ������ ������, ����������� ��������� �� �������� ������. ��� ����� ����� ���������� �� ������� ��� �.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "� ������ ������...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //� ������ ������...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //���� ����������? ����� ���� ���� �� ���? ��� ������ �����, ��?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //��� ������ 100 ������� �������� ������.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //����� ���, ��� ��� �� ���! � ��� ���, ��� ��� ����� �� ����, �� ��� ���� ��������!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //��� ��������� ����� ���� ��������� ������.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //��� �������� ������ 200 ������� � ���������� ������, ����� ������������ � �� �������! � ��� ������ �����!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //������ ������ ���� � ����.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //���, �������� � ���. �� � ����� ���� ������: � ��� ��� �� ����� ������� ������.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //���������...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "� ����� ���������� ���� 100 ������� �����.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //� ����� ���������� ���� 100 ������� �����.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //���? �� ��� ���� - ��� ���� ��� ������! ��� ����� ��� �� ����� �������.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //����� ��� ���! � ������ ������� ��������� ������. ������ ����� ���������!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "� ��� ����� ������ ������!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "���. ������ ������� ���� ������ �����.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "��� ���� ������.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //�, ��������� � ���� ��� ������, � ������, ��� ��� ������� ����� � ���������� � ������� ���� ����!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //� ������ ������� ���� ������.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //� ��� ����� ������ ������!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //����! ��, �����, ���� ���� ����. �� ������� ����, �� �� �������� ��� ������. �����, ��� ����� ������������� ���� �� ���.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //���. ������ ������� ���� ������ �����.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //�� ������ �������� ����. ����� �� ���������� ������������, ����� ���� ������� �� ������.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //��, �� ������� ����, �� ������������ � ������� ���� ����������. �����, ��� ����� ������������� ���� �� ���.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //��� ���� ������.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //�������! ������, � ���� ���� ���� �� ����� �����, ������� � ������ ������.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //�� ���� ��������, ��� � ��� ������� �������� ����� ��� ������!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















