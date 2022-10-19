///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bennet_DI_EXIT   (C_INFO)
{
	npc         = SLD_809_Bennet_DI;
	nr          = 999;
	condition   = DIA_Bennet_DI_EXIT_Condition;
	information = DIA_Bennet_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bennet_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bennet_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Bennet_DI_Hello (C_INFO)
{
	npc			= SLD_809_Bennet_DI;
	nr			= 10;
	condition	= DIA_Bennet_DI_Hello_Condition;
	information	= DIA_Bennet_DI_Hello_Info;
	permanent	 = 	TRUE;

	description = "V�echno klape?";
};    
                   
FUNC INT DIA_Bennet_DI_Hello_Condition()
{	
	if (Npc_IsDead(UndeadDragon)  == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bennet_DI_Hello_Info()
{	
	AI_Output	(other ,self,"DIA_Bennet_DI_Hello_15_00");	//V�echno klape?

	if (ORkSturmDI == FALSE)
	{
		AI_Output	(self ,other,"DIA_Bennet_DI_Hello_06_01");	//Kov�rna na t�hle lodi je tak kapku zarezl�. M��e za to ta mo�sk� s�l. Vyrobit tu n�co komplikovan�j��ho m��e b�t docela probl�m. Ale zase na druhou stranu...
	}
	else
	{
		AI_Output	(self ,other,"DIA_Bennet_DI_Hello_06_02");	//M��eme za��dit, aby se sk�eti nevr�tili zp�t.
	};
};
  
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_TRADE		(C_INFO)
{
	npc		 = 	SLD_809_Bennet_DI;
	nr          = 7;
	condition	 = 	DIA_Bennet_DI_TRADE_Condition;
	information	 = 	DIA_Bennet_DI_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"Jak� zbran� mi m��e� prodat?";
};

func int DIA_Bennet_DI_TRADE_Condition ()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bennet_DI_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DI_TRADE_15_00"); //Jak� zbran� mi m��e� prodat?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Bennet_DI_TRADE_06_01"); //Pouze ty nejlep��. To p�ece v�.
};
  
///////////////////////////////////////////////////////////////////////
//	Info Smith
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_Smith		(C_INFO)
{
	npc		 = 	SLD_809_Bennet_DI;
	nr          = 7;
	condition	 = 	DIA_Bennet_DI_Smith_Condition;
	information	 = 	DIA_Bennet_DI_Smith_Info;
	permanent	 = 	TRUE;
	description	 = 	"M��e� m� nau�it sv� um�n�?";
};

func int DIA_Bennet_DI_Smith_Condition ()
{
		if (Bennet_TeachSmith == TRUE)
		&& (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bennet_DI_Smith_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DI_Smith_15_00"); //M��e� m� nau�it sv� um�n�?
	AI_Output			(self, other, "DIA_Bennet_DI_Smith_06_01"); //Z�le�� na tom, co chce� d�lat.

	Info_ClearChoices (DIA_Bennet_DI_Smith);
	Info_AddChoice	    (DIA_Bennet_DI_Smith, DIALOG_BACK, DIA_Bennet_DI_Smith_BACK);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString("Nau�it se kov��stv�"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Bennet_DI_Smith_Common);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,DIA_Bennet_DI_Smith_1hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,DIA_Bennet_DI_Smith_2hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,DIA_Bennet_DI_Smith_1hSpecial2);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,DIA_Bennet_DI_Smith_2hSpecial2);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03))		,DIA_Bennet_DI_Smith_1hSpecial3);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03))		,DIA_Bennet_DI_Smith_2hSpecial3);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04))		,DIA_Bennet_DI_Smith_1hSpecial4);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04))		,DIA_Bennet_DI_Smith_2hSpecial4);
		};
	};
};

// ------ Back ------
func void DIA_Bennet_DI_Smith_BACK ()
{
	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
};

FUNC VOID DIA_Bennet_DI_Smith_Common ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_Common);
};

FUNC VOID DIA_Bennet_DI_Smith_1hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};

FUNC VOID DIA_Bennet_DI_Smith_2hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);
};

FUNC VOID DIA_Bennet_DI_Smith_1hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};

FUNC VOID DIA_Bennet_DI_Smith_2hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};

FUNC VOID DIA_Bennet_DI_Smith_1hSpecial3 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_03);
};

FUNC VOID DIA_Bennet_DI_Smith_2hSpecial3 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_03);
};

FUNC VOID DIA_Bennet_DI_Smith_1hSpecial4 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_04);
};

