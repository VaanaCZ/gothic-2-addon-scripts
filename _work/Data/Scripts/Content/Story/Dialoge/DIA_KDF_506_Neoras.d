
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Hallo   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 2;
	condition   = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Neoras_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Neoras_Hallo_01_00"); //���... ���-�� ���������? ����� �� ���������� ����? ����� �� �� ������ - � ������� ����� ������� �����������?
	AI_Output (other,self ,"DIA_Neoras_Hallo_15_01"); //� �� ����� ������������ ����.
	AI_Output (self ,other,"DIA_Neoras_Hallo_01_02"); //�� ��� �����������. (��������) �����, ������, ���� �� ������?
};
///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Arbeit   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 5;
	condition   = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent   = FALSE;
	description	= "� ���� ���� ������ ��� ����?";
};
FUNC INT DIA_Neoras_Arbeit_Condition()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Arbeit_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Arbeit_15_00"); //� ���� ���� ������ ��� ����?
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_01"); //��, ��� ����� ����� ��� ���� �������������. �� ���� ���������� ��, �� � ��� ������ ����������� �������� �������.
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_02"); //���� ������� ����� ����������. ������� ��� �� - ��, ��, ��� - � ������� ������ ���������� �����.
	AI_Output (self ,other,"DIA_Neoras_Arbeit_01_03"); //���� �� ������� ���, � ���� ����� ����������.
	
	MIS_NeorasPflanzen = LOG_RUNNING;
	MIS_NeorasRezept = LOG_RUNNING;
	
	Log_CreateTopic (Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus (Topic_NeorasPflanzen,LOG_RUNNING);
	B_LogEntry (Topic_NeorasPflanzen,"� ������ �������� ���� ������ �������� ������� ������� �������, ��������.");
	
	Log_CreateTopic (Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus (Topic_Neorasrezept,LOG_RUNNING);
	B_LogEntry (Topic_Neorasrezept,"������� ������� �� ������� ������� ��� ������������� ����� ����.");

	if Npc_KnowsInfo (other, DIA_Opolos_beibringen)
	{
		B_LogEntry (Topic_Neorasrezept,"���, ������ ����, ������, �� ������� ��� ����� ��������� ������.");
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Rezept abliefern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Rezept   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 6;
	condition   = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent   = TRUE;
	description	= "������ �������...";
};
FUNC INT DIA_Neoras_Rezept_Condition()
{	
	if (MIS_NeorasRezept == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Rezept_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Rezept_15_00"); //������ �������...
	
	if B_GiveInvItems (other, self, ItWr_ManaRezept,1)
	{
		AI_Output (other,self ,"DIA_Neoras_Rezept_15_01"); //� ����� ���.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_02"); //������. � ������, ��� �� ������� ��� ���� ��������.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_03"); //���, ������ � ���� ���� ������������� ��� ���������� �����.
		
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP (XP_NeorasRezept);
		B_GiveInvItems (self, other, ItPo_Mana_02,1);
	}
	else
	{
		AI_Output (other,self ,"DIA_Neoras_Rezept_15_04"); //� ��� �� ����� ���.
		AI_Output (self ,other,"DIA_Neoras_Rezept_01_05"); //��, � ��� �� �������, ��� ���� ������� ��� �����.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Flieder abliefern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Flieder   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 7;
	condition   = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent   = TRUE;
	description	= "� ������ ���� �������� �������.";
};
FUNC INT DIA_Neoras_Flieder_Condition()
{	
	if (MIS_NeorasPflanzen == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Neoras_Flieder_Info()
{
	AI_Output (other,self ,"DIA_Neoras_Flieder_15_00"); //� ������ ���� �������� �������.
	
	if B_GiveInvItems (other, self, ItPl_Mana_Herb_01,7)
	{
		AI_Output (self ,other,"DIA_Neoras_Flieder_01_01"); //�����������, ������ � ���� ��������. ������ ���� ������ � ����������� '����� �����', �������, �� ���� ����������.
		
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP (XP_NeorasPflanzen);
		B_GiveInvItems (self, other, ItSc_Windfist,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_Flieder_01_02"); //��, �������������? �� �� ������ ������������. ��� ����� ���� �����������.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_TEACH		(C_INFO)
{
	npc			 = 	KDF_506_Neoras;
	nr			 =  10;
	condition	 = 	DIA_Neoras_TEACH_Condition;
	information	 = 	DIA_Neoras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"���� � ����-������ ��������� � ����?";
};
func int DIA_Neoras_TEACH_Condition ()
{	
	return TRUE;
};
func void DIA_Neoras_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Neoras_TEACH_15_00"); //���� � ����-������ ��������� � ����?
	
	if (other.guild == GIL_KDF)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_01"); //� ���� ������� ���� �������� �������.
		
		Info_ClearChoices 	(DIA_Neoras_TEACH);
		Info_AddChoice 		(DIA_Neoras_TEACH,DIALOG_BACK,DIA_Neoras_TEACH_BACK);
	
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice 		(DIA_Neoras_TEACH,B_BuildLearnString ("�������� ��������", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("�������� ��������", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Neoras_TEACH_Health_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("�������� �������", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Neoras_TEACH_Health_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("������� �����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Neoras_TEACH_Perm_Health);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("�������� ����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Neoras_TEACH_Mana_01);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("�������� ����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Neoras_TEACH_Mana_02);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("������� ����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Neoras_TEACH_Mana_03);
		};
		
		if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
		&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			Info_AddChoice	  (DIA_Neoras_TEACH, B_BuildLearnString ("������� ����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Neoras_TEACH_Perm_Mana);
		};
		
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_02"); //� �� ������ ��������. ����, �������, �� ������ ������ � ���� ����, 
		AI_Output (self, other, "DIA_Neoras_TEACH_01_03"); //����� � ������ ����, ��� ��������� ������� �����.
	}
	else
	{
		AI_Output (self, other, "DIA_Neoras_TEACH_01_04"); //� ������� ���� ������ ������ ������ ����� ������.
	};
};
FUNC VOID DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices 	(DIA_Neoras_TEACH);
};
FUNC VOID DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
};
FUNC VOID DIA_Neoras_TEACH_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
};
FUNC VOID DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03);
};
FUNC VOID DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health);
};
FUNC VOID DIA_Neoras_TEACH_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
};
FUNC VOID DIA_Neoras_TEACH_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
};
FUNC VOID DIA_Neoras_TEACH_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
};
FUNC VOID DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
};

