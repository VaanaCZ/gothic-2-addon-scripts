///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hakon_EXIT   (C_INFO)
{
	npc         = VLK_407_Hakon;
	nr          = 999;
	condition   = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Sperre_Condition;
	information	 = 	DIA_Hakon_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Hakon_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
	//return FALSE;
};
func void DIA_Hakon_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Sparisci, carcerato! Canthar mi ha raccontato che sporco bastardo sei.
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 =  3;
	condition	 = 	DIA_Hakon_Hallo_Condition;
	information	 = 	DIA_Hakon_Hallo_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Hakon_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Hallo_Info ()
{
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Sono Hakon, il mercante di armi.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //Ogni uomo dovrebbe avere un'arma in tempi come questi. Specialmente quando ci si avventura fuori dalle mura cittadine.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon vende armi al mercato.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	99;
	condition	 = 	DIA_Hakon_Trade_Condition;
	information	 = 	DIA_Hakon_Trade_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Mostrami la mercanzia.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Mostrami la mercanzia.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //È un onore per me che un rappresentante della nostra sacra chiesa mostri interesse per la mia merce.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_407_Hakon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Hakon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Hakon_MissingPeople_Info;

	description	 = 	"Cosa sai dei cittadini scomparsi a Khorinis?";
};

func int DIA_Addon_Hakon_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Hakon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //Cosa sai dei cittadini scomparsi a Khorinis?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //Li ho visti passare dalla porta orientale della città.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Alcuni non li avevo mai visti prima, e molti di coloro che sono usciti non sono più tornati.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Ma l'altro giorno è successa una cosa davvero strana.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //È venuto un tizio, mi pare si chiamasse Joe. Sosteneva che presto sarebbe diventato ricco.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Diceva di aver trovato il modo di entrare in una delle torri della città in cui la milizia tiene le armi.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Da allora non l'ho più visto, mentre prima mi capitava di incrociarlo tutti i giorni alla stessa ora.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //Ho fatto rapporto alla guardia cittadina.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Ma Lord Andre non aveva idea di cosa stessi dicendo. Non lo conosceva neppure, quel tizio.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Halon, un commerciante di Khorinis, dice che un uomo di nome Joe è scomparso senza lasciare traccia. Sostiene che Joe sappia come entrare in una delle torri della città, dove la milizia tiene le armi."); 

	B_GivePlayerXP (XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_OutOfTown_Condition;
	information	 = 	DIA_Hakon_OutOfTown_Info;
	permanent	 = 	FALSE;
	description	 = 	"Parlami ancora delle zone che circondano la città.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Parlami ancora delle zone che circondano la città.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Si è fatto terribilmente pericoloso là fuori.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //A causa dei briganti, per esempio, ma anche per le bestie selvagge.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Persino gli animali non sembrano trovare abbastanza da mangiare in questi tempi sventurati.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Si avventurano sempre più vicino alle mura della città.
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	3;
	condition	 = 	DIA_Hakon_Paladine_Condition;
	information	 = 	DIA_Hakon_Paladine_Info;
	permanent	 = 	FALSE;
	description	 = 	"Sai qualcosa sui paladini?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //Sai qualcosa sui paladini?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Sì! Quei tizi mi stanno rovinando gli affari!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //Tutto quello che riesci a comprare in città è una spada corta, nel migliore dei casi.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Hanno preso tutto quello che era più lungo di un piede e mezzo.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //(sarcastico) In cambio, ora posso vivere alla locanda senza dover pagare, ah!
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_WoWaffen_Condition;
	information	 = 	DIA_Hakon_WoWaffen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dove ti procuri le tue armi?";
};
func int DIA_Hakon_WoWaffen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Hakon_WoWaffen_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //Dove ti procuri le tue armi?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //Da nessuna parte! Harad è sempre stato il mio fornitore finora.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Harad il fabbro è stato il mio fornitore finora.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Ora fabbrica solo roba per i paladini.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Lavora per quei tizi notte e giorno come un pazzo, senza paga. Pensa sia il suo dovere.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Tutto quello che posso offrirti ora sono le scorte rimaste...
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_HaradBandits_Condition;
	information	 = 	DIA_Hakon_HaradBandits_Info;
	permanent	 = 	FALSE;
	description	 = 	"Herald mi ha parlato dell’attacco dei briganti...";
};
func int DIA_Hakon_HaradBandits_Condition ()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_HaradBandits_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Herald mi ha parlato dell’attacco dei briganti...
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Oh? E...?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Accetterà che io diventi un apprendista se troverò i briganti.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //(ride) Buon vecchio Harad. Dev'essere il suo modo di scusarsi perché non può produrre alcuna arma al momento.
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Banditen_Condition;
	information	 = 	DIA_Hakon_Banditen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Cosa mi dici dei briganti?";
};
func int DIA_Hakon_Banditen_Condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo (hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};
func void DIA_Hakon_Banditen_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //Cosa mi dici dei briganti?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //Cosa so su di loro? Mi hanno rapinato sulla strada per la città!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //E non sono l'unico. È da un po' che usano questo stratagemma.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //L'esercito ha provato a individuarli, ma senza alcun successo.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Hakon il venditore di armi è stato derubato dai briganti fuori dalla città." );
};


