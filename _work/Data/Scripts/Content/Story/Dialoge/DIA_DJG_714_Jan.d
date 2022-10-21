// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jan_EXIT(C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 999;
	condition	= DIA_Jan_EXIT_Condition;
	information	= DIA_Jan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jan_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//***********
//	Begr��ung
//***********

INSTANCE DIA_JAN_Hello (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Hello_Condition;
	information	= DIA_Jan_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Jan_Hello_Condition()
{
	if (Kapitel >= 4)
	&& (Npc_IsInState (self,ZS_TALK))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Hello_Info()
{		
		AI_Output (self ,other,"DIA_Jan_Hello_10_00"); //� ����� ����� ������� ���� ����?!
		AI_Output (self ,other,"DIA_Jan_Hello_10_01"); //� �����, ����� ��� ���� ������������� �������� ��������� ������. �� ����� ������ ��� ����� ���������� ������������ ��������� � ����� �����.
};

//*******************************************
//	Du hast die Drachen vergessen!
//*******************************************

INSTANCE DIA_JAN_Dragons (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Dragons_Condition;
	information	= DIA_Jan_Dragons_Info;
	permanent	= FALSE;
	description	= "�� ����� � ��������!";
};                       

FUNC INT DIA_Jan_Dragons_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (MIS_JanBecomesSmith == FALSE)
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Dragons_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Dragons_15_00"); //�� ����� � ��������!
		AI_Output (self ,other,"DIA_Jan_Dragons_10_01"); //(� ��������) ��� �� � ��� ������?! ������ ���? � ������, � �� ����.
		AI_Output (self ,other,"DIA_Jan_Dragons_10_02"); //� ����� ������. � ��������� �� ���� ������.
		AI_Output (other,self ,"DIA_Jan_Dragons_15_03"); //����� ������ �� �� ������ �� ���� �����������?
		AI_Output (self ,other,"DIA_Jan_Dragons_10_04"); //�������� �� ���������� ���� � �������. ���� � ������� � ���, ���� ������ �� �������.

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_Dragons_10_05"); //�� ���� ���� �� ���. �����, ��������� �� ���� ��������?
		};

		Info_ClearChoices (DIA_JAN_Dragons);
		Info_AddChoice (DIA_JAN_Dragons,"��� ����� ����.",DIA_JAN_Dragons_ShitHappen);
		Info_AddChoice (DIA_JAN_Dragons,"� ��� � ������ �� ��, ��� ������ ����?",DIA_JAN_Dragons_Reward);
		Info_AddChoice (DIA_JAN_Dragons,"� �������� ������ ����.",DIA_JAN_Dragons_HelpYou);
};

FUNC VOID DIA_JAN_Dragons_HelpYou ()
{	
	AI_Output (other,self ,"DIA_JAN_Dragons_HelpYou_15_00"); //� �������� ������ ����.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_01"); //��� ���� ��� �������? ��������� �������� ������ �� � ���� ��� �� ����������.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_02"); //����� �� ��������� �������� ���.
	AI_Output (other,self ,"DIA_JAN_Dragons_HelpYou_15_03"); //� ������ ���, ��� �����.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_04"); //����������� ���� �� ����, ��� �� ��������� ����.
	
	Log_CreateTopic (TOPIC_JanBecomesSmith, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith, LOG_RUNNING);
	B_LogEntry (TOPIC_JanBecomesSmith,"������� �� �������� ��, ����������� � ����� ������ ��������, ����� �������� � �������. �� ��������� ��������� ��� ���."); 


	MIS_JanBecomesSmith = LOG_RUNNING;
	Info_ClearChoices (DIA_JAN_Dragons);
};

FUNC VOID DIA_JAN_Dragons_Reward ()
{
	AI_Output (other,self ,"DIA_JAN_Dragons_Reward_15_00"); //� ��� ��� �����, ���� � ������ ����?
	AI_Output (self ,other,"DIA_JAN_Dragons_Reward_10_01"); //� ���� ������ ���. �����������, � ���� ������� ���� ����-������.
	if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_JAN_Dragons_Reward_10_02"); //� ���� ������, ��� ������� ������, ���������� �� ���������� ����, ��� �������.
	};
	Jan_TeachPlayer = TRUE;
};

FUNC VOID DIA_JAN_Dragons_ShitHappen ()
{
	AI_Output (other,self ,"DIA_JAN_Dragons_ShitHappen_15_00"); //��� ����� ����.
	AI_Output (self ,other,"DIA_JAN_Dragons_ShitHappen_10_01"); //��� ������ ������. � �� ���� �������� ���� ����� � �� ���� �������� � �������.

	Info_ClearChoices (DIA_JAN_Dragons);
};
//*******************************************
//	Wo kommst du her?
//*******************************************

