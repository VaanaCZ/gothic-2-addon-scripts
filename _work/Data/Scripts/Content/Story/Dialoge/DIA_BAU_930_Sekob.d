// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Sekob_EXIT (C_INFO)
{
	npc         = BAU_930_Sekob;
	nr          = 999;
	condition   = DIA_Sekob_EXIT_Condition;
	information = DIA_Sekob_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sekob_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sekob_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Sekob_HALLO (C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 3;
	condition	= DIA_Sekob_HALLO_Condition;
	information	= DIA_Sekob_HALLO_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Sekob_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Sekob_HALLO_01_00"); //��� �� ������� �� ���� �����? ����� ������ �������. ����������.
	AI_Output (other, self, "DIA_Sekob_HALLO_15_01"); //������� � ���� ��������� ������ ��� �� ������ �����, ������� ������ �� �����������?
	AI_Output (self, other, "DIA_Sekob_HALLO_01_02"); //� �� ������� �����, �����, ��������, �����-������ � �� ������� ������� ����� ����� ����� ��������������. �� �� ��� ����, ���� ����, ��� ������� ���-������ � ������ �����.
};

// ************************************************************
// 			  					PermVorMis 
// ************************************************************
instance DIA_Sekob_PermVorMis (C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 3;
	condition	= DIA_Sekob_PermVorMis_Condition;
	information	= DIA_Sekob_PermVorMis_Info;
	permanent	= TRUE;
	description	= "��������...";
};

func int DIA_Sekob_PermVorMis_Condition ()
{
	if (Kapitel < 3)
	&& (MIS_Torlof_HolPachtVonSekob == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info ()
{
	AI_Output (other, self, "DIA_Sekob_PermVorMis_15_00"); //��������...
	AI_Output (self, other, "DIA_Sekob_PermVorMis_01_01"); //� ���� ������ ��� ��� ���� ������� ������. �����!
};

// ************************************************************
// 			  				ZAHL PACHT 
// ************************************************************
instance DIA_Sekob_ZAHLPACHT		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_ZAHLPACHT_Condition;
	information	= DIA_Sekob_ZAHLPACHT_Info;
	permanent	= FALSE;
	description	= "���� �����, ����� ��, �������, �������� �����.";
};

func int DIA_Sekob_ZAHLPACHT_Condition ()
{
	if (MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info ()
{
	AI_Output (other, self, "DIA_Sekob_ZAHLPACHT_15_00"); //��� ����� ����������� �������� ��������������. �� ����� ����� ���� ���������. ���� �����, ����� ��, �������, �������� �����. �� ������ ��� ������� ��� ��� ��������� ������ �����.
	AI_Output (self, other, "DIA_Sekob_ZAHLPACHT_01_01"); //���? � �� ������ ������� ����� ����? �� �� ��� �� ������ � ���!
	AI_Output (self, other, "DIA_Sekob_ZAHLPACHT_01_02"); //�������� ������, ���� � �� ����� �� ����.
	
	self.aivar[AIV_DefeatedByPlayer] = FALSE; //WICHTIG
};

// ************************************************************
// 			  				Kohle Raus (not defeated)
// ************************************************************
instance DIA_Sekob_KohleRaus		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_KohleRaus_Condition;
	information	= DIA_Sekob_KohleRaus_Info;
	permanent	= TRUE;
	description	= "����� ���� ������, ��� � ����� ���� ��������� ����.";
};

func int DIA_Sekob_KohleRaus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info ()
{
	AI_Output (other, self, "DIA_Sekob_KohleRaus_15_00"); //����� ���� ������, ��� � ����� ���� ��������� ����.
	AI_Output (self, other, "DIA_Sekob_KohleRaus_01_01"); //�� �� �������� �� ����� �� ����� ��������, ����������. ������ �� ��!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
};

// ************************************************************
// 			  				InformOnar
// ************************************************************
instance DIA_Sekob_InformOnar		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_InformOnar_Condition;
	information	= DIA_Sekob_InformOnar_Info;
	permanent	= FALSE;
	description	= "����� ��� �������� �������� �� ���� �����.";
};

func int DIA_Sekob_InformOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info ()
{
	AI_Output (other, self, "DIA_Sekob_InformOnar_15_00"); //����� ��� �������� �������� �� ���� �����.
	AI_Output (self, other, "DIA_Sekob_InformOnar_01_01"); //���� ��� �� �������! ������ ������� �����, ��� � ���� ������ ���. ��� ��������� ������.
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

	
// ************************************************************
// 			  				Defeated (Kohle Raus II)
// ************************************************************
instance DIA_Sekob_Defeated		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_Defeated_Condition;
	information	= DIA_Sekob_Defeated_Info;
	permanent	= FALSE;
	description	= "��� �� ������� ������?!";
};

func int DIA_Sekob_Defeated_Condition ()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE) 
	&& (Npc_KnowsInfo (other, DIA_Sekob_ZAHLPACHT))
	&& (Sekob_Pachtbezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info ()
{
	AI_Output (other, self, "DIA_Sekob_Defeated_15_00"); //��� �� ������� ������?!
	AI_Output (self, other, "DIA_Sekob_Defeated_01_01"); //�� ��� ���� ������, ����������. � ������ ���, ��� �� �������.
	AI_Output (other, self, "DIA_Sekob_Defeated_15_02"); //������� �����.
	AI_Output (self, other, "DIA_Sekob_Defeated_01_03"); //(�����) ��, ��������, � ���� ������ ���. � ������� ������, � ��� ����� �� ������.
	AI_Output (self, other, "DIA_Sekob_Defeated_01_04"); //��� ��������� ������ ��������� ����� �� ������. � ���� ��������� �����, �� ��� ������ �����. ��� ����� ����.

	Info_ClearChoices	(DIA_Sekob_Defeated);
	Info_AddChoice	(DIA_Sekob_Defeated, "������� �����, ��� � ���� ����.", DIA_Sekob_Defeated_hart);
	Info_AddChoice	(DIA_Sekob_Defeated, "������, � �������� � ������.", DIA_Sekob_Defeated_weich);
};

func void DIA_Sekob_Defeated_Weich()
{
	AI_Output (other, self, "DIA_Sekob_Defeated_weich_15_00"); //������, � �������� � ������.
	AI_Output (self, other, "DIA_Sekob_Defeated_weich_01_01"); //�������, ��������. �������� �������!
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;
	
	AI_StopProcessInfos (self);
};

			func void B_Sekob_Kassieren()
			{
				AI_Output (other, self, "DIA_Sekob_Kassieren_15_00"); //������ ����� ����. ����� ��� ����� �� ����������, � ���� ������� ������� �� �����. ������� �����, ��� � ���� ����.
				AI_Output (self, other, "DIA_Sekob_Kassieren_01_01"); //(��������������) ���, ����������, ���, ������ ������. � ���� �������� ������, ���� �� �������� ���� � �����.
				B_GiveInvItems (self, other, ItMi_Gold, 60);
				AI_Output (other, self, "DIA_Sekob_Kassieren_15_02"); //��� ������, ��� ���� �� ��� �� � ������.
				AI_Output (self ,other, "DIA_Sekob_Kassieren_01_03"); //(� ��������) � �������.
				Sekob_Pachtbezahlt = TRUE;
			
				AI_StopProcessInfos (self);	
			};

func void DIA_Sekob_Defeated_hart()
{
	B_Sekob_Kassieren();
};


// ************************************************************
// 			  				Again (und nach Onar)
// ************************************************************
instance DIA_Sekob_Again		(C_INFO)
{
	npc		 	= BAU_930_Sekob;
	nr		 	= 5;
	condition	= DIA_Sekob_Again_Condition;
	information	= DIA_Sekob_Again_Info;
	permanent	= TRUE;
	description	= "������ �����...";
};

func int DIA_Sekob_Again_Condition ()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Sekob_Defeated))
	&& (Sekob_Pachtbezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info ()
{
	AI_Output (other, self, "DIA_Sekob_Again_15_00"); //������ �����...
	AI_Output (self, other, "DIA_Sekob_Again_01_01"); //�� ���������� � ������, ������?
	
	Info_ClearChoices	(DIA_Sekob_Again);
	Info_AddChoice	(DIA_Sekob_Again, "� ���������.", DIA_Sekob_Again_Nein);
	
	if (Onar_WegenSekob == TRUE)
	{
		Info_AddChoice	(DIA_Sekob_Again, "� ���������...", DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice	(DIA_Sekob_Again, "�������.", DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein()
{
	AI_Output (other, self, "DIA_Sekob_Again_Nein_15_00"); //� ���������.
	B_Sekob_Kassieren();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output (other, self, "DIA_Sekob_Again_Ja_15_00"); //�������.
	AI_Output (self ,other, "DIA_Sekob_Again_Ja_01_01"); //� ���� ���������.
	
	AI_StopProcessInfos (self);
};
	
func void DIA_Sekob_Again_verarscht()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_00"); //� ���������...
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_01"); //�? ��� �� ������?
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_02"); //������, �� ������ ��� �������� �������� ���� ������.
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_03"); //�� ���? ��� � ������ ������?
	AI_Output (other, self, "DIA_Sekob_Again_verarscht_15_04"); //�� ������� �������� ����.
	AI_Output (self, other, "DIA_Sekob_Again_verarscht_01_05"); //� ������ ������ - ������!
	B_Sekob_Kassieren();
};

// ************************************************************
// 			  			Perm Kap 1
// ************************************************************
instance DIA_Sekob_PERMKAP1		(C_INFO)
{
	npc		 	 = 	BAU_930_Sekob;
	nr		     = 	6;
	condition	 = 	DIA_Sekob_PERMKAP1_Condition;
	information	 = 	DIA_Sekob_PERMKAP1_Info;
	permanent	 =  TRUE;
	description	 = 	"� ��������� ��� �� ��������� �������, �������?";
};

func int DIA_Sekob_PERMKAP1_Condition ()
{
	if (Sekob_Pachtbezahlt == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info ()
{
	AI_Output (other, self, "DIA_Sekob_PERMKAP1_15_00"); //� ��������� ��� �� ��������� �������, �������?
	AI_Output (self, other, "DIA_Sekob_PERMKAP1_01_01"); //(���� ��� ���) ��� � ������, ����� ��������� �����...
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Sekob_KAP3_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP3_EXIT_Condition;
	information	= DIA_Sekob_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMt
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMT		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	30;
	condition	 = 	DIA_Sekob_DMT_Condition;
	information	 = 	DIA_Sekob_DMT_Info;

	description	 = 	"���-������ ���������?";
};

func int DIA_Sekob_DMT_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_DMT_15_00"); //���-������ ���������?
	AI_Output			(self, other, "DIA_Sekob_DMT_01_01"); //�� ������ ������ ���. ��� ��� ������ ���� � ������ �����.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output	(self, other, "DIA_Sekob_DMT_01_02"); //��, ����� ������, ���� ������ ���������� � ���������, ������?
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Sekob_DMT_01_03"); //� ����, ��� ��, ��������, �� ����������� ��������������������, �� � ������� ����.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Sekob_DMT_01_04"); //�� ������ ������ ���, �, ������� ���.
		};

	AI_Output			(self, other, "DIA_Sekob_DMT_01_05"); //��� ���� �������, ��� ����-�� ����. �� ������ � ���� ����?!
	AI_Output			(self, other, "DIA_Sekob_DMT_01_06"); //����������, ������ ���. ������� �� ��������.

	Log_CreateTopic (TOPIC_SekobDMT, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT, LOG_RUNNING);
	B_LogEntry (TOPIC_SekobDMT,"������ ���� ������� ������ �� ����. ����� �����, ����� � ������ ��."); 
};

///////////////////////////////////////////////////////////////////////
//	Info DMTWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMTWEG		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	31;
	condition	 = 	DIA_Sekob_DMTWEG_Condition;
	information	 = 	DIA_Sekob_DMTWEG_Info;

	description	 = 	"���� ��� ����.";
};

func int DIA_Sekob_DMTWEG_Condition ()
{
	if (Kapitel >= 3)	
	&& (Npc_KnowsInfo(other, DIA_Sekob_DMT))
	&& (Npc_IsDead(DMT_DementorAmbientSekob1))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob2))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob3))	
	&& (Npc_IsDead(DMT_DementorAmbientSekob4))	
		{
			return TRUE;
		};
};

