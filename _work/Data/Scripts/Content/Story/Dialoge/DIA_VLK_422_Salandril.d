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
	description = "(Tento kl�� p�jde ukr�st snadno.)";
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
	AI_Output (self, other, "DIA_Salandril_PERM_13_00"); //V�tej, poutn�ku, hled� n�jak� dobr� lektvar?
	AI_Output (self, other, "DIA_Salandril_PERM_13_01"); //U m� najde� velk� v�b�r za p�ijateln� ceny a m� lektvary jsou mnohem lep�� ne� ty patoky, kter� prod�v� Zuris.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Salandril prod�v� lektvary. Jeho obchod najdu v horn� �tvrti."); 
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
	AI_Output (self, other, "DIA_Salandril_Trank_13_00"); //Sly�el jsem, �e ses s paladiny vypravil do Hornick�ho �dol�. To na m� ud�lalo dojem.
	AI_Output (self, other, "DIA_Salandril_Trank_13_01"); //M�l by sis vy�et�it chvilku a prohl�dnout si m� zbo�� - zrovna ti mohu nab�dnout jeden velmi zvl�tn� lektvar.
	
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
	description	 =  "Uka� mi sv� zbo��.";
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
	AI_Output (other, self, "DIA_Salandril_Trade_15_00"); //Uka� mi sv� zbo��.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_01"); //Je mi pot�en�m, ctihodn� brat�e.
		if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Salandril_Trade_13_02"); //Je mi pot�en�m, �lechetn� v�le�n�ku.
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

	description	 = 	"Te� se vyprav do kl�tera - bude� souzen.";
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
	AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_00"); //Te� se vyprav do kl�tera - bude� souzen.
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_01"); //Co�e? To jako abych zvednul zadek? Houby s octem! Ti mizern� m�gov� proti mn� nemaj� jedin� d�kaz!

	if (hero.guild == GIL_KDF)
	&& (SC_KnowsProspektorSalandril == TRUE)		
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_02"); //A co ty fale�n� d�ln� akcie, kter� jsi prod�val na ulic�ch po cel� zemi? Nesou tv�j podpis. Jsi vinen.
	}
	else
	{
		AI_Output			(other, self, "DIA_Salandril_KLOSTER_15_03"); //M�m sv� p��kazy, a ty taky vypln�m. Tak�e bu� p�jde� po dobr�m, nebo po zl�m.
	};
	AI_Output			(self, other, "DIA_Salandril_KLOSTER_13_04"); //Co�e? Klidn� t� p�es m�sto pot�hnu za l�mec jako kus �pinav�ho hadru!
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

	description	 = 	"Tak�e p�jde� te� do toho kl�tera, nebo chce� je�t� jednu?";
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
	AI_Output			(other, self, "DIA_Salandril_GehinsKloster_15_00"); //Tak p�jde� te� do toho kl�tera, nebo chce� je�t� jednu?
	AI_Output			(self, other, "DIA_Salandril_GehinsKloster_13_01"); //Toho bude� litovat. Jo, ksakru, p�jdu do toho pitom�ho kl�tera, ale nemysli si, �e je to vy��zen�.
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































