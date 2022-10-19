// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "� ���������� ����������� � ����! (�����)";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //� ���������� ����������� � ����!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //������! � ��� ����: �� ������ ������, ��� ������������ �� ����. �, ������ �����, �� ������ �� ���� �����!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //� ��� ���, ��� � ������ �� ���, ���� ���� ������� ���� ������� - � ��� ����� ������.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: mu� auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //�������-��! (���������) � � �� �����, ��� ��� � ����� ��������� ����������� �����.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //� �������� ���� ���, ����� ��� ������ �������� ��� ����� ������.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //��� ��� � ����. �� ����� ������ ��������� ����� ����� ��������. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //� ��� ����� ���������, ��� �� ����� �������� ���� ��-��� �������� �����.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //�� ������ �� ����. ������-�� �� �����.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //� ��� ���� ������� ����� ������.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "�� ������� ����, � ��� ������ ���������� �������. ������ ���������.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "��� ��� �� ����� ������, � ������� �� ��������?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //�� ������ ����� �� ���������! ��� ������������ ������ ���������� �������.
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //�� ������� ����, � ��� ������ ���������� �������. � ������ ���. ������...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //...��� ������. �� ������� ���, ��, ��� ��� - �� �� � ����� ����� ���������� �����, ������� ����������� ������.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //����� ���������, �������� ������, ������ ������ � �������� ����� ����.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //��� ��� ������ ���� ��������� ����. ����� ����, �������� ��� ��� ������� ������������.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //��� ��������� �������� ����: �����! � ��� �����. ���. ���� �������.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(���������) �������!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //��� �������� ������� ����. � �������� �� ����������� - ���� �����.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //� ��� ������� ������ ���� ����� ����� �� ������ �������.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //� ��� ��� ����� ������?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //������ ���� ����� ��������� �������� ������, � ������ �������� ����� ��������, � ��� ��������� � �����.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(���������) � ��� ����� ���� �������.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //�� ��� ��� �� ���. ���� ��� ���-���, ��� �������� ���. �� ���� � ����� ���� �������.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "� ����� ������  ������ �� ��������?", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"����� ����� ��������� ������� ������ ����!";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //����� ����� ��������� ������� ������ ����!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //���� �� ������ ������, ��� ����� ���� �������� ���� ������� � ���������.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //��� ������ ������ � �����, ������� �����, �� ����� ���������� �� �� ����, ��� ����� ���� ����� ��������� ������������.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //� ��� �� ����� ������� ����� ��� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"��� �� ����� �������?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //��� �� ����� �������?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //�� ���� ��� ����� ��� �� ����������. ������ ���� ������ ����� ������ ��� � ������ ������ ���� ��������.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //� ������ �������, ��� ���������� ������, ����������� ����� ���������.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //��� �������� ������� ����������, ������� ����� ������ ��� �������� ���� ��������.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //��� �������� ��� '���� ������'. �� ������ ��������� ���� ����������.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //�������� ��������� � ������������� ������. �� ������ ������� �� ������������ ���������� ���!
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //� ����� ����� �� ������ ����� �������� �������.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //��� ����������������� ����� ������. �� �� ������ ������� � ���� ���.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"� ������ ������� ������������ ����� ���������. ��� �������� ������� ����������: ������ ������. ��� ���� ������ ������ ��� ���������� �� ��������. � ������ ������� ���������, ��� ��� ����� ���������� ���� ������."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"��� �� ������ ������� �� ���� �������� ��������?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //��� �� ������ ������� �� ���� �������� ��������?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der H�hlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //������� � ����������, ��� ��� ���������� ��������, �� ����� ������ � ������, ��� ������� �������� ��� �� �����.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //� �� ���� ��������� ������������ ������� �� ��������, �� ������, ��� ��������� � ������� �����-�� ������� ��������.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //���� ������, ������ ������� �������� ����. ��� ��� �� � ����.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "���� ���� ����� ������, ������� � ��������������� ����� �������...";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //���� ���� ����� ������, ������� � ��������������� ����� �������...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //��� ���������...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //��� ������ �� ������� ���-������, ��� ������������� ������ ��� ������, ��� ��� �����!
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //���-�� ��� ����� ���� ������� �������� �������. �� ������ ����� ���!
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "������ ���� ����������� ����� �������...";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //������ ���� ����������� ����� �������...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //���� �� ���������� ������. �����������, ���� ������� ���-������ ������������� ��������.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "� ���������� ����������� ����� �������...";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //� ���������� ����������� ����� �������...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //� ��� �� �����?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //��� ��������� ���, ��� � ��� ���� ����� ������ �������.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //������ �������?! ��� �� ������? �� � ���� � �����?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //��, ��� ��.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(�����) ��� ���������...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //��� ������ ����� ��� ����� ������. �� ��� ����� � ����� ������.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //���� ����������! � ����� �������, �� ������� ������!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //� ���� ��� ������ ���...
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //� ����� ��� ����� ����, ����� ��� ������� ��� � ����...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(������) �� ����� � ���?! �� �� ���� �� ���������, ��� �� �����?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //��� ������ ����� �� ��������� ��� �������� ������!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //� �����, ��� � ������ ���������� �����.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(��������) ���� ����� ������������...
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"��� ����� ������.";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //��� ����� ������.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //� ���� ���� ���� ������ �� ��������, ��� � ���� ���� �����.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //�������� � ���� �����. �� ������ ����� ���, ��� ��������� ���� ��������.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"� ��� ����� ���� '���� ������'?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //� ��� ����� ���� '���� ������'?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //��� ������. ������� ������, ��� ��� ����� ������ ����� ����� ���� � ���� ������.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //�� ����������� ����� ����� ���������� ���� � ������� ��� �������� ��������.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //����� �� �������� � ������� �������� �������������. � �������� ���� ������, ����� ���� ������ ����� � ���� � �����.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"� ������ �������� ������ ������ ��� ���� ���� ������?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //� ������ �������� ������ ������ ��� ���� ���� ������?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //������ ��� �� ���, ���� ������� ������������� ������ ���.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //� ������ ���� ��� ��������?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //���� ��������� ������ �������� ���. ��� ����� ������ �� ���: �� ������� �������. ���� �� ���� �� ����������� ����, �� �� ����� ��� ��� �����.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //�����������, ��� �� ����, � ��� ������������� ������������� ������ ���� ������. � ������ �������� ������, ��� ��� ������?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //���� ��� �������� ����, ��� ����� ������ ���. ����� �� �������� ���, ��� �������� ��������� ���������.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"� ��� ��� ��������� �� ������?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //� ��� ��� ��������� �� ������?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //������ ��� �� ��������, ������� ������ ����� ����. ����� �������, �� ��� �� ����������.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //�� ���� ���������! ���� � ����� ����� ����������. � �� ������ ������ �� ��� �����, ��� ��� ������.
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ��� ������ �� ������ ���������?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //� ��� ������ �� ������ ���������?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //��� � ��� ������, ���������� �� ������ �������.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //� �������� ��� ����� �����.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //�� ���� ������ ����� ��������� ����, � ��� ��� ��� �� ���� � ������ ��������...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //�����, ������� � ������ ��� ������������� ��� �����, ��������� ����������� ������...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //��, ������ �� ���.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ��� � ����� ����� ���������� �������?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //� ��� � ����� ����� ���������� �������?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //��������� �����, ��� �� ������� ��������� ��������� ������ � ������� - ����� �������.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //�� �����, � ������, �� ������� ����� �������� �����, ������� ������� ����, ���� �� ������ ����� � ���.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //������ ����� ������ �� ���� �����? ������ � ������ ����� ��������� ������.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"�� ��� ��������� � ��������?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //�� ��� ��������� � ��������?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //��, � ������ ������� ��� ���������. �� ������ ���� ���������� ���, �� �� ��������� �������.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //��� ����� ����, ��� ��� ������� ������. � �������� ��� � �������.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //��� �� ��������� ����?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //�����, ��� ������ ��������. �� ����� �� ������ �������, �� ��� � ����� � ������ ������ � ����������.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //�?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //���� ��� ���� ����������, �� �� ����������� ����� ������������ ������.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //� ��� ��� �� ��������. ���, ������ ��� ������. ��� ������� ���� �� �����.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ��� � ������...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //� ��� � ������...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //�? �� ���� ���������� � ������������� ���������?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //���� � ���� �� ���������...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //����! ������ ���� ������ ��������� � ���.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //���� ��� ��������� �� ���������, ������ � ��������� � ����� �����.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //���, ��������, ������������ ����� � ����� ������ ������, �� ��� ���� ���� ��, ��� ���� �����.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //���� �� ������ �����, ��� �������� ����������� � �����.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ��� ��� ������ ������?";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //� ��� ��� ������ ������?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //�� ������ ����������� �������� ������ �����. ������� ���� ���.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //�� ������ ������ ���� ������, � � ���� ���������� ������ ������.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "������ ���� ���� �� ������ ����� � ����?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//������ ���� ���� �� ������ ����� � ����?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//�����-�� � ��� ������ ������ �����. ���� ����� � ����������, ��� ������������ ����� ����� ���� ������ � ����� ����������� �������.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //�� ��� ���� �� �� ��� �� ������� ��������� ������ ����� ����������� ����� ����.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //������� � ������� ����, ����� ������� ������ �����.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //��� ������������, �������� � ������ ����� ����, (����������) '����������� ������', ������ ����� '������' � '��������������', ������� �� ����� ����������.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //��� �������, ��� � ��� ��� ���, �� ��� ������� �� �����, ��� ������ ���� - � ��� ������.
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

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"� �������� �� ������ ��������.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //� �������� �� ������ ��������.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //����� �� ����. � ��� �� ��� �����?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //�� ��� ����. ��� ��� ����� �������, ���� ������ ������ �����.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //���� �������� �����, � ������� ���������� ��� ������.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //�������� �������, ������ ��� ��� ������� �� �������, ���� � �� ��������.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"���, ���� ������, ��������� �����?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //������ ������, ��� �� ����� ������ ���� ��� ����� �������.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //���, ���� ������, ��������� �����?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //���� �����, ��� �� ��������� �� ����� ����, � ��������� ��������� ������ ������.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //�� ��������� ��� ������. ��� ��������� ��� ����� �� ���� � �������� �� �������� �����.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //���� � ������ ��������. ����� ��� ����� �� ����, ������ ����� ����� �����. �� ������ ��� ���������� ������� ��������.

	B_LogEntry (TOPIC_INNOSEYE, "����� ������ ��������, ��� � ��� ���� ������. ��� ����� ��������� ����� ���, ���� ��� �� ������� ������.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "���� ��������� ���� � ������ �������.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "�, �������, ����� ��������������, ��� ����� ������.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //���� ��������� ���� � ������ �������.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //� ����� ����� �������. ������ - ���� �� ���. ��� ��, ��� �������������� �������� ��� �����.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //��� ������ ������� � �������������� ������, � ������ ������ ���� ����������� ���������� �������.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //������� �� ��� ��������. ��� ������� ����, � ��� ���������� �� ��� �� �� �� ����� ���������� ����.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"������� ����� ��� ����� ��� ���� � ������ �����. ������ ������ ������  ���������� ���� � � ��������� �����, � ��� ����� ������."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //�, �������, ����� ��������������, ������� �������� �� ���� ���� �����.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //��� ��� �� ��������������?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //� ������� ������ �� �������, ������������ ��������� � ������ ��������. � ��� �� ������ � ������������.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //����� ������ ���� ����������, ����� ������� ������������� ��������. �������.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "� ����� ����� ��� ��������� ���?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //� ����� ����� ��� ��������� ���?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //��� � ������ ����� ������ ������ �� �������, � ������� �� ����, ����� �� �������� ���� ����� ���� ������.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //����� ��� � ���������, � �������� � ���������. �� ������ ���� ���� ����.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //������ ��� ������ ����� �������, ��� ���������� ������������ ����� ���������.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //���, ���� ��� �� ������� ������. ���� ����� ���������� �������� �� ���� ���� ����.
	B_LogEntry (TOPIC_INNOSEYE, "���� ��������� � ��������� ����� ����. � �������, ��� ���� ����� ����������� ��� ������ � ����, ����� � ������� ��� ������ �� ����� �������. ��������� ��� ������� �� �������� ��� ������ ���� ������ ��� ��������� ������.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"���� ������ ��� ���������.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //���� ������ ��� ���������.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //��� �� ��������? ���������!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //� ����� ��� � �������� ����� - � ���������, ��� ������� ����� ������ ���������.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //��� ��� ��� ������������ ���� ������������� ���� ��������. � �� ��������� ���!

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "� ��� ������?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //� ��� ������?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //��� ����������� ����. �� ������ �������������. � ������ ����������, � ��� ��������.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //� ��� ��������, �� ����������� � ����� � �������� � ��������, ����� ����. ��������, �� �����, ��� ����� ������.

	B_LogEntry (TOPIC_INNOSEYE, "������� ������� �� ����� ������� ������������ ����� ������. ��� ���� ������ � ������ �������, ��������, ���� ������������ �������.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"������ �������� ���� � ����.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //������ �������� ���� � ����.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //������. ��� �� ������?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //�� ������, ���-�� � ������� ��������� � ����� ������.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(�������) ��� ������ ������. �����, � ����, ��� �� ������. �� ������, ����� �������� ���� � ����.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //������ �� ��. ����� �� �������������?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //�� ����� ���������� ������� �����. � ����������� ����������. � �� ������ ��������� ���� ������, � ����� �������������� �� ��� �����.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "������� ���������� ����������� � ������� � ����� ������.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //� ���� �������� � ���� ������� ������ ����� ���� ������, ��� �� ����� � ������� � ���������.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"������ �� ���� �� ����������� �� ������� � �������� ����� ������?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //������ �� ���� �� ����������� �� ������� � �������� ����� ������?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //������ � ������ �� ������� ����.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(�����������) �� ���� �������� �� ���� � ����� ����. ���� �� �� �, ���� �� �� ��� �� ������ ���� �� ��� ��� �� ����� � ���� �����.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "�� ��������! ������ �����, ��� ��� ����� �������.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "�����, �� ������� ���� ������� ���, ������ �� �����������.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //�����, �� ������� ���� ������� ���, ������ �� �����������.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //� ��� ���, ��� � ������ �� ����� ����, � �������� ��������� �� ��� ��������.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //� � �� ��������� �������� ���� ��������, ���� ������ � ���� ������ �� �� ����� ������.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //�� ������, ��� � ��������� ����� ������������ ������ ���� �����, � ������� ���� ���������, ��� � ���� ���� ���� �����-�� ����� ������������� ��������.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //� ����� ������ �����������, �������, ���� ������ �� ������������. �����������, ����� ������� ���������� �����.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //�� ��������! ������ �����, ��� ��� ����� �������.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //�� ��� ��� ������� ����, ����� ��������� � ���������. � ���� ����������� � ���� ��� ������� ������.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //�� ����������� �� ���, ���� �� ������ ��������� �����. ��� ����� � �����, � ������������ � �������.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"� ����� � �������� � ���������.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //� ����� � �������� � ���������.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //����� �� ����� ������ �������. � ���������� ����������� � ����� ������. � �� ������� ���� ������. � ������� ���� ���.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "������� ���������� ����������� � ������� � ����� ������.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"���� ������ ��������� ���������?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //���� ������ ��������� ���������?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //� �� ������ ������. ��� ������� �� ����, ��� ������ ���������� ������� ������.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"������� ������������ ������� ������� � �������.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //������� ������������ ������� ������� � �������.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //������� �� ����� �������� �������������� ����, ��� �� ����� �������� ����.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //��, �������! �������. ��� ���������.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //���� ������ ����� ���������� ���������� �����������. �� � �����, � ���� ���� ���-���, ��� ������� ����.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //����� � ������� ����� ����� ����, � ���� � ����� �� ��������� ��������� �����.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich st�ndig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen k�nnte - Satz ist eh �berfl�ssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //� �� �����, ����� �������� ��� ���� ���� ����������� ��� � ���� ����� ����� ����, � ����� ��� ����.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //������� � ������� �� � �������� �����, ��� ����� ������� �� ������ � ������ ������ ��.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //� ��� ��?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //��������� �� ��� ����� � �������� ������� �� ����� ������.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //�� ��������� ����� ������?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //���. �� ��� ����� ������ � �� �� ����� �������� ������ ��������. � ���� ��, ���� ������ ������. ��� ����.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //���, ����� �������, ���� ����� ������ �����. ����� ������� ������ ��� �����, �� ������, ��� ��� �� ����.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //��� ������ �� ����� ���. �������, ����� ��� �������� ���� ����� ����.
	B_LogEntry (TOPIC_INNOSEYE, "������� ��� ��� ���� �� ������� �� ����� ������. � ������ ������� �����, ����������� � ���, ��������.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //������, ����� ���� ������ ������������, �� ������ ��������� ����� ���������!
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //��� ��� ������ �������, ���� ����.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //�� ������ ���� ����� ������ ����, ������� ������������ ��. ������ ��� ����� ��������� ��� ����.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //����� �������� ���� ����.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //� ��� ������ �� �������� ���, ����� �� ����������� �� ���!
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Start");
  	B_StartOtherRoutine	(Vatras,"Start");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"���� ������ ������������. ��� ������?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //���� ������ ������������. ��� ������?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //�� ������ ������ ���, ����� ��, �������, ����������� ����� ���������.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //�� ����� �������. ����������� � ������ �������� � ���� ���� ��������.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //��� � ��������, � ����� �� �������� ����, ��� ������������ ������.
	};
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

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� ������?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //��� ������?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //������ ��� �� ����. ��� �� �����������, ���� �� ��������� ����.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //���� �������� � ������ �������� � ������, ��� ����� �� ����� �����������. � ��������� ������, �� ���� ������ �������� ��� ������.

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



























