func void DIA_Sekob_DMTWEG_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_DMTWEG_15_00"); //���� ��� ����. ����� � ������ ����� ������ ���.
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output	(self, other, "DIA_Sekob_DMTWEG_01_01"); //� ����, ��� �� ��������� ����� ����������.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Sekob_DMTWEG_01_02"); //�� ������� ���������. ���� ����� ���������, ��� �� ��� ������� ���� ����� ����.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Sekob_DMTWEG_01_03"); //������� ����, � ������� ���. ��� �� � ���� ������� ��� ������ �����������?!
		};
	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP (XP_SekobDMTWEG);

	if (Kapitel < 5)
	{
		Npc_ExchangeRoutine	(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine	(self,"Obsessed");
	};
	
	if (Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine (Rosi,"Start"); 
		B_StartOtherRoutine (Till,"Start"); 
	};
	B_StartOtherRoutine (Balthasar,"Start"); 
	B_StartOtherRoutine (BAU_933_Rega,"Start"); 
	B_StartOtherRoutine (BAU_934_Babera,"Start"); 
	B_StartOtherRoutine (BAU_937_BAUER,"Start"); 
	B_StartOtherRoutine (BAU_938_BAUER,"Start"); 

};

///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_BELOHNUNG		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	32;
	condition	 = 	DIA_Sekob_BELOHNUNG_Condition;
	information	 = 	DIA_Sekob_BELOHNUNG_Info;

	description	 = 	"�� ��� ������, ��� ����.";
};

