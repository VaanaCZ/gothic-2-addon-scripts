///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_EXIT   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 999;
	condition   = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kardif_EXIT_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Kardif_PICKPOCKET (C_INFO)
{
	npc			= VLK_431_Kardif;
	nr			= 900;
	condition	= DIA_Kardif_PICKPOCKET_Condition;
	information	= DIA_Kardif_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kardif_PICKPOCKET_Condition()
{
	C_Beklauen (55, 85);
};
 
FUNC VOID DIA_Kardif_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kardif_PICKPOCKET);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_BACK 		,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
	
func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hi		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hi_Condition;
	information	 = 	DIA_Kardif_Hi_Info;
	permanent    =  FALSE;
	description	 = 	"Cosa succede?";
};
func int DIA_Kardif_Hi_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hi_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //Come vanno le cose?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Se vuoi qualcosa da bere, devi ordinarlo.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif vende bevande al pub della banchina.");
};	
	
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hallo		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hallo_Condition;
	information	 = 	DIA_Kardif_Hallo_Info;
	permanent    =  FALSE;
	description	 = 	"Scommetto che sai un sacco di cose...";
};
func int DIA_Kardif_Hallo_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Kardif_Hi)
	&& (Kardif_Deal == 0)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Scommetto che sai un sacco di cose...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //E quindi?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Ho sempre un orecchio aperto per le informazioni.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //Anche il tuo borsellino è sempre aperto?
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Ogni informazione che ti passo costa 10 pezzi d'oro.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, il locandiere del pub del porto, commercia in informazioni.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Non ti darò più di 5 per le tue informazioni.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Lascia perdere. Troverò le informazioni in altro modo.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Va bene. Affare fatto.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //Va bene. Affare fatto.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Hai fatto un buon affare (sogghigna). Sono sempre al tuo servizio.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //Ti darò non più di 5 pezzi d'oro per le tue informazioni.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //Cosa? 5 pezzi d'oro? Stai cercando di rovinarmi? (ci riflette un attimo). Facciamo 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No, così non ci siamo. Facciamo 6!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"D'accordo, 7 monete d’oro mi sembra un prezzo onesto.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Scordatelo, prenderò le mie informazioni altrove.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //Va bene, va bene... Vada per 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"D'accordo, 7 monete d’oro mi sembra un prezzo onesto.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No, non le tue informazioni non sono così importanti per me.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Ok, 7 monete d’oro mi sembra un prezzo giusto.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //(sogghigna) Una decisione saggia. Bene, se c'è qualcosa che vuoi sapere, non esitare a chiedere!
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //No, non le tue informazioni non sono così importanti per me.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Ehi, aspetta... (sospira). Va bene, 5 pezzi d'oro. Ma è la mia ultima offerta!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Perché non l’hai detto subito?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //Perché non l’hai detto subito?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Oh, sono semplicemente fuori forma, ma in ogni caso, è un affare.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //No, così non ci siamo. Facciamo 6!
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Sei una canaglia, lo sai? Beh, se insisti, diciamo 6 pezzi d'oro per ciascuna informazione.
	Kardif_Deal = 6;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TRADE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TRADE_Condition;
	information	 = 	DIA_Kardif_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Dammi qualcosa da bere.";
};

func int DIA_Kardif_TRADE_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //Dammi qualcosa da bere.
};
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TradeInfo		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TradeInfo_Condition;
	information	 = 	DIA_Kardif_TradeInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Mi servono alcune informazioni.";
};

