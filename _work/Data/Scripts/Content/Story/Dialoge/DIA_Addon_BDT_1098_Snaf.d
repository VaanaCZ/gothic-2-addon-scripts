//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_EXIT   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 999;
	condition   = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Snaf_PICKPOCKET (C_INFO)
{
	npc			= BDT_1098_Addon_Snaf;
	nr			= 900;
	condition	= DIA_Addon_Snaf_PICKPOCKET_Condition;
	information	= DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       
FUNC INT DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen (49, 56);
};
 
FUNC VOID DIA_Addon_Snaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
	
func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Hi   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 1;
	condition   = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Snaf_Hi_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Snaf_Hi_01_00"); //������ ����� ��� �������?
};
//---------------------------------------------------------------------
//	Was gibt's denn leckeres?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Cook (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 2;
	condition   = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent   = FALSE;
	description = "� ��� � ��� � ����, ���?";
};
FUNC INT DIA_Addon_Snaf_Cook_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_Cook_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_15_00"); //� ��� � ��� � ����, ���?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_01_01"); //��������� �� ����������� ���� ����� �����, �����. ��� ���������� '��������� ������� � ����� '��������� ����'.
	
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"��������� �������?",DIA_Addon_Snaf_Cook_FEUER);	
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"� ��� �� ���� ����� - '��������� ����'?",DIA_Addon_Snaf_Cook_HAMMER);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_FEUER_15_00");//��������� �������?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_01");//��� ���������, ������ ����������� ���� � ������������� ��������� �������� �����. 
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_02");//�� �� �� ��������. ��� ����������� ��� � �������.
};
FUNC VOID DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_15_00");//� ��� �� ���� ����� - '��������� ����'?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_01");//����, �������������� �� ������ �������� �����, ��� ���� ��������. ������ ������ � �������� �� ����� ��.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_02");//�� �������� ������ �����������, ������ ������� �� ������������ ������������, � � ���� ����� ����. �� ���?
	
	Info_AddChoice (DIA_Addon_Snaf_Cook,"� ���� ��� ������� �� ���.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice (DIA_Addon_Snaf_Cook,"����������, ������ �� � ���?",DIA_Addon_Snaf_Cook_YES);
	
};
FUNC VOID DIA_Addon_Snaf_Cook_NO ()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");//���, �������, ������, �� ��� �� �� �����.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");//��, ���� ����.
	
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
};
FUNC VOID DIA_Addon_Snaf_Cook_YES()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");//����������, ������ �� � ���?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");//�������. ��� ������.
	
	B_GiveInvItems (self, other,ItWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	
	Log_CreateTopic (Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Hammer,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Hammer,"����� ����� ���������� ��� �����. �� ��� ��� ������ ������� '�����', ������� � ���� ����������� �� ������������ �����.");
};
//---------------------------------------------------------------------
//	Info Booze
//---------------------------------------------------------------------
var int Snaf_Tip_Kosten;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Booze   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 3;
	condition   = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent   = FALSE;
	description = "��� ���� �������, ��������.";
};
FUNC INT DIA_Addon_Snaf_Booze_Condition()
{	
	if (Npc_HasItems (other, ItFo_Addon_LousHammer) >= 1)
	&& (MIS_SnafHammer == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Booze_Info()
{
	B_GiveInvItems (other, self, ItFo_Addon_LousHammer, 1);
	
	AI_Output (other, self, "DIA_Addon_Snaf_Booze_15_00");//��� ���� �������, ��������.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_01");//���������. ������� ��� ����������� ����.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_02");//���, ������. ������ ����������� ����� ������. �������-�� � �������� ����������, ����� ���.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_03");//� ���, ���� ���� ����������� ��� ������... ������ ��� ���������� ��� ���� - ���������.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems (self, other, ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Loushammer);
};

//---------------------------------------------------------------------
//	ATTENTAT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Attentat   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 4;
	condition   = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent   = FALSE;
	description = "��� �� ������ � ���������?";
};
FUNC INT DIA_Addon_Snaf_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_15_00"); //��� �� ������ � ���������?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_01"); //�� �������� ��� ��������� �� ��������?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_02"); //��, �� ���� ���������, ������ ������� ������ ���, �� �� ����������, ��� ���, ��� �� ������, - ������.
	
	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"����� ����, � ���� � ���� � ���� ����������.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"� ��� �� �� ������, ���� �� �� ���� �����?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"������, ��� �� ���� ���-�� ��������?",DIA_Addon_Snaf_Attentat_Something);	
};
	
