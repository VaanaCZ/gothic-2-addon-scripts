
///////////////////////////////////////////////////////////////////////
//DIA_BDT_10XX_Fluechtling
///////////////////////////////////////////////////////////////////////

FUNC VOID B_DIA_BDT_10XX_Fluechtling_Stimme7 ()
{
	AI_Output			(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_07_00"); //������ �� ����, � �� ������� ����� � ������.
};

FUNC VOID B_DIA_BDT_10XX_Fluechtling_Stimme6 ()
{
	AI_Output			(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_06_00"); //�� �� ������ �� �����, ����� ������� ��� ����� � ������, ������?
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1031_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1031_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1031_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1031_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1031_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1031_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Tip1
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1031_Fluechtling_Tip1		(C_INFO)
{
	npc			 = 	BDT_1031_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1031_Fluechtling_Tip1_Condition;
	information	 = 	DIA_BDT_1031_Fluechtling_Tip1_Info;
	important	 = 	TRUE;

};
func int DIA_BDT_1031_Fluechtling_Tip1_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1031_Fluechtling_Tip1_Info ()
{
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_07_00"); //���� ����� ��������� �� ���� ��������, ���� �� ������ ������� � ������.
	B_GivePlayerXP (XP_AmbientKap3);
	
	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices	(DIA_BDT_1031_Fluechtling_Tip1);
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "� �� ��������� ������� ����.", DIA_BDT_1031_Fluechtling_Tip1_frei );
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "� ������ ���������� ����.", DIA_BDT_1031_Fluechtling_Tip1_Knast );
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "��� ���������, ��� �������?", DIA_BDT_1031_Fluechtling_Tip1_Morgahard );
	};
};
func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00"); //��� ���������, ��� �������?
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01"); //�� �����������, ����� ��� �� ������� ������� ������. ������� �� ����, ��� ������ ���������.
	
	Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "����. �����, �������, ��� �������� ��������� ���� � �����.", DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen );

};
func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00"); //����. �����, �������, ��� �������� ��������� ���� � �����.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01"); //������, ������. � �����, ��������� �� ��� ����������� � �������. �� �� �� ������ ����� �� ����, ������?
	AI_StopProcessInfos (self);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Knast ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00"); //� ������ ���������� ����.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01"); //������ ����� ��� ����.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno , 1);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_15_00"); //� �� ��������� ������� ����.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_07_01"); //���� ���� ������ �����, ����� ���, ����� �� ������ �� ���.
	
	Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "��� � ����� ������������ �� �����������?", DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen );
};
func void DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00"); //��� � ����� ������������ �� �����������?
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01"); //��� �� ���� ����.

};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1031_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1031_Fluechtling;
	nr			 = 	3;
	condition	 = 	DIA_BDT_1031_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1031_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1031_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1031_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1032_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1032_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1032_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1032_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1032_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1032_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1032_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1032_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1032_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1032_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1032_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1032_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1033_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1033_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1033_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1033_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1033_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1033_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Tip2
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1033_Fluechtling_Tip2		(C_INFO)
{
	npc			 = 	BDT_1033_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1033_Fluechtling_Tip2_Condition;
	information	 = 	DIA_BDT_1033_Fluechtling_Tip2_Info;
	important	 = 	TRUE;

};
func int DIA_BDT_1033_Fluechtling_Tip2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1033_Fluechtling_Tip2_Info ()
{
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_07_00"); //(���������) ��� ���� ����� �� ����?
	B_GivePlayerXP (XP_AmbientKap3);
	
	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices	(DIA_BDT_1033_Fluechtling_Tip2);
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "����������. � ������ ���� ����������.", DIA_BDT_1033_Fluechtling_Tip2_frei );
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "���� ������ �����, ����� � ������ ���� �����.", DIA_BDT_1033_Fluechtling_Tip2_Knast );
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "��� ���������, ��� �������?", DIA_BDT_1033_Fluechtling_Tip2_Morgahard );
	};
};
func void DIA_BDT_1033_Fluechtling_Tip2_Morgahard ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00"); //��� ���������, ��� �������?
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01"); //(���������) ��� �� ����� ��������. ��� � ���������. �� ����� ���������� ����� ���������. � ���� ������ � �����.
	AI_StopProcessInfos (self);
};

func void DIA_BDT_1033_Fluechtling_Tip2_Knast ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00"); //���� ������ �����, ����� � ������ ���� �����.
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01"); //(�����) ����!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno , 1);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_15_00"); //����������. � ������ ���� ����������.
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_07_01"); //�� � �� ���� �������� � �����. ����������!
	
	Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "�� ���� �� ������ �������, ����� ���?", DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen );
};
func void DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00"); //�� ���� ������� �� ������, ���?
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01"); //���� ����� ��������. ���� �� ���� ��������, ���� ���� �������.

};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1033_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1033_Fluechtling;
	nr			 = 	3;
	condition	 = 	DIA_BDT_1033_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1033_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1033_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1033_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1034_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1034_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1034_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1034_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1034_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1034_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1034_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1034_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1034_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1034_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1034_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1034_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1035_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1035_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1035_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1035_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1035_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1035_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1035_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1035_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1035_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1035_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1035_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1035_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7 ();	
	AI_StopProcessInfos (self);
};









