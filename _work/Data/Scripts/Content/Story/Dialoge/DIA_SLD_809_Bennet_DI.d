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

	description = "Are you doing all right?";
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
	AI_Output	(other ,self,"DIA_Bennet_DI_Hello_15_00");	//Are you doing all right?

	if (ORkSturmDI == FALSE)
	{
		AI_Output	(self ,other,"DIA_Bennet_DI_Hello_06_01");	//The smithy on the ship is a little on the rusty side. It's the sea salt that does it. It may be a little difficult to produce anything decent here. But apart from that...
	}
	else
	{
		AI_Output	(self ,other,"DIA_Bennet_DI_Hello_06_02");	//Yes, provided the orcs don't come back.
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

	description	 = 	"What weapons can you sell me?";
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
	AI_Output			(other, self, "DIA_Bennet_DI_TRADE_15_00"); //What weapons can you sell me?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Bennet_DI_TRADE_06_01"); //Only the best. You know that.
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
	description	 = 	"Can you teach me your craft?";
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
	AI_Output			(other, self, "DIA_Bennet_DI_Smith_15_00"); //Can you teach me your craft?
	AI_Output			(self, other, "DIA_Bennet_DI_Smith_06_01"); //Depends on what you want to make.

	Info_ClearChoices (DIA_Bennet_DI_Smith);
	Info_AddChoice	    (DIA_Bennet_DI_Smith, DIALOG_BACK, DIA_Bennet_DI_Smith_BACK);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice		(DIA_Bennet_DI_Smith, B_BuildLearnString("Learn to forge"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Bennet_DI_Smith_Common);
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
	Info_ClearChoices (DIA_Bennet_DI_Smith);
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
	description = "I want to get stronger.";
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
	AI_Output (other,self ,"DIA_Bennet_TeachSTR_15_00"); //I want to become stronger.
	AI_Output (self,other ,"DIA_Bennet_TeachSTR_06_01"); //In times like these, a strong arm is what's needed.
	
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

	description	 = 	"I've got a dragon egg here.";
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
	AI_Output			(other, self, "DIA_Bennet_DI_DragonEgg_15_00"); //I've got a dragon egg here.
	AI_Output			(self, other, "DIA_Bennet_DI_DragonEgg_06_01"); //Well?
	AI_Output			(other, self, "DIA_Bennet_DI_DragonEgg_15_02"); //Well. I thought ...
	AI_Output			(self, other, "DIA_Bennet_DI_DragonEgg_06_03"); //I know what you're thinking. Forget it, keep the thing. I don't want it.
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

	description	 = 	"We've done all we needed to do.";
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
	AI_Output			(other, self, "DIA_Bennet_DI_UndeadDragonDead_15_00"); //We've done all we needed to do.
	AI_Output			(self, other, "DIA_Bennet_DI_UndeadDragonDead_06_01"); //I'm glad to hear that. I've had just about enough of this old smithy. I need to plant my feet on firm ground once more.
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


