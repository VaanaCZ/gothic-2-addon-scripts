//---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_EXIT   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 999;
	condition   = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Scatty_EXIT_Condition()	
	{
		return TRUE;
	};
FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine (self, "START");
		Scatty_Start = TRUE;
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Scatty_PICKPOCKET (C_INFO)
{
	npc			= BDT_1086_Addon_Scatty;
	nr			= 900;
	condition	= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information	= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen (60, 90);
};
 
FUNC VOID DIA_Addon_Scatty_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
	
func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Hi   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent   = FALSE;
	description = "��� ��������?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//��� ���� ����?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//� ��� ��� ��� �������� ���� �������, ����������� �� ��� �����.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//������ ������ �� ����� ����, ������� ��� ������ �������� ������. �� ������� ��������.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//�������� �� ������� �����������. (��������) � ���������, ������� �� �����������, �� ��� ����� � �����.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"������ ������� ��������� ������.");
};
/*
	Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln. 
	(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf-  oder ein Abstieg? 
*/
//---------------------------------------------------------------------
//	Info last
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_last   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent   = FALSE;
	description = "�������? �� ������ ���������?";
};
FUNC INT DIA_Addon_Scatty_last_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_last_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//�������? �� ������ ���������?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//�� ������� �� �����. �� ��� �� ����� ������� �� ����������. ����������� ������� �� �������� � ����� � �������.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//'����� �������' - ��� ��� �����, ���� ���� ������?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//��������� ��� � ����� ���, ����� �� ������� �� ��������...
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(������) ...���� ���, �������! ��������� ��� ���, ����� �� ������� ����� �������� ������.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//� ������� �� ������, ��� ����� ���������� ������.
};
//---------------------------------------------------------------------
//	Info Gruft
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gruft   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent   = FALSE;
	description = "� ��� ��� �� ��������?";
};
FUNC INT DIA_Addon_Scatty_Gruft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//� ��� ��� �� ��������?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//���������, ������� ��������! �� ��������� ����� ��������� ������!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//���������? �� ������ � ���� ����� �������� �������? ������� � � ������� �������?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//� ��������! ��� ������� �� ������ ����� ������ ��������.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//� � ������ ������ ����, ��� ����������� �������� - ������ ����.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//�� ����� ��� ������ ������� ����� ������ �����. � ����� �������� ���-���� ���������, �� ����� ���� �� ������ �����������.
};
//---------------------------------------------------------------------
//	Info GruftAgain
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_GruftAgain   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent   = FALSE;
	description = "��� ������ ����� � ��������?";
};
FUNC INT DIA_Addon_Scatty_GruftAgain_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gruft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//��� ������ ����� � ��������?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(����� ���������������) ��... �� ����� ���������. �� ����������� ��� ������ �����, ��� � �����-�� ����.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//�� ��� ����� �� ����������. � � �����-�� ������ ��� ����� �������� ��� ������.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//�����-�� � ����. ��� ��������� � ��������?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//��... �-�... ���-�� � ���� ����� ���������...
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//��, ������, �� ������. ��� �����, ��� ��� ������ ��� �����?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//�����. (�������� ����) ��... �� ����... �������� ����-��. �� ���������� ����� �� ����� �����.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//����� ���� �������� �� ��������, � � ������� �����, ������� ������� ���� �� ������ - ������������ �����.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//� �����?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//��� ���, ��� � ����. ����� ����� ������� ����� �� �������� � ������, ����� � ����������. ��� � � ������.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//����� �������� ����� ����� �� ������ ������ �������� � ����. � � ��� ��� ����� �� ����� ������.
};
//---------------------------------------------------------------------
//	Info Trinken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Trinken   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent   = FALSE;
	description = "������ ������?";
};
FUNC INT DIA_Addon_Scatty_Trinken_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Scatty_GruftAgain)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//������ ������?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//������ ��... ����. �� ���� �� � ������ ���� ����.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//��, ����� ����, � ����� ���� ���������...
};
//---------------------------------------------------------------------
//	Info Bier geben
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Bier   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent   = FALSE;
	description = "�� ���� ��������. (���� ����)";
};
FUNC INT DIA_Addon_Scatty_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems (other, ItFo_beer) 
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Bier_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//���, ����������.
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//�, �������, ��� ������. �������. �� - ��� �����.
	
	B_GivePlayerXP (XP_Ambient* 5);
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gold   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Scatty_Gold_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//������ ����� � ���� � ������ �� ������� ���� - ������ ����� ��� �������.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//��, ���� ��� �������, ���������� ����� ����������. ������� ������ ������ ����, ������� �������� � ���� ����.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//� ����� ���������� ���� ������, ����� � ���� ����� ������ �����.

	B_Upgrade_Hero_HackChance(5);
};
//---------------------------------------------------------------------
//	Info teach
//---------------------------------------------------------------------
var int Scatty_teach_perm;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_teach   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent   = TRUE;
	description = "��������� �������� ������ (2 LP/10 ���������)";
};
FUNC INT DIA_Addon_Scatty_teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//�������� ��� ��� ���-������ � ���, ��� ������ ������.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//� ������ ������� �� ������ �����, ��� ������ - ��� �� ����. ��� ������, ��� �����. ���� �� ������� ������� ������, ��� ����������.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//� ������� �������� ���� ���� ������, ����������� ��� �������� ��������� �� ������.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//� �������� �����, ��� ������ � �������� ������ �������� �� �������� ��������.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//����� �����, ���������� - ���� ������. ������ ������� �� ������� ������� ���������.
		
		other.lp = (other.lp -1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};

//---------------------------------------------------------------------
//	Info tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_tot   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent   = FALSE;
	description = "������� �����.";
};
FUNC INT DIA_Addon_Scatty_tot_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_tot_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//������� �����.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//��, ���� �� ��� ����� �����, ���� ������ � �� �����... �� ������� ������� ����� ������.
};
//---------------------------------------------------------------------
//	Info trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_trade   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Scatty_trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};