//#####################################################################
//##
//##	Kapitel 2
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap2_EXIT_Condition;
	information = DIA_Neoras_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap2_EXIT_Condition()
{
	if Kapitel == 2
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
}; 

//#####################################################################
//##
//##	Kapitel 3
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap3_EXIT_Condition;
	information = DIA_Neoras_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Trank brauen 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Neoras_BrewPotion   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 39;
	condition   = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent   = TRUE;
	description = "�� ��� �� �� ������� ��� �����?";
};
FUNC INT DIA_Neoras_BrewPotion_Condition()
{
	if (NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_BrewPotion_Info()
{
	AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_00"); //�� ��� �� �� ������� ��� �����?
	
	if (hero.guild == GIL_NOV)
	{
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_01"); //��� ������� �� ������� ����������. ���, ��������� ������ �������������.
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_02"); //�� ������ ������ ���, ��� ���� �����, � �������.
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_03"); //�� ������������ � ���� ������������? � ���� ������� ����� �����.
		AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_04"); //�������.
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_05"); //�� ��� ������, ������� �� ������ �������� ��� ����������� ����������� � ������ �������� ����� �� ��� �����, � ����� �� ���������.
		AI_Output (other,self ,"DIA_Neoras_BrewPotion_15_06"); //������� �� �������?
		AI_Output (self ,other,"DIA_Neoras_BrewPotion_01_07"); //�� ���� ������������� � ���� 10 ������� �����.
		
		NeorasBrewsForYou = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Was brauche ich f�r einen...
///////////////////////////////////////////////////////////////////////
/*
INSTANCE DIA_Neoras_Ingrediences   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 38;
	condition   = DIA_Neoras_Ingrediences_Condition;
	information = DIA_Neoras_Ingrediences_Info;
	permanent   = TRUE;
	description = "Welche Zutaten brauche ich f�r...";
};
FUNC INT DIA_Neoras_Ingrediences_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_Ingrediences_Info()
{
	Info_ClearChoices (DIA_Neoras_Ingrediences);
	Info_AddChoice (DIA_Neoras_Ingrediences,DIALOG_BACK,DIA_Neoras_Ingrediences_Back);
	Info_AddChoice (DIA_Neoras_Ingrediences,"einen Trank der Geschwindigkeit?",DIA_Neoras_Ingrediences_Speed);
	Info_AddChoice (DIA_Neoras_Ingrediences,"ein Mana Extrakt?",DIA_Neoras_Ingrediences_Mana);
	Info_AddChoice (DIA_Neoras_Ingrediences,"ein Extrakt der Heilung?",DIA_Neoras_Ingrediences_Health);
};

FUNC VOID DIA_Neoras_Ingrediences_Back ()
{
	Info_ClearChoices (DIA_Neoras_Ingrediences);
};

FUNC VOID DIA_Neoras_Ingrediences_Speed ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Speed_15_00"); //Welche Zutaten brauche ich f�r einen Trank der Geschwindigkeit?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Speed_01_01"); //F�r einen Trank, der dich schneller macht, brauche ich f�nfmal so genanntes Snapperkraut und einen Kronst�ckel.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Speed_01_02"); //Und vergiss das Gold nicht.
};

FUNC VOID DIA_Neoras_Ingrediences_Mana ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Mana_15_00"); //Welche Zutaten brauche ich f�r ein Mana-Extrakt?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_01"); //Ein Manatrank ist nicht wirklich kompliziert.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_02"); //Du musst mir f�nfmal Feuerkraut und einen Feldkn�terich bringen.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Mana_01_03"); //Und vergiss das Gold nicht.
};

FUNC VOID DIA_Neoras_Ingrediences_Health ()
{
	AI_Output (other,self ,"DIA_Neoras_Ingrediences_Health_15_00"); //Welche Zutaten brauche ich f�r ein Extrakt der Heilung?
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_01"); //So ein Trank ist nicht besonders kompliziert.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_02"); //Du musst mir nur f�nf Heilkr�uter und einen Feldkn�terich bringen.
	AI_Output (self ,other,"DIA_Neoras_Ingrediences_Health_01_03"); //Und vergiss das Gold nicht.
};
*/
///////////////////////////////////////////////////////////////////////
//	Braue mir einen Trank //Ist Perm f�r KAp 3,4 und 5!!
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Neoras_BrewForMe   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 39;
	condition   = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent   = TRUE;
	description = "����� ��� ...";
};
FUNC INT DIA_Neoras_BrewForMe_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ���������.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"�������� ����.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"�������� ��������.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Back ()
{
	Info_ClearChoices (DIA_Neoras_BrewForMe);
};

FUNC VOID DIA_Neoras_BrewForMe_Speed ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Speed_15_00"); //����� ��� ����� ��������.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_01"); //������, � ���� ���� ����������� ����������� � ������?
	
	if (Npc_HasItems (other,ItPl_Speed_Herb_01) >= 1)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Speed_15_02"); //��, ���, �����.
		
		B_GiveInvItems (other,self,ItPl_Speed_Herb_01,1);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_03"); //������, �������. ������ � ��� ���� �����, ���� �� �������� ����� �����.
	
		B_GiveInvItems (self,other,ItPo_Speed,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Speed_01_04"); //� ���� ��� ����������� ������������. �����������, ����� �������� ��.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� ����� ������� ��������.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� ������� ����.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� �������� �������.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Mana ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Mana_15_00"); //����� ��� ������� ����.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_01"); //������, � ���� ���� ����������� ����������� � ������?
	
	if (Npc_HasItems (other,ItPl_Mana_Herb_02) >= 2)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Mana_15_02"); //��, ���, �����.
		
		B_GiveInvItems (other,self,ItPl_Mana_Herb_02,2);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_03"); //������. ������ � ��� ���� �����, ���� �� �������� ����� �����.
	
		B_GiveInvItems (self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Mana_01_04"); //� ���� ��� ����������� ������������. �����������, ����� �������� ��.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� ����� ��������.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� ������� ����.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� �������� �������.",DIA_Neoras_BrewForMe_Health);
};

FUNC VOID DIA_Neoras_BrewForMe_Health ()
{
	AI_Output (other,self ,"DIA_Neoras_BrewForMe_Health_15_00"); //����� ��� �������� �������.
	AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_01"); //������, � ���� ���� ����������� ����������� � ������?
	
	if (Npc_HasItems (other,ItPl_Health_Herb_02) >= 2)
	&& (Npc_HasItems (other,ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems (other,ItMi_Gold) >= 10)
	{
		AI_Output (other,self ,"DIA_Neoras_BrewForMe_Health_15_02"); //��, ���, �����.
		
		B_GiveInvItems (other,self,ItPl_Health_Herb_02,2);
		B_GiveInvItems (other,self,ItPl_Temp_Herb,1);
		B_GiveInvItems (other,self,ItMi_Gold,10);
		
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_03"); //������. ������ � ��� ���� �����, ���� �� �������� ����� �����.
	
		B_GiveInvItems (self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Neoras_BrewForMe_Health_01_04"); //� ���� ��� ����������� ������������. �����������, ����� �������� ��.
	}; 
	
	Info_ClearChoices (DIA_Neoras_BrewForMe);
	Info_AddChoice (DIA_Neoras_BrewForMe,DIALOG_BACK,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� ����� ��������.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� ������� ����.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice (DIA_Neoras_BrewForMe,"����� ��� �������� �������.",DIA_Neoras_BrewForMe_Health);
};

//#####################################################################
//##
//##	Kapitel 4
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap4_EXIT_Condition;
	information = DIA_Neoras_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRACHENEIER		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	40;
	condition	 = 	DIA_Neoras_DRACHENEIER_Condition;
	information	 = 	DIA_Neoras_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"�� ��� ������� ���������, ��� ���� �������.";
};

func int DIA_Neoras_DRACHENEIER_Condition ()
{
	if 	(Kapitel >= 4)
	&& 	((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	|| (hero.guild == GIL_KDF))
	&&  (MIS_Neoras_DragonEgg == 0)
		{
				return TRUE;
		};
};

func void DIA_Neoras_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_15_00"); //�� ��� ������� ���������, ��� ���� �������.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_01_01"); //��, � ��������� �������. ��� ��������� ���� � ������� ����������� ��� ������� �����. � ������ �� ����������.

	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "��� �� ��� ��������.", DIA_Neoras_DRACHENEIER_no );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "� ��� ��� ������ ���� �� �����?", DIA_Neoras_DRACHENEIER_trank );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "� ��� ��������?", DIA_Neoras_DRACHENEIER_ei );

};
func void DIA_Neoras_DRACHENEIER_ei ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_15_00"); //� � ��� ��������?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_01"); //� ������� ��������� ���-�� � ���� �������. ������� ��, � ���� ��� ���.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_02"); //������� � ������� �������� ���� ����������. ������ ���� ��� ������.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_01_03"); //���� �������, � �����-������ ������, �� ���������� �� ���� �� ����� ����, ����������, �� ������ ��� ���.

	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "� ��� �� ����������� ������ ���������� ����?", DIA_Neoras_DRACHENEIER_ei_statt );
	Info_AddChoice	(DIA_Neoras_DRACHENEIER, "� ��������.", DIA_Neoras_DRACHENEIER_ei_jep );

};
func void DIA_Neoras_DRACHENEIER_ei_jep ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_00"); //� �������� ���-������ �������.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_jep_01_01"); //��. � ������ �������. � �� ����, ��� ���� ������������� ������� ����� ���� �������.
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_02"); //����� ����� ��������.
	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
	
	Log_CreateTopic (TOPIC_DRACHENEIERNeoras, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENEIERNeoras,"������� ��� ������������� ����� �������� ����. �� ������, ���, �������� � ����� ����� ��� � �����-������ ������."); 

	MIS_Neoras_DragonEgg = LOG_RUNNING;
};

