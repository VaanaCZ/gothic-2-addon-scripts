// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //���-���, ��� �� ��� ������������ ������� �����?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //� ���� ����!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //������� ����� ����� � �������?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //����, �����?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(�����) ����, � �������� �� ���� �����������.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //�� ��� �������, ��� � ���-�� ��� ����� ���� ����...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //�� �������!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //�� ������ ��������, �������, �� ��� ����� ��.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //�� �� �������������, ��������. ��� ���� �� ���������� � ������� �������� �� �����.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "� ���� ��� ���� ������� �� ���������.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //� ���� ��� ���� ������� �� ���������.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(����������) ��, ������ ���� ������ ������������� ������������� � ������ ����.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //���, ������� ��� ��� �������. ������ � �����, ���� ��� ����.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "��� �� ������� �����?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //��� �� ����� �������?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //� ������ ��� �������� �� �������� � ������ ��� ����������� �����.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "� ����� ����� � ��������.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //� ����� ����� � ��������.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //������? ������! ������, ���-�� ����� �� ���.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //�� ��� ����� ������ ��� ��������� ���� �� ����� �������.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //�������, � ������ ��������� � ������� � ����������� � ���...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(��������) ���, �������, �� �������. � ����� ������, � ������ ��� ������.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			�berfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "�� ������ ������� ���� � �������?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //�� ������ ������� ���� � �������?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //���, ��������. ������ � ������ �� �������. ������� ��� ����� ������� ���� �����.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //�� ��������? �� �������� �������, ��������!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //� �� ��������� ��������� ����� ��������� ������� ������ ������, ��� ���� ���� �������������� �������� ���� ������� �� ��������!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //��������� ��� �������: ���!
	};
};

// ************************************************************
// 			 			Banditen + R�stung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "��� �� ��� ������ ���������� � ��������?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //��� �� ��� ������ ���������� � ��������?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //�������?! ��� �������� �� ���!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //��� �� �������, ������ �� ������ ��� ������?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //�� ���� �������� ���� ���� ��������.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //������� �� � ���� ���������. � ����� ����, ��������, ��� � ��� ������� ������, ��� ��� �� �����, ���� ��� ������!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //�� ������� ���� ��� ���� ������� ����� ����.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //�� ������ ������� ������. ������ � ��� �����!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //��� ���������?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //��� ������� �� ��������� �� ��������� ��������.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //������� � ����� � ���, ����� ������, ��� ��������� � ����� �������.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //�� ����� � ����� �� ������, ��� ���� ������ �� ����!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //�� ��� ��� �� ���. ��� ����� ������ � ����� - ����� ����� ������ �����.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //��� ���� �����, ������: ������� �� ����� ������ ��������.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //������� �������� �� �������, ��� �������� ��������, ��� ���.
	
	
};

// ------------------------------------------------------------
// 						Banditenr�stung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "��� ����� ������� ��������.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //��� ����� ������� ��������.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //�� ������ ����� �� ������? �� ����� � ���! 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //��� ������ ��� ������, ��� �� - �� ���� �� ���, ���� �����!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //�� �� ������, ��� � ���� ����� ���������� �������?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(��������) � ���� ������ ��� �� ����������, �����? �� ������. � ��� ��� �������� ����� ��������.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //��, ��������, �� ��� ��� ����� � ������ �����.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //����� ����, ����� ���� ��������, �� ������� ������ � ���� �������...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"���� ������, ��� ������� ��������� � ������ �����."); 
};