func int DIA_Kardif_TradeInfo_Condition ()
{
	if (Kardif_OneQuestion == FALSE)
	&& (Kardif_Deal > 0)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_TradeInfo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Mi servono delle informazioni.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Torna quando avrai abbastanza soldi.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"Quali sono i cittadini più importanti in questa città?";
};
//-------------------------------------------
var int DIA_Kardif_Buerger_permanent;
//-------------------------------------------
func int DIA_Kardif_Buerger_Condition ()
{	
	if (DIA_Kardif_Buerger_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Buerger_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //Quali sono i cittadini più importanti in questa città?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //Non troverai nessuno al porto. L'unico uomo potente da queste parti è Lehmar.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //Lo strozzino non è molto popolare, ma possiede dell'oro e altri cittadini influenti gli devono dei soldi.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Anche i mercanti e gli artigiani hanno un sacco di influenza, troppa se posso dire la mia.
		
		
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

// *****************************************************
//						Lehmar
// *****************************************************

instance DIA_Kardif_Lehmar	(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lehmar_Condition;
	information	 = 	DIA_Kardif_Lehmar_Info;
	permanent    =  TRUE;
	description	 = 	"Chi è in debito con Lehmar?";
};
//-------------------------------------------
var int DIA_Kardif_Lehmar_permanent;
//-------------------------------------------
func int DIA_Kardif_Lehmar_Condition ()
{	
	if (DIA_Kardif_Lehmar_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Buerger_permanent == TRUE) //(Knows perm Info)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lehmar_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //Chi è in debito con Lehmar?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //(ride) Se vuoi saperlo, faresti bene a dare un'occhiata al suo libro mastro.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Solo che sarà particolarmente difficile farlo senza che lui se ne accorga.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Per quanto ne so, lo porta sempre con sé.
		
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};



///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Arbeit		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Arbeit_Condition;
	information	 = 	DIA_Kardif_Arbeit_Info;
	permanent    =  TRUE;
	description	 = 	"Dove trovo un lavoro?";
};
//-------------------------------------------
var int DIA_Kardif_Arbeit_permanent;
//-------------------------------------------
func int DIA_Kardif_Arbeit_Condition ()
{	
	if (DIA_Kardif_Arbeit_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Arbeit_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //Dove trovo un lavoro?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //Non credo che troverai lavoro quaggiù al porto. Devi andare dagli artigiani nella parte inferiore della città per quello.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Ma se adoperi una lama decente, potresti andare a sfidare Alrik, combatte per denaro, nel retro del magazzino.
			
	DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Kardif_MissingPeople		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Addon_Kardif_MissingPeople_Condition;
	information	 = 	DIA_Addon_Kardif_MissingPeople_Info;
	permanent    =  TRUE;
	description	 = 	"Cosa puoi dirmi dei cittadini scomparsi?";
};
//-------------------------------------------
var int DIA_Addon_Kardif_MissingPeople_permanent;
//-------------------------------------------
func int DIA_Addon_Kardif_MissingPeople_Condition ()
{	
	if (DIA_Addon_Kardif_MissingPeople_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Kardif_MissingPeople_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //Cosa puoi dirmi dei cittadini scomparsi?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Io so solo che negli ultimi giorni sono scomparse delle persone.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Dicono che al porto la situazione sia particolarmente grave. Prova a fare qualche domanda in giro.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //Ci sono stati dei casi anche nella città bassa.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Se vuoi saperne di più, parla con Coragon.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Ha una taverna nella città bassa, e gli capita di venire a sapere parecchie cose.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //Anche Halvor, il mercante di pesce giù al molo, potrebbe sapere qualcosa. Ha molti clienti.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif dice che dovrei chiedere notizie sui cittadini scomparsi a Coragon, il padrone della taverna nella parte bassa della città, e ad Halvor, il pescivendolo del porto."); 

		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Lernen		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lernen_Condition;
	information	 = 	DIA_Kardif_Lernen_Info;
	permanent    =  TRUE;
	description	 = 	"Chi può insegnarmi qualcosa, qui?";
};
//-------------------------------------------
var int DIA_Kardif_Lernen_permanent;
//-------------------------------------------
func int DIA_Kardif_Lernen_Condition ()
{	
	if (DIA_Kardif_Lernen_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lernen_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //Chi può insegnarmi qualcosa, qui?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Nel distretto del porto ci sono pochi personaggi competenti in materia.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Carl il fabbro è un uomo robusto. Scommetto che può mostrarti come diventare più forte.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Alrik sa molto sul combattimento e Lares è un ladro astuto. Di tanto in tanto lo puoi trovare qui al porto.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //E se sei abbastanza pazzo da visitare il vecchio Ignaz, lui sa tutto sull'almic... alchidi... sulle pozioni.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //Dove posso trovare questa gente?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //(lamentandosi) Ragazzo, il Re avrà vinto la sua guerra contro gli orchi quando avrò finito di spiegartelo.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Guardati attorno al distretto del porto e li troverai. E se non sai come muoverti, vai da Brahim e comprati una mappa.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //È facile da trovare. È proprio dietro alla mia taverna. (mormora) Avrei dovuto raddoppiare il costo...
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, il fabbro del porto, può aiutarmi a diventare più forte.");
		B_LogEntry (Topic_CityTeacher,"Lares può aiutarmi a migliorare la mia destrezza.");
		B_LogEntry (Topic_CityTeacher,"Alrik può allenarmi a combattere con armi a una mano. Si trova dietro il magazzino nella zona del porto.");
		B_LogEntry (Topic_CityTeacher,"Ignaz può mostrarmi alcune ricette per preparare delle pozioni. Vive nella zona portuale.");
	
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brahim disegna e vende mappe vicino al porto.");
		
		
	DIA_Kardif_Lernen_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk_Condition;
	information	 = 	DIA_Kardif_Diebeswerk_Info;
	permanent    =  TRUE;
	description	 = 	"C’è bisogno di qualcuno per qualche lavoro 'speciale'?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk_Condition ()
{	
	if (DIA_Kardif_Diebeswerk_permanent == FALSE)
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	//&& (other.guild == GIL_NONE) 
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //C'è qualche 'lavoretto speciale' in zona per guadagnare velocemente dei soldi?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //Qualcosa di speciale dici? Mmmh...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //...Vai a parlare con Nagur. Forse lui può aiutarti.
	
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk2		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk2_Condition;
	information	 = 	DIA_Kardif_Diebeswerk2_Info;
	permanent    =  TRUE;
	description	 = 	"Hai qualcosa di 'speciale' da farmi fare?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk2_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk2_Condition ()
{	
	if (DIA_Kardif_Diebeswerk2_permanent == FALSE)
	&& (DIA_Kardif_Diebeswerk_permanent == TRUE) //andere Info
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	&& (other.guild != GIL_KDF) 
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk2_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //Hai qualcosa di “speciale” da farmi fare?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //Ho qualcosa per te, ma potrebbe interessarti solamente se sei un uomo versatile.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //Che cos'hai?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //Bene, Zuris, il venditore di pozioni del mercato, ospita Daron, il mago del fuoco.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //E allora?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Si è fatto fare un forziere appositamente da Thorben il carpentiere.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //Dicono che questo Daron abbia portato con sé degli oggetti di valore. Ma non hai avuto questa informazione da me, ci siamo intesi?
		
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's ich will doch keine Info kaufen 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zurueck		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Zurueck_Condition;
	information	 = 	DIA_Kardif_Zurueck_Info;
	permanent    =  TRUE;
	description	 = 	DIALOG_BACK;
};
func int DIA_Kardif_Zurueck_Condition ()
{	
	if (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Zurueck_Info ()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices (DIA_Kardif_Zurueck);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DOPE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_DOPE_Condition;
	information	 = 	DIA_Kardif_DOPE_Info;
	permanent    =  TRUE;
	description	 = 	"Dove posso comprare dell’erba, qui?";
};
var int DIA_Kardif_DOPE_perm;
func int DIA_Kardif_DOPE_Condition ()
{
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&&  (DIA_Kardif_DOPE_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_DOPE_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //Dove posso comprare dell’erba, qui?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Certamente non qui, non ho niente a che fare con quella roba.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Certamente non qui.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //Va bene, allora dove?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Parlerei con Meldor se fossi in te, dopotutto lui fuma tutto il giorno.
		
		DIA_Kardif_DOPE_perm = TRUE;
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Paket		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  3;
	condition	 = 	DIA_Kardif_Paket_Condition;
	information	 = 	DIA_Kardif_Paket_Info;
	permanent	 =  TRUE;
	description	 = 	"Cosa puoi dirmi su una confezione d’erba di palude?";
};
var int DIA_Kardif_Paket_perm;
func int DIA_Kardif_Paket_Condition ()
{
	if 	(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Paket_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Paket_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //Cosa puoi dirmi su una confezione d’erba di palude?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Chiunque possegga un pacco del genere è un uomo ricco. E probabilmente anche molto rilassato!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //Non provare a prendermi in giro. Tu sai qualcosa. Perciò sputa il rospo!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //Va bene, va bene. Questo tizio è venuto l'altro giorno alla mia taverna. Uno dei mercenari.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Ha detto che ha venduto un pacco di erba di palude al porto, ma naturalmente era su di giri. Questo è tutto quello che so.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif stava parlando con un mercenario. L'individuo aveva un pacchetto di erba di palude che voleva vendere.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info SendAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_SENDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_SENDATTILA_Condition;
	information	 = 	DIA_Kardif_SENDATTILA_Info;
	important	 = 	TRUE;
};

func int DIA_Kardif_SENDATTILA_Condition ()
{
	if (MIS_ThiefGuild_sucked == TRUE)
	|| (Diebesgilde_Okay >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kardif_SENDATTILA_Info ()
{
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Ehi tu, vieni qui. Ho qualcosa per te.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //C'era un tizio qui che ha insistito per parlare con te.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Siccome non c'eri, mi ha chiesto di riferirti questo messaggio.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Vuole incontrarti. Dietro al negozio del pescivendolo Halvor.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Questa informazione è gratis, ma è un'eccezione ragazzo! Qualsiasi altra ti costerà come al solito.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //Che aspetto aveva quel tizio?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //Potrei dirtelo, ma devi pagare, amico mio (sogghigna).
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Ogni informazione che ti passo costa 10 pezzi d'oro.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc (VLK_494_Attila, "NW_CITY_ENTRANCE_01");
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Kerl		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_Kerl_Condition;
	information	 = 	DIA_Kardif_Kerl_Info;
	permanent    =  TRUE;
	description	 = 	"Che aspetto aveva quel tizio?";
};
//----------------------------------
var int DIA_Kardif_Kerl_permanent;
//----------------------------------
func int DIA_Kardif_Kerl_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_SENDATTILA)
	&& (Attila.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //Che aspetto aveva quel tizio?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //Beh, piuttosto alto, carnagione scura e robusto, ma nessuna uniforme. In qualche modo... minaccioso.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //E la sua faccia?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //La sua faccia? Quando mi ha guardato ho ringraziato di non essere io il tipo per cui era venuto.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //C'era qualcosa di spaventoso nei suoi occhi, in ogni caso credo che dovresti andare a incontrarlo. Sembra interessante.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //Certo... la domanda è, per chi...
		
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DEFEATEDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_DEFEATEDATTILA_Condition;
	information	 = 	DIA_Kardif_DEFEATEDATTILA_Info;
	permanent    =  FALSE;
	description	 = 	"Quel bastardo ha cercato di uccidermi!";
};

func int DIA_Kardif_DEFEATEDATTILA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info ()
{
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //Quel bastardo ha cercato di uccidermi!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Ehi, non è colpa mia! Ti ho solamente passato delle informazioni.
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Se qualcuno è determinato a pestarti i piedi, immagino che abbia i suoi buoni motivi.

	B_GivePlayerXP (XP_Kardif_Blame4Attila);
	
	B_KillNpc	(Attila);
	Npc_RemoveInvItem	(Attila, ItMi_OldCoin);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Zeichen   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 2;
	condition   = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent   = FALSE;
	description = "(Mostra il segnale dei ladri)";
};

FUNC INT DIA_Kardif_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Ah, sei anche tu della banda. Bene. In questo caso, ho qualcosa per te.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//(con calma) Se dovessi avere bisogno di grimaldelli, vieni da me. Ne ho ancora qualcuno in giro, chiedimi semplicemente qualcosa da bere.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
};

//###########################
//##
//##	Kapitel 5
//##
//###########################

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Crew   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 51;
	condition   = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent   = FALSE;
	description = "Ho bisogno ancora di qualche marinaio.";
};

FUNC INT DIA_Kardif_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Crew_Info()
{
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//Ho bisogno ancora di qualche marinaio.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//È un brutto momento, amico mio. Non troverai abbastanza marinai in tutta Khorinis. La maggior parte di loro ha abbandonato la città.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Ma con un buon capitano, non dovrebbe essere difficile per te e alcuni altri uomini fare da equipaggio per un po'.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//Dove posso trovare un capitano?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//Stai chiedendo alla persona sbagliata. Io gestisco solo questa taverna.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif mi ha mandato dal vecchio Jack. Pare che possa essere in grado di aiutarmi.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Vai a parlare con il Vecchio Jack. Lo troverai gironzolare per il porto. Se vuoi andare per mari, lui è l'uomo giusto per te.
	};
};




























