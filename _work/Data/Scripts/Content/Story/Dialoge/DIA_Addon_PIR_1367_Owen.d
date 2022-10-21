// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Owen_EXIT(C_INFO)
{
	npc			= PIR_1367_Addon_Owen;
	nr			= 999;
	condition	= DIA_Addon_Owen_EXIT_Condition;
	information	= DIA_Addon_Owen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Owen_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Owen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Owen_PICKPOCKET (C_INFO)
{
	npc			= PIR_1367_Addon_Owen;
	nr			= 900;
	condition	= DIA_Addon_Owen_PICKPOCKET_Condition;
	information	= DIA_Addon_Owen_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Owen_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Addon_Owen_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Owen_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Owen_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Owen_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Owen_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Owen_PICKPOCKET_DoIt);
};

func void DIA_Addon_Owen_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Owen_PICKPOCKET);
};
	
func void DIA_Addon_Owen_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Owen_PICKPOCKET);
};
// ************************************************************
// 			  				 Hallo 
// ************************************************************
instance DIA_Addon_Owen_Hello		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 1;
	condition	= DIA_Addon_Owen_Hello_Condition;
	information	= DIA_Addon_Owen_Hello_Info;

	important 	= TRUE;
};
func int DIA_Addon_Owen_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_Hello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_00"); //��� ����?
	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_01"); //� �� ��� �����? ���� �� ��������?
	AI_Output	(other, self, "DIA_Addon_Owen_Hello_15_02"); //� ���, �����?

	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ItAr_Pir_M_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_L_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ItAr_Pir_H_Addon) == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_03"); //���� �� ��� ��, ��� � ��, �� � ���� �� ����.
	}
	else if ((Hlp_IsItem(itm, ItAr_BDT_M) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_BDT_H) == TRUE))
	
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_04"); //������ ������, ��.
	}
	else
	{
	 	AI_Output	(self, other, "DIA_Addon_Owen_Hello_13_05"); //���. ���� �� ����� ������, �� ��������.
	};
};