INSTANCE DIA_JAN_Home (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Home_Condition;
	information	= DIA_Jan_Home_Info;
	permanent	= FALSE;
	description	= "������ ��?";
};                       

FUNC INT DIA_Jan_Home_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (Kapitel >= 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Home_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Home_15_00"); //������ �� ������?
		AI_Output (self ,other,"DIA_Jan_Home_10_01"); //� ������������� � ������ � ���. � �� ����������� � ��� ������, ����� �����������, ������� �� ��������.
		AI_Output (self ,other,"DIA_Jan_Home_10_02"); //�� ������� ����� �������. ����� �������! �� ��������� �� ���� ��� �� ����� ��������������.
};

//*******************************************
//	Was ist in der Burg alles passiert?
//*******************************************

INSTANCE DIA_JAN_OldCamp (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_OldCamp_Condition;
	information	= DIA_Jan_OldCamp_Info;
	permanent	= TRUE;
	description	= "��� ��������� � �����?";
};                       

FUNC INT DIA_Jan_OldCamp_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_OldCamp_Info()
{		
		AI_Output (other,self ,"DIA_Jan_OldCamp_15_00"); //� ��� ��������� � �����?
		AI_Output (self ,other,"DIA_Jan_OldCamp_10_01"); //������, ��������� � ������. ��, �������, ���� ����� �������, ��� ��������� ��� �����.
};
//*******************************************
//	Ich hab mit Parcival geredet
//*******************************************

INSTANCE DIA_JAN_Parcival (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Parcival_Condition;
	information	= DIA_Jan_Parcival_Info;
	permanent	= FALSE;
	description	= "� ��������� � ����������.";
};                       

FUNC INT DIA_Jan_Parcival_Condition()
{
	if (MIS_JanBecomesSmith != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other,DIA_Parcival_Jan))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Parcival_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Parcival_15_00"); //� ��������� � ����������.
		AI_Output (self ,other,"DIA_Jan_Parcival_10_01"); //�?

		if (hero.guild == GIL_DJG)
		{
			AI_Output (other,self ,"DIA_Jan_Parcival_15_02"); //�� �� �������� ���, ��������� �� ��������.
		}
		else
		{
			AI_Output (other,self ,"DIA_Jan_Parcival_15_03"); //�� �� �������� ���, ��������� �� ��������.
		};
		AI_Output (self ,other,"DIA_Jan_Parcival_10_04"); //����. � ��� ���� ��������.
		AI_Output (self ,other,"DIA_Jan_Parcival_10_05"); //��� �, ������, �������� ���������. ������ ������ ����� ������ ��� ������.
};


//*******************************************
//	Ich hab mit Garond geredet
//*******************************************

INSTANCE DIA_JAN_JanIsSmith (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_JanIsSmith_Condition;
	information	= DIA_Jan_JanIsSmith_Info;
	permanent	= FALSE;
	description	= "������ �� �����, ��� ���� ���� ������.";
};                       

FUNC INT DIA_Jan_JanIsSmith_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_JanIsSmith_Info()
{		
		AI_Output (other,self ,"DIA_Jan_JanIsSmith_15_00"); //������ �� �����, ��� ���� ���� ������.
		AI_Output (self ,other,"DIA_Jan_JanIsSmith_10_01"); //�� ������ ���? ��� ���� �������?
		AI_Output (other,self ,"DIA_Jan_JanIsSmith_15_02"); //��� �������� ���������� �� ����, ��� ��� �� ��������� ����.
		AI_Output (self ,other,"DIA_Jan_JanIsSmith_10_03"); //�� ��������. � ��� ���, ��� ����� ���� ��������.

		AI_StopProcessInfos (self);
	
		Npc_ExchangeRoutine (self,"SMITH");
};

//*******************************************
//	Verkaufst du Waffen?
//*******************************************

INSTANCE DIA_JAN_SellWeapons (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_SellWeapons_Condition;
	information	= DIA_Jan_SellWeapons_Info;
	permanent	= FALSE;
	description	= "�� �������� ������?";
};                       

