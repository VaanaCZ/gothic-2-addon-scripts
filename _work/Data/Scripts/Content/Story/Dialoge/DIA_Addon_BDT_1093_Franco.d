///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Franco_EXIT   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 999;
	condition   = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_EXIT_Info()
{
	if (Franco_Exit == FALSE)
	&& (MIS_HlpLogan == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//�� ���������, ��� ������� �� ���� �������� ������.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Franco_PICKPOCKET (C_INFO)
{
	npc			= BDT_1093_Addon_Franco;
	nr			= 900;
	condition	= DIA_Franco_PICKPOCKET_Condition;
	information	= DIA_Franco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(�������� ������� �� ������ ����� ����������)";
};                       

FUNC INT DIA_Franco_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)
	&& (Npc_HasItems (self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Franco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Franco_PICKPOCKET);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_BACK 		,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItAm_Addon_Franco, 1);
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Franco_PICKPOCKET);
		
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX]	= 196; //boah ey, ist ja ein super trick!
		self.attribute[ATR_HITPOINTS] 		= 196;
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
		
		
	};
};
	
func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Franco_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HI   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 1;
	condition   = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Franco_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Franco_HI_Info()
{	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"���� � ������� ������� ������, �� ������� ���� � ������.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//��, ��� �� ����� �������? �� ������ ������� � ������?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//��, �...
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//���� �� ����������, ��� �� �����. ���� ����� ������. � ����� ��������.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//���� �� ������ ������ ��������, � �������� ���� � ������.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//�������� ����� ����� ���� �������, ����� �� � ������ ����� ����. �������� � ���.
		B_LogEntry (Topic_Addon_Franco,"� ������ �������� ������, ����� �� � ������ ��� ����.");
	};
};
//---------------------------------------------------------------------
//	Info Mission SumpfHai
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Hai   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 2;
	condition   = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent   = FALSE;
	description = "������ ����� ����� �������.";
};
FUNC INT DIA_Addon_Franco_Hai_Condition()
{	
	if (Ramon_News == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Hai_Info()
{	
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//������ ����� ����� �������.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//������, � ���������� �� ����.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//���������, � ��� �� �?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//�� ��� ������ �� ������.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//� ������ �������� �����, ��� ������ �� �� ���� �� ������.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//�� ������. ���� ����� ����? �� ��� ��������. ���� ���� ������� � ������. ��� �������� �������� �����.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//������ ��� ������������ � ���������� � ������, ��� �� � ������.
	
	B_LogEntry (Topic_Addon_Franco,"������ �����, ����� � ����� ������.");
};
//---------------------------------------------------------------------
//	Info Logan Wo?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Wo   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 3;
	condition   = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent   = FALSE;
	description = "��� ��� ����� ������?";
};
FUNC INT DIA_Addon_Franco_Wo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	&& (!Npc_IsDead (Logan))
	&& (MIS_HlpLogan == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Wo_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//��� ��� ����� ������?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//���� �� ������ ����� � ����� � ������, �� ���� ���� ���� ������, ����� �����. ����� ����������� � �������, ������ ������� ������ ������.
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Logan tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tot   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 5;
	condition   = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent   = FALSE;
	description = "����� �����.";
};
FUNC INT DIA_Addon_Franco_tot_Condition()
{	
	if (MIS_HlpLogan != LOG_SUCCESS)
	&&  Npc_IsDead (Logan)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tot_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//����� �����.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//����! �� ��� ����� ������ ���������. ������, ����� ��� ��������.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//�� �����. �� � ��� ������ � ������ ������� ��������.
	
	if (MIS_HlpLogan == LOG_RUNNING)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};
//---------------------------------------------------------------------
//	Info Logan Success HAISUCCESS
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HaiSuccess   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 6;
	condition   = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent   = FALSE;
	description = "� ����� ������.";
};
FUNC INT DIA_Addon_Franco_HaiSuccess_Condition()
{	
	if (MIS_HlpLogan == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_HaiSuccess_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//� ����� ������.
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//�� �� �� �����.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//����, �� ������� �������� ����. �������������, �� �������... �� ������� ����, ��������, ��� ����������� ������� ������������.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"����� ������ ������ ��������� ������������ ��� ����, ����� ������� � ������.");
};

//---------------------------------------------------------------------
//	Mis 2 (Edgor)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Mis2 (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 7;
	condition   = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent   = FALSE;
	description = "������ � ���� ������ � ������?";
};
FUNC INT DIA_Addon_Franco_Mis2_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	|| (Npc_KnowsInfo (other, DIA_Addon_Franco_tot))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Mis2_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//������ � ���� ������ � ������?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//��������, ��� �����, ����� �� �������� ��� ���� ��� ���������.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//��������� ���� ����� � ������ �� ������ ������.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//�� ������ ��� ������ ��� ���� ������� �������� ��������. �� � ��� ��� ��� ����� �� �����.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//�����, ��� �� ������, � ������� ��� ��� ������� ��������!
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"������ ����� �������� ��������, ������� ������ ��� �������� ��� �����. ������ ��� ��� ������.");
	
	B_LogEntry (Topic_Addon_Franco,"������ �����, ����� � ����� ������.");
};

