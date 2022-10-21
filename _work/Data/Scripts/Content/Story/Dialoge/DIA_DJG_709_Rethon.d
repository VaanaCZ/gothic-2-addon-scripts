///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"��� �� ������� �����?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //��� �� ������� �����?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //��������� � ��������, ��� �� ���?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"� ��� �� �������� ���������?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //� ��� �� �������� ���������?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //� ���� ������� �� ��� ��������� � �������� ���� ������ �������, ��� ���� ������.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //�����. � ���������, ������� ��. � �� ��� �������?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"�������� �� ������ ����, ��� �� �����?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //�������� �� ������ ����, ��� �� �����?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //����. � ��� ������ ������ ��������. ����������� �� ��� ����, ��� ������ ����.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //������ ��� � ��� �� � �����. ��� ������ �� �����.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //� ���� �������, �� ������ �������� �� ��� �� ������ ����������� ������, ������� ��� ��������� �����.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //����� �������� ���� ����� �� ������ ������.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"�� ������ �� ����� ������?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //�� ������ �� ����� ������?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //���� ������? � ���� ��� ������. � ������� �� ��������.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //���� � ������� ����� ��� ������, ����� �� ������, ����� � ����� ����. ������� � �� ���� �� � ��� ��������.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"�� ��� ����� �������?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //�� ��� ����� �������?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //���. � ���� �������� ���� ������ � �������, ������ ��� ���������� ��������� �� ����.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"� �� �� �������, ��� ���-������ ����� ���� ���������?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //� �� �� �������, ��� ���-������ ����� ���� ���������?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //���? ���? �������?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //���� ���� ������������� ������, ��� ��� ����� ���-�� ������, ��?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //� �� �� ����� �������. � ������� ��� �� ����.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //��. ��� ������. ������ � ���, ��� � �������.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //�� ����� ���� ������ ������, ��� �� ������ � �����?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //������� ������ ����������, ���� ��� ������� ��������� ������ �����.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //�� �������. �� �����.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //� ���.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "������, �� �� ��������-�� ������ ���.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "� ��� ������ �������?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "������� ��� �����?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //������� ��� �����?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //�����, � �����, �� ������ �������? ��, ���. �� ����� �������.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //�� �������� � ����������� ������� �����, � ����� ����� �����.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //������, �� �� ��������-�� ������ ���.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //��� �� ������ ���� ������� - ������? ���� �� �����, ���� �� � ��� ������ �� ����.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //� ������� ��� ������. ��� ����� ����, ������� ���� �� ��� � �� ������ ��������.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //��� �� �� ���. � ������� ����.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //� ��� ������ �������?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //�������� ��������, ���-�� � ������� ������� �� ������. ��, �� ������, ����� ������� � ������� �� ���� ��������.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //�� �� ����� ����� � ������ �������, ����� �� ������� �� ����. ���� ������ �� �����, ���� �� �����.

	B_LogEntry (TOPIC_DRACHENJAGD,"������� �� �������� ����� �������� ���-�� � ������� �������."); 
	B_LogEntry (TOPIC_Dragonhunter,"������� ��� � �����, � ����� ���������� �� ������ �������� �������.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"�� ������ ������ ��� �������� ��� ������?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //�� ������ ������ ��� �������� ��� ������?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //��������? ����� ���� ���-������ ����� � ������� ���� ����, ��� �� ������ � �����.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //��������, � ���� �������� ���-������ ��� ����. ���� ��� ���������?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"��� �� ������ ������� ���?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //��� �� ������ ������� ���?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //��, ��� ����� � ���������! ������ � ���� ������ ��� ������ ��������!
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //� ���� ���� ��� ���� ��� ����, �� ��� �� �� ������ ���������.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //�����, � ���� ���� ������ ��, ��� ���� �����, ��������.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};


