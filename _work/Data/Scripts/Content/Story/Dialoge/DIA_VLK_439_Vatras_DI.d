///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Vatras_DI_EXIT   (C_INFO)
{
	npc         = VLK_439_Vatras_DI;
	nr          = 999;
	condition   = DIA_Vatras_DI_EXIT_Condition;
	information = DIA_Vatras_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Vatras_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Vatras_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_HEAL		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_HEAL_Condition;
	information	 = 	DIA_Vatras_DI_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"������ ����.";
};

func int DIA_Vatras_DI_HEAL_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_DI_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_HEAL_15_00"); //������ ����.
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_DI_HEAL_05_01"); //(������������) ������, ���������� ��� ����. ��� ������������� ������������ ������ ����.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_DI_HEAL_05_02"); //���� ���� ������ �� ��������� � �������.
	};	
};
 
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_TRADE		(C_INFO)
{
	npc		 = 	VLK_439_Vatras_DI;
	nr          = 12;
	condition	 = 	DIA_Vatras_DI_TRADE_Condition;
	information	 = 	DIA_Vatras_DI_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"�� ������ ������� ��� ���-������?";
};

func int DIA_Vatras_DI_TRADE_Condition ()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_DI_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_TRADE_15_00"); //�� ������ ������� ��� ���-������?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Vatras_DI_TRADE_05_01"); //� ��� �� ����������?
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_OBSESSION		(C_INFO)
{
	npc		 = 	VLK_439_Vatras_DI;
	nr		 = 	35;
	condition	 = 	DIA_Vatras_DI_OBSESSION_Condition;
	information	 = 	DIA_Vatras_DI_OBSESSION_Info;
	permanent	 = 	TRUE;

	description	 = 	"������ ���. � �������!";
};

func int DIA_Vatras_DI_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&&  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Vatras_DI_OBSESSION_Info_OneTime;
func void DIA_Vatras_DI_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_OBSESSION_15_00"); //������ ���. � �������!

	if (Got_HealObsession_Day<=(Wld_GetDay()-2))  
		{
			if (DIA_Vatras_DI_OBSESSION_Info_OneTime <= 1)//2 mal
			{
				CreateInvItems 	(self, ItPo_HealObsession_MIS, 1 );
				DIA_Vatras_DI_OBSESSION_Info_OneTime = (DIA_Vatras_DI_OBSESSION_Info_OneTime + 1);
			};
		
			if (Npc_HasItems (self,ItPo_HealObsession_MIS))
			{
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_01"); //������ ��� ����� ������������. ������� ��� ��� ��������� ���� �������� ��������� �� ���� �������.
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_02"); //������ �����: ��� ����������� �� ���������� ���� �� ������ �������� ����������.
				B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 1);
				Got_HealObsession_Day = Wld_GetDay(); 
			}
			else
			{
				AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_03"); //������ �������� ��������. ��� ����� ����, ���� ���. � ������ ����� �� ���� ������ ����.
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Vatras_DI_OBSESSION_05_04"); //� �� ������ �� ���� ���� ���� ���� ��� ���� ������� � ����� �������� �����. ����������� �����, ���� ���.
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RAT
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_RAT		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_RAT_Condition;
	information	 = 	DIA_Vatras_DI_RAT_Info;

	description	 = 	"����� ����� �� ������ ���� ���?";
};

func int DIA_Vatras_DI_RAT_Condition ()
{	
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (SC_IsObsessed == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Vatras_DI_RAT_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_RAT_15_00"); //����� ����� �� ������ ���� ���?
	AI_Output			(self, other, "DIA_Vatras_DI_RAT_05_01"); //������� �������� �� ������. �����, ��� �� ������ ������ ����� ������� ���� ��������� ���� �����, ����� �� ���������.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
		AI_Output			(other, self, "DIA_Vatras_DI_RAT_15_02"); //�� ��������, � ���� ���� ������ ������ ���.
	};

	AI_Output			(self, other, "DIA_Vatras_DI_RAT_05_03"); //���� ��� �� ���-�� ���������� � �����, ������� �� ���. � ��������, ��� ����� �������.
};

///////////////////////////////////////////////////////////////////////
//	Info PEDROTOT
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_PEDROTOT		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	3;	
	condition	 = 	DIA_Vatras_DI_PEDROTOT_Condition;
	information	 = 	DIA_Vatras_DI_PEDROTOT_Info;

	description	 = 	"� ����� ��������� �����.";
};

func int DIA_Vatras_DI_PEDROTOT_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
		{
				return TRUE;
		};
};

