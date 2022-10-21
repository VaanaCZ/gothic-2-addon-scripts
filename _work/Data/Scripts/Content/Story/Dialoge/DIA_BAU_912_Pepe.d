// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Pepe_EXIT   (C_INFO)
{
	npc         = BAU_912_Pepe;
	nr          = 999;
	condition   = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 1;
	condition	= DIA_Pepe_Hallo_Condition;
	information	= DIA_Pepe_Hallo_Info;
	permanent	= FALSE;
	description	= "��� �� ������� �����?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //��� �� ������� �����?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(������) ������� ����! (��������) �, �� �����������, �������� ��������� �������� �� �������������.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //��� �� ������ ��������, ��?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //�� ��, �������� ����� ���� �������� ���������. � ����� ���, ��� ������� �����, �� ��������, �������� �� ���. ���� � ����� �� ������ ���������.
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 2;
	condition	= DIA_Pepe_Danger_Condition;
	information	= DIA_Pepe_Danger_Info;
	permanent 	= FALSE;
	description	= "� ��� �������� �� ��������?";
};
func int DIA_Pepe_Danger_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};
func void DIA_Pepe_Danger_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //� ��� �������� �� ��������?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //���������� ������ ��������� ���� ������. ��� ��������� ����� ����� ������ ���� ���������� ���� �� ���� ����.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //��������� ���� ����� � ���� ���� � ��� ���� ������ ����. ��� �� ������� ���� ������, ��� ���� ������� �� ����, ����� ������ �� ����.
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD	(C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 3;
	condition	= DIA_Pepe_WhyNotSLD_Condition;
	information	= DIA_Pepe_WhyNotSLD_Info;
	PERMANENT 	= FALSE;
	description	= "������ �� �� ������� ��������� � ������? ��� ��������, ��� �� ������.";
};
func int DIA_Pepe_WhyNotSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
func void DIA_Pepe_WhyNotSLD_Info ()
{
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //������ �� �� ������� ��������� � ������? ��� ��������, ��� �� ������.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //��, � ����. � ������ ��� ������� ���. �� �� ������, ����!
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //� ������, ����� ������� ���� �������, � ����� ����-������ �������� �� ����.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //�� �� ������ ��� ������ ���...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(�������) � ��� ������� �� ����.
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves (C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr			= 4;
	condition	= DIA_Pepe_KillWolves_Condition;
	information	= DIA_Pepe_KillWolves_Info;
	permanent 	= FALSE;
	description	= "��� ���� � ���� ���� ������?";
};
func int DIA_Pepe_KillWolves_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};
func void DIA_Pepe_KillWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //��� ���� � ���� ���� ������?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(����������) ��, ���? �� ��. � �� ���� � ���. � ������ ������, ��� ��� �����-����� ����������� � ����.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //������ �� ����. ��� ���� ����� ���� �������������. � ����� � ������, � ���������, ��� ��� ������ ������ �����...
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(���������) ������� �������. ������, ������! ���... �� ���������� ����, � �� ������ ������� ����� ������ ����� �����. ��� �������!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //������ ��� ������� � ���� ����� ��������. (��� �� ����� ������) � �����, �� ����� �������...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"���� ���� �������� �� ������. � ������ �������� ��.");
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves		(C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_KilledWolves_Condition;
	information	 = 	DIA_Pepe_KilledWolves_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ����������� � �������.";
};
func int DIA_Pepe_KilledWolves_Condition ()
{
	if  (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Pepe_KilledWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //� ����������� � �������.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(���������) �� ������ ���! ����� ������!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //�� � ��� ����� �� ����, ��� ������� �����, ��� ��� ���� �������.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(���� ��� ���) ��� ��� ���� ������ ����� �������!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //�� ���� �������� �� ������? ��� ����� ��� �� ��� ������.
	};
};

// ************************************************************
// 					Was hast du �ber Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"��� �� ������ ������ �����?";
};
func int DIA_Pepe_Bullco_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Bullco_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //��� �� ������ ������ �����?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //��� ���� �� ���������. ��� ��� ������ �������� ��������.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //�� ������ ����� �� � ��� �������� ������� ���� �������� ��������� � ����� � �����.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //��� ���� ������� ����� �������, ���� ��� �� �������� �� ������ ������ ������ ��-�� ������ ����.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //��� � ����� �� ������ ��� �����. �� ������ ��� �� �� �����. ���� ������ - ������.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"����� ����� �������� ���� ����. ���� �����, ����� ���-������ ������� ���.");
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_BullcoDefeated_Condition;
	information	 = 	DIA_Pepe_BullcoDefeated_Info;
	permanent	 = 	FALSE;
	description	 = 	"����� ������� �� ��������.";
};
func int DIA_Pepe_BullcoDefeated_Condition ()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Pepe_BullcoDefeated_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //����� ������� �� ��������. � �������� ��� ����.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //��� ������ ��������� ���.

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP (XP_KickBullco);
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Pepe_PERM		(C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr		 	= 6;
	condition	= DIA_Pepe_PERM_Condition;
	information	= DIA_Pepe_PERM_Info;
	permanent	= TRUE;
	description	= "��� ����, ��� ���� ����?";
};

func int DIA_Pepe_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info ()
{
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //��� ����, ��� ���� ����?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //���������. � � ������ ��� � �������. ��, � ����, ��� ��� �������� � ����, ��� � �������.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //������. �� ����� ������ ������ �����. �, ��������, � ������� ����������!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //� ������ �������� ����. �������, ��� �� ����� ������ ��������� �������� ��������. ��� ������ ��� ���.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //� ������, ��� �����-�� ������� ���������� �� ����� �������. ���-������ ������ ������ ���.
	};
};

// ************************************************************
// 			  					Liesel 
// ************************************************************
instance DIA_Pepe_Liesel		(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	7;
	condition	 = 	DIA_Pepe_Liesel_Condition;
	information	 = 	DIA_Pepe_Liesel_Info;
	permanent	 = 	FALSE;
	description	 = 	"���� � ������ ����?";
};
func int DIA_Pepe_Liesel_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Pepe_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Liesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //���� � ������ ����?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //����� ��������, ���� � ���� ���� ������. ���� ����� 100 ������� �����.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //���� �� ���������, ������ ������� ���� ����. �� �� ������ ��������� ������ � ��� ����������.
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	8;
	condition	 = 	DIA_Pepe_BuyLiesel_Condition;
	information	 = 	DIA_Pepe_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"��� 100 ������� �����. ����� ��� ����.";
};
func int DIA_Pepe_BuyLiesel_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};
func void DIA_Pepe_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //��� 100 ������� �����. ����� ��� ����.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //������. ������ ����� - �� ������� �� �� ��������.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //������ ����� ��, ��� ��� ������ ���� �� �����. ��� ����� ���� ��� ����. �� ������ ��!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //�����? ������. ������ �����.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //�����? �� ��������� ����, ��� � ���� � ����, ���� ����� �����...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //���� ���� ����� �����.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //�� ����������� �������, ������� ��.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //� ��� �� �����?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //����.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //� ���� ������������ ������. � � �� ���� ������� ���� �������.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pepe_PICKPOCKET (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 900;
	condition	= DIA_Pepe_PICKPOCKET_Condition;
	information	= DIA_Pepe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, 25);
};
 
FUNC VOID DIA_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pepe_PICKPOCKET);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_BACK 		,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};
	
func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};















