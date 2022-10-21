// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //��! � ���� ������-�� ����?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //����� ����. � ���� ��� � �������.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //�����... ��� ���� �����?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "��� ��������?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //��� ��������?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //��������� ������� ��������. �������� ������������� �� ��� �������.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //������� � ��� ���� �����������, ��� �� ������ ���������� ����.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "� ��� ���������, ��� ��������� ��� �������?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //� ��� ���������, ��� ��������� ��� �������?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //����������� �� ��� ������ �� ������� ������ � ��.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //�� ��������� �������� �������������� � ��� �����.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //��� �� �� �������, ��� ���� ����� � ��������� � ������.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //��� ���-�� ����������, ��� �� ����� ����. �� ������� ��� �������.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //�� ����������, ��� ����������� ����� ��, �� ������ �� �������� ������� ��������� ������ �� � ��� �����.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //����������� �� ����� �� �� ��������� ��� �������� �������. �� � ������ ���� ����� ������, ��� �������.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //�� �������� ����� �� �����������, ����� ����������� ���� ����.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "�� ������, ��� ���������� ������ ��?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //�� ������, ��� ���������� ������ ��?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //�� �����, ����� �� �������� � ������ ������� ��������� � ������.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //�� ��������� �������� ��� ���� � ����� �������. ����� ���������, � �� ���� ������ ������ ����, ����� �������� ������.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //� �� ����, ��� �� ���������� ���������� ���, �� � ������� ���. �� ������ ��� ������� �������.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "�� ������, ��� ��������� �������?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //�� ������, ��� ��������� �������?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //������� �������, ��� ����� ��������� ����������� � ������ �������.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //�� �������, ��� ���������� �������� �� ��������� ��������� ��� ����� � ����� ��������������� ���� ���������.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //������� ������ �����, ���������� ������ �� ������� ��������� � ������, ��������� ����������������, �� � ��� �����.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //�� �� ��������, ��� ��� ������ �� ����, ��� ����� ��������� � ���� ��������.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "� ���� ����� ���������!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //� ���� ����� ���������!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //� �� ������, ��� ��� ������� ����...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //� ��� ��������?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //��, � ������ ���������� ���� �� ����, ���� ������.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //� �������� ��������, � ���������� �� ����, ������ ���� ���� ������, ��� �� �� ������� ��!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "� ��� � ������ �������?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //� ��� � ������ �������?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //��� ������. �������� ���������� ������ �������! ��� ��� ������� ����� ������, � ��� ��.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //� ���� �� ������ �������������� ������ �����, �� ���� ������� ��������� �������� ���������.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"������� �����, ����� � ������� ������� ������ �������, ����� �� ������ ���� ����� �� ����.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "��� �� ������� ������?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //��� �� ������� ������?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //�������� � ��������, �� ��� ��������, ���� ���� ��� ���������.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //� ����, ����� ����� ���� �� ���� �������������: ���� �� �������, ������ �� �������������� ���� ������ ��� ���. ���� ������ ���� ������� �������� ���� ������ � �����!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"� ��� ���� �� ����� �������������� ���� �������� ������ �����...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "��� �� ��������� ���� �������?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //��� �� ��������� ���� �������?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //�� �������. ������ �����, ��� ������� � ��� ������ ���� �����.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //����� ���� ���, ��������, ������ � �����.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //��������� �������� ���� ����������� �������, ���� �� ������� ��.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"���� ������� - ��� ��� �������, ��� ������ ���� �����, ���, ��������, ������ � �����.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "������� ����� ������� � ������ ��������?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //������� ����� ������� � ������ ��������?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //���� �� �������� ����� �� ���, �� ��������, �� ���� �� �������.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //���� �� �������� - ��� ���� ����.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //��� ���� ���������: �� ����� �������� �������� ��������. �� �������� ������ ������ ������� - �� ������� �� ���� �������.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"������ ����������, ���� � ������� ����� ����� �������. �������, � ����� ������� ��� ����� ���� �� �����������.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "������� ����� ������� ��� ��� ����� �������?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //������� ����� ������� ��� ��� ����� �������?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //� ��������� �����.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //� ������. �������.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //��� ������ ����� ������ �����������.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //�������� ������� �������� �� ���� ������ - �� ����� ������ ����.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //� ������� ��������.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //������ ������� �������� ���� - ��� ���� ��� ������.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //������ ������� �� ��������.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //��� �������� �����...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //� ����� ���������� � ������...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //�?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //���������, ��� ��� ������ ���������� �������.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //�� ���� �� ������� �� ������ �� ����� �������.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //������, ��������� � ��� �� ����.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //� ����, ����� �� ������� ��� ������� ����� �� ���.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //����� ����������, ������ ����������.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //�� �� ���� �������� ����������, ��?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //� ������� - ���� �� ������� ��� ������, � ���������� �� ���� ��� ���������.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"������� ����������� �� ����, ���� � ���� �������������� � ���������.");
	};
};


// ###############################
// ##							##
// 			H�here Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "���� �������?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //���� �������?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //������ �� ���� �� ���. ��� ������.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //�� ������ �������� �����, �� ��� �� ����� ����� �� ���.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //��������� �����, ���� ������� ����� �����-�� �����������. (������� ������)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //������� �������-�� ������. ����� ����, ��� �� ������� � ��������, �� �� ������ ������� ���������� � �������.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //��, ��������, ������, ��� ��� ����� �����.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //���, ���� ��� ��������. ��� ����� ���������, ��� ��� ��� ��������.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





