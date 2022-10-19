///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //����� ���������� � ��������� ������, ���������.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //� ���� �����, �������� ����� ������ � ��������� ���� ����� ���������� ���������.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //��� �� ������?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "���, ������ �������, ����!";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //���, ������ �������, ����!
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //� ���, ��� �� ������� ��� ���. ������ ��� ��� ��������.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //�� ������ ���� ��� ��� ���� ��������?
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //������ �� ����, ����� �� �� ���� �� ������.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //��, ����� ���� �������� - ����� ���� �� ������� �����. � �� ���-��� �������� �� ��� - � ���� �����, ��� ������ �������� �������.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //���� �� �������� �� �������, �� ��������� ���� ���� ���� �� ����������. ��� �������?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"�����, ����� ��� ���� �������.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"���, ������ �� ����.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //�����, ����� ��� ���� �������.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //�������. �������� ������� ������ ����� � ������ �� ������ ������� �����.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //���, ������ �� ����.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //�� ������ ����������� ����� ��������, ��? ��, ����� ���������� ��� ����������...
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"� ���� ����� � ���������.";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //� ���� ����� � ���������.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //������ � ��������� ������ ������ ��� ���� ������.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //���� �� ������ ���������� ������, ��� � ������ �� ����������� �������. �� ������� ��� ���������� � ��������.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"��� ����� �������, ����� ���� ������� � ���������?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //��� ����� �������, ����� ���� ������� � ���������?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //����������� � ��������� ���������� ��� ���� - �� ��� ������ ���� ����.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //���� �� ������ ���� �������� � �������� ������, �� ������ ����� � ��������� ������� ���������.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Au�erdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //����� ������ ������� ������ �������� ��� ������.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //���� � 1000 �������.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //��� ����� ���� ������.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //��� ���� ����, ��� �� ��������� ����� ����� � �������� ����� ������. ����� �� ������ ������, ��� ���� ���������� ����������� ����� �������.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //� ���������� ������� - ����� �� �� ������� ���������� �� ������ ������� ����� ������ ������.
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"����� ����� ����������� ��������� ������, ��� ����� ���� � �������� ����� �������.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ���� ���� ��� ��� ���������...";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //� ���� ���� ��� ��� ���������. �����, ��� ������� �� ���������. 
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //������ � ���� �����?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //��, �����, ��� � ����� �������������� ���������������, �� ������ ����� ����������� ���������.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"��������� ����� ��������� ���� � ���������, ������ ��� � ��� ��������� ���������. � ������ ������ �� ����-�� � ���������."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //�����, ���� ��� ������������� �� ������� ���� ���� ������. 
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //�� ��� ������ ���� ����. ��������� ��� ���� ������.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"� ���� ������ ��������� ����?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //� ���� ������ ��������� ����?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //�������. � ���������� � ���. ��������� ���� �� ��������.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"��� ��� �� �������, �� ������� �� ������?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //��� ��� �� �������, �� ������� �� ������?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //����� - ��� ������ � ������. ������� �� ������� �� ���� � �� ��������� ������������.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //���� �� ��������� ������ ����� �� ����� ������ ��� �������� ���� �������������, ���� �������� ��������� �� ��� �����.
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //����� ����� ��� ��������� � ����.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //������ �����������, �� ������ ��������� ���������� � ��������  �� ���� ����� ����.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //�������.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //����� ����, ��������� ������ ��������� ������ � ��������� �� ����� ������.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //���� �� ����� ��������� ���� ��������, � � ���� ���� ���������� ������, �� ������ ������� ���� � ��������� � �������� ����������.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"� ���� ����� �����������.";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"� ��� ������� ������� ��� ����.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"��, � ���� ��������� ���� ����� �������� ������.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //� ���� ����� �����������.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //�� ��� ������ ���� ����. ���� ����� ������ ��� ����.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //���� ������� ������������? ���� ����� ��� ���� ��� �� �����.
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //� ����, �� ������ ����������� ����������. ���� �� ������������� ������� �����, �� ������ ����� �����������.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //������, ���� �� ������� ��� �������, ���� ����� �� ����� - ������ �������, ���� �� ��� ����!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //�� �� ������ ����������� ����������.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //��, � ���� ��������� ���� ����� �������� ������.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //����� ����� ����������, ����. � ��� ���� ���� ���� �� ������������ �����.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //� ���� ������ ������������� �������� ����� �������, �� ������ ��� ������� ��� ������ � ����� ������.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //������ �� ���������. ���� ��� ���� � ���� ����, ��� ������ �� ���� ������ ��������.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //����� �� ������� � ���������, ������� � �������. � ����� ������� �� ����� �������� �� ����.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //��� ����������� ������ �������?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //���� ��� ���. �������� � �������� ��������. �� ����������� ���� � ������� �� ����� ������.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //� ��� ������� ������� ��� ����.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //�����������, ����� ������ �����.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erz�hl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"�������� ��� � ����� � ���������.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //�������� ��� � ����� � ���������.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //�� ����� � ���������, ����� ������� ������. ��, ����������, ��������� ��������� ������ � ������� �������, ����� � ��� ���������� ����� �����������.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //���� ������������� �� ����, � ����� ������� ��������� �����.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};