var int DIA_Vatras_DI_PEDROTOT_VatrasSucked;
func void DIA_Vatras_DI_PEDROTOT_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_00"); //� ����� ��������� �����.
	B_GivePlayerXP (XP_Ambient);
	
	if (MIS_Gorax_KillPedro == LOG_SUCCESS)
	&& (Npc_IsDead(Pedro_DI)) 
	{
		AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_01"); //�� �����.
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_02"); //� ������ �����������. � �� ������ ����� �� ����.
		AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_03"); //��� �� ������ � ����?
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_04"); //� ���� � ����� �������������� ���������� � �����������. � ������� �������� ���, ��� ��� �������� � ����.
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE;
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_05"); //����� ������� ��� ����, �� �������. �� ��������� ��� ������� ��������.

		if (Npc_IsDead(Pedro_DI)) 
		{
			AI_Output			(other, self, "DIA_Vatras_DI_PEDROTOT_15_06"); //��� ����� ������� ������. �� �����.
			AI_Output			(self, other, "DIA_Vatras_DI_PEDROTOT_05_07"); //(���������) ��. ����� �������. � ���� �������� �� ��� ������ ����.
		}
		else
		{
			AI_StopProcessInfos (self);
		};
	};
};



///////////////////////////////////////////////////////////////////////
//	Info VatrasSucked
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_VatrasSucked		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	1;	
	condition	 = 	DIA_Vatras_DI_VatrasSucked_Condition;
	information	 = 	DIA_Vatras_DI_VatrasSucked_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Vatras_DI_VatrasSucked_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_DI_VatrasSucked_Info ()
{
	AI_Output			(self, other, "DIA_Vatras_DI_VatrasSucked_05_00"); //�������� � ���� ����, ������. �� ������ ������ �� ������������ �� ��� ������.
	AI_StopProcessInfos (self);
};


//***************************************************************************
//	Talente
//***************************************************************************
INSTANCE DIA_Vatras_DI_Talente (C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	condition		= DIA_Vatras_DI_Talente_Condition;
	information		= DIA_Vatras_DI_Talente_Info;
	permanent		= TRUE;

	description		= "����� ���� ����, ��� ������ ���."; 
};

FUNC INT DIA_Vatras_DI_Talente_Condition()
{		
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
FUNC VOID DIA_Vatras_DI_Talente_Info ()
{	
	AI_Output			(other, self, "DIA_Vatras_DI_Talente_15_00"); //����� ���� �����.
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_05_01"); //� ������ ���, ��� � ���� �����.
	
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	Info_AddChoice	  (DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);

	if (hero.guild == GIL_KDF) 
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, "����� �����", DIA_Vatras_DI_Talente_CIRCLES);
	};
	Info_AddChoice	  (DIA_Vatras_DI_Talente, "������� - ��������� ������������� �����", DIA_Vatras_DI_Talente_ALCHIMIE);
};

//**********************************************************
// Addchoices Talente: Magische Kreise
//------------------------------------
//**********************************************************
FUNC VOID DIA_Vatras_DI_Talente_CIRCLES()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	Info_AddChoice	    (DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 1) 
	{ 
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("1-� ���� �����"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 1))			,DIA_Vatras_DI_Talente_Circle_1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("2-� ���� �����"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 2))			,DIA_Vatras_DI_Talente_Circle_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("3-� ���� �����"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 3))			,DIA_Vatras_DI_Talente_Circle_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("4-� ���� �����"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 4))			,DIA_Vatras_DI_Talente_Circle_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 4)	
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("5-� ���� �����"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 5))			,DIA_Vatras_DI_Talente_Circle_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice		(DIA_Vatras_DI_Talente, B_BuildLearnString("6-� ���� �����"	, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 6))			,DIA_Vatras_DI_Talente_Circle_6);
	};
};

//**********************************************************
// Addchoices Talente: Alchimie
//-----------------------------
//**********************************************************
FUNC VOID DIA_Vatras_DI_Talente_ALCHIMIE ()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	Info_AddChoice	    (DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("�������� ��������", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Vatras_DI_Talente_POTION_Health_01);	  
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("�������� ��������", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Vatras_DI_Talente_POTION_Health_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("�������� �������", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Vatras_DI_Talente_POTION_Health_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("�������� ����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Vatras_DI_Talente_POTION_Mana_01);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("�������� ����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Vatras_DI_Talente_POTION_Mana_02);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("������� ����", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Vatras_DI_Talente_POTION_Mana_03);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("����� ���������"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)), DIA_Vatras_DI_Talente_POTION_Speed);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("������� ����"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("������� ��������"		, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("������� ����"	, 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};
	if ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	{
		Info_AddChoice	  (DIA_Vatras_DI_Talente, B_BuildLearnString ("������� �����", 	B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Vatras_DI_Talente_POTION_Perm_Health);
	};
};
//***************************************************************************
// Talente Magische Kreise
//***************************************************************************
FUNC VOID DIA_Vatras_DI_Talente_Circle_1()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 1);

};
FUNC VOID DIA_Vatras_DI_Talente_Circle_2()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 2);

};
FUNC VOID DIA_Vatras_DI_Talente_Circle_3()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 3);
};
FUNC VOID DIA_Vatras_DI_Talente_Circle_4()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 4);
};
FUNC VOID DIA_Vatras_DI_Talente_Circle_5()
{
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_5_05_00"); //������ �� ��� ������ �����. ��������� ����������, ��������� �����, �� �����.
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 5);
};
FUNC VOID DIA_Vatras_DI_Talente_Circle_6()
{
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_00"); //�� ������ ����� ������� ������ � �����.
	AI_Output			(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_01"); //����� ���� ���� ���������� �����, � ���� ������������ �������� ����� ��� �������� ���������. ��� �� ������ ������� ���� ����.
	Info_ClearChoices (DIA_Vatras_DI_Talente);
	B_TeachMagicCircle (self, other, 6);
};

//***************************************************************************
// Talente Alchemy
//***************************************************************************

FUNC VOID DIA_Vatras_DI_Talente_POTION_Health_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Health_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Health_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Mana_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Mana_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Mana_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Speed ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);	
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_STR ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_DEX ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_Mana ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
};
FUNC VOID DIA_Vatras_DI_Talente_POTION_Perm_Health ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health);
};

