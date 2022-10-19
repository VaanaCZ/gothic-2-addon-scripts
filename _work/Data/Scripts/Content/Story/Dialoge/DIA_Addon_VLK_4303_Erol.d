///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Erol_EXIT   (C_INFO)
{
	npc         = VLK_4303_Addon_Erol;
	nr          = 999;
	condition   = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Erol_PICKPOCKET (C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 900;
	condition	= DIA_Addon_Erol_PICKPOCKET_Condition;
	information	= DIA_Addon_Erol_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Erol_PICKPOCKET_Condition()
{
	C_Beklauen (43, 42);
};
 
FUNC VOID DIA_Addon_Erol_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
	
func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Hallo		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Hallo_Condition;
	information	 = 	DIA_Addon_Erol_Hallo_Info;

	description	 = 	"� ��� ����?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //� ��� ����?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(� ������) � ��� ����? �� ������ �������� �� ���� ������ ��� ������!
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //� ������ �� ��� ���� ����� �� ��������! ���� ������ ����� �������� ���� �� ������.
};

///////////////////////////////////////////////////////////////////////
//	Info what
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_what		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_what_Condition;
	information	 = 	DIA_Addon_Erol_what_Info;

	description	 = 	"��� ���������?";
};

func int DIA_Addon_Erol_what_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_what_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //��� ���������?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //� �� ������ ����������� �������� ���� �� ������, � ����� ��� ������� ��������� �� ������ � ����� ���� ���� �����.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //������, ��� � ��� �� ����� ���� �������� ��� ������, ����� � ���� ��� �� �����.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"�� �������� ����� ������ �������. ��� ������� ��� ��� ������. ���� �����, ����� � ������ ���������� �������� ��������. ������� ������������� �� ����� ���������� �� ������� '������� ������'."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "��� ��� ���� ���� ����� ��� ������?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "��� ��� ����?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //��� ��� ���� ���� ����� ��� ������?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //��. �������, ������, ��� ���������.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //� ���-��� ������ ������...
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //������ �������� ��� ���� ����, �������� ��� �� ������������.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //���� ��� ��� ������ �������� �� ������������.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //�� ������� ������ � ���� ����� ������������� ������. ��� �������� ��������.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "�������� ��������?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //�������� ��������?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //��. �� ����� ������ � ���� ��������� ��� ����. � ������ ���, ��� ������� ��.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //� ������ ����� ����� ������� ��, ����� ���������� ��� ���������.

	Info_AddChoice	(DIA_Addon_Erol_what, "��� �� ������ ��� ��������?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "����� �������� ����� ���� ����?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //����� �������� ����� ���� ����?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //�� ������, ��� ������� ��, � ������ �������� ��� ����� ������.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //��� �� ������ ��� ��������?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //������ �� � ������� ���������, ��������, ���������. � ������ �� ����� ����� � �������.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //� ������ ���� ���� ��� ����� ���� ��������.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //�������, ����� ��� ����������� �������� �����. ���� ����� � ������ �� �� ������-������� ��������.

	Info_AddChoice	(DIA_Addon_Erol_what, "������ �� ���� ������ �� �������� ����� ��������?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //������ �� ���� ������ �� �������� ����� ��������?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //�� ����� ������� � ��������� � �������� �������.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //� ������ ����� � ������ �� ����.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //��� �� ���� �� ���� ������?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //�������, ��� ���? ��� ������������ �� �����.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //������ �������, ��� �������� ������.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //� ����, ��� � ��� ��� ������, ��� ��� ����� �������� ��� ������.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //�� ������, ��� ������� ���������� �� ������� ���������������.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //��� ������� ������ ��������� � ����� ����� �� ���.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //���� ���� ����������� ��������� �������� �����...
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_FernandosWeapons		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Erol_FernandosWeapons_Info;

	description	 = 	"�� ���-������ ������ � ��������� ������ ��������?";
};

func int DIA_Addon_Erol_FernandosWeapons_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
 	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //�� ���-������ ������ � ��������� ������ ��������?
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //��������� ������? ��, ���-��� ����. �����-�� ������ �� ������ ������� �� ������� ������, ��� ��� ��� ��� ������.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //����� ��� �������� �� ����� � �������� �� ���� ��������.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //����� ������ ����-�� � ������� ����� ������� �� ������� ���������.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //��������, ������� ������ ����������� ������ ����� ������.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "��� ��������� ��� ������� ��������?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //��� ��������� ��� ������� ��������?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //� ����������� ����� �������� ��������� '������� ������', ������� ������. 
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //�� ��� �� �� ����� ������. ��� �������� ����� ������� �������� � ������� � ������ ��������.
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};


///////////////////////////////////////////////////////////////////////
//	Info Stoneplates
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Stoneplates		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Stoneplates_Condition;
	information	 = 	DIA_Addon_Erol_Stoneplates_Info;
	permanent	 = 	TRUE;

	description	 = 	"������ ���� �������� ��������...";
};

