///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //������, ���������� �����, ������, �� ������ �� ����.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //� ���� ����� �����-�� �������.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //�� ���� � ������, ������. ���, ��� ���� ����� - ��� ������� ������� ����.
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"��� �� ������� �����?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //��� �� ������� �����?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //����� � ��� ��� ������, � ���������� ������������� �� �����, � ������� ����� ������� �������.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //�� ����� ��� �����, � ���� �����, � � ��� ��� ������� ����������� ����� ��������.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //� ���� ��� ������ ��������. ������. �� ���� ������ ���� ���� ��� ������ �����.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //�� � ��� ����� ��� �� ��� � ���.
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //������?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //� ��� ���, ��� ��� ������� ��������� ��� ����, � �� ����������� ������� � ���� �����, ��� �� �������� �����. ��� ����� ������ ����.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //��� ����������� �� ������ ��������, ���������?
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //�� ������ ������� ��� �������� ������������� �����, � ����� ��� �������� �� ��� ����� ��� ���� �� ������. ������ ��� ���������� ����� ������� - ���� �� ���� �����.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //� �����, ��� ��������� �������, �� ������� ����� �� ������.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //��! ����� ������ ���� �����. �����, �� ������� ����, ��� �������� � ����� �����.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"������ ������� ���� ���� �� ����� ��������� �� ���� ����, ��� ��� ��� ������ �������."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"�� ����� ������� � ������?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //�� ����� ������� � ������?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //� ������ ������: ����� ��������� �����, ��������� ����� ��� ����.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //���� - ��� ������ � ���. ����� ��� �����������, � ��� ���������� �����.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //� ����� � ����� ����� ����������, ����� ��������� ���� �� �� ������.
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"�������� ��� �� ���� �����.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //�������� ��� �� ���� �����.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //���� �������� ������ �� ���, ��� ��� ������.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //����� ������ �� ��������, ����� ������������������ ������, ������� ���� ������ �� �������, � �������� ������ � ������. ����� �����, ������, ����� ������ �����.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"������ ������� ������ �� �������� ����?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"��� �� ������ � ���� ��� �������?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"��� ������ �� �� ������ ������?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //������ ������� ������ �� �������� ����?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //����� �������, ��� ����� ����� ����� ��������, ��� �������� �� ����� ����. ��� ��� ���� �������.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //������ ����, ��������� ������ ������ ������ ��������, ��� ����� �������� � ������.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //������ ��������� ��� ����� ������. � � ������ ����, ������ �� ���� �����, ��� ������ ��� ����� ������.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //��� �� ������ � ���� ��� �������?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //�������� �� ���, ��� �� ������� �������. ����������� �� ��� ���� �� �����, ��� ����� ������. ��� ������ � ������, ��� ���� ��� ��� �������� � ������� ���� ��������� ����� � �������.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //������ ����, ������� �� ��� ��������.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //��� ������ �� �� ������ ������?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //������� ����� �� ������� �� ������� ������� �������� ����� ����� ����.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //����������� ��������, ��� ������ ���� �� �� ��� �� �����, � ��� ��� ������ ����� ��������� �������.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //�? ��� �����?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //�����. ��� ������ � ����� ���������� ��� ������ ������ ������, � ��� ���� ������ �� ���� ��������� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"��������, ������� ��������� ���� ����, ������ ���.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //��������, ������� ��������� ���� ����, ������ ���.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //��� ������? �������-�� � ����� ����� ��������� � ����� ������.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //������ �� ���� � �����. ������ �� ������� ����������� ����������� ����� �� ����.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"��� �������� ���� ����.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //��� �������� ���� ����.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //�������. ��������� �� �������� ������, ������ ����������� ����� ����������� ���. �������� ���� ����� ��� ����.
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"�� �� �� ����� ����� ����� � ����?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //�� �� �� ����� ����� ����� � ����?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //� �� � �������� ����� ���� ������ ���� ������ �� ��, ����� ���-������ ����� ���� �� ������� �����, ���� �� ���������.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //�� ��� ������� �������� ����� ����� ���� ��� �� ���-�� �����, ��������. �� � � ���� ��, ��� ����� ����� ������������� �� ������?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "������. ��� � ������ ��� ������.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "� �������� � ����� ����� ������.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //� �������� � ����� ����� ������.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //���� ���� ������! ��� �� �������, ��������? �� �� �� ����������� ��������� ����������� ������� ������, �?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //��� �����?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(�������) ��� ����� ���-��! ��, ����. �� � �� ���� ��� ��� ����� � ������� ���� ����. ���. ��� �� ��� � ���� ������?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"����, ������ ������� ���� �� ������, ��� �� ����� ������� ���������. �� ������� � ������ ����� ����-������, ��� ���������� ��� ����."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "������. ��� � ������ ��� ������.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "� ��� ���� � ������� � ���� ����-������ ...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //� ��� ���� � ������� � ���� ����-������, ��� ����������� �� � ����� � ���� ����������?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //�������� ����, ��������. � � ���� ���� ���������� �����������.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //� ������, �������, ���� ����������� �� ����� ������. � ����� ��� ��������� � ���.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //� �� ����� �������� ���� ���� ���. � �����, �� ����� ����� �������� ��� �����.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //���, �������� � ���. ��������, ��� �������, � ���� ������ ���������� ������ ���.
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //������. ��� � ������ ��� ������.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"������ ������� ...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //������ �����.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //��. ������� �������. �� ��� ����� ������� ������.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //������ ����������� � ����� �����.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //� ��������, ��� �� ������� ���.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //� ���� ��� ��� �����?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //���������, ������ �� �� ����� ����� ����.
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"���� ���� ���������.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //���� ���� ���������.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //� �������� ���� �����, ��������, �� ��� ������� � �� ��� ��������� �������.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //� ������ �� ���� � ���������. �� ������ ����� �� ���� ��� �����������.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //� ������ ���, ��� ����� � ���� �����.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //� ������, ������ ��� ��� ������� � ���� �������. � ��, ������, ������, ���� �������������? � ���� � ����, � ���� ���� ������� �����?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //������� ���� � �����. � �� ��������� �� ��������.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //��, ��� �������.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"�������, ������. ������� ������!";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //�������, ������. ������� ������!

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //��� � ������ �������. � ������ ������ ��� ���� ������� �����.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //��� ����� �������� ��������. �� � ��� �� �������, ��� �� ��������� ���� ������ � �����������.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //� ���� ������������� ���� ���, ��� ���� �����? �� �� ������ ������������ ����� ������ ������, ��� �� ���-�� �����.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //���� �� ������, ��� � ���� ���� ��� �����������, ��� � ����������� ����� � �������� �������. ���� ���� ����� �����������.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //�������, ��������. � ��� ���� �� ����� ��� ������. ��� �� ������.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //�������, �� ������ �������������� �������, �� ����� ��� �� 5 �������, �������� ������ �� ������� � ������� ������� �����. � ��������� ������, ������ �� ����.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ��� ������?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //� ��� ������?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //� ���������. � ��� �� ����� �������� ����� � �������� ���� ����.
	
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