func void DIA_Neoras_DRACHENEIER_ei_statt ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_ei_statt_15_00"); //� ��� �� ����������� ������ ���������� ����?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_ei_statt_01_01"); //������ ���, ���� ����� �� �����.
};

func void DIA_Neoras_DRACHENEIER_trank ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_trank_15_00"); //� ��� ��� ������ ���� �� �����?
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_trank_01_01"); //� ����� ���� ������ � �������������� ��������. � ��� ��������� � �������� ��������, �� ����� ���������� �����.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_trank_01_02"); //� �� ������, ������ �� ��� ����� ������ ���-������, �� ����� ������ ���������� ���� ���������� ���� �����������.
};

func void DIA_Neoras_DRACHENEIER_no ()
{
	AI_Output			(other, self, "DIA_Neoras_DRACHENEIER_no_15_00"); //���� ��� �������� �� ��������.
	AI_Output			(self, other, "DIA_Neoras_DRACHENEIER_no_01_01"); //�����, ����������, �� �������� ���� ������.
	Info_ClearChoices	(DIA_Neoras_DRACHENEIER);
};


///////////////////////////////////////////////////////////////////////
//	Info FoundDragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_FOUNDDRAGONEGG		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information	 = 	DIA_Neoras_FOUNDDRAGONEGG_Info;

	description	 = 	"���, � ����� ��� ���� ���� �������.";
};

