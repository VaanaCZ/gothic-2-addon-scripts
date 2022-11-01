///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Martin_EXIT   (C_INFO)
{
	npc         = Mil_350_Addon_Martin;
	nr          = 999;
	condition   = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Martin_PICKPOCKET (C_INFO)
{
	npc			= Mil_350_Addon_Martin;
	nr			= 900;
	condition	= DIA_Addon_Martin_PICKPOCKET_Condition;
	information	= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen (65, 77);
};
 
FUNC VOID DIA_Addon_Martin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};
	
func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Martin_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Martin_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //Dunque tu sei quello nuovo, eh? Benvenuto tra noi, compagno dell'Anello.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //Prima vai da Vatras, poi forse avrò tempo per te.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Hallo_Condition;
	information	 = 	DIA_Addon_Martin_Hallo_Info;
	
	important	 = 	TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Ehi tu! Gira al largo. Qui possono entrare solo paladini e miliziani.
};


///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Martin_WasMachstDu_Info;

	description	 = 	"Perché, cosa c'è qui?";
};

func int DIA_Addon_Martin_WasMachstDu_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //Perché, cosa c'è qui?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Questo è lo spaccio della guardia reale dei paladini.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Io sono il furiere, e devo sorvegliare la roba dei paladini perché non si perda. E tu non sei il benvenuto qui.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Tieni le mani in tasca o giuro che te le mozzo.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_PreTrade_Condition;
	information	 = 	DIA_Addon_Martin_PreTrade_Info;

	description	 = 	"Puoi vendermi la roba dei paladini?";
};

func int DIA_Addon_Martin_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_PreTrade_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //Puoi vendermi la roba dei paladini?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Vuoi comprare? Mmh. Beh, se le cose dei paladini andassero perse ci sarebbero dei problemi, ma se tu mi compensassi per il fastidio, forse potremmo metterci d'accordo.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //Capita spesso che si 'perda' qualcosa?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Se il furiere dice che è tutto a posto, nessuno controlla.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //Capisco.
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Farim_Condition;
	information	 = 	DIA_Addon_Martin_Farim_Info;

	description	 = 	"Farim, il pescatore, ha problemi con la milizia.";
};

func int DIA_Addon_Martin_Farim_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Farim_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Farim, il pescatore, ha problemi con la milizia. I ragazzi lo derubano di continuo.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //E io che c'entro?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Tu hai una certa influenza sui paladini.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim ha bisogno di protezione. In cambio, è disposto a darti una parte del pescato.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Capisco.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //(sprezzante) Pesce! Come se non avessi già abbastanza grattacapi...
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Di' al tuo amico di venire da me. Voglio sapere cosa sta combinando la milizia.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Me ne occuperò io.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"Martin, il mastro furiere si occuperà della faccenda."); 

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP (XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	80;
	condition	 = 	DIA_Addon_Martin_Trade_Condition;
	information	 = 	DIA_Addon_Martin_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Cosa puoi offrirmi?";
};

func int DIA_Addon_Martin_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};
var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info ()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader, LogText_Addon_MartinTrade); 
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //Cos’hai da offrirmi?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Ascolta bene.
};


///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Rangerhelp_Condition;
	information	 = 	DIA_Addon_Martin_Rangerhelp_Info;

	description	 = 	"Mi ha mandato Lares";
};

func int DIA_Addon_Martin_Rangerhelp_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};		
};

