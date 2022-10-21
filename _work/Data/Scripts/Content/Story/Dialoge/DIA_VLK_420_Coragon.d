///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Coragon_EXIT   (C_INFO)
{
	npc         = VLK_420_Coragon;
	nr          = 999;
	condition   = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Coragon_PICKPOCKET (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr			= 900;
	condition	= DIA_Coragon_PICKPOCKET_Condition;
	information	= DIA_Coragon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen (40, 45);
};
 
FUNC VOID DIA_Coragon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Coragon_PICKPOCKET);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_BACK 		,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};
	
func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_HALLO_Condition;
	information	 = 	DIA_Coragon_HALLO_Info;
	permanent    =  FALSE;
	description	 = 	"Posso avere qualcosa da bere?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Posso avere qualcosa da bere?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Puoi anche mangiare, se ti va... e se hai dell'oro.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Posso comprare cibo e bevande da Coragon il taverniere.");
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_Trade_Condition;
	information	 = 	DIA_Coragon_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Mostrami la mercanzia.";
	trade 		 =  TRUE;
};
func int DIA_Coragon_Trade_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Trade_Info () //FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Mostrami la mercanzia.
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  3;
	condition	 = 	DIA_Coragon_WhatsUp_Condition;
	information	 = 	DIA_Coragon_WhatsUp_Info;
	permanent    =  FALSE;
	description	 = 	"E come vanno gli affari?";
	
};
func int DIA_Coragon_WhatsUp_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_WhatsUp_Info ()
{
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //E come vanno gli affari?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Non ricordarmelo... Lord Andre serve birra gratis nella piazza del patibolo.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Ormai qui vengono soltanto i ricchi dei quartieri alti.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //Che cos'hanno che non va?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(ride) Alcuni di quei signoroni mi danno davvero ai nervi.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Prendi quel Valentino, per esempio. Non lo sopporto proprio.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ma non posso scegliermi i clienti. Ho bisogno di guadagnare.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Quel poco che avevo risparmiato mi è stato rubato insieme a tutto il mio argento.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_420_Coragon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Coragon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Coragon_MissingPeople_Info;

	description	 = 	"Parlami dei cittadini scomparsi.";
};

func int DIA_Addon_Coragon_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Coragon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Parlami dei cittadini scomparsi.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //°Ho saputo che parecchi sono scomparsi nella zona del porto. Non che mi meravigli, con quel che succede laggiù. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //°Persino Thorben, il falegname nella parte bassa della città, ha perso il suo apprendista.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //°Hakon, uno di quelli che vende al mercato, racconta una storia proprio strana. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //°Dice che c'era un tizio che incontrava tutti i giorni che a un tratto sembra essere scomparso dalla faccia della terra. Ne ha parlato persino alla milizia. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //°La cosa ha gettato nel panico gli abitanti della città. Io non so cosa pensare. Credo siano tutte sciocchezze.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //°Khorinis è un postaccio, e fuori dalle sue porte si celano molti pericoli.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Chi esce dalla città finisce in mano ai briganti o divorato dalle bestie selvatiche. Tutto qui.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Hakon, un ambulante, e Thorben, il carpentiere, dovrebbero sapere qualcosa delle persone scomparse."); 
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  4;
	condition	 = 	DIA_Coragon_Bestohlen_Condition;
	information	 = 	DIA_Coragon_Bestohlen_Info;
	permanent    =  FALSE;
	description	 = 	"Qualcuno ti ha derubato?";
	
};
func int DIA_Coragon_Bestohlen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Bestohlen_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Ti hanno derubato?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //Sì, qualche tempo fa. Il locale era affollato quella sera, e io servivo birra ai tavoli.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Mi sono allontanato solo per un attimo dal bancone, ma per quei bastardi è stato sufficiente.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Ho sporto denuncia alla milizia, ma naturalmente non hanno scoperto nulla. Preferiscono sbronzarsi di birra gratis.
	
	MIS_Coragon_Silber = LOG_RUNNING;
};


// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------	
	