FUNC INT DIA_Jan_SellWeapons_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (Jan_TeachPlayer == FALSE)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_SellWeapons_Info()
{		
		AI_Output (other,self ,"DIA_Jan_SellWeapons_15_00"); //�� �������� ������?

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_SellWeapons_10_01"); //�� �� ���. ����� ����� ���� �������� ������� ���� � ������� �� �������� ��-��� ����? ���, ������ �� ����!
		}
		else
		{
			AI_Output (self ,other,"DIA_Jan_SellWeapons_10_02"); //��� ��, ���� �� ��� � ���� ����. �� ������� � ������ ���������� ������� ��������� � �����.
		};

		AI_Output (self ,other,"DIA_Jan_SellWeapons_10_03"); //�� � ���� �������� ����, ��� ������ ������� ������.
		
		Jan_TeachPlayer = TRUE;
};

//*******************************************
//	Zeig mir wie man schmiedet.
//*******************************************

INSTANCE Jan_Training_Talente (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= Jan_Training_Talente_Condition;
	information	= Jan_Training_Talente_Info;
	permanent	= TRUE;
	description	= "����� ���� ���������� ����.";
};                       

FUNC INT Jan_Training_Talente_Condition()
{
	if (Jan_TeachPlayer == TRUE)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID Jan_Training_Talente_Info()
{		
	AI_Output (other,self ,"DIA_Jan_TeachPlayer_15_00"); //����� ���� ���������� ����.
	AI_Output (self,other ,"DIA_Jan_TeachPlayer_10_01"); //��� ������ �� ������ ��������� ������?
	
	Info_ClearChoices (Jan_Training_Talente);
	
	Info_AddChoice		(Jan_Training_Talente, Dialog_Back,Jan_Training_Smith_Back);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString("��������� ���������� ����"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,Jan_Training_Smith_Common);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{	
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,Jan_Training_Smith_1hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,Jan_Training_Smith_2hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,Jan_Training_Smith_1hSpecial2);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,Jan_Training_Smith_2hSpecial2);
		};
	};
};

FUNC VOID Jan_Training_Smith_Back()
{
	Info_ClearChoices (Jan_Training_Talente);
};

FUNC VOID Jan_Training_Smith_Common ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_Common);
};

FUNC VOID Jan_Training_Smith_1hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};

FUNC VOID Jan_Training_Smith_2hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);	
};

FUNC VOID Jan_Training_Smith_1hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};

FUNC VOID Jan_Training_Smith_2hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};

//*******************************************
//	Kann ich bei dir R�stungen kaufen?
//*******************************************

//-------------------------------------
 var int DIA_JAN_SellArmor_permanent;
//------------------------------------

INSTANCE DIA_JAN_SellArmor (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_SellArmor_Condition;
	information	= DIA_Jan_SellArmor_Info;
	permanent	= TRUE;
	description	= "���� � ������ � ���� �������?";
};                       

FUNC INT DIA_Jan_SellArmor_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_SellArmor_Info()
{		
		AI_Output (other,self ,"DIA_Jan_SellArmor_15_00"); //���� � ������ � ���� �������?

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_01"); //��� ������� �� ���� �� � ����� ��������� � ����, ��� � ���� ������ ����. ������ �� ����.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_02"); //���, ������� ��������� � ��������? ������ �� ���� - ���� ����� ���������� � ��������. � �� ���� ������� ������� ��� ����.
		}
		else
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_03"); //���� �� ��� � ���� ����, � �� ������ �� ����. ��, � ���������, � ���� �� ���.
			
			Info_ClearChoices (DIA_JAN_SellArmor);
			Info_AddChoice (DIA_JAN_SellArmor,"�����, ������ �� ���������.",DIA_JAN_SellArmor_Sorry);
			Info_AddChoice (DIA_JAN_SellArmor,"�� ������ ���������� ���-������ ��� ����?",DIA_JAN_SellArmor_BuildOne);
		};	
};

FUNC VOID DIA_JAN_SellArmor_Sorry()
{
	AI_Output (other,self ,"DIA_JAN_SellArmor_Sorry_15_00"); //�����, ������ �� ���������.
	AI_Output (self ,other,"DIA_JAN_SellArmor_Sorry_10_01"); //��, ���� ��� �� ���-������ ����������, ��� ��� �����.
	
	Info_ClearChoices (DIA_JAN_SellArmor);
};

FUNC VOID DIA_JAN_SellArmor_BuildOne()
{
	AI_Output (other,self ,"DIA_JAN_SellArmor_BuildOne_15_00"); //�� ������ ���������� ���-������ ��� ����?
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_01"); //��, ���� �� ������ ���-������ �������, �� ������ �������� ��� ����������� ���������.
	AI_Output (other,self ,"DIA_JAN_SellArmor_BuildOne_15_02"); //� ��� �����?
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_03"); //�� ������ ��������� � ���������, ��? ������� ��� �������� ������� - �� ��� � ����� ������� ���-������ ��� ����.
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_04"); //20 ������ ������ ���� ����������.
	
	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices (DIA_JAN_SellArmor);
};

