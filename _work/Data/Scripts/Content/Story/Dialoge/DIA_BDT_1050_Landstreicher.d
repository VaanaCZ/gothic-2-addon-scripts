///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Landstreicher_EXIT   (C_INFO)
{
	npc         = BDT_1050_Landstreicher;
	nr          = 999;
	condition   = DIA_Landstreicher_EXIT_Condition;
	information = DIA_Landstreicher_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Landstreicher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Landstreicher_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Landstreicher_HALLO		(C_INFO)
{
	npc		 = 	BDT_1050_Landstreicher;
	nr		 = 	5;
	condition	 = 	DIA_Landstreicher_HALLO_Condition;
	information	 = 	DIA_Landstreicher_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Landstreicher_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //��� ����������?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //��� �� ������ � ����?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //�� ��� ������ �����, ��� �������, ��� ����� ��������� �������� �����.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "��� ����� ����.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "� ���� ������ �������?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "��� ��� �� ������?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //� ���� ������ �������?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //��� ����. �����, ��� ��� ����� �������.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //� ��� ��� ���?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //�� ��� ����� �� ������ �� ���� ���������� ����������� �� ���������.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //������ ��������, ��� ������, ��, ��-�����, � ���� ������ �� ��� � ������� � �������.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //������ �������� �� �� �������� �������. � �� �� ����� ���� ��������� �� ����� ����� � ����� ������. (�������)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "���������� ����. � ��� ��� ����������� � ���������.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //���������� ����. � ��� ��� ����������� � ���������.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(�������) �� ��, �������. ��� ��������� ���-���.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //������ �������. ������ � �����. �� ������� �������, �� ���� ����������� ����.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "���-������ ������ ������� ���� ������� �������.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //���-������ ������ ������� ���� ������� �������.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //�����, �� ��������. �� ���� �� ��� �� ������ ���������, �� �����.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //������ ���, �� ��� ��, ����������, ��������.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //��� ����� ����.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //��. ��� �������.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info WASMACHSTDU
///////////////////////////////////////////////////////////////////////
instance DIA_Landstreicher_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BDT_1050_Landstreicher;
	nr		 = 	6;
	condition	 = 	DIA_Landstreicher_WASMACHSTDU_Condition;
	information	 = 	DIA_Landstreicher_WASMACHSTDU_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� �� ������� �����?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //��� �� ������� �����?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //�� ������� ������� ����� ��������, ���������.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //������ ������ ��������, � ������� �� ������� ������, � � �������� ���� ��� ���� �����.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //� � ��������� ������, ��� �� ���� ����.

	AI_StopProcessInfos (self);
};












