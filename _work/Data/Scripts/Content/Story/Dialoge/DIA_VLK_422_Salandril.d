///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Salandril_EXIT   (C_INFO)
{
	npc         = VLK_422_Salandril;
	nr          = 999;
	condition   = DIA_Salandril_EXIT_Condition;
	information = DIA_Salandril_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Salandril_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Salandril_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Salandril_PICKPOCKET (C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 900;
	condition	= DIA_Salandril_PICKPOCKET_Condition;
	information	= DIA_Salandril_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(It would be easy to steal his key)";
};
//----------------------------------------                       
var int DIA_Salandril_PICKPOCKET_perm;
//----------------------------------------
FUNC INT DIA_Salandril_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (DIA_Salandril_PICKPOCKET_perm == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Salandril_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Salandril_PICKPOCKET);
	Info_AddChoice		(DIA_Salandril_PICKPOCKET, DIALOG_BACK 		,DIA_Salandril_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Salandril_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Salandril_PICKPOCKET_DoIt);
};

func void DIA_Salandril_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItems (self, ItKe_Salandril, 1);
		B_GiveInvItems (self, other, ItKe_Salandril, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		
		DIA_Salandril_PICKPOCKET_perm = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Salandril_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Salandril_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Salandril_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Hallo		(C_INFO)
{
	npc			 = 	VLK_422_Salandril;
	nr			 = 	2;
	condition	 = 	DIA_Salandril_Hallo_Condition;
	information	 = 	DIA_Salandril_Hallo_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};

func int DIA_Salandril_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Salandril_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Salandril_PERM_13_00"); //Welcome, traveler. Looking for a fine potion?
	AI_Output (self, other, "DIA_Salandril_PERM_13_01"); //I have a large selection and reasonable prices. And my potions are much better than the stuff that Zuris sells.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Salandril sells potions. His shop is in the upper quarter."); 
};
///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Trank		(C_INFO)
{
	npc			 = 	VLK_422_Salandril;
	nr			 = 	2;
	condition	 = 	DIA_Salandril_Trank_Condition;
	information	 = 	DIA_Salandril_Trank_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Salandril_Trank_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Salandril_KLOSTER) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Salandril_Trank_Info ()
{
	AI_Output (self, other, "DIA_Salandril_Trank_13_00"); //I've heard you were with the paladins in the Valley of Mines. I'm impressed.
	AI_Output (self, other, "DIA_Salandril_Trank_13_01"); //You should take your time and browse my goods. Right now, I have a very special potion to offer.
	
	CreateInvItems (self,ItPo_Perm_DEX,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Trade		(C_INFO)
{
	npc			 = 	VLK_422_Salandril;
	nr			 = 	9;
	condition	 = 	DIA_Salandril_Trade_Condition;
	information	 = 	DIA_Salandril_Trade_Info;
	permanent	 = 	TRUE;
	description	 =  "Show me your wares.";
	trade		 =  TRUE;
};

func int DIA_Salandril_Trade_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Salandril_KLOSTER) == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Salandril_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Salandril_Trade_15_00"); //Show me your wares.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_01"); //It's my pleasure, reverend brother.
		if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_02"); //It's my pleasure, noble warrior.
	};
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

INSTANCE DIA_Salandril_KAP3_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP3_EXIT_Condition;
	information	= DIA_Salandril_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};     
                  
FUNC INT DIA_Salandril_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Salandril_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_KLOSTER		(C_INFO)
{
	npc		 = 	VLK_422_Salandril;
	nr		 = 	2;
	condition	 = 	DIA_Salandril_KLOSTER_Condition;
	information	 = 	DIA_Salandril_KLOSTER_Info;

	description	 = 	"You go to the monastery now to be judged.";
};

func int DIA_Salandril_KLOSTER_Condition ()
{
	if ((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info ()
{
	AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_00"); //You go to the monastery now to be judged.
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_01"); //What? Have you gone off your rocker? Like hell I will. Those miserable magicians don't have the slightest proof against me.

	if (hero.guild == GIL_KDF)
	&& (SC_KnowsProspektorSalandril == TRUE)		
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_02"); //And what about those fake ore mining shares you've huckstered all over the country? They bear your signature. You're guilty.
	}
	else
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_03"); //I have my orders, and I'm going to carry them out. So either you go now, or I'll make you.
	};
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_04"); //What? I'll drag you through town by your collar like a filthy rag.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info GehinsKloster
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_GehinsKloster		(C_INFO)
{
	npc		 = 	VLK_422_Salandril;
	nr		 = 	2;
	condition	 = 	DIA_Salandril_GehinsKloster_Condition;
	information	 = 	DIA_Salandril_GehinsKloster_Info;

	description	 = 	"So are you going to the monastery now, or should I give you another ...?";
};

func int DIA_Salandril_GehinsKloster_Condition ()
{
	if ((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Npc_KnowsInfo(other, DIA_Salandril_KLOSTER))
		{
				return TRUE;
		};
};

func void DIA_Salandril_GehinsKloster_Info ()
{
	AI_Output			(other, self, "DIA_Salandril_GehinsKloster_15_00"); //So are you going to the monastery now, or should I give you another ...?
	AI_Output			(self, other, "DIA_Salandril_GehinsKloster_13_01"); //You'll live to regret to this. Yes, damnit, I'll go to that monastery, but don't you think you'll get away with this.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"KlosterUrteil");
	MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Verschwinde		(C_INFO)
{
	npc		 = 	VLK_422_Salandril;
	nr		 = 	2;
	condition	 = 	DIA_Salandril_Verschwinde_Condition;
	information	 = 	DIA_Salandril_Verschwinde_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Salandril_Verschwinde_Condition ()
{
	if (MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Salandril_Verschwinde_Info ()
{
	B_Verschwinde_Stimme13 ();
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Salandril_KAP4_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP4_EXIT_Condition;
	information	= DIA_Salandril_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Salandril_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Salandril_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Salandril_KAP5_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP5_EXIT_Condition;
	information	= DIA_Salandril_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Salandril_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Salandril_KAP5_EXIT_Info()
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


INSTANCE DIA_Salandril_KAP6_EXIT(C_INFO)
{
	npc			= VLK_422_Salandril;
	nr			= 999;
	condition	= DIA_Salandril_KAP6_EXIT_Condition;
	information	= DIA_Salandril_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Salandril_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Salandril_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};