func int DIA_Neoras_FOUNDDRAGONEGG_Condition ()
{
	if (Npc_HasItems (other,ItAt_DragonEgg_Mis))
	&& (MIS_Neoras_DragonEgg == LOG_RUNNING)
		{
				return TRUE;
		};
};
var int Neoras_DragonEggDrink_Day;
func void DIA_Neoras_FOUNDDRAGONEGG_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_00"); //���, � ����� ��� ���� ���� �������.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_01"); //�� ����������� ���� ����.
	B_GiveInvItems 		(other, self, ItAt_DragonEgg_Mis,1);
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_02"); //��� ���������! � ���� �� �����, ��� ��� ��������. ��� �� ����� ���?
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_03"); //���� ����� ����� �� �����.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_04"); //�����������. ��� �� ������ �� ����?
	
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP (XP_Neoras_DragonEgg);

	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "���� �� ����.", DIA_Neoras_FOUNDDRAGONEGG_irgendwas );
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "��� ������ ���������� �������� �����?", DIA_Neoras_FOUNDDRAGONEGG_heil );
	Info_AddChoice	(DIA_Neoras_FOUNDDRAGONEGG, "��� ��� ������� ����� �����, ����� ��� ����� ������.", DIA_Neoras_FOUNDDRAGONEGG_trank );
};