//---------------------------------------------------------------------
//	Info Logan While
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_While   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 8;
	condition   = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent   = FALSE;
	description = "� ��� ������ ������?";
};
FUNC INT DIA_Addon_Franco_While_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_HaiSuccess))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_While_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//� ��� ������ ������?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//���?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//��� � ������ �� ���� ������ �� ������?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//(����������) �, ���� ����� ������? �� �������! ������� �� ������? ��������� ����������? ���? � ��� ���� �������, ������� �� ������� ������...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//(������) �� ��� �� �����?! �� ���, ������ ������� �� ���� ������?!
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//������ ����� �������� � �����, ��� ���� �������! ����� �� � ������ � ������ �� ���������!
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info WOEDGOR
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_WOEDGOR   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 9;
	condition   = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent   = TRUE;
	description = "� ��� �� ��� ����� ����� ������?";
};
FUNC INT DIA_Addon_Franco_WOEDGOR_Condition()
{	
	if (MIS_HlpEdgor == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Addon_Stone_04 ) < 1)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_WOEDGOR_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //(��������) � ��� �� ��� ����� ����� ������?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //���� ������ ���� ��� �������?
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "� ������� ������� ����." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "����� ��� ������ ����." ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //����� ����� ���������. �� ��������� ����� ���-�� ���.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //�����, ��� ������� ��� �������� ������. �������, ������-�� �� ������� �����?
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //����� ��� ������ ����.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //��� �� ����, �������� � ������� �������. ��� �� ��������� �����.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //������ ��� ������ �� ���������� �������.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //� ������� ������� ����.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //������. ��� ������ �� ��������� ������. ����������� ������ ������, ����� ���������� �������.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};
//---------------------------------------------------------------------
//	Info tafel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tafel   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 10;
	condition   = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent   = FALSE;
	description = "��� ���� �������� ��������.";
};
FUNC INT DIA_Addon_Franco_tafel_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04 ) >= 1)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tafel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//��� ���� �������� ��������.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//����� ������. ����� ����� �������.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"� ������ ������ ��� �������� ��������.");
};

//---------------------------------------------------------------------
//	JemandAnderen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_JemandAnderen   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 11;
	condition   = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent   = FALSE;
	description = "�� ���, ������-�� ������� � ������ � ������?";
};
FUNC INT DIA_Addon_Franco_JemandAnderen_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_tafel))
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_JemandAnderen_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//�� ���, ������-�� ������� � ������ � ������?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//���, � ��� �������� ���� ������. �� ��� ����� ����� � ������.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//���, � ��� ������ � ������ ������� ��������.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//� ������ ���� � ������ �� �����.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//� ���� �� ������, ����� ������ ������ ����� ���, � ����� ������������ ������ ���� ����.
		
	B_LogEntry (Topic_Addon_Franco,"������ �� ������� ���� � ������. �����, �������� � ��� �����������...");
};

//---------------------------------------------------------------------
//	Info Fight
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Fight   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 12;
	condition   = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent   = TRUE;
	description = "���������� ������ ���� � ������!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //���������� ������ ���� � ������!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //� ���, ���� � ��������?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "�����, � �������..." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "����� �� �� ���� ���������." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //����� �� �� ���� ���������.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //�� ���, ��� ���������? �� ��������� ���? �������� ��������� ���� ����...
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //�����, � �������...
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //������ ���.
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info Fight2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Pig   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 13;
	condition   = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent   = TRUE;
	description = "������! � ���������� � �����!";
};
FUNC INT DIA_Addon_Franco_Pig_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Pig_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//������! � ���������� � �����!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//�� ��, ������ �������! �� ������ �������� ���? ���� �����!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




