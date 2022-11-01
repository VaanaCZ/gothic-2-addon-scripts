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

	description = "Všechno klape?";
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
	AI_Output	(other ,self,"DIA_Bennet_DI_Hello_15_00");	//Všechno klape?

	if (ORkSturmDI == FALSE)
	{
		AI_Output	(self ,other,"DIA_Bennet_DI_Hello_06_01");	//Kovárna na téhle lodi je tak kapku zarezlá. Může za to ta mořská sůl. Vyrobit tu něco komplikovanějšího může být docela problém. Ale zase na druhou stranu...
	}
	else
	{
		AI_Output	(self ,other,"DIA_Bennet_DI_Hello_06_02");	//Můžeme zařídit, aby se skřeti nevrátili zpět.
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

	description	 = 	"Jaké zbraně mi můžeš prodat?";
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
	AI_Output			(other, self, "DIA_Bennet_DI_TRADE_15_00"); //Jaké zbraně mi můžeš prodat?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Bennet_DI_TRADE_06_01"); //Pouze ty nejlepší. To přece víš.
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
	description	 = 	"Můžeš mě naučit své umění?";
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
	AI_Output			(other, self, "DIA_Bennet_DI_Smith_15_00"); //Můžeš mě naučit své umění?
	AI_Output			(self, other, "DIA_Bennet_DI_Smith_06_01"); //Záleží na tom, co chceš dělat.

	Info_ClearChoices (DIA_Bennet_DI_Smith);
	Info_AddChoice	    (DIA_Bennet_DI_Smith, DIALOG_BACK, DIA_Bennet_DI_Smith_BACK);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString("Naučit se kovářství"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Bennet_DI_Smith_Common);
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
	description = "Chci se stát silnějším.";
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
	AI_Output (other,self ,"DIA_Bennet_TeachSTR_15_00"); //Chtěl bych se stát silnějším.
	AI_Output (self,other ,"DIA_Bennet_TeachSTR_06_01"); //V takovýchhle dobách se budou silné paže hodit.
	
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

	description	 = 	"Mám tady dračí vejce.";
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
	AI_Output			(other, self, "DIA_Bennet_DI_DragonEgg_15_00"); //Mám tady dračí vejce.
	AI_Output			(self, other, "DIA_Bennet_DI_DragonEgg_06_01"); //A?
	AI_Output			(other, self, "DIA_Bennet_DI_DragonEgg_15_02"); //No. Myslel jsem...
	AI_Output			(self, other, "DIA_Bennet_DI_DragonEgg_06_03"); //Vím, na cos myslel. Zapomeň na to, nech si tu věc. Já to nechci.
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

	description	 = 	"Udělali jsme všechno, co jsme potřebovali udělat. ";
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
	AI_Output			(other, self, "DIA_Bennet_DI_UndeadDragonDead_15_00"); //Udělali jsme všechno, co jsme potřebovali udělat.
	AI_Output			(self, other, "DIA_Bennet_DI_UndeadDragonDead_06_01"); //To rád slyším. Už jsem mám téhle staré kovárny po krk. Potřebuju se zase postavit na zem pevnýma nohama.
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


