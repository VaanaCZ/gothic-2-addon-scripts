// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thekla_EXIT (C_INFO)
{
	npc         = BAU_913_Thekla;
	nr          = 999;
	condition   = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Thekla_HALLO		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 1;
	condition	= DIA_Thekla_HALLO_Condition;
	information	= DIA_Thekla_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Thekla_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //��� �� ������� �����, �� ���� �����?
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 2;
	condition	= DIA_Thekla_Lecker_Condition;
	information	= DIA_Thekla_Lecker_Info;
	permanent 	= FALSE;
	description	= "��� � ���� ����� ������ ������!";
};

func int DIA_Thekla_Lecker_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //��� � ���� ����� ������ ������!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //�� ������������! � ���� �����, ��� ��, ��� �����������! ��� �� ������� ������ ������!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //������� �� ��������� ��������������, � �����, ����� �� ��� ���-�� �����, �� ������ �� �������!
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------

instance DIA_Thekla_Hunger		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 3;
	condition	= DIA_Thekla_Hunger_Condition;
	information	= DIA_Thekla_Hunger_Info;
	permanent 	= FALSE;
	description	= "� �������!";
};

func int DIA_Thekla_Hunger_Condition ()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //� �������!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //� �� ������ ������. � ������ ������ ���, ��� ��������.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(������������) � ���� �����, ���������, �������.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //��� ���� ���.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //�� �� ����������� ����� ���������.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //��� � ���� �������� ��������� ������?
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************

instance DIA_Thekla_Arbeit		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_Arbeit_Condition;
	information	= DIA_Thekla_Arbeit_Info;
	permanent 	= FALSE;
	description	= "� ��� ������.";
};

func int DIA_Thekla_Arbeit_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //� ��� ������...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //�� ������ �������� �����, �� �����?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //���� ������ ����� ������ ������ ����. ��� ����� ���, ��� � ��� ������.
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************

instance DIA_Thekla_WannaJoin		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 5;
	condition	= DIA_Thekla_WannaJoin_Condition;
	information	= DIA_Thekla_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "������-�� � ���������� �������������� � ���������...";
};

func int DIA_Thekla_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //������-�� � ���������� �������������� � ���������...
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //��� �� ���� ���������� �� �������?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //� ����� �� ����������! ������ ���� � �����! ����� ������ ����� ��� � ��� �������!
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************

instance DIA_Thekla_Schlafen		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 6;
	condition	= DIA_Thekla_Schlafen_Condition;
	information	= DIA_Thekla_Schlafen_Info;
	permanent 	= FALSE;
	description	= "��� ��� ����� �������?";
};

func int DIA_Thekla_Schlafen_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //��� ��� ����� �������?
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //���� �� ����� ����� � ���� �����. ����� ���� ����� � �����.
};
		
// ************************************************************
// 			  				   Problem
// ************************************************************

instance DIA_Thekla_Problem		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Problem_Condition;
	information	= DIA_Thekla_Problem_Info;
	permanent 	= FALSE;
	description	= "������ �� �� ������ ���������?";
};

func int DIA_Thekla_Problem_Condition ()
{
	if (kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //������ �� �� ������ ���������?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //��, ��� ������� ��������� ��� �� �����! �������� ������� � ��� ������ �������� �����.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //��� ���� ����� ��� ���, � ����, ������ ����� �������� � ��������� ��� �����.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //�� ��� �� ������� �������, �� ���� ������� �������, �� � ��� ���� ��������...
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //� ������ �� ������ �� ������� � ����?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //� ��� � ���� �������, ������ ������-��������? ������� �� ����� �������? ��, � ��������� ��� ��������, �� ���� ��� ������� ������� ����� ������� �����!
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************

instance DIA_Thekla_Manieren		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Manieren_Condition;
	information	= DIA_Thekla_Manieren_Info;
	permanent 	= FALSE;
	description	= "������, � ����� ���� ����� ������� �������?";
};

func int DIA_Thekla_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem)) 
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //������, � ����� ���� ����� ������� �������?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //���� ����� �� ����������� � ����. ��� � ����, � ������� ���������� �������. ��� ������ ��������.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //� ��� ������ �����?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //���� ������ ����� ��� ���. ���� �� ����� ���������� �� �����, ��� ������� ��������� ������ ���� ��� �������.
};
		
