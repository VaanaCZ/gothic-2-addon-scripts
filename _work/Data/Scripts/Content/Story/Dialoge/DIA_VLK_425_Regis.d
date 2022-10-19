///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //��, �� ������� � ���� ������, ��?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //��, � ��?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //� ������� � �������� � ��� ������ �������� ����� ��� ����. � ���� ����� ����������� ������, �������, ������, ��� ������ ������� �� ��������, ����� ��� ��������� � ���������.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //�� � �� ���� ������ �����. � �� ����, ����� ���� ����� ����, ����� � ���� ��������� �� ������.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"��� �� ������ ���������� �� ���������?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //��� �� ������ ���������� �� ���������?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //��� ������ ��������� ���� �� ���������. ����� ���� �����.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //�� �������� ������������ �������� ������ �� ������ ��������� �����.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //�� ����� �������� � ���������, ����� ���� ����������� ����� ������.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //��������� ��� ��������, ���� �� �� ��������� ����������� ������, ���� ��� ����� ����� �����������, �� ���������� �� ��������.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"��� ��� �� ������ ���������� � ����� �����?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //��� ��� �� ������ ���������� � ����� �����?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //�� ����� ����� ��������� �����.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //���� �� ������� ����� � ������, ���� �������� ������� ����� ����� ���.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //� ���-�� �������� � ����� �����������.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //�� ������� ���������� � ����� �����.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //� ���� ������ �������� ��� � 50 ������� �����.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //������ ���, ��� ��� ��������� �����, � �� ���� �� ������ ���������.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //��� ������ ����� �������� �� ����, ��� ���� �����.
};

// ****************************************************
// 					Pr�gelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"� ��� �� ������?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //� ��� �� ������?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //� ������ �� ����� ���������. �� ����� ��������� � ������� ����� �����.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //������ � �������� ������. �� ���� ���� ������ ����� ���� �� ����...
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"� �������� ����� ���������...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //� �������� ����� ���������...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //�?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //� ����� ��� ������� �������...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(�������) �� �������� ���...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //��� - � ����� ��� ������ � ��� �������, ����� ���� ������ �����������.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(����������) �� ������ �������� ��� ����������, ��� ������ ��� �������...
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"������ ���-������ ����������?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //������ ���-������ ����������?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //����� ������� � ���.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //�������, ������, ������-������, ��� ��������. ������ ����� ������ �������!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //��� �������� � ��� ����� ����� ���� ��� � ������� ���.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //������ ������� �� ���, ���� '����� ����!' �� ��� �������� ����� ���������.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //� ����� �����-�� ������� ������� ����� ���� ��� � ������ �������.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //��� ������� - � ���� ����� ������ ������ ��� ���� �� ������, �� ���� ������ ��� ����� � ���� � ������ ���.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //���� ��� ����. �� � �����, ��� ����� ������ ����, �� ��� �������...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //����������, ��� ���� ������� ���������, � �� �������� ��������� ���.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //���� �����, ������ ����, ��� ���� �� ������.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //���� ����� ������ � ������� �� ����. �� ������� ������, ��������?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //����� ����.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //��� ���, �� �����. ���� ����� �� �����. � ���� ����������� ���������, ������� ��.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"� ������� ������� ������� ��� ������� ��������.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //� ������� ������� ������� ��� ������� ��������.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //����� �� ���� ������. ���� ����� ������������ � �����, �� ��� ����� � ������.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //���� ����� ��� �������� ������, ��, ������ �����, �� ������� �� ���.

};