// ------------------------------------------------------------
// 						In Gregs H�tte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "�� ������ �������, ��� ������� � ������ �����?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //�� ������ �������, ��� ������� � ��� ������?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //��, ��, �� ��� ������!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //�� �� �� ����������� �������� � ����� �����?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //����� ���� ������, �� ������� ���� �� ������ �������� � �������� ��� ������ �� ������� ������.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"� �������� ���� ���� �� ������, �� ��� ��������� ������ � ��� �� �������."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					�ber Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "��� �� ��� ������ ������� � ��������?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //��� �� ������� � ��������?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //��� ��� ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //������� ��� ��������. ������� �� ������� �������� �� ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //�� ����� �� ����� �� ������������ ��� �������.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //���� ������ ������ ������, �������� � ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //� ���� ����������� � ��������� ������ �� ������ ������.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //��� � ������ ������ ��������, � ������� ������� �� ���� �� ��� �����������...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"� ������ ���������� � ��������. ��������, �� ������� ���."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "�� �����-������ ����� ������?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //�� �����-������ ����� ������?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //��, ������. ����� �� � ����� �������� � �����, �� ���������, ��� ����� ��������� ����� ����� � ����� �� ���.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //�� ��� �� ������ ������ ������ ��������� �����. (�������) �������, ��� ��� ����� �� ���� ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //� ��� � �����, ��� �� ������������� � ������, ������� ��� �� �����������.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //� ����, ��� �� ��������� ��� ������ �� ���������� �����, � ���� �������� ��������. 
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //������� ��� �����: �� ���������� � �������.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "�������� ��� �� ������ � �����.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //�������� ��� �� ������ � �����.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //����� � ���� ������ ���� ����������� � ��������� ���������� �� ������.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //� ��� � ����� ���� ��������� ������. ���, ��� ��� ����� � ��� ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //�����, ������� � ��� �����.  
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //�� ������� ����� �� ���������. ��-��������, ��� ������ � ���� ������������!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //������ � ���� ����������� �� ������, �� ����������� ��� �� ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //���� ��������� ��������. ��� � ������ � ������� ���� ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //� �� ��� �����, � ��������� ������������ ������ ��� ���� ��������.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //�������, ����� ������������. ������ ������ �� ���������. (��������) �� � ��� ��� � ����� ����...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(�������) �� ������� ����, 20 �������!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"������� �������� � ����� 20 ������� �����. �� ����� ������� ��.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"����� � ���� ������ ���� ����������� � ���������. � ��� ��� �� ����� �� �����.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"������ ������� � ����� ������ ����������.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "������ ������ � �����...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //������ ������ � �����...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //���?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //� �� �����.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //��� ������.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //�����... �������...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //��� �, ����� ����� ���� �������.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //���� �� ��� ����� �� ������, �������� �����.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //�� ���������� ������� ��� �������. �� ��� �����.
};

// ------------------------------------------------------------
// 			 			Kenne den M�rder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "� ����, ��� ���� ����� � ������.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //� ����, ��� ���� ����� � ������.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //������. �� ��� ��� ������. ����� ������ �������?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //����� ��� �� ������� ������� �� ������ ������.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //��� �� ���� ���� ����� ��������.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //���� �� ����������, ��� �� ����. ��� � ���� ������?!
	};
};

// ------------------------------------------------------------
// 							Grog zur�ck
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "�� ������ �����...";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //�� ������ �����...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "��� ���� 20 �������.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //� ���� ������� 20 �������, �����?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //��, ���� ������! ��� ��� ������.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //��� ���� 20 �������.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"���� ������� ���� 20 ������� ����� ����� � ������ ����� ��������.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //���? ��� ��� ��� ������?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //��-�...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //�����, � ������� �� ���.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //����� ����, � ���� �������� ���-������ ������������ ������?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //��-�... ���������... � ���� ���� ��� ��� ������.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //� ������� ��� � ����� � �����-�� ������� �������� ������ ���� ��� �����.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //������, ������� ��� ��������, ������, ��� ��� ���������. �� ����, ������ �� ���.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //���� ������, � ��� ���� ��� ������ �����?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "� ������ ������.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "��� ��� ������.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //� ������ ������.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //�����.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //� ������ ������.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //������.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "�� ������ ���-������ �������?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //�� ������ ��� ���-������ �������?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //���� �� ������ ���������, ��� � �������. �� �������� �� ���� ������.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "�� ������ ��� ������.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //�� ������ ��� ������.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //����� �������?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //��� ���� ������.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //����, �� ���� � ����� �����. ���������! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //���� ����� ����� � ����� ��� �����!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //� ������� ��������� ������!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "������ �� ����.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //������ �� ����.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //�������. ����� ������� �������� � ������...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //����!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "�� ��� ������ �� �����.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //�� ��� ������ �� �����.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //��� �, �� ������� �����������. ���� ���, �� ������ ����� ���� � ������.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //�� ����� ���������� ������!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //���� �� ����� ������, �� �� ��� �� �����������!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //���� �� ����� ������, �� �� ��� �� �����������!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //���� �� �������� ���� �����, �� ����������� �����, � �������.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //������!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //����! �������� ���� ������!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //������, �� �������� ���� �����������.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //���� ������, �� ����� ��������� ����� ���.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //������ �� ������ �� �������. 
	
	AI_StopProcessInfos (self); 
};


