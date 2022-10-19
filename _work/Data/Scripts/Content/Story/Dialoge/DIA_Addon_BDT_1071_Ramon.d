// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //��, ��� ��� ���������?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //� �������� ������.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //��� ���? ������ ��� ������ ���� ������ - ���������� ���� ������� ��������� ���� ������.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //��, � ����� �� ��� ����, ����� ��������� � ����������. ��� ���� ������� � ������.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //������ �� ����. �� ���� ������ - ������ �� �������, ��� ����� ���� ������.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //���� � �������, �� � �����, ��� ������ ���������.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //� � �����, ��� ��������� ����� �.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(�������) ��� �� ��� ������. �� ������ �� �������, ��� ��� ����� �� ������.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //����� ����� ������� ������ ��������� ���������, ����� ��� ����������� ����� ��� ����.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(�������) �� �� ���������, �����? �� �����, ����� ����� ����.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //����� ����������� � ���, ����� �������� �� �������� ��� ���������.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //���� �� �����? � �� ������ ����� �����.
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //��, ���� ���� �����? �� ���� ����������, ��� � ���� ���� ���������� �� ������ � ������.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //���� ������ ������. �� ����� ������, �� ����� �� ���-������ � ������.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //��, �����. ����� ��� ���� ������ ��� ����.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //���� ����� ���������� � ���������.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //��� ����� �������?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //�������� ������� ������. �� ����������, ��� ������ � �����.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //��� ��� ����� ������, ��� ������ ����� ����� �������. �����?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"������ ����� ��� ���� �������. ��� ����� �������������� ������.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"�����? ��� �����?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"�����? ������� ��� ���� ������...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //��, ����������. �� ���� �� ��������, ��� ��� ����������!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //�����? ��� �����?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //��. ��� �����. ���, ��� ��������� ����� �����.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //���, ��� ������, ����� ����� ������� ������ � ������ � �������� � ������.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //�����, �� ������ �������, ��� �� � ������ ��� ������ � �������?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //��... ��...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //��������, ��� ����� ������.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //� ��� ������, ��� �� �� �������� ������ - � � ���� �� ����� ��� ��������!
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //�����? ������� ��� ���� ������...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //�, ������, �� ��� �� ������? �� ��� ����������� ������ � ������ ������.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //��� �������� ����� ��������.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //�� �������� ����� ����� � ������, ����� ������� ������ ������� � ������.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //���� �� ��������� ���������� �����, �� � ��� �������������.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //��������� ��� ����� ����� ���������!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //��������� ���� ���������� ����������...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "� ��� ����� �������.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //� ��� ����� �������.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //��, �� ������� ���� ��������. ��� ����� ������ ������, ��� �� ��� ������ � ������.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "������ ������ ����...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //������ ������ ����...
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //��-�. ����������, � �� �� � ��������� ���� �����...
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "�������� ��� ���������?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //�������� ��� ���������?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //����� ��� � �������, ���� � ������ �� ���������� ������ ���-������, ���� �� ��������.
	
	AI_StopProcessInfos (self);
};