//*******************************************
//	Ich habe die Drachenschuppen f�r dich.
//*******************************************

//-------------------------------------------
var int Jan_Sells_Armor;
//-------------------------------------------

INSTANCE DIA_JAN_Dragonscales (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Dragonscales_Condition;
	information	= DIA_Jan_Dragonscales_Info;
	permanent	= TRUE;
	description	= "� ������ �������� �������.";
};                       

FUNC INT DIA_Jan_Dragonscales_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == TRUE)
	&& (Jan_Sells_Armor == FALSE)
	&& (Npc_HasItems (other,ItAT_Dragonscale) >= 1)
	{
		return 1;
	};	
};
 var int DIA_JAN_Dragonscales_OneTime;
FUNC VOID DIA_Jan_Dragonscales_Info()
{		
		AI_Output (other,self ,"DIA_JAN_Dragonscales_15_00"); //� ������ �������� �������.
		if (Npc_HasItems (other,ItAT_Dragonscale) >= 20)
		{
			B_GiveInvItems (other,self ,ItAT_Dragonscale,20);
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_01"); //������. �����, �� ����� ���-������ ���������.
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_02"); //������ ������ � �������� ���� ����� �������.
			
			if (DIA_JAN_Dragonscales_OneTime == FALSE)//Joly:zur sicherheit
			{
				B_GivePlayerXP (XP_Addon_JanSellsArmor);
				DIA_JAN_Dragonscales_OneTime = TRUE;
			};
			
			Jan_Sells_Armor = Wld_GetDay ();
		}
		else
		{	
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_03"); //��� ����� 20 ��������� ������, ����� � �� ����� ������� ���� �������.
		};	
};

//*******************************************
//	Ist die R�stung fertig?
//*******************************************

//-------------------------------
var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;
//-------------------------------

INSTANCE DIA_JAN_ArmorReady (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_ArmorReady_Condition;
	information	= DIA_Jan_ArmorReady_Info;
	permanent	= TRUE;
	description	= "������� ������?";
};                       

FUNC INT DIA_Jan_ArmorReady_Condition()
{
	if (MIS_OCGateOpen == FALSE)
	&& (Jan_Sells_Armor != FALSE)
	&& (DIA_JAN_ArmorReady_NoPerm == FALSE)
	{
		return 1;
	};	
};

FUNC VOID DIA_Jan_ArmorReady_Info()
{		
		AI_Output (other,self ,"DIA_JAN_ArmorReady_15_00"); //������� ������?
		if (Jan_Sells_Armor == Wld_GetDay ())
		{
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_01"); //���� ��� ���. ������ ������.
		}
		else
		{
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_02"); //��. ��� ��������� ������������ ���������. �� ������ ������ ��, ���� ������.
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_03"); //��� ���� ������ ����. 12,000 ������� �����.
			AI_Output (other,self ,"DIA_JAN_ArmorReady_15_04"); //���!? � ��� ����� �����, ��� � ������ ��� ����.
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_05"); //�� �� ���� ���. ��� �� ���� ����� ������������ �� �����. �� ������, �� ����.
		
			DJG_Armor_is_offered = TRUE;
			DIA_JAN_ArmorReady_NoPerm = TRUE;
		};	
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Jan_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	DJG_714_Jan;
	nr           = 	4;
	condition	 = 	DIA_Jan_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Jan_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"������� ������� �������� �� ��������: ������: ������ 80, ������ 80. (12000 ������)"; //Wenn �ndern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Jan_DJG_ARMOR_M_Condition ()
{
	IF (Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (DJG_Armor_is_offered == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Jan_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Jan_DJG_ARMOR_M_15_00"); //� ���� ������ ��� �������.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Jan_DJG_ARMOR_M_10_01"); //�� �������, ��� ����� ����� �����.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Jan_DJG_ARMOR_M_10_02"); //� ���� ������������ ������.
	};	
	
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonPlettBericht		(C_INFO)
{
	npc			 = 	DJG_714_Jan;
	nr			 = 	3;
	condition	 = 	DIA_Jan_DragonPlettBericht_Condition;
	information	 = 	DIA_Jan_DragonPlettBericht_Info;

	description	 = 	"������ �������� ...";
};

var int DIA_Jan_DragonPlettBericht_NoPerm;
func int DIA_Jan_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_JAN_Dragons))
	&& (DIA_Jan_DragonPlettBericht_NoPerm == FALSE)
	&& (MIS_OCGateOpen == FALSE)
	&& (MIS_KilledDragons != 0)
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info ()
{
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_00"); //� ���� �������.
	}
	else if ((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_01"); //� ���� ��������� ��������.
	}
	else 
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_02"); //� ���� ���� ��������.
	};
	
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_03"); //� ���? �� ���� ������� �� ��������, ����� ���?
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_04"); //� �� ����� ���?
	}
	else
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_05"); //��, �������, �� ���� ������, �� ��� ��� �� ���������.
	};
	
	AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_06"); //� ��� ������� ����, ��� ������ �������� ������ ������, ��� ������� ��������.

	if (hero.guild != GIL_DJG)
	&& (hero.guild != GIL_SLD)
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_07"); //�������, ���� ���-���, ��� ����� �������������� ����.
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_08"); //���� �� �� ������ ��� ��������� �����, � �� ������ �������� �� ���.
		Jan_WantsDragonBlood = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonBlood
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonBlood		(C_INFO)
{
	npc		 = 	DJG_714_Jan;
	nr		 = 	3;
	condition	 = 	DIA_Jan_DragonBlood_Condition;
	information	 = 	DIA_Jan_DragonBlood_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ������ ���� �������� �����.";
};

