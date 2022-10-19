// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_EXIT(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 999;
	condition	= DIA_Addon_Greg_EXIT_Condition;
	information	= DIA_Addon_Greg_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Greg_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Greg_PICKPOCKET (C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 900;
	condition	= DIA_Addon_Greg_PICKPOCKET_Condition;
	information	= DIA_Addon_Greg_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Addon_Greg_PICKPOCKET_Condition()
{
	C_Beklauen (111, 666);
};
 
FUNC VOID DIA_Addon_Greg_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
	
func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
// ************************************************************
// 			  			Hallo - (Greg Is Back)
// ************************************************************
INSTANCE DIA_Addon_Greg_ImNew(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 1;
	condition	= DIA_Addon_Greg_ImNew_Condition;
	information	= DIA_Addon_Greg_ImNew_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_ImNew_Info()
{	
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(���������) ��, ��! ��� �� ������� � ���� ������?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //�...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(� ������) ����� ������ �� ��������� ����, � ��� ��� ������ ���������� ������� ������������� � ���� ������.
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //������ �����, ��� ����� ����������?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //�������� ��� �� ��������! ������ ������ ����� �������, � ��� ������ � ������, ��� ��������� ������.
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(������) � ��� ���, ��� �� ������, �������?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(������) ���������� ����� � ���� ��������!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //� ��? ��� �� ������?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "���� �� ��� �����.", DIA_Addon_Greg_ImNew_nich );
	if (
			(Npc_IsDead(BeachLurker1))
			&& (Npc_IsDead(BeachLurker2))
			&& (Npc_IsDead(BeachLurker3))
			&& (Npc_IsDead(BeachWaran1))
			&& (Npc_IsDead(BeachWaran2))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (MIS_Addon_MorganLurker != 0 )
		)
		|| (C_TowerBanditsDead() == TRUE)
			{
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "� �������.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //� �� �����, ��� � �����, ��� �� ��� �������.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //� ��������� ������ �������� � ����� ��������� ����� ������� �����.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //�� �� �����������, �� ��� ��?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //� �������� ���� ���������� ��� �� ���������� ������.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //� ������ ����, ��� ������ ��������� ��-�������.
	};
	
	if (!Npc_IsDead (Francis))
	{
		Npc_ExchangeRoutine  (Francis,"GREGISBACK");
		AI_StartState (Francis, ZS_Saw, 1, "ADW_PIRATECAMP_BEACH_19"); //HACK - REDUNDANT!!!
		Francis_ausgeschissen = TRUE;
	};
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
};
// --------------------------------------------------------------------
func void DIA_Addon_Greg_ImNew_nich ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //���� �� ��� �����.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //�������. � ���-������ ������� ����, �������.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //� �������.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //������? � ���?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //� ���������� � ��������� �� �����.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //�� ��������� � ������ ������ ��� ����� ������.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //�� ��� �. �������, ������� ������.
	
	B_UseRakeBilanz ();
};

// ************************************************************
// 			  				JoinPirates
// ************************************************************
INSTANCE DIA_Addon_Greg_JoinPirates(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_JoinPirates_Condition;
	information	= DIA_Addon_Greg_JoinPirates_Info;
	permanent	= FALSE;
	description = "��� ����� �������?";
};                       
FUNC INT DIA_Addon_Greg_JoinPirates_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //��� ����� �������?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //������ ����� ���������� ����������� � ������ �����.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //��� ������� ������ ������ ����� ������ ���������.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //� �� ��������� ������� ������� � �������� ������ �� ���� ��������� ������.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"���� �����, ����� � ���� �� ���� ������ ������� � ������� ������ �� ������.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"� ����� ������ ��� ����.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"� ���, ������ ������ ��� � ��������?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"��� ��� �� �����?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //� ����� ������ ��� ����.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //� ��� ���-���. ������ �� ���� �� ���.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //������� ������� ����� ���� ���������� ������ ��������.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //���, ������ ���. �������, ���� ��� ���������� �������� �����.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //� �� ������, ������ ���������� �� ����!
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //� ���, ������ ������ ��� � ��������?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //������ ��������� � ����� ������.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //����� ������������ ���� ��������.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"���� ������, ��� � ���� ����� � ����� ���������� �����.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //��� ��� �� �����?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //���������� � ������� ��� ����� ����������� � ������ ������.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //� �� ��������� �����, ���� ��� ������ ����-������ �� ���� �����.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"��������� � ������ �� �����������.");
};

