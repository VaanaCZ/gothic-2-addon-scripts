///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"� ���� ���� ������������?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //� ���� ���� ������������?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(��������) ��� ��? �� �����, ��� ��� ��� �����-������ ��������� ������� ���� ����.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //�� �������, ���� ����� ����� ����������. ��������� ����� ����� �� ���� ������ ������ ������� �  ���� ����.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //� ������� ��� ����, � ���� ������� ������ ��� ��������� ������, ��� ��� �� ������� �����������.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"��� �� ������� �����?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //��� �� ����� �������?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //��� ������ - �������� ��� ����� ������ �� ���������� �����.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //��������� ������, ����� � ����. �������� ���� �������� ������� ��� ���������� ���������.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //��� ����� ������, ���������� �� ������� ��������� �����, � ����� ������� ��� �������� �� ����, ��� ���������.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //� ��� �� ��������� ����, ������� �������� �� � ��������, �� � ����� � ���� �������� ���: ������� ���� ���� ����������.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"�������� ��� � �������� �������.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //�������� ��� � �������� �������.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //������� � ������� ���� �� ����. � ���������, ��� �������� �� ����������. ������ ��� �� ������.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //����� �� ������ ������ ����, ��� ������ �� ���.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //���� ������������� ������ ��� ������� �� ��������. �����, �� �������� ��� ���� ����� ������.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //������ ���� ������ ������� �������� �� ����, ����� ��� ���������� ���� ������������� ��������.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"�� ������ ������� ��� �����-������ �������?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //�� ������ ������� ��� �����-������ �������?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //������ �� � ���? ���� � ��������� �����, �� � ����� ��� ���� ����.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //����, ��� ���� �����?

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