var int Neoras_SCWantsDragonEggDrink;
func void DIA_Neoras_FOUNDDRAGONEGG_trank ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_trank_15_00"); //��� ��� ������� ����� �����, ����� ��� ����� ������.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_01"); //������. ��, ��� � ��� ������, � ������� �� ����, ��� ��� ���������.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_02"); //����� �������, ����� � ������� ���.

	Neoras_DragonEggDrink_Day = Wld_GetDay(); 
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_heil_15_00"); //��� ������ ���������� �������� �����?
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_heil_01_01"); //������� �����. ���, �����. �������, ��� ���� ����������.

	CreateInvItems 		(self, ItPo_Health_03, 3);									
	B_GiveInvItems 		(self, other, ItPo_Health_03, 3);					
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);

};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas ()
{
	AI_Output			(other, self, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00"); //���� �� ����.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01"); //���. ������. ����� ������ ��� ���������� ������. � ������, ��� ������� ���� � �������� � ������ �������.
	AI_Output			(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02"); //��� ������� ���� �� ���� ���������� ��������.

	CreateInvItems 		(self, ItRi_Prot_Mage_02, 1);									
	B_GiveInvItems 		(self, other, ItRi_Prot_Mage_02, 1);
						
	Info_ClearChoices	(DIA_Neoras_FOUNDDRAGONEGG);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRAGONEGGDRINK		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_DRAGONEGGDRINK_Condition;
	information	 = 	DIA_Neoras_DRAGONEGGDRINK_Info;

	description	 = 	"� ������ �������� ��� ���������� ����� �� ���� �������.";
};

func int DIA_Neoras_DRAGONEGGDRINK_Condition ()
{
	if (Neoras_DragonEggDrink_Day <=(Wld_GetDay()-2))
	&& (Neoras_SCWantsDragonEggDrink == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_00"); //� ������ �������� ��� ���������� ����� �� ���� �������.
	AI_Output			(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_01"); //��. � ������ ��� �������� ���. � ��� �� ��������� ��� � �� ���� ������� ��������������� �� ��� ��������. �� �������?
	AI_Output			(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_02"); //����� ��� ����.
	AI_Output			(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_03"); //������. �������, ��� ����� �� �������� ���� ������ ����������.
	CreateInvItems 		(self, ItPo_DragonEggDrinkNeoras_MIS, 1);									
	B_GiveInvItems 		(self, other, ItPo_DragonEggDrinkNeoras_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info UsedDragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_USEDDRAGONEGGDRINK		(C_INFO)
{
	npc		 = 	KDF_506_Neoras;
	nr		 = 	3;
	condition	 = 	DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information	 = 	DIA_Neoras_USEDDRAGONEGGDRINK_Info;

	description	 = 	"� ���������� ���� ����� �� ���� �������. �������� �����!";
};

func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition ()
{
	if (Neoras_SCUsedDragonEggDrink == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info ()
{
	AI_Output			(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_00"); //� ���������� ���� ����� �� ���� �������. �������� �����!
	AI_Output			(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_01"); //���. ����� ���������. � ������ ���������� ���� ������������.
	AI_Output			(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_02"); //�� �� ��� �� ������� ��� ���?
	AI_Output			(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_03"); //����� �����, ���� �� �������� ��� ����� ��������� ������. �����, �����, � ���� ����� ������� ����.
};

//#####################################################################
//##
//##	Kapitel 5
//##
//#####################################################################
 
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Neoras_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_506_Neoras;
	nr          = 999;
	condition   = DIA_Neoras_Kap5_EXIT_Condition;
	information = DIA_Neoras_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Neoras_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Neoras_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Neoras_PICKPOCKET (C_INFO)
{
	npc			= KDF_506_Neoras;
	nr			= 900;
	condition	= DIA_Neoras_PICKPOCKET_Condition;
	information	= DIA_Neoras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Neoras_PICKPOCKET_Condition()
{
	C_Beklauen (72, 140);
};
 
FUNC VOID DIA_Neoras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Neoras_PICKPOCKET);
	Info_AddChoice		(DIA_Neoras_PICKPOCKET, DIALOG_BACK 		,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Neoras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Neoras_PICKPOCKET);
};
	
func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Neoras_PICKPOCKET);
};
