// ************************************************************
// 			  				Wegen dem Canyon...
// ************************************************************
INSTANCE DIA_Addon_Greg_AboutCanyon(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_AboutCanyon_Condition;
	information	= DIA_Addon_Greg_AboutCanyon_Info;
	permanent	= TRUE;
	description = "������ �������...";
};                       
FUNC INT DIA_Addon_Greg_AboutCanyon_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //������ �������...
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //��, ��� ���?
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"��� ���-������ ����� ������?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"� ��� ��� �� �����, ������� � ������ �����?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"� ��������� ���� �����������.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //��� ���-������ ����� ������?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //������� � ����� ���� �����.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //��� ��� ����� ��������� ��� ����.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //� ��� ��� �� �����, ������� � ������ �����?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //�������� �� �����������! ������ �������� ��������.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //� ��������� ���� �����������.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //������. ������, �� ���� ���� ������.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"���� ��� ���������, ����� � ������� ���, ��� ���� ���� ����������� � �������.");
	
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP (XP_ADDON_CLEARCANYON);
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};


// ************************************************************
// 			  				BanditArmor
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditArmor(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditArmor_Condition;
	information	= DIA_Addon_Greg_BanditArmor_Info;
	permanent	= TRUE;
	description = "��� ����� ���������� �������.";
};                       
FUNC INT DIA_Addon_Greg_BanditArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditArmor_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //��� ����� ���������� �������.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //������� ������, �� ��� �� ��������. ����� ����� ���������.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //������� �� ������ ����� ���� �����������!
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"���� �����, ����� � ����� ��� ������� ������� � ������. ����� ����� � ����� ���������� � ��� � ��������."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //� �� �������!
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //������� �� ��������� ������ ��� �����. ��� ���� � ��������������� ��� �������.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //��, ���� �����, ��� ���� ������ ������ �������� ���� �����������.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //��������, � ���� ���� ��������� ��������� ������ �����.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //�������� � �������, ����� �� ��� ���� �����. ����� ������� �� � ����������� � ������ ��������.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //� ���� ������, ������ ��� ������� ���������� � ���� ������.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //����� �������, �������!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"����� ���� ��� � �������, � ����� ������� ������� � ������."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"� ������ ������, ��� ���� ������� ������ � ������, � �������� �����.");
	
		MIS_Greg_ScoutBandits = LOG_RUNNING;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auftraege2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Auftraege2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Auftraege2_Condition;
	information	 = 	DIA_Addon_Greg_Auftraege2_Info;

	description	 = 	"���� ��� ���� ��� ������?";
};

func int DIA_Addon_Greg_Auftraege2_Condition ()
{
	if (MIS_Greg_ScoutBandits != 0)
	&& (
		(C_TowerBanditsDead() == FALSE)
		|| (
				 (Npc_IsDead(BeachLurker1)== FALSE)
				&& (Npc_IsDead(BeachLurker2)== FALSE)
				&& (Npc_IsDead(BeachLurker3)== FALSE)
				&& (Npc_IsDead(BeachWaran1)== FALSE)
				&& (Npc_IsDead(BeachWaran2)== FALSE)
				&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
		   )
		)
				{
					return TRUE;
				};
};

func void DIA_Addon_Greg_Auftraege2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //���� ��� ���� ��� ������?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //�������� ��������� ��� ��� �������� �����.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //������, ������ ������ �� ������.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"���� �����, ����� � ������� ������� ��������� ����.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //� ����� ����� ��� ��� ���� �������.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //������� ������ ��� ��� ����� � ���� �����������, �� ������ �� ������.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"���� �������� ���� ����������� � ���������, ��������� ����� � ��� �� ������.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //�����, �� ������ ���� ��������.
};

///////////////////////////////////////////////////////////////////////
//	Info Sauber2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Sauber2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Sauber2_Condition;
	information	 = 	DIA_Addon_Greg_Sauber2_Info;

	description	 = 	"�� �������� ����� ������ ���������.";
};

func int DIA_Addon_Greg_Sauber2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_Sauber2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //�� �������� ��������� ������ ���������.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //�������. ����� ���� �������.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"� ������� �����, ��� ���� �� ������ ������ �� ��������.");
	
	MIS_Addon_MorganLurker = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);	
};

///////////////////////////////////////////////////////////////////////
//	Info BanditPlatt2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_BanditPlatt2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_BanditPlatt2_Condition;
	information	 = 	DIA_Addon_Greg_BanditPlatt2_Info;

	description	 = 	"������� � ����� ����������.";
};

func int DIA_Addon_Greg_BanditPlatt2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (C_TowerBanditsDead() == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //������� � ����� ����������.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //���������. ������� ������. ��� ���� �������.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"������� �� ����� ������. ���� ����� �������.");
	
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);	
};