func int DIA_Sekob_BELOHNUNG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sekob_DMTWEG))
	&& (Kapitel >= 3)	
		{
				return TRUE;
		};
};

func void DIA_Sekob_BELOHNUNG_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_00"); //�� ��� ������, ��� ����.

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
				{
					AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_01"); //������ ���� �������� �������� ���� ������� ������� � ������ �� ���� �����, ��� � �������...
				};		
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_02"); //� �� �������. ��� ��� ���� �����?
		};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_03"); //�� ���-�� ��� ������ � �������, ��� ��� �����������?
		};

	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_04"); //���� ���������� ������ ����. ��� ��� ���� � ������ ����� ������ � ����� ����?
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_05"); //� ��� �� �������, �, ������� ���. ��������, ���...
			AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_06"); //���?
			AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_07"); //����� �������� ����. ��������� ��� ����� � �������� ������� �� �������� �� ���� � �� ��������� �������� ���� ������.
		};

	AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_08"); //���, ��� � ���� �������, - ��� ���� ���� ������� ������ � ������� ���� �������� ����.
	AI_Output			(other, self, "DIA_Sekob_BELOHNUNG_15_09"); //����� ����� ��� ����. � ���������.
	AI_Output			(self, other, "DIA_Sekob_BELOHNUNG_01_10"); //���.
	CreateInvItems (self, ItMi_Gold, 250);									
	B_GiveInvItems (self, other, ItMi_Gold, 250);
	AI_StopProcessInfos (self);					

};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_PERM		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	80;
	condition	 = 	DIA_Sekob_PERM_Condition;
	information	 = 	DIA_Sekob_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"���-������ ��������� �����������?";
};