func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Tieni, prendi questa come ricompensa.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //È una birra speciale. Questo è l'ultimo barilotto.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //È l'ultimo bicchiere!
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  5;
	condition	 = 	DIA_Coragon_BringSilber_Condition;
	information	 = 	DIA_Coragon_BringSilber_Info;
	permanent    =  FALSE;
	description	 = 	"Ho qui il tuo argento.";
	
};
func int DIA_Coragon_BringSilber_Condition ()
{	
	if (MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_CoragonsSilber) >= 8)
	{
		return TRUE;
	};
};
func void DIA_Coragon_BringSilber_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Ho qui il tuo argento.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Davvero?
	B_GivePlayerXP (XP_CoragonsSilber);
	B_Coragon_Bier();
	
	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  6;
	condition	 = 	DIA_Coragon_Schuldenbuch_Condition;
	information	 = 	DIA_Coragon_Schuldenbuch_Info;
	permanent    =  FALSE;
	description	 = 	"Guarda cosa ho qui...";
	
};
func int DIA_Coragon_Schuldenbuch_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Schuldenbuch_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Guarda cosa ho qui...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Mmm? (sorpreso) Ma è il registro di Lehmar!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Cos'hai intenzione di fartene?
};


// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  7;
	condition	 = 	DIA_Coragon_GiveBook_Condition;
	information	 = 	DIA_Coragon_GiveBook_Info;
	permanent    =  FALSE;
	description	 = 	"Ecco il libro.";
	
};
func int DIA_Coragon_GiveBook_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_GiveBook_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Ecco il tuo libro.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Grazie! Mi hai salvato la pelle. Lehmar è un tipaccio.
	B_GivePlayerXP (XP_Schuldenbuch);
	B_Coragon_Bier();
};


// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  9;
	condition	 = 	DIA_Coragon_ToOV_Condition;
	information	 = 	DIA_Coragon_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Cosa devo fare per raggiungere il quartiere alto?";
	
};
func int DIA_Coragon_ToOV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Coragon_ToOV_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //Cosa devo fare per raggiungere il quartiere alto?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Devi essere un cittadino di qui. Trovati un lavoro.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Preferibilmente dai maestri artigiani nella parte bassa della città. Così diventerai un cittadino.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //Se non bastasse, va' in caserma e parla con Lord Andre.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Magari ti accetterà tra le guardie cittadine. Anche a loro è consentito accedere al quartiere alto.
};


// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  8;
	condition	 = 	DIA_Coragon_Valentino_Condition;
	information	 = 	DIA_Coragon_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Come stanno le cose con questo Valentino?";
	
};
func int DIA_Coragon_Valentino_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Valentino_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //Come stanno le cose con questo Valentino?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //È ricco sfondato e non ha bisogno di lavorare. E non perde occasione per vantarsene.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Che a te interessi o meno...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Beve come una spugna e rimane sempre fino all'alba, poi se ne torna barcollando nel quartiere alto.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //Ogni giorno così.
	
	
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 1;
	condition	= DIA_Coragon_News_Condition;
	information	= DIA_Coragon_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
	
};
func int DIA_Coragon_News_Condition ()
{	
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{	
			return TRUE;
		};
	};
};
func void DIA_Coragon_News_Info ()
{
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //L'altra sera Valentino non aveva di che pagare il conto.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Sosteneva di essere stato derubato, e ha detto che mi avrebbe pagato dopo... Come no!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //Fino a poco prima non aveva fatto altro che vantarsi della sua ricchezza.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //Poi ha messo una mano in tasca e ha fatto una faccia strana. Ha detto che l'avevano derubato...
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //E? Che cosa hai fatto?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Gliele ho date di santa ragione, che altro?
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 10;
	condition	= DIA_Coragon_Ring_Condition;
	information	= DIA_Coragon_Ring_Info;
	permanent   = FALSE;
	description = "Ecco… prendi questo anello.";
	
};
func int DIA_Coragon_Ring_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_News))
	&& (Npc_HasItems (other, ItRi_ValentinosRing) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Ring_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Ecco... prendi questo anello.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Cosa? Non capisco...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Apparteneva a Valentino.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Sei libero di darlo alla prossima persona che lo concerà per le feste...

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