// ************************************************************
// 			  				  After Fight
// ************************************************************

instance DIA_Thekla_AfterFight (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_AfterFight_Condition;
	information	= DIA_Thekla_AfterFight_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Thekla_AfterFight_Condition ()
{
	if (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info ()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //�� ������������� ���� ������ ���� �� ����� �����.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //������ ����, �� ����� �����, ���� ������� ��� ������ ������.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //�� ���, ������� �� ������ ���������?
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //� �� ���� �������������! ������ �� ���������, ��� � ����� � ����?
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //� ���, ��� �������� ���� ���� ������������.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //�� ������������� ���. �� ������ �� ������, ��� ��������� �� ���� �������.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //���, ����� �������. ��� ����������� ���� ����.
	B_GiveInvItems (self, other, ItFo_XPStew, 1);	
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess 
// ************************************************************
instance DIA_Thekla_SagittaPaket (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_SagittaPaket_Condition;
	information	= DIA_Thekla_SagittaPaket_Info;
	permanent 	= TRUE;
	description	= "��� ����� �� �������.";
};

func int DIA_Thekla_SagittaPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info ()
{
	B_GiveInvItems (other, self, ItMi_TheklasPaket, 1);
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //��� ����� �� �������.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //�������� �������. �� ���� ���� ���� �����-�� ������ � ������� �� ������.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_TheklasPaket);		
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------

instance DIA_Thekla_PERM		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 900;
	condition	= DIA_Thekla_PERM_Condition;
	information	= DIA_Thekla_PERM_Info;
	permanent	= TRUE;
	description	= "�� ��� �� ���� ��� ����� ��������?";
};
func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //�� ��� �� ���� ��� ����� ��������?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //��� �����������.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //�� �������� ���� ��������� �����?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //���.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //� ���� �������� ������, �?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //��������!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //���� ���� ��� ����������� ��� ��������, ���� �������� ������� ���-���, ����� �������� ��.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //���?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //����� � �������, ��������, ��� ����� �� ������ ������, � ������� ��� �� ��� ����� � ������.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //���� �� ��������� ��� ��� �����, � ����� �������� ��� ����.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"���� � ������� ����� ����� �� �������� �������, ��� ������ ��� ���� �������� ��� ����. ������� ����� �� ������ ������.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //������. � ������� ��� �����. ���, �����. �� ���� ��������, ��� �� �������� �� ������ � ���� �� ������.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //��, ��, ��! �� ���� ����� ������! � ��� ���� �����, ���� � ���� �������� ��� ������ ��� ����.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //� ����� �� �������� ��� ���� ��������, �������?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //� �������, �� ����� ������� ��������� �� ������. �������� ������, ������.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //��� ������� �� ��������� ������� ������� �� �������.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //����� ��� ������, ������� ��� ������, ������? � ��� �������� � ����� ��� ���� ����� ������� ��������.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //� ���� ������ �� ��������. ������ �����.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //�� ���, ������ ����� ��������? � ��� �� ����� ��� ��� �����?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //� ��������� ���������� ��������.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //��! ����� ���� ������������� �� �������� ����� ������� ��������.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //���! �������� ��� �����������.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //��� ����, ��� �������� - �������?
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thekla_PICKPOCKET (C_INFO)
{
	npc			= BAU_913_Thekla;
	nr			= 900;
	condition	= DIA_Thekla_PICKPOCKET_Condition;
	information	= DIA_Thekla_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen (53, 60);
};
 
FUNC VOID DIA_Thekla_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thekla_PICKPOCKET);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_BACK 		,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};
	
func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};























