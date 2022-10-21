// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Dar_EXIT (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 999;
	condition   = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Dar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Dar_Hallo (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent   = FALSE;
	description = "��� �� ������?";
};

FUNC INT DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Dar_Hallo_15_00"); //��� �� ������?
	AI_Output (self, other, "DIA_Dar_Hallo_03_01"); //������ ����������?
	
	Info_ClearChoices (DIA_Dar_Hallo);
	Info_AddChoice (DIA_Dar_Hallo, "���.", DIA_Dar_Hallo_Nein);
	Info_AddChoice (DIA_Dar_Hallo, "�������.", DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_00"); //�������.
	CreateInvItem (other, itmi_joint);
	B_UseItem (other, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_01"); //�������, ��?
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_02"); //��� �� ���� ��� �����?
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_03"); //(����������) � ���� ���� ���������.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Nein_15_00"); //���.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Dar_einmal; 

INSTANCE DIA_Dar_PERM (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 2;
	condition   = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent   = TRUE;
	description = "�� ���������� ���-������ ����� ����?";
};

FUNC INT DIA_Dar_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_PERM_Info()
{
	AI_Output (other, self, "DIA_Dar_PERM_15_00"); //�� ���������� ���-������ ����� ����?
	
	if (Dar_LostAgainstCipher == TRUE)
	&& (Dar_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_01"); //(�������������) ������ � �������� ������ ����������� �������� ���������� ������ ��� �������...
		Dar_einmal = TRUE;
	}
		else //DEFAULT
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_02"); //�� �� ������.
	};
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************

INSTANCE DIA_Dar_WannaJoin (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 3;
	condition   = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent   = FALSE;
	description = "� ���� �������������� � ���������. �� �� ����������?";
};

FUNC INT DIA_Dar_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	&& (other.guild == GIL_NONE)
	&& (Dar_LostAgainstCipher == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Dar_WannaJoin_15_00"); //� ���� �������������� � ���������. �� �� ����������?
	AI_Output (self, other, "DIA_Dar_WannaJoin_03_01"); //��� ��� �����.
};

// ************************************************************
// 			  				DuDieb
// ************************************************************

INSTANCE DIA_Dar_DuDieb (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent   = FALSE;
	description = "����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...";
};

FUNC INT DIA_Dar_DuDieb_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat)) //von Diebstahl geh�rt
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_DuDieb_Info()
{
	AI_Output (other, self, "DIA_Dar_DuDieb_15_00"); //����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...
	AI_Output (self, other, "DIA_Dar_DuDieb_03_01"); //(������� ��������� ������������ ������)
	AI_Output (other, self, "DIA_Dar_DuDieb_15_02"); //�� ������ �� ������ �� ����?
	AI_Output (self, other, "DIA_Dar_DuDieb_03_03"); //(����� �������) ���.
	
	Dar_Verdacht = TRUE;
};

// ************************************************************
// 			  				WoPaket
// ************************************************************

INSTANCE DIA_Dar_WoPaket (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent   = TRUE;
	description = "��� ���?";
};