///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Wieviel_Condition;
	information	 = 	DIA_Hakon_Wieviel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ci penserò io...";
};
func int DIA_Hakon_Wieviel_Condition ()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wieviel_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Ci penserò io...
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //Cosa? TU vorresti occuparti dei briganti? Da solo? Sei un guerriero molto abile, eh?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //Quanto può valere per te tutto questo?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //(astutamente) Vuoi entrare nelle grazie di Harad, non è vero?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //Non penso che dovrei pagarti per questo...
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //È un affare pericoloso.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //Beh, per me va bene. Ti pagherò 100 pezzi d'oro se sconfiggerai i briganti.
		MIS_HakonBanditsPay = TRUE;
	};
	
	Info_ClearChoices (DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_Miliz_Condition;
	information	 = 	DIA_Hakon_Miliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Sai chi nella guardia cittadina ha preso parte alla perquisizione?";
};

func int DIA_Hakon_Miliz_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Miliz_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Sai chi ha preso parte alla ricerca dell'esercito?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //Un tizio di nome Pablo. Lui e qualche altro sono andati a cercare i briganti, ma non li hanno trovati.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //Sai dove posso trovare Pablo?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //È di ronda per la città. Lo troverai nella piazza del tempio o nella parte bassa della città.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo, la guardia cittadina, ha guidato l'inutile ricerca dei briganti." );
};
///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_Wo_Condition;
	information	 = 	DIA_Hakon_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dove ti hanno bloccato?";
};

func int DIA_Hakon_Wo_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wo_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //Dove ti hanno bloccato?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //Vicino alla fattoria di Akil. Esci da questo cancello cittadino e segui la strada sulla destra.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Dopo poco, arriverai ad alcuni scalini. Quei bastardi sono venuti proprio da lì. Scommetto che il loro nascondiglio di trova in quel bosco.
};
///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Success_Condition;
	information	 = 	DIA_Hakon_Success_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mi sono occupato dei briganti.";
};

func int DIA_Hakon_Success_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead (Bandit_1))
	&& (Npc_IsDead (Bandit_2))
	&& (Npc_IsDead (Bandit_3))
	
	{
		return TRUE;
	};
};
func void DIA_Hakon_Success_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Mi sono occupato dei briganti.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //Davvero? Chiunque potrebbe dire una cosa del genere, hai delle prove?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //(sospira) Devo tornare indietro a tagliargli le teste?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //(frettolosamente) No, non credo sia necessario. Ti credo.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Hai reso un grosso servigio ai mercanti e alla città.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //Harad sarà felice, credo.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Ecco i soldi che ti avevo promesso.
		B_GiveInvItems (self, other, ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Hakon_Bandits); 
	
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Hakon_Minenanteil (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 3;
	condition	= DIA_Hakon_Minenanteil_Condition;
	information	= DIA_Hakon_Minenanteil_Info;
	permanent	= FALSE;
	description = "Come ti sei procurato quelle azioni della miniera che stai vendendo?";
};   
                    
FUNC INT DIA_Hakon_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hakon_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //Come ti sei procurato quelle azioni della miniera che stai vendendo?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Mi dispiace, ma non posso dirtelo. Sarebbe troppo pericoloso per me.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hakon_PICKPOCKET (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 900;
	condition	= DIA_Hakon_PICKPOCKET_Condition;
	information	= DIA_Hakon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen (45, 65);
};
 
FUNC VOID DIA_Hakon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hakon_PICKPOCKET);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_BACK 		,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};
	
func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};


// ************************************************************
// 			  				Kapitel2
// ************************************************************

INSTANCE DIA_Hakon_Kapitel2 (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 5;
	condition	= DIA_Hakon_Kapitel2_Condition;
	information	= DIA_Hakon_Kapitel2_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Hakon_Kapitel2_Condition()
{
	if (Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hakon_Kapitel2_Info()
{	
	AI_Output (self ,other,"DIA_Hakon_Add_12_22"); //Eccoti ancora qui!
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad ha finalmente completato quel dannato ordine per i paladini.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //Questo significa che ora posso offrirti alcune nuove armi. Ti interessano?
};
