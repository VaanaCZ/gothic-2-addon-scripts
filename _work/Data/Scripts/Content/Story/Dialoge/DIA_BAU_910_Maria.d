// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "��� ��?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //��� ��?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //� ���� �����, �����.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //��� ���� ����� �����?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "� ������ ����� ����������, ��� �� ������...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //� ������ ����� ����������, ��� �� ������...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //����� ������� ����� ����� �� �����, ���� � ���� ����� �� �������!
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //��� ��� � ����� ����.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "���� ��������� ��������?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //���� ��������� ��������?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //��, ������ � ���, ��� � ������ ��� ������� - � ��� ���, ��� �� �����, ���� ����� ����� ����������� ����������.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //��. ��, ���� � ��� ��� ��� ������ ��������, ���� �� �� ����� ����� ����������.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //����� �� ��� ���� ���� �� ����, ���� ��������� ��������� ��������� �� ������ � ������� ���.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //��� �������� ������� ����� ������. � ���� ����. � ������ �� ������ ��� ������.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //��������� �� ��� ���� ��������, ��� ����� �����.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //������ �� ����� ���� �������, ������. � ����, ��� �� ��� �� �����.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "� ��� ��� ������ � ����?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //� ��� ��� ������ � ����?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //� �������� ������ � �������. ��� ���� ������� ��� ��������� �������. ������� �������.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //�������, ��� ������ ������� � ������� � ������-������ ���������� ���������.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "� ������ ������� �������. ��� �� ����?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //� ������ ������� �������. ��� �� ����?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //��! ��� ���! �������� ������� ����!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "� ��� ������ ����� ��������������?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //� ��� ������ ����� ��������������?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //�� ��������� ��������� �� ����� ����, ��?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //�����.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //������� ��� ��� ������ ����?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //����� ������������. ��� � ���� � �����, ����� �� ������ ���� ������.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //�� �������, �� ���������?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //�� �����, ��� �����, ���� �� ���������. ������ ���.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //�� ������ ����� ��������� �� ���� �����?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "������-�� ���.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "��.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //���, ������ ���. �� ��������.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //������-�� ���.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //����� ������ ��� ������ � �������� �������. �� �������� ���.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //��.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //������, ���� �� ������ �������� �����, � ��������, ����� �� ������� ������� ���������.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //����� �� ���, ����� �������� ������ ��������� � ���� �����.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "�������� ��� �� �����.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //�������� ��� �� �����.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //�� ������� �������. ������� ��������� � ����� ���������������, �� � ��� � ���� ���� ���� ����������.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //� �������� ������ ����:  '������ �� ���������� �������� �� ������ ��� � ����� ����������'?
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //'������ �� ���-������', - ������� �.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //� �� ����� ���������. � ������ ��� �������, ��� �� ����� �����.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //��, ���� ��������, �� ���� ������������� �����, ����� ���?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "��� ����������� ���� � ��������� �����?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //��� ����������� ���� � ��������� �����?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //���� ������ ��������.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //������� �� ��������, ��� ��� ���������� ������� �� ���� �����, �� ��� ������ ����, � ������ ��������.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //������� ������ ���� ��������� ���� �����. � ����� �����, ��� ��������.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //� ��� ���, ��� ����� ��������� ���� ������, ����� ����������� ���������.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