FUNC INT DIA_Dar_WoPaket_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WoPaket_Info()
{
	AI_Output (other, self, "DIA_Dar_WoPaket_15_00"); //(���������) ��� ���?
		
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{	
		AI_Output (self, other, "DIA_Dar_WoPaket_03_01"); //������, ������, ������. � ������ ��� ������-�� ������ � ������.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_02"); //��� ���� � ������. � �� �����, ��� �� ��������.
		AI_Output (other, self, "DIA_Dar_WoPaket_15_03"); //�����, ���� ����� ��� ���� ������� ��������?
		AI_Output (self, other, "DIA_Dar_WoPaket_03_04"); //���� ������, � ��� ���������� � ����. � ���������� �� �����������, ��� ���� ������ ��������.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_05"); //��� ���� � ������ ����� �����������������. ��� ���, ��� � �����.
	
		Dar_Dieb = TRUE;
		B_LogEntry (Topic_CipherPaket,"��� �������, ��� ����� ��� � ������. �� ������ �� � �������� �������� ��������, ����� �����������������.");
	}
	else
	{
		AI_Output (self, other, "DIA_Dar_WoPaket_03_06"); //��� � ���� �����?
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************

INSTANCE DIA_Dar_AufsMaul (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 5;
	condition   = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent   = FALSE;
	description = "� ������ ��� ���������� �� ����!";
};

FUNC INT DIA_Dar_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_AufsMaul_Info()
{
	AI_Output (other, self, "DIA_Dar_AufsMaul_15_00"); //� ������ ��� ���������� �� ����!
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_01"); //����������. � ������� ���������, ����� ������� � �����!
	B_GiveInvItems (self, other, itmi_joint, 1);
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_02"); //���, ��������!
};

// ************************************************************
// 			  			Kameradenschwein
// ************************************************************

INSTANCE DIA_Dar_Kameradenschwein (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Dar_Kameradenschwein_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] == FALSE; //geht NUR bei ECHTER Important-Info!
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Kameradenschwein_Info()
{
	AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_00"); //������! �� ������ ������, ��� � ���� ��� �����!
	if (Npc_KnowsInfo (other, DIA_Dar_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_01");  //� �� �� ��� �� ���������� �� ����.
	};
};

// ************************************************************
// 			  				Pilztabak
// ************************************************************

INSTANCE DIA_Dar_Pilztabak (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 6;
	condition   = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent   = FALSE;
	description	= "�� �����-������ �������� ������� �����?";
};

FUNC INT DIA_Dar_Pilztabak_Condition()
{
	if (Npc_HasItems (other, Itmi_Pilztabak) > 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Pilztabak_Info()
{
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_00"); //�� �����-������ �������� ������� �����?
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_01"); //������ ���������. ��� ��� ����.
	B_GiveInvItems (other, self, Itmi_Pilztabak, 1);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_02"); //���, ���������...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_03"); //�� �����-������ ����� ��� ���?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_04"); //��...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_05"); //����� ��� ���?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_06"); //��� ���� �������...
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_07"); //��, ����!
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_08"); //������ �����!
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_09"); //��� ������ ������� ������! ���� � �� ������� ���������!
	B_GivePlayerXP (XP_Ambient);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Dar_KAP3_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP3_EXIT_Condition;
	information	= DIA_Dar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
}; 
                      
FUNC INT DIA_Dar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Dar_KAP4_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP4_EXIT_Condition;
	information	= DIA_Dar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orcring
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_ORCRING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_ORCRING_Condition;
	information	 = 	DIA_Dar_ORCRING_Info;

	description	 = 	"������, ����� ��������� �������.";
};

func int DIA_Dar_ORCRING_Condition ()
{
	if (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Dar_ORCRING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_15_00"); //������, ����� ��������� �������.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_01"); //�������. ��� ���. ������� ������ ����� ������, � �� ���� � ����� �������� �����.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_02"); //��� �������. � ���� ����� ������ ������ �������� ���� � ��������� �������� ��. ��� ����� ����� ������� ���-������ �������.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_03"); //���� � ����� �������� ��������������, ��� ������������� ������ ������, ��������, � ���� ����� ����� ����� �� �������������� ��.

	Info_ClearChoices	(DIA_Dar_ORCRING);
	Info_AddChoice	(DIA_Dar_ORCRING, "���� ��� �� ����������.", DIA_Dar_ORCRING_no );
	Info_AddChoice	(DIA_Dar_ORCRING, "������ ������? ��?", DIA_Dar_ORCRING_necken );
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Dar_ORCRING, "��� ��� ������ ���������?", DIA_Dar_ORCRING_wie );
	};
};

func void DIA_Dar_ORCRING_necken ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_15_00"); //������ ������? ��?
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_01"); //(������) ��, �����, ��������. ��-�� ������ ��� �����?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_02"); //�����-�� ������� ���������� �� ������. ���� ������ ������ �� ������.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_03"); //�� ����� ����� ���� ���� � ��� ������ ��� ���� �������.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_04"); //���� �� ������ �������� ���� ����� ���������� �����? ������ �� ����.
		}; 
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_05"); //� ����, ���� ��������, ��������� ���� ����� - ������ ��, ��� ��� �����, ����� ��������� �������� �� � ��� ������.

		Info_ClearChoices	(DIA_Dar_ORCRING);
		Info_AddChoice	(DIA_Dar_ORCRING, "� ���� ��� ������� �� ��� ����.", DIA_Dar_ORCRING_necken_no );
		Info_AddChoice	(DIA_Dar_ORCRING, "�����. ��������.", DIA_Dar_ORCRING_necken_schlagen );
	}
	else
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_06"); //�� �������. � ����� ������ ���������� ����������� �� ��.
	};
};
var int Dar_FightAgainstPaladin;
func void DIA_Dar_ORCRING_necken_schlagen ()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_schlagen_15_00"); //�����. ��������.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_schlagen_03_01"); //��, � �� ���� �����.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Dar_ORCRING_necken_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_no_15_00"); //� ���� ��� ������� �� ��� ����.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_no_03_01"); //�, ��. �� �� ������ ����������, ��� � ��� ������. ����. � �����, ��� � ���� ������ ��������.
	AI_StopProcessInfos (self);
};