// ************************************************************
// 			  		 Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_Owen_WasMachen		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 2;
	condition	= DIA_Addon_Owen_WasMachen_Condition;
	information	= DIA_Addon_Owen_WasMachen_Info;

	description	= "��� �� ������� �����?";
};
func int DIA_Addon_Owen_WasMachen_Condition ()
{
	if (Malcom_Accident == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_WasMachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_WasMachen_15_00"); //��� �� ����� �������?
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_01"); //����� ������� ��� ������ ������.
	AI_Output	(self, other, "DIA_Addon_Owen_WasMachen_13_02"); //� ����� ������� ��� ���������, ��� �����, � ��� ��� � ������ �������� �� ��������.
};

// ************************************************************
//								PERM
// ************************************************************
instance DIA_Addon_Owen_Perm		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 99;
	condition	= DIA_Addon_Owen_Perm_Condition;
	information	= DIA_Addon_Owen_Perm_Info;
	permanent	= TRUE;
	description	= "�?";
};
func int DIA_Addon_Owen_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Owen_WasMachen))
	|| (Npc_KnowsInfo (other, DIA_Addon_Owen_MalcomStunt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_Perm_15_00"); //�?
	AI_Output	(self, other, "DIA_Addon_Owen_Perm_13_01"); //���� �� � ����, ��� ��� ����� ������ ���, � �� �� �� ��� �� ���� �������.
};

// ************************************************************
// 						Henrys Holzlieferung
// ************************************************************
instance DIA_Addon_Owen_Henry		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 3;
	condition	= DIA_Addon_Owen_Henry_Condition;
	information	= DIA_Addon_Owen_Henry_Info;
	permanent	= TRUE;
	description	= "����� ����� ������.";
};
func int DIA_Addon_Owen_Henry_Condition ()
{
	if (MIS_Henry_HolOwen == LOG_RUNNING)
	&& (Owen_ComesToHenry == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_Henry_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_Henry_15_00"); //����� ����� ������.

	if (MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_01"); //������� � ������ ��������, ��� ��������� � ���� ������ ���������.
	
			
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_02"); //����������. ������� �� ���� ��� ������ ���� ������.
		AI_Output	(self, other, "DIA_Addon_Owen_Henry_13_03"); //��� ��� � �������.
		
		B_LogEntry (TOPIC_Addon_HolOwen,"� ������ �������� �����, ��� ���� �������� ������.");
		
		AI_StopProcessInfos (self);
		Owen_ComesToHenry = TRUE;
	};
};



// ************************************************************
// ***														***
// 							Malcom Accident
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 						Malcom im Loch
// ------------------------------------------------------------
instance DIA_Addon_Owen_MalcomStunt		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 1;
	condition	= DIA_Addon_Owen_MalcomStunt_Condition;
	information	= DIA_Addon_Owen_MalcomStunt_Info;

	description	= "��� ����?";
};
func int DIA_Addon_Owen_MalcomStunt_Condition ()
{
	if (Malcom_Accident == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_MalcomStunt_Info ()
{
	AI_Output (other, self, "DIA_Addon_Owen_MalcomStunt_15_00"); //��� ����?
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_01"); //��� �������� ������� ������.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_02"); //�� ��� ����� ���� �� ���� ��������.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_03"); //�� ������� � ��� ������.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_04"); //�� ������ ���������� �� ����.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_05"); //������� ����� � ��� ���������, � ����� ��� ��� ����� � �� ���.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_06"); //������, ��� �� ��� ����.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_07"); //� ������, ��� ����� ������� ������� � ��������. � ����� ��� ������.
	AI_Output (self, other, "DIA_Addon_Owen_MalcomStunt_13_08"); //�� ����, ��� �� ��� �������.
	
	Log_CreateTopic (TOPIC_Addon_MalcomsStunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_MalcomsStunt,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"���� ����� ������, ��� ��������� � ��� ������ ���������, ������� ���� � �������� ��� ����� ����, ��� ��������� � ��������.");
	Log_AddEntry	(TOPIC_Addon_MalcomsStunt,"���� ������ ���, ��� �� ��� ��� ����, � ������� ������� ���� ������� ��� ���. �� ����� ��������� ����� ��� � ��� ����.");
	
	MIS_Owen_FindMalcom = LOG_RUNNING;
};

// ------------------------------------------------------------
// 					Wie komme ich da runter?
// ------------------------------------------------------------
instance DIA_Addon_Owen_runter		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 2;
	condition	= DIA_Addon_Owen_runter_Condition;
	information	= DIA_Addon_Owen_runter_Info;

	description	= "��� ����� ���������� �� ��� ���?";
};
func int DIA_Addon_Owen_runter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Owen_MalcomStunt))
	&& (MIS_Owen_FindMalcom == LOG_RUNNING)
	&& (Npc_HasItems (Malcom, ItWr_TwoHStonePlate3_Addon) > 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_runter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_runter_15_00"); //��� ����� ���������� �� ��� ���?
	AI_Output	(self, other, "DIA_Addon_Owen_runter_13_01"); //������� �� ����. ���������� �� ������� ��� ���������, ��������.
};

// ------------------------------------------------------------
// 						Malcom gefunden
// ------------------------------------------------------------
instance DIA_Addon_Owen_MalcomDead		(C_INFO)
{
	npc		 	= PIR_1367_Addon_Owen;
	nr		 	= 3;
	condition	= DIA_Addon_Owen_MalcomDead_Condition;
	information	= DIA_Addon_Owen_MalcomDead_Info;

	description	= "���� �������� ������� �����.";
};
func int DIA_Addon_Owen_MalcomDead_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Owen_MalcomStunt))
	&& (MIS_Owen_FindMalcom == LOG_RUNNING)
	&& (Npc_HasItems (Malcom, ItWr_TwoHStonePlate3_Addon) == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Owen_MalcomDead_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Owen_MalcomDead_15_00"); //���� �������� ������� �����.
	AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_01"); //� ��� � ����. �������. � ������ ��� ��� ������.
	if (SC_MadeStunt == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_02"); //� �� �������.
		AI_Output	(self, other, "DIA_Addon_Owen_MalcomDead_13_03"); //� �� �� �� ��� �� ���� ���������� � ��� ���.
	};
	
	B_LogEntry	(TOPIC_Addon_MalcomsStunt,"� ��������� ����� � ������ ��������. �� ��������� ������� �������� ��������.");
	
	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Owen_MalcomDead);
};