func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_Something_15_00"); //������, ��� �� ���� ���-�� ��������?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_Something_01_01"); //��, � ����� �� �������.
};
func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_GoWhere_15_00"); //����� ����, � ���� � ���� � ���� ����������.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_GoWhere_01_01"); //����� ���� �� ����� ����, ����? ����� �� ��� ���.
};
func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_YouBeingMe_15_00"); //� ��� �� �� ������, ���� �� �� ���� �����?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_01"); //� �� ��������� ��� ���, ��� � ���� � ��������, ������� ����� �� ����������. 
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_02"); //��-������, ��������� ����� ��� ���������, � ��� ��������, ��� �� �����, � ������.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_03"); //��-������, �� ��������� �� ����� ���������.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_04"); //� �-�������, ���� �� �������, ��� �� �� ������� ��������, �� �� �� ��� �� �������� ���� ����.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_05"); //����� ����� ������ ������: ������ ���� ����� ����� ����� ��������?

	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
};

//---------------------------------------------------------------------
//	Info Abrechnung
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Abrechnung   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 5;
	condition   = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent   = TRUE;
	description = "�� � ������ ��?";
};
FUNC INT DIA_Addon_Snaf_Abrechnung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Snaf_Attentat)
	&& (MIS_JUDAS == LOG_RUNNING)
	&& (Huno_zuSnaf == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Abrechnung_15_00"); //�� � ������ ��?
	AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_01"); //��...
	
	if (Senyan_Erpressung == LOG_RUNNING) 
	&& (!Npc_IsDead (Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_02"); //��������, � �� ������. ��������� ��� ��������, ��� � ���� ����� ���� � ��������. 
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_03"); //���� ����� ������ ��������� ��� � ������� � ���, ����� �� ������ ���� ��������, ��� ����� �� ����������.
		
		if (Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry (Topic_Addon_Senyan,"� ������ ������� ��������� � ��������. �������� �� ���� �������� ���� �� �����, ������� � ������ ������� � ��� ����������.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if (Npc_IsDead(Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_04"); //�� ������ ������ �� ������ ��������. � �������, ���, ���� �� �����, ����� ������ ���� ��������, ����� �� ��� ���������. 
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_05"); //�� �� ���� �� ��� ������ ����������. ���� ����� ������ ������. 
	}
	else if (Finn_Petzt == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_06"); //���� ������� ���������� � ��� ���, ��� �� � ��� ���������.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_07"); //� ��� ����� �����, ��� �� ������ ����� � ���������.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_08"); //��� ������, ��� �� ������ ��� ���-��, ���� �� ���� �� ����� �������.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_09"); //��� ��������� ���������� ����, ���� �� �����.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_10"); //���� ������ ��������, ��� �� �������� � �������� � ���� �����������. (����������) ��, ���� �� ��� ��� ��������� ���������. 
	}
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_11"); //�������, �� �������� �����, ��� ��������� �� ��������.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_12"); //�� ����, ���� �� ��� �������, �� ������ �������, �������� �� �����, ��������� ������ ����������.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_13"); //��, ���� ���� �� ����� �������� �� ���� � ������������.
	};
	
	//------------------- Abschied ----------------------------------
	if (Snaf_Rechnung == FALSE)
	{
		if (Snaf_Einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_14"); //������� ����.
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_15"); //(�����) ��! �� �� ���� ������ �� ������, ����?!
			
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_16"); //���� �����.
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_17"); //��� ������.
		};
	};
};

//---------------------------------------------------------------------
//	HOCH
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_HOCH (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent   = FALSE;
	description = "� �� ����.";
};
FUNC INT DIA_Addon_Snaf_HOCH_Condition()
{	
	if (Huno_zuSnaf == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_HOCH_15_00"); //� �� ����.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_01"); //�����, �� ����� ����, ���� �����.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_02"); //��������� ������, ���� ��� ����.
		
	AI_StopProcessInfos (self);
	AI_Teleport (Fisk,"BL_INN_UP_06");
	B_StartotherRoutine (Fisk,"MEETING");

	B_GivePlayerXP (XP_Addon_Auftraggeber);
};