func void DIA_Dar_ORCRING_wie ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_wie_15_00"); //��� ��� ������ ���������?
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_01"); //� �� ���� �����. �����-������ ������ ����� ������ ������� ��.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_02"); //���-������ ����� ������� ������ �����, �� ��� ���-�� �����. �����, ���������� ������� ��� ������, ��, �� �����.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_03"); //� �� ����� ���������� ����������� ��� �����. ��� ��������.
	
	Log_CreateTopic (TOPIC_Dar_BringOrcEliteRing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing, LOG_RUNNING);
	B_LogEntry (TOPIC_Dar_BringOrcEliteRing,"��� ����� ����� ������ ������ � ����� ���������. �� ����� ���������� ������ �����. �����, ���������� �������, ������, ��� ��� ���-������."); 

	MIS_Dar_BringOrcEliteRing = LOG_RUNNING;
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_no_15_00"); //���� ��� �� ����������.
	AI_Output			(self, other, "DIA_Dar_ORCRING_no_03_01"); //(������) ������� ���. � �� ����� ��������, ���� �� ��� ���� �� ���.
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

///////////////////////////////////////////////////////////////////////
//	Info FightagainstPalOver
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_FIGHTAGAINSTPALOVER		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important	 = 	TRUE;
};

func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition ()
{
	if 	(Dar_FightAgainstPaladin == TRUE)
	&&	((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
				return TRUE;
		};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info ()
{
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_00"); //������, � ����, ��� �� �� �������� ����������, ���� � ����� �������� � �����.
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_01"); //� �� ���� �������� ���� ����� ������. ��� ��� ������� �� ����, ������?
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringOrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_BRINGORCELITERING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_BRINGORCELITERING_Condition;
	information	 = 	DIA_Dar_BRINGORCELITERING_Info;

	description	 = 	"� ������ ������ �����, ������� �� �����.";
};

func int DIA_Dar_BRINGORCELITERING_Condition ()
{
	if (MIS_Dar_BringOrcEliteRing == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	&& (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
				return TRUE;
		};
};

func void DIA_Dar_BRINGORCELITERING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_00"); //� ������ ������ �����, ������� �� �����.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_01"); //��� �� ��� ������ ���?
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_02"); //������ ������������ �����.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_03"); //�� ��, � ����� ������... ��� �� ������ �� ����?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "��� �� ������ ���������� ���?", DIA_Dar_BRINGORCELITERING_was );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "������� ��� �������.", DIA_Dar_BRINGORCELITERING_geld );
	};
		
};
func void DIA_Dar_BRINGORCELITERING_geld ()
{
	
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_00"); //������� ��� �������.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_01"); //���. 600 ������� �����?
		AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_02"); //���?
	};

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_03"); //�����. � ��� ���� 1200 �����.
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_04"); //������� �� ��� ������ ���� ��� ������.
	};
	
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "����� ������������.", DIA_Dar_BRINGORCELITERING_geld_no );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "������������.", DIA_Dar_BRINGORCELITERING_geld_ok );

};
func void DIA_Dar_BRINGORCELITERING_geld_ok ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_ok_15_00"); //������������. ����� ������.
	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_ok_03_01"); //�������. �� �������� ��������, ��� ������ ������ �� ����.

	CreateInvItems 		(self, ItMi_Gold, 1200);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 1200);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_no_15_00"); //����� ������������.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_no_03_01"); //� � �����, ��� ��� ������� �����. ���� ������ �� �������� ���. �� ���� �������.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_15_00"); //��� �� ������ ���������� ���?
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_01"); //���� ������� ������, ���� ���� ������, ������� �... ��, ������, �������� �������.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_02"); //�� ������� ���� ��������. � ��� ��������� ���.

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "������� ��� �������.", DIA_Dar_BRINGORCELITERING_geld );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "����� ��� ������.", DIA_Dar_BRINGORCELITERING_was_am );
};

func void DIA_Dar_BRINGORCELITERING_was_am ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_am_15_00"); //����� ��� ������.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_01"); //�������. ����� �� �������� ���� �������. ������ ����� ��� ��� ������.

	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	CreateInvItems 		(self, ItAm_Dex_01, 1);									
	B_GiveInvItems 		(self, other, ItAm_Dex_01, 1);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_02"); //������ � ��������.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Dar_KAP5_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP5_EXIT_Condition;
	information	= DIA_Dar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Dar_KAP6_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP6_EXIT_Condition;
	information	= DIA_Dar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dar_PICKPOCKET (C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 900;
	condition	= DIA_Dar_PICKPOCKET_Condition;
	information	= DIA_Dar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Dar_PICKPOCKET_Condition()
{
	C_Beklauen (67, 35);
};
 
FUNC VOID DIA_Dar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dar_PICKPOCKET);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_BACK 		,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};
	
func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};












