func void DIA_Addon_Martin_Rangerhelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Mi ha mandato Lares. Ha detto che mi avresti aiutato.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Ah sì, eh? Sputa il rospo, allora! Cosa vuoi da me?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Voglio entrare nella milizia.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //(ride) Ti piacerebbe, eh? Per accettare uno straccione come te ci servirebbe un ottimo motivo.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //Probabilmente dovrai...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Risparmiami le chiacchiere. Dimmi solo cosa devo fare.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //(sorpreso) D'accordo. Ascoltami bene.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //Fare il furiere è un lavoraccio, credimi. Già sorvegliare tutte le casse e i sacchi che ci sono qua dentro è un'impresa.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //In più, ogni volta che rientro dopo una serata trascorsa nella taverna di Kardif, scopro che qualcosa è scomparso.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //(arrabbiato) E stranamente, i paladini non vedono mai niente.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //(arrabbiato) Sto impazzendo. Non posso starmene impalato qui tutta la notte come un idiota.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Tu, invece...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //Ho afferrrato. Vuoi che rimanga qui di guardia mentre tu te la spassi alla taverna.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //Prendere o lasciare.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Dovrei tenere d'occhio le casse di Martin, il mastro furiere. Se acchiappo chi armeggia con le sue casse, Martin mi aiuterà a entrare nella milizia."); 

}; 

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Auftrag_Condition;
	information	 = 	DIA_Addon_Martin_Auftrag_Info;

	description	 = 	"Stanotte farò la guardia alle tue casse.";
};

func int DIA_Addon_Martin_Auftrag_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Stanotte farò la guardia alle tue casse.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //(soddisfatto) Perfetto.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //E io me ne andrò alla taverna di Kardif. E guai a te se quando torno scopro che manca qualcosa.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Bene. Allora torna stanotte e tieni d'occhio la roba. Nel frattempo, io sarò alla taverna di Kardif.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(altro)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartOtherRoutine	(MIL_321_Rangar,"PalCampKlau");
};



// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_FromVatras_Condition;
	information	= DIA_Addon_Martin_FromVatras_Info;

	description	= "Stai cercando l'uomo che vende armi ai briganti?";
};
func int DIA_Addon_Martin_FromVatras_Condition ()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_FromVatras_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Stai cercando l'uomo che vende armi ai briganti?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //Chi lo dice?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Oh. Cosa sai di questa faccenda?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Non molto, ma potrei indagare.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //(comprendendo) Ah, è così...
};	
///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_TellAll_Condition;
	information	= DIA_Addon_Martin_TellAll_Info;

	description	= "Dimmi, cosa sai sul trafficante di armi?";
};
func int DIA_Addon_Martin_TellAll_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_TellAll_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Dimmi, cosa sai sul trafficante di armi?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Ascolta. Sappiamo che è un cittadino influente dei quartieri alti.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //Sembra addirittura che alcune delle armi provenissero dalle dotazioni della milizia.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Ma non abbiamo ancora individuato il responsabile.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Se te la senti di affrontare come minimo cinque briganti, forse riuscirai a scoprirlo...
	B_LogEntry (TOPIC_Addon_BanditTrader,"Secondo Martin, il venditore di armi è un cittadino influente dei quartieri alti."); 
};	
///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_AboutBandits_Condition;
	information	= DIA_Addon_Martin_AboutBandits_Info;

	description	= "E quanto ai briganti?";
};
func int DIA_Addon_Martin_AboutBandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_AboutBandits_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //E quanto ai briganti?
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Sappiamo che i briganti hanno bloccato le strade che collegano le fattorie alla città.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //Ho saputo anche che c'è stata una consegna di armi negli ultimi giorni.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Forse tra i briganti troverai qualche indizio per scoprire il trafficante di armi.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"I briganti bloccano le strade tra il porto e le fattorie. Forse là posso trovare un indizio che mi permetta di scoprire il venditore di armi."); 
};	

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Fernando_Condition;
	information	 = 	DIA_Addon_Martin_Fernando_Info;
	permanent	 = 	TRUE;

	description	 = 	"A proposito del venditore di armi…";
};