// ------ Back ------
func void DIA_Vatras_DI_Talente_BACK ()
{
	Info_ClearChoices (DIA_Vatras_DI_Talente);
};

///////////////////////////////////////////////////////////////////////
//	Info DementorObsessionBook
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_DementorObsessionBook		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_DementorObsessionBook_Condition;
	information	 = 	DIA_Vatras_DI_DementorObsessionBook_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ������ �������� ���������.";
};

func int DIA_Vatras_DI_DementorObsessionBook_Condition ()
{	
	if  (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))
		{
				return TRUE;
		};
};

var int DIA_Vatras_DI_DementorObsessionBook_OneTime;
func void DIA_Vatras_DI_DementorObsessionBook_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_DementorObsessionBook_15_00"); //� ������ �������� ���������.
	if (DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_01"); //��. � �����, ����� ����� �����, ���� � ������ ��� � ��������� � ��������. ����, �������, ��� ������� ��������� ������.
		
		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_02"); //� ���� ���� ���? ������� ��� ���, ��� �������.
	};
	B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
	B_GivePlayerXP (XP_Ambient);
};
	
///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	VLK_439_Vatras_DI;
	nr          = 	99;	
	condition	 = 	DIA_Vatras_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Vatras_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ������ ���.";
};

func int DIA_Vatras_DI_UndeadDragonDead_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon))
		{
				return TRUE;
		};
};

var int DIA_Vatras_DI_UndeadDragonDead_OneTime;
func void DIA_Vatras_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_DI_UndeadDragonDead_15_00"); //� ������ ���.

	if (DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_01"); //� ����, � �������� ���.
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_02"); //�� ����� ���� �������, �� �������� �� �� ����� ���������.
	
		if (hero.guild == GIL_DJG)
		{
			AI_Output (other, self, "DIA_Vatras_DI_UndeadDragonDead_15_03"); //���� � ������ �����������, ��� � ���, � �����, ���� ��� ���� ������ � �����, �������� ����� ������� �� ����� ����?
		}
		else
		{
			AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_04"); //�����, ��� ��� ��� ����� ���� ������ � ������ ����� ����� �� ����.
		};
		
		AI_Output			(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_05"); //��� ������ ������� ������ ���������� � ���� ���. ��� ����� ������� �� ��������.
		
		if (hero.guild == GIL_PAL)
		{
			AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_06"); //��� ���� ����� �� ������ �������� ���.
		};
			
		AI_Output (self, other, "DIA_Vatras_Add_05_15"); //������ ���� ������ ����� ����� �������� ������ � ������ ������� ������!
		AI_Output (other, self, "DIA_Vatras_Add_15_16"); //����� �� �� ����� ���.
		AI_Output (self, other, "DIA_Vatras_Add_05_17"); //(������) �� ��� � ������ - ���� ������.
					
		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};	

	AI_Output (self, other, "DIA_Vatras_DI_UndeadDragonDead_05_09"); //����� ��������, ����� �� �������� ����� ��� ����� �������. ��������������� ��� ����� ���� �������.
};
 
///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER_DI
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER_DI		(C_INFO)
{
	npc		 = 	VLK_439_Vatras_DI;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition;
	information	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition ()
{
	if 	(
		(VatrasPissedOffForever == TRUE)
		|| (
			(MadKillerCount >= 7) 						//SC hat mehr als 6 unschuldige auf dem Gewissen.
			&& (VatrasMadKillerCount != MadKillerCount)	//die letzte Chance von Vatras nicht genutzt
			)
	 	)
		&& (Npc_IsInState (self,ZS_Talk))
			{
				return TRUE;
			};	
};
var int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime;
func void DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info ()
{
	if (DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime == FALSE)
	{
		B_LastWarningVatras ();
		DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime = TRUE;
	};
	B_VatrasPissedOff ();
	AI_StopProcessInfos (self);
};