// ************************************************************
// 			  				BanditGoldmine
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditGoldmine(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditGoldmine_Condition;
	information	= DIA_Addon_Greg_BanditGoldmine_Info;
	permanent	= TRUE;
	description = "������� ����� ����� � �������.";
};                       
FUNC INT DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if (SC_KnowsRavensGoldmine == TRUE)
	&& (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditGoldmine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //������� ����� ����� � �������.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //� ��� � ����! ��� ������ ��� ���������� ����.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //����� �� ������� ���� � ���� ����.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //������� ������. ���, �����, � ���� ��� ���� �������.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"� ��������� ����� � ������� �����.");	
	
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Greg_ScoutBandits);
};


// ************************************************************
// 			Wer bist du			  				
// ************************************************************
INSTANCE DIA_Addon_Greg_WhoAreYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 2;
	condition	= DIA_Addon_Greg_WhoAreYou_Condition;
	information	= DIA_Addon_Greg_WhoAreYou_Info;
	permanent	= FALSE;
	description = "��� ��?";
};                       
FUNC INT DIA_Addon_Greg_WhoAreYou_Condition()
{
	if (PlayerTalkedToGregNW == FALSE)//Joly:WAR VOHER npc_gLOBAL -> GREG_NW
	&& (SC_MeetsGregTime == 0)//Joly:zur sicherheit
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //��� ��?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //� ����, ������������ ���� ������� �����.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //���� ���������� ����� �����?
};

// ************************************************************
// 			  	NiceToSeeYou			
// ************************************************************
INSTANCE DIA_Addon_Greg_NiceToSeeYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_NiceToSeeYou_Condition;
	information	= DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent	= FALSE;
	description = "� ��� �� ���� �����?";
};                       
FUNC INT DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if (PlayerTalkedToGregNW	 == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_NiceToSeeYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //� ��� �� ���� �����?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //�� ������ ������� ���� �����, ��?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //����� ����� ��������� ����� ��� i. � ����, � ��� ��� ������.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //���� ���������� ����� �����?
};
	
// ************************************************************
// 			  	Story			
// ************************************************************
INSTANCE DIA_Addon_Greg_Story(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 99;
	condition	= DIA_Addon_Greg_Story_Condition;
	information	= DIA_Addon_Greg_Story_Info;
	permanent	= TRUE;
	description = "� ����� �� ����� ��� ���-���.";
};                       
FUNC INT DIA_Addon_Greg_Story_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Addon_Greg_WhoAreYou) == TRUE)
	|| (Npc_KnowsInfo (other,DIA_Addon_Greg_NiceToSeeYou) == TRUE))
	&& (MIS_Greg_ScoutBandits != 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_Story_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //� ����� �� ����� ��� ���-���.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //��� ������?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"��� �� ���� �����?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"� ��� ���� �������?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"��� �� ������ � ������?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //��� �� ���� �����?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //� ��������� ���� � ������� ����� ������� ��������, ������� �������� ��������� �����.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //��� ������� ��������� ������������� ���� ���� �������.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //������� � ������ ��� ����� �� ������� ����� � ����� ���������, ��� ��� ����� ����������.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //��������� ��� ���������, ����� � �������� � ���� �������� ������.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //� ��� ��������� ��� ��� � ��� ������, ����� � ��� �����, ��� ���� ������� ����� ��� �������� ���������� �� ���������.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //� ��� ���� �������?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //(� ���������) � ��������� ��������� �������. ��� ��������� ������� ���� �� ���������� �������. 
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //��������� �������! � ������ �������, ������� ��� ����� ����� �����������, ����������� ������ ��������, ������������� ������.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //�� ��� ������ ����� ����������.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //�� ��, �� ������� ����.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //��� ������. ��� ��� �� �������� ���. � ������������, ��� �������� �� ������. 
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //��� �� ������ � ������?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //�� �������� �����. �������� ������� ����� � �������.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //� �� ���� �� ��������� �������������, ��� �� ����� ���� ������ � ������ ���� ��� ��� ������� �� ���.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //�� �� ���� ���-�� ���������. ��-�� �� ����� �� ����� ������������ � �������� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_RavenDead		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Greg_RavenDead_Condition;
	information	 = 	DIA_Addon_Greg_RavenDead_Info;

	description	 = 	"� ������� ���������...";
};

func int DIA_Addon_Greg_RavenDead_Condition ()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //� ������� ���������...
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //���� ����... �� ������ � �����... ������ ��� ��������, ��?
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //��, �� ��� ������, ��� ����� ������� ������� �����.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //� �� ������. ��������� � ��� �� ����.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