func int DIA_Jan_DragonBlood_Condition ()
{
	if (Jan_WantsDragonBlood == TRUE)
	&& (MIS_OCGateOpen == FALSE)
	&& (Npc_HasItems (other,ItAt_DragonBlood))
	&& ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
		{
			return TRUE;
		};
};

func void DIA_Jan_DragonBlood_Info ()
{
	AI_Output			(other, self, "DIA_Jan_DragonBlood_15_00"); //� ������ ���� �������� �����.
	AI_Output			(self, other, "DIA_Jan_DragonBlood_10_01"); //�������. ������� ��� ��� �����, ��� �������.

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(���)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(���� ��������)", DIA_Jan_DragonBlood_1 );
	};
};
func void DIA_Jan_DragonBlood_BACK ()
{
	Info_ClearChoices	(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1 ()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = 1;

	B_GiveInvItems (other, self, ItAt_DragonBlood,  DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP (XP_DJG_BringDragonBloods);
	DragonBloodGeld	= (DragonBloodCount * Value_DragonBlood);	//Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems (self, ItMi_Gold, DragonBloodGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(���)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(���� ��������)", DIA_Jan_DragonBlood_1 );
	};
	

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString (Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen	(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

func void DIA_Jan_DragonBlood_all ()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = Npc_HasItems(other, ItAt_DragonBlood);

	B_GiveInvItems (other, self, ItAt_DragonBlood,  DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP (XP_DJG_BringDragonBloods);
	DragonBloodGeld	= (DragonBloodCount * Value_DragonBlood); //Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems (self, ItMi_Gold, DragonBloodGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(���)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(���� ��������)", DIA_Jan_DragonBlood_1 );
	};

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString (Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen	(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

///////////////////////////////////////////////////////////////////////
//	Info nachOCGATEOPEN
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_NACHOCGATEOPEN		(C_INFO)
{
	npc		 = 	DJG_714_Jan;
	nr		 = 	3;
	condition	 = 	DIA_Jan_NACHOCGATEOPEN_Condition;
	information	 = 	DIA_Jan_NACHOCGATEOPEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"��� � �������?";
};

func int DIA_Jan_NACHOCGATEOPEN_Condition ()
{
	if (MIS_OCGateOpen == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Jan_NACHOCGATEOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Jan_NACHOCGATEOPEN_15_00"); //��� � �������?
	AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_01"); //��������� ������ �� ����!
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_02"); //����� ��� ������ ������� ������? ��, ��������, �� �� ��� �� ��������!
	}
	else
	{
		AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_03"); //��� ��� ��� ��� ������ ����� � ������� ������. ������! ��� ����� �� ������.
	};
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jan_PICKPOCKET (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 900;
	condition	= DIA_Jan_PICKPOCKET_Condition;
	information	= DIA_Jan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jan_PICKPOCKET_Condition()
{
	C_Beklauen (37, 95);
};
 
FUNC VOID DIA_Jan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jan_PICKPOCKET);
	Info_AddChoice		(DIA_Jan_PICKPOCKET, DIALOG_BACK 		,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jan_PICKPOCKET);
};
	
func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jan_PICKPOCKET);
};