func int DIA_Sekob_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sekob_BELOHNUNG))
	&& (Kapitel >= 3)	
	&& (NpcObsessedByDMT_Sekob == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sekob_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
	&& (Kapitel >= 5)
		{
			B_NpcObsessedByDMT (self);
		}
	else
		{
			AI_Output		(other, self, "DIA_Sekob_PERM_15_00"); //���-������ ��������� �����������?
			
			if (MIS_bringRosiBackToSekob == LOG_FAILED)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_01"); //����������.
			}
			else if (MIS_bringRosiBackToSekob == LOG_SUCCESS)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_02"); //���. ������ ����������.
			}
			else if (Kapitel >= 5)
			&& (MIS_bringRosiBackToSekob != LOG_SUCCESS)
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_03"); //��� ���� �������. ������� � �� ������ ����� ��������, �� ��� ��� � �� ���������.
				AI_Output		(self, other, "DIA_Sekob_PERM_01_04"); //� ����������, ��� ��� ������� � ���, �������� �� ������� ��������.
				AI_Output		(self, other, "DIA_Sekob_PERM_01_05"); //����� ��� ������: ���� �� ������� ��, ������� �� �����.
				MIS_bringRosiBackToSekob = LOG_RUNNING;
				Log_CreateTopic (TOPIC_bringRosiBackToSekob, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_bringRosiBackToSekob, LOG_RUNNING);
				B_LogEntry (TOPIC_bringRosiBackToSekob,"���� ������ ���� �������. ����� �����, ����� ��� ���������."); 
			}
			else
			{
				AI_Output		(self, other, "DIA_Sekob_PERM_01_06"); //������ � ��� ���, ��� ��� ������� � ������ ��������� ��� ���.
			};
		};
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

INSTANCE DIA_Sekob_KAP4_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP4_EXIT_Condition;
	information	= DIA_Sekob_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP4_EXIT_Info()
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

INSTANCE DIA_Sekob_KAP5_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP5_EXIT_Condition;
	information	= DIA_Sekob_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_Heilung		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	55;
	condition	 = 	DIA_Sekob_Heilung_Condition;
	information	 = 	DIA_Sekob_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ���� ��������.";
};

func int DIA_Sekob_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 5)
	 {
				return TRUE;
	 };
};