func int DIA_Addon_Martin_Fernando_Condition ()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //A proposito del trafficante...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Mostrami cos'hai trovato.
	
		var int FernandoHints;
		FernandoHints = 0;
		
		if 	(
			(Npc_HasItems (other,ItMw_Addon_BanditTrader))
			||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
			||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
			)
			{
				
				if (Npc_HasItems (other,ItMw_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //I briganti avevano questo stocco. Sul pomo è incisa la lettera 'F'.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //I briganti avevano quest'anello. È di un importatore.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Quest'elenco di armi e altre merci consegnate ai briganti è firmato da un certo Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //Inoltre Fernando, il vecchio mercante dei quartieri alti, ha ammesso di aver fatto affari con i briganti.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando ha ammesso di aver fornito armi ai briganti.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //Penso che ciò basti. È stato Fernando, allora. Bene, avrà quel che merita.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //E pensare che si atteggia sempre a gran signore!
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Lo butterò in prigione a marcire.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Ottimo lavoro, devo dire.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras sarà lieto della notizia.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin farà in modo che Fernando sconti la sua pena. Dovrei dirlo a Vatras."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //E...? Che altro?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //È tutto.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //La confessione non basta, mi servono delle prove concrete.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Non voglio rendermi ridicolo agli occhi di Lord Hagen. Dovrai portarmi altre prove.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //Non basta. Potrebbe essere stato chiunque nei quartieri alti.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Dovrai seguire le tracce dei briganti e della consegna di armi fino a risalire al responsabile.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Forse dovresti riparlare con Vatras...
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Puoi ripetere?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Ascolta. Devci scoprire chi è che consegna armi ai briganti e portarmene le prove.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Ma è necessario che siano prove incriminanti, o non potrò arrestare il responsabile.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Martin_Perm_Condition;
	information	 = 	DIA_Addon_Martin_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Le casse sono ancora tutte lì?";
};

func int DIA_Addon_Martin_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Le casse sono ancora tutte lì?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //(arrabbiato) Bastardo, è così che fai la guardia alle mie casse? È sparita dell'altra roba.

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //(gridando) Vai subito allo spaccio giù al porto e acciuffa il manigoldo che ha rubato la mia roba, capito?
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //E vedi di stare più attento questa notte, intesi?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Sì, ridi pure. Provaci TU a startene tutto il giorno a fare la guardia a questo casino.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Non hai idea di quanta roba si siano portati dietro i paladini.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Non toccare niente o chiamerò le guardie, intesi?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GotRangar_Condition;
	information	 = 	DIA_Addon_Martin_GotRangar_Info;

	description	 = 	"Ho preso il ladro.";
};

func int DIA_Addon_Martin_GotRangar_Condition ()
{
	if (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GotRangar_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //Ho preso il ladro.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //È Rangar che saccheggia le scorte.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //Beh, era l'ora. Almeno adesso so chi devo tenere d'occhio. Che bastardo! Se lo becco con le mani nel sacco gli faccio vedere io..
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Mi chiedevo come mai nessun paladino avesse mai visto niente.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //E... ?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //È ovvio. Quegli idioti non ci distinguono l'uno dall'altro. Per loro, noi della milizia siamo tutti uguali.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //Ottimo lavoro, amico.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Se posso fare qualcosa per te, chiedi pure.

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GetMiliz_Condition;
	information	 = 	DIA_Addon_Martin_GetMiliz_Info;

	description	 = 	"Sai già cosa voglio da te.";
};

func int DIA_Addon_Martin_GetMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_GotRangar))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GetMiliz_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Sai già cosa voglio da te.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //Oh, certo. Vuoi entrare nella milizia, giusto?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //Mi hai già dimostrato quanto vali.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //Bene, mettiamola così: preferisco saperti con noi piuttosto che contro di noi.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //Per questo ti aiuterò. Pendi questa lettera di raccomandazione e mostrala ad Andre, il nostro comandante.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //È in caserma. Troverà di certo qualcosa da farti fare.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin mi ha dato una lettera di raccomandazione per Andre, il comandante dei paladini. Con quella, Andre mi lascerà entrare nella milizia. Posso trovare Andre in caserma."); 
};


