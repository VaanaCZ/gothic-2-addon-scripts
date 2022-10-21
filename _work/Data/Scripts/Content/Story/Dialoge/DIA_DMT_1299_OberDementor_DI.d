///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //��� �, ��������� �����, �� ������������� ��������� ����� �� ����� �������.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //��� �� ����� ���� �����������?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //� ����� �������� ��������. ����������� ��������� ������ ������� �� �����. ������������ ���� ���������� ����� ����� ��� ����.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //���� ��� �����, � �� ����������� � ������ �������.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //�������. ������, ��� �������� ���������� ��� �� ����� �����.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"� � ��������� ����. ������ ���, ������, ���� � ���."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "������ ���� � ������ �������.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "� ������� ��� ���� �������� ��� �������� �����?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "� ��� ���������� �� ��� �������� ��������, ��� ���?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "��� ���� ������?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "�� ��� �������������� �������.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //��� ���� ������?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //�� �������� ����� ������. ��� ������������ �������� ���������� ���.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //�� ��������� �������. �� ���, ��� ��������� ����������� �� ���������� �������������� ������.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //�� ����� ������ ����, ��� ����������� � ��� �������.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //�������� �����.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //� ��� ���������� �� ��� �������� ��������, ��� ���?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(�������) ����� ����� ���������� ��������� ������������ ��� ����. � �� ��� ���� ����������� ������� ��� �����.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //�� ��� �������������� �������.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //��� ���� � ������� �������. ���������� ������ ��� �����. ������ ����� �� ��������� ���.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //���������� ������� ��� ����������� ��������� ���� ������ � ����, �����������.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //� ������� ��� ���� �������� ��� �������� �����?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //��� �����. �� ���� �� �������������, ��� ������������� ��, ��� ���� ������� ���� �������.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //�� ����� ���������� �� ���� �����, ����� �� ������� � ���� ���.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //����� ���������� ��� �� ��������, ���������� ���� �������� ����. ��� ���� �����, � ���� �����, ����� ��������.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //��.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(���������) ������ ��������! � �������� ����.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //���� ���� ��������, � ���� ��� ������� �� ����.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(���� ��� ���) ��� ����� ������� ������ ��� � ���� �� ���� ������� �������� ������.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