FUNC VOID DIA_Bennet_DI_Smith_2hSpecial4 ()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
};

//*******************************************
//	TechPlayerSTR
//*******************************************

INSTANCE DIA_Bennet_TeachSTR (C_INFO)
{
	npc			= SLD_809_Bennet_DI;
	nr			= 150;
	condition	= DIA_Bennet_TeachSTR_Condition;
	information	= DIA_Bennet_TeachSTR_Info;
	permanent	= TRUE;
	description = "Chci se st�t siln�j��m.";
};                       

FUNC INT DIA_Bennet_TeachSTR_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
 
FUNC VOID DIA_Bennet_TeachSTR_Info()
{	
	AI_Output (other,self ,"DIA_Bennet_TeachSTR_15_00"); //Cht�l bych se st�t siln�j��m.
	AI_Output (self,other ,"DIA_Bennet_TeachSTR_06_01"); //V takov�chhle dob�ch se budou siln� pa�e hodit.
	
	Info_ClearChoices (DIA_Bennet_TeachSTR);
	Info_AddChoice		(DIA_Bennet_TeachSTR, DIALOG_BACK, DIA_Bennet_TeachSTR_Back);
	Info_AddChoice		(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Bennet_TeachSTR_STR_1);
	Info_AddChoice		(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Bennet_TeachSTR_STR_5);
};

FUNC VOID DIA_Bennet_TeachSTR_Back ()
{
	Info_ClearChoices (DIA_Bennet_TeachSTR);
};

FUNC VOID DIA_Bennet_TeachSTR_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);	 
	Info_AddChoice		(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Bennet_TeachSTR_STR_1);
};

FUNC VOID DIA_Bennet_TeachSTR_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	Info_AddChoice		(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Bennet_TeachSTR_STR_5);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_DragonEgg		(C_INFO)
{
	npc			 = 	SLD_809_Bennet_DI;
	nr          = 	99;	
	condition	 = 	DIA_Bennet_DI_DragonEgg_Condition;
	information	 = 	DIA_Bennet_DI_DragonEgg_Info;

	description	 = 	"M�m tady dra�� vejce.";
};

func int DIA_Bennet_DI_DragonEgg_Condition ()
{	
	if  (Npc_HasItems (other,ItAt_DragonEgg_MIS))
		{
				return TRUE;
		};
};

func void DIA_Bennet_DI_DragonEgg_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DI_DragonEgg_15_00"); //M�m tady dra�� vejce.
	AI_Output			(self, other, "DIA_Bennet_DI_DragonEgg_06_01"); //A?
	AI_Output			(other, self, "DIA_Bennet_DI_DragonEgg_15_02"); //No. Myslel jsem...
	AI_Output			(self, other, "DIA_Bennet_DI_DragonEgg_06_03"); //V�m, na cos myslel. Zapome� na to, nech si tu v�c. J� to nechci.
	B_GivePlayerXP (XP_Ambient);
};
	
///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_UndeadDragonDead		(C_INFO)
{
	npc		 = 	SLD_809_Bennet_DI;
	nr          = 7;
	condition	 = 	DIA_Bennet_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Bennet_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ud�lali jsme v�echno, co jsme pot�ebovali ud�lat. ";
};

func int DIA_Bennet_DI_UndeadDragonDead_Condition ()
{
	if (Npc_IsDead(UndeadDragon))
		{
				return TRUE;
		};
};

func void DIA_Bennet_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DI_UndeadDragonDead_15_00"); //Ud�lali jsme v�echno, co jsme pot�ebovali ud�lat.
	AI_Output			(self, other, "DIA_Bennet_DI_UndeadDragonDead_06_01"); //To r�d sly��m. U� jsem m�m t�hle star� kov�rny po krk. Pot�ebuju se zase postavit na zem pevn�ma nohama.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bennet_DI_PICKPOCKET (C_INFO)
{
	npc			= SLD_809_Bennet_DI;
	nr			= 900;
	condition	= DIA_Bennet_DI_PICKPOCKET_Condition;
	information	= DIA_Bennet_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bennet_DI_PICKPOCKET_Condition()
{
	C_Beklauen (35, 65);
};
 
FUNC VOID DIA_Bennet_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bennet_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Bennet_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Bennet_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bennet_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bennet_DI_PICKPOCKET_DoIt);
};

func void DIA_Bennet_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bennet_DI_PICKPOCKET);
};
	
func void DIA_Bennet_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bennet_DI_PICKPOCKET);
};