var int DIA_Sekob_Heilung_oneTime;
func void DIA_Sekob_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_Heilung_15_00"); //� ���� ��������.

	if (DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Sekob_Heilung_01_01"); //��, ��� �����. �� ��� ��������, ������� ���. �������� �����, ���� � �� ������ � ���� ����� ������.
		AI_Output			(other, self, "DIA_Sekob_Heilung_15_02"); //(���� ��� ���) ������� ������.
	
		B_NpcClearObsessionByDMT (self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Sekob_Heilung_01_03"); //�� ���, ���� �� �������?!
		AI_Output			(other, self, "DIA_Sekob_Heilung_15_04"); //(���� ��� ���) ����������� ������.
		B_NpcClearObsessionByDMT (self);
		B_Attack (self, other, AR_NONE, 1);
	};

};


///////////////////////////////////////////////////////////////////////
//	Info rosibackatSekob
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSIBACKATSEKOB		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	53;
	condition	 = 	DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information	 = 	DIA_Sekob_ROSIBACKATSEKOB_Info;

	description	 = 	"� ������ ���� ���� �����.";
};

func int DIA_Sekob_ROSIBACKATSEKOB_Condition ()
{
	if (Kapitel >= 5)
	&& (hero.guild != GIL_KDF)
	&& (Npc_GetDistToWP(Rosi,"NW_FARM4_SEKOB")<3000)
	&& (MIS_bringRosiBackToSekob == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_ROSIBACKATSEKOB_15_00"); //� ������ ���� ���� �����.
	AI_Output			(self, other, "DIA_Sekob_ROSIBACKATSEKOB_01_01"); //�����������. ���, ������ ��� �� ���� �����.
	MIS_bringRosiBackToSekob = LOG_SUCCESS;
	CreateInvItems (self, ItMi_Gold, 650);									
	B_GiveInvItems (self, other, ItMi_Gold, 650);					
	B_GivePlayerXP (XP_Ambient);
	B_NpcClearObsessionByDMT (self);
	B_StartOtherRoutine	(Rosi,"Start");
	B_StartOtherRoutine	(Till,"Start");

};

///////////////////////////////////////////////////////////////////////
//	Info rosineverback
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSINEVERBACK		(C_INFO)
{
	npc		 = 	BAU_930_Sekob;
	nr		 = 	56;
	condition	 = 	DIA_Sekob_ROSINEVERBACK_Condition;
	information	 = 	DIA_Sekob_ROSINEVERBACK_Info;

	description	 = 	"���� ������� �� �������� � ����.";
};

func int DIA_Sekob_ROSINEVERBACK_Condition ()
{
	if (MIS_bringRosiBackToSekob == LOG_OBSOLETE)
	&& (hero.guild != GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Sekob_ROSINEVERBACK_Info ()
{
	AI_Output			(other, self, "DIA_Sekob_ROSINEVERBACK_15_00"); //���� ������� �� �������� � ����. � ����� �� � ���������� �����.
	AI_Output			(self, other, "DIA_Sekob_ROSINEVERBACK_01_01"); //����������. �� ����?
	AI_Output			(other, self, "DIA_Sekob_ROSINEVERBACK_15_02"); //�� ����.
	AI_Output			(self, other, "DIA_Sekob_ROSINEVERBACK_01_03"); //�� ��������� �� ����, ������� ������.
	B_NpcClearObsessionByDMT (self);
	B_Attack (self, other, AR_NONE, 1);
	B_GivePlayerXP (XP_Ambient);
	MIS_bringRosiBackToSekob = LOG_FAILED;

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


INSTANCE DIA_Sekob_KAP6_EXIT(C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 999;
	condition	= DIA_Sekob_KAP6_EXIT_Condition;
	information	= DIA_Sekob_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sekob_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sekob_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sekob_PICKPOCKET (C_INFO)
{
	npc			= BAU_930_Sekob;
	nr			= 900;
	condition	= DIA_Sekob_PICKPOCKET_Condition;
	information	= DIA_Sekob_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sekob_PICKPOCKET_Condition()
{
	C_Beklauen (75, 230);
};
 
FUNC VOID DIA_Sekob_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sekob_PICKPOCKET);
	Info_AddChoice		(DIA_Sekob_PICKPOCKET, DIALOG_BACK 		,DIA_Sekob_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sekob_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sekob_PICKPOCKET_DoIt);
};

func void DIA_Sekob_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sekob_PICKPOCKET);
};
	
func void DIA_Sekob_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sekob_PICKPOCKET);
};















































