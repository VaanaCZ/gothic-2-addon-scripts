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
	description = "(Kradzie¿ tego klucza bêdzie doœæ ³atwa)";
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
	AI_Output (self, other, "DIA_Salandril_PERM_13_00"); //Witaj, wêdrowcze. Szukasz doskona³ej mikstury?
	AI_Output (self, other, "DIA_Salandril_PERM_13_01"); //Mam œwietny wybór po rozs¹dnych cenach. A moje mikstury s¹ o wiele lepsze od tych, które stara siê sprzedawaæ Zuris.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Salandril sprzedaje mikstury. Jego sklep znajduje siê w górnym mieœcie."); 
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
	AI_Output (self, other, "DIA_Salandril_Trank_13_00"); //S³ysza³em, ¿e by³eœ z paladynami w Górniczej Dolinie. Jestem pod wra¿eniem.
	AI_Output (self, other, "DIA_Salandril_Trank_13_01"); //Nie œpiesz siê i spokojnie obejrzyj mój towar. Dobrze siê sk³ada, bo akurat mam coœ wyj¹tkowego na sprzeda¿.
	
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
	description	 =  "Poka¿ mi swoje towary.";
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
	AI_Output (other, self, "DIA_Salandril_Trade_15_00"); //Poka¿ mi swoje towary.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_01"); //Z przyjemnoœci¹, czcigodny Bracie.
		if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_02"); //Z przyjemnoœci¹, szlachetny Panie.
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

	description	 = 	"Masz udaæ siê do klasztoru, w którym zostaniesz os¹dzony!";
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
	AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_00"); //Masz udaæ siê do klasztoru, w którym zostaniesz os¹dzony!
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_01"); //Co? Nie ma mowy! Ci nêdzni magowie nie maj¹ nawet cienia dowodu przeciwko mnie!

	if (hero.guild == GIL_KDF)
	&& (SC_KnowsProspektorSalandril == TRUE)		
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_02"); //A co z tymi fa³szywymi udzia³ami w kopalni, które mo¿na wszêdzie kupiæ? Widnieje na nich twój podpis. Jesteœ winny!
	}
	else
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_03"); //Mam rozkazy do wykonania i albo ze mn¹ pójdziesz, albo ciê do tego zmuszê.
	};
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_04"); //CO? Przeci¹gnê ciê przez ca³e miasto i poka¿ê, jak nale¿y siê do mnie zwracaæ!
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

	description	 = 	"No, to teraz pójdziesz do klasztoru, czy bêdziemy siê dalej bawiæ?";
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
	AI_Output			(other, self, "DIA_Salandril_GehinsKloster_15_00"); //No, to teraz pójdziesz do klasztoru, czy bêdziemy siê dalej bawiæ?
	AI_Output			(self, other, "DIA_Salandril_GehinsKloster_13_01"); //Bêdziesz tego ¿a³owa³! Cholera! Pójdê do tego twojego klasztoru, ale nie myœl, ¿e ujdzie ci to na sucho.
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