func int DIA_Addon_Erol_Stoneplates_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); //Joly:Kohle f�r eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //������ ���� �������� ��������...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //� ���� ���� ���� �����.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //� ���� ���� ��������� ����.
		
					if ((StoneplatesCount + StoneplatesCounter) >= 3)
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 3 - StoneplatesCounter);
						XP_Addon_BringStoneplates = ((3 - StoneplatesCounter) * XP_Addon_BringStoneplate);
						StoneplatesCounter = 3;
					}
					else
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, StoneplatesCount);
						XP_Addon_BringStoneplates = (StoneplatesCount * XP_Addon_BringStoneplate);
						StoneplatesCounter = (StoneplatesCounter + StoneplatesCount); 
					};
					B_GivePlayerXP (XP_Addon_BringStoneplates);
				};
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //������� ����.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //������ ��� �� ������� ������ ����.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //������ ��� �� ������� ������ �����.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //����� ����������. ��� ���� ������� ��, ��� � ������, � � �����, �������, ��������� �����.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //������� ��, � ���� �������.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum H�ndler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //� ��� �����. ���� ������, ������ ����� �� ����.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //����� �� ��������� �� ����� ����, � ����� ������� ���� ��������� ����.
				
				AI_StopProcessInfos (self);
				AI_UseMob			(self,"BENCH",-1);
				AI_GotoWP 			(self,"NW_TAVERN_TO_FOREST_03");
				Npc_ExchangeRoutine	(self,"Start");
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
	}
	else
	{
			if (C_ScHasMagicStonePlate () == TRUE)
			{
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //��� �������� ��������?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //���. ��� �������� ���������� �����.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //����� �������� ��� ���� �� ��������.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //������� ���� ����� ��������?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //����� ������ ��� ���������, ��� ����� �������� ���� ���� ��� ��������.
			}; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Buerger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Buerger		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Buerger_Condition;
	information	 = 	DIA_Addon_Erol_Buerger_Info;

	description	 = 	"�� ������ � ������?";
};

func int DIA_Addon_Erol_Buerger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_Buerger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //�� ������ � ������?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //� �� ��� ��� ��� ����� ���, ��������. ���� ������ �� ���������� ����� ���� ������ � ������ ������, ������� � ������� ��������.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //� ���� ����� � ��� �������� ����������� �����������. �� ��� ���� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTeach		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_PreTeach_Condition;
	information	 = 	DIA_Addon_Erol_PreTeach_Info;

	description	 = 	"�� ���� �������� �� ��������?";
};

func int DIA_Addon_Erol_PreTeach_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //�� ���� �������� �� ��������?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //��. �� ��� ��� ��� ����� �� �����.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //�� ������ ������� ���� ������ �����?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //�������.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic (Topic_OutTeacher,LOG_NOTE);
	B_LogEntry (Topic_OutTeacher, LogText_Addon_Erol_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTrade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_PreTrade_Condition;
	information	 = 	DIA_Addon_Erol_PreTrade_Info;
	permanent	 = 	TRUE;

	description	 = 	"������ ��� ���� ������.";
};

func int DIA_Addon_Erol_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")>2000)
	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_PreTrade_Info ()
{
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //� ������ �� ���� ���� �������. ��� ��� ���� �������� ��� ������.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //���-�� � ���� ������ �� ������� ������ �����, ����� � �������� �� ����.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //�� � �� ���� ���������, ���� �� ������� �������� ��� ����.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_SLD		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_SLD_Condition;
	information	 = 	DIA_Addon_Erol_SLD_Info;

	description	 = 	"��� � ���� ���� ���?";
};

func int DIA_Addon_Erol_SLD_Condition ()
{
	if	((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<2000) )
		{
			return TRUE;
		};
};
var int Erol_IsAtHome;
func void DIA_Addon_Erol_SLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(���������) ��� � ���� ���� ���?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //��. � ���? ���-������ �� ���?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //� ���� ��� ������� � ����������?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //���� � �� ��� ��� � �� ����, ��� ���� �� ������� .
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //� ���� ��, ��� �������� ����������. � � ����� ��, ����� ��� �������� ��� ���, ���� � � �������.
	B_GivePlayerXP (XP_Ambient);
	if (Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine	(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Trade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_Trade_Condition;
	information	 = 	DIA_Addon_Erol_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"������ ��� ���� ������.";
};

func int DIA_Addon_Erol_Trade_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<3000) )
	{
		return TRUE;
	};
};
var int DIA_Addon_Erol_Trade_OneTime;
func void DIA_Addon_Erol_Trade_Info ()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //�������, ������ � ���� ���.
	
	if (Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
		B_LogEntry (Topic_OutTrader, LogText_Addon_ErolTrade);

		Npc_ExchangeRoutine	(self,"Home");
		Erol_IsAtHome = TRUE;
	};
};

//*******************************************
//	TeachPlayer
//*******************************************

INSTANCE DIA_Addon_Erol_Teach(C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 99;
	condition	= DIA_Addon_Erol_Teach_Condition;
	information	= DIA_Addon_Erol_Teach_Info;
	permanent	= TRUE;
	description = "������ ���, ��� ������� ���� �������.";
};                       

FUNC INT DIA_Addon_Erol_Teach_Condition()
{
	if (Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Erol_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //������ ���, ��� ������� ���� �������.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //������, �� �� ������� ��� ���� ������.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //������ ��� ������ ��� ���������. ������� ��� �������� �������� ��� ���� ����.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //����� � ������ ����, ��� ��������� ���� ���� � ���.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //������. ������ �����������. ���� ���� ������� �����.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //����� �� �������� ����, ��������� �� ���� ����, � ���� ����� ����.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //� ���� � �� �� ����� �� ������ ���������� �����, ������� ������ ����� � ���������� ����.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(�������) ���� �� �������� ���� ���������, �� ��� �������!
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //���� �� ������ �������� ��������, �� ������ ������ �������������...
		Info_ClearChoices (DIA_Addon_Erol_Teach);
		Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
	};
};

FUNC VOID DIA_Addon_Erol_Teach_Back ()
{
	Info_ClearChoices (DIA_Addon_Erol_Teach);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};