//---------------------------------------------------------------------
//	People
//---------------------------------------------------------------------
var int Kosten_Einmal;
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_People (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent   = TRUE;
	description = "��� ������� ������ �� ��������?";
};
FUNC INT DIA_Addon_Snaf_People_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_People_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Snaf_People_15_00"); //��� ������� ������ �� ��������?
	AI_Output (self, other, "DIA_Addon_Snaf_People_01_01"); //���� ������� ���� ����� ������ � ����� ��������...
	if (Kosten_Einmal == FALSE)
	&& (MIS_SnafHammer != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_02"); //���������� ����� �����, ��������...
		AI_Output (other, self, "DIA_Addon_Snaf_People_15_03"); //��, � ������� �� ��� �����?
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_04"); //������� ������ ������.
		
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Snaf_People);
	Info_AddChoice (DIA_Addon_Snaf_People, DIALOG_BACK, DIA_Addon_Snaf_People_BACK);
	Info_AddChoice (DIA_Addon_Snaf_People, "����", DIA_Addon_Snaf_People_Paul);
	Info_AddChoice (DIA_Addon_Snaf_People, "Huno", DIA_Addon_Snaf_People_Huno);
	Info_AddChoice (DIA_Addon_Snaf_People, "����", DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice (DIA_Addon_Snaf_People, "������", DIA_Addon_Snaf_People_Emilio);
	if (!Npc_IsDead (Senyan))
	{
		Info_AddChoice (DIA_Addon_Snaf_People, "������", DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice (DIA_Addon_Snaf_People, "������", DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice (DIA_Addon_Snaf_People, "����", DIA_Addon_Snaf_People_Finn);
};
// --------------------------------------------
	func void B_Addon_Snaf_NotEnough()
	{
		AI_Output (self, other, "DIA_Addon_Snaf_NotEnough_01_00"); //�� � ���� ������ �� �������, ������!
	};

FUNC VOID DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_People);
};
FUNC VOID DIA_Addon_Snaf_People_Paul()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Paul_15_00"); //� ��� ���?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Paul_01_01"); //�� �����, ��� �� ��� ��� �� ��������. ��-�� ����, ��� �� �������� �� ����, � ����� ��� ������� �� �������.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Huno()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Huno_15_00"); //��� ���� ������ �� ��������?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_01"); //�, ����! � ��� ���� ����� ������ �� ����.
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_02"); //(����������) �������, ����� � �� ��� � ���� �� ������.
};
FUNC VOID DIA_Addon_Snaf_People_Fisk()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Fisk_15_00"); //� ����?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_01"); //���� ���� ����. �� ������ ���� �������� � ����������� �����, ������� ��, � ��������, �������� �� �������.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_02"); //�� ���, ��� �� ���� �� ������ ������ ������� � ��������. 
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Emilio()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Emilio_15_00"); //��� ������ ��������� � ��������?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Emilio_01_01"); //��, ������ �� ��� ���� �� ���� �� �����-������ ��������, ��� �����.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Senyan()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Senyan_15_00"); //� ������?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Senyan_01_01"); //������ - ���� �� ����� ��������. �������� ����� �������� �� ����.  
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Lennar()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Lennar_15_00"); //������ ������ �� �������� ������?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Lennar_01_01"); //��������� � ���� �������, �� �� ����� �������� ������ �� ��������.
};

func VOID DIA_Addon_Snaf_People_Finn()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Finn_15_00"); //� ��� � ������?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_01"); //�������� �������. �� ������ ����� ����.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_02"); //������� ������ ��� �� ��� �����. ��� ��� ��� ���� � ������ ������� �����. 
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

//---------------------------------------------------------------------
//	Und du?
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Himself (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 7;
	condition   = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent   = FALSE;
	description = "� ��? ��� �� ������� �� ��������?";
};
FUNC INT DIA_Addon_Snaf_Himself_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Himself_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_00"); //� ��? ��� �� ������� �� ��������?
	AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_01"); //� �����, ��� ��� �� ����� � ��� ���������, � �� ���� ��...
	//AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_02"); //Und?
	//AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_03"); //Ende der Geschichte. //wav fehlt
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_PERM (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 8;
	condition   = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent   = TRUE;
	description = "��� ����������?";
};
FUNC INT DIA_Addon_Snaf_PERM_Condition()
{	
	if (Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_PERM_15_00"); //��� ����������?
	AI_Output (self, other, "DIA_Addon_Snaf_PERM_01_01"); //����� ������! ������ �������� ��� ���� - ��������.
};


