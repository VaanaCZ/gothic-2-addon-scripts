///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Baltram_EXIT   (C_INFO)
{
	npc         = VLK_410_Baltram;
	nr          = 999;
	condition   = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielfluß hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	1;
	condition	 = 	DIA_Baltram_Sperre_Condition;
	information	 = 	DIA_Baltram_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	&& ((!Npc_KnowsInfo (other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Baltram_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Sträfling aus der Minenkolonie. Mit dir mache ich keine Geschäfte!
	AI_StopProcessInfos (self);	 
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_Hallo_Condition;
	information	 = 	DIA_Baltram_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	//&& (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Baltram_Hallo_Info ()
{
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //Benvenuto, straniero, il mio nome è Baltram. Sei venuto per comprare del cibo?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //Temo che dovrò deluderti. Non ho molto in vendita al momento.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //Ma sono in attesa di una consegna.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //Se sei venuto a comprare del cibo, puoi andartene pure via.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //Non mi piacciono i mercenari! Non causano altro che problemi.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese		(C_INFO)
{
	npc		 	= VLK_410_Baltram;
	nr		 	= 1;
	condition	= DIA_Addon_Baltram_LaresAbloese_Condition;
	information	= DIA_Addon_Baltram_LaresAbloese_Info;

	important 	= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //Perché quell'espressione dubbiosa?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //Vedo che porti le insegne dell'Anello dell'Acqua.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //Ne sei membro anche tu?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //E se così fosse?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //Allora ti direi che Lares vuole che qualcuno lo sostituisca, giù al porto.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //Bene. Se è così, farò in modo che qualcuno vada a dargli il cambio.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //Capisco.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"Baltram, l'ambulante, farà in modo che Lares sia allontanato. Forse Lares può lasciare il porto ORA."); 

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	3;
	condition	 = 	DIA_Baltram_Job_Condition;
	information	 = 	DIA_Baltram_Job_Info;
	permanent	 =  FALSE;
	description  =  "Hai un lavoro per me?";
};
func int DIA_Baltram_Job_Condition ()
{
	if (MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Baltram_Job_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //Hai un lavoro per me?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //No, ho già un fattorino. Prova con gli altri mercanti.
};
///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	4;
	condition	 = 	DIA_Baltram_Trick_Condition;
	information	 = 	DIA_Baltram_Trick_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Baltram_Trick_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Trick_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Trick_01_00"); //Stai cercando un lavoro?
	AI_Output (other, self, "DIA_Baltram_Trick_15_01"); //Certo, che mi dici?
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //Il mio fattorino non è tornato e io sto aspettando una consegna dalla fattoria di Akil.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //E quanto vale tutto questo per te?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //Ti darò 50 pezzi d'oro.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //D'accordo, ci sto.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //Bene, di' ad Akil che ti mando io. Ti darà un pacco. Portamelo.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"Baltram mi ha assunto come fattorino. Devo recuperare un pacco dalla fattoria di Akil.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "Se porto a Baltram il suo pacco mi pagherà 50 pezzi d'oro.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_WAREZ_Condition;
	information	 = 	DIA_Baltram_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Mostrami la mercanzia.";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //Mostrami la mercanzia.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Baltram vende cibo al mercato.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //Non avrebbero dovuto spingersi tanto oltre. Ora uno dei mercenari ha anche assassinato un paladino.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //Qualcosa doveva succedere uno di questi giorni!
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //La gente come te non avrà nulla da me.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //Perché?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //Prima incitate i contadini e poi fate come se niente fosse successo.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //Ora sparisci, mi fai perdere i clienti.
		
		MIS_BaltramTrade = LOG_FAILED;
		
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_Skip_Condition;
	information	 = 	DIA_Addon_Baltram_Skip_Info;

	description	 = 	"Stai commerciando con i pirati?";
};

func int DIA_Addon_Baltram_Skip_Condition ()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_Skip_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_00"); //(in tono casuale) Fai affari con i pirati?
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_01"); //(sentendosi scoperto) Cosa? Chi te l'ha detto?
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_02"); //Ho parlato con uno di loro. Ti aspetta alla baia.
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //Che ci vuoi fare, questi sono tempi duri... Ognuno deve badare ai propri interessi.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Non avevi paura che ti scoprissero?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Pagherai le conseguenze del tuo gesto!", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //Non mi occorre sapere altro.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //Pagherai le conseguenze del tuo gesto!
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //Ehi, ascolta. Ti dirò tutto quello che so e tu, in cambio, non farai la spia. Intesi?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Cosa vendi?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Cosa sai dei pirati?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //Non avevi paura che ti scoprissero?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //Il rischio c'era. E dìaltronde tu mi hai scoperto, no?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //Ma terrai la bocca chiusa, vero?
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Cosa vendi?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Cosa sai dei pirati?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //(bruscamente) Cosa commerci?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //Perlopiù li rifornisco di cibo.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //In cambio, mi danno il miglior rum di tutta Khorinis.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Non mi occorre sapere altro.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Potrei gestire questo affare per te.", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //(sorride) Se vuoi posso occuparmene io al posto tuo.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //Sarebbe fantastico. Al momento non posso lasciare Khorinis.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //Tieni, prendi questo pacco e di' a Skip di non fare il taccagno con il rum questa volta.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //Fatti dare almeno 3 bottiglie.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Baltram mi ha dato un pacchetto. Dovrei portarlo a Skip."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //(bruscamente) Cosa sai dei pirati?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //(con foga) Vivono in una zona remota dell'isola di Khorinis.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //A quanto ne so, ci si può arrivare soltanto con un'imbarcazione.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //Gli abitanti di Khorinis li temono, e hanno ragione: non sono altro che dei tagliagole.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //Ma secondo me i briganti sono molto peggio.
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_SkipsRum_Condition;
	information	 = 	DIA_Addon_Baltram_SkipsRum_Info;

	description	 = 	"Ho il rum per Skip.";
};

func int DIA_Addon_Baltram_SkipsRum_Condition ()
{
	
	if (Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFo_Addon_Rum) >= 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_SkipsRum_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //Ho avuto il rum da Skip. Ma me ne ha dato soltanto 2 bottiglie.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //È troppo caro per me. Chi crede di essere? Dai qua allora.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //Per il momento non posso darti molto. Questo dovrà bastarti.
	CreateInvItems (self, ItMi_Gold, 10);									
	B_GiveInvItems (self, other, ItMi_Gold, 10);		

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  4;
	condition	 = 	DIA_Baltram_AkilsHof_Condition;
	information	 = 	DIA_Baltram_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Dove si trova la fattoria di Onar?";
};
func int DIA_Baltram_AkilsHof_Condition ()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //Dove si trova la fattoria di Akil?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //Vai dritto qui, esci dal cancello est e segui la strada verso sud-est.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //Dopo un po', arriverai a delle scale di pietra. Sali le scale e da lì dovresti già vedere la fattoria di Akil.
};
///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung	(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  5;
	condition	 = 	DIA_Baltram_Lieferung_Condition;
	information	 = 	DIA_Baltram_Lieferung_Info;
	permanent 	 =  FALSE;
	description	 = 	"Ho il raccolto di Akil.";
};

func int DIA_Baltram_Lieferung_Condition ()
{
	if (Npc_HasItems (other, ItMi_BaltramPaket) >=1)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //Ho il raccolto di Akil.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //Eccellente. Finalmente potrò nuovamente offrire merce fresca. Ecco i tuoi 50 pezzi d'oro.
	
	B_GiveInvItems (other, self, ItMi_BaltramPaket,1);
	B_GiveInvItems (self, other, ItMi_Gold,50);
	
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP (XP_Baltram_ScoutAkil);
	
	Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	
	CreateInvItems (self,ItFo_Cheese	,  5); 	
	CreateInvItems (self,ItFo_Apple 	, 10); 
	CreateInvItems (self,ItFo_Beer  	,  5);
	CreateInvItems (self,ItFo_Bacon 	,  5);
	CreateInvItems (self,ItFo_Sausage	,  5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_LetUsTrade_Condition;
	information	 = 	DIA_Baltram_LetUsTrade_Info;
	permanent	 =  FALSE;
	description	 = 	"Non potremmo concludere qualche affare insieme?";
};
func int DIA_Baltram_LetUsTrade_Condition ()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info ()
{
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //Non potremmo concludere qualche affare insieme?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //Ascolta, se mi porti 10 prosciutti e 10 bottiglie di vino, faremo nuovamente affari.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //Vedrò cosa posso fare.
	
	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_HaveYourWarez_Condition;
	information	 = 	DIA_Baltram_HaveYourWarez_Info;
	permanent	 =  TRUE;
	description	 = 	"Ho qui la tua mercanzia.";
};
func int DIA_Baltram_HaveYourWarez_Condition ()
{
	if (MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info ()
{
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //Ho qui la tua mercanzia.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //Mostramela.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //Ci siamo già accordati su 10 prosciutti. Torna quando ne avrai abbastanza.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //E che mi dici delle 10 bottiglie di vino? Te le sei dimenticate?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //Mmmh, non è la migliore qualità, ma di questi tempi non si può essere troppo esigenti.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //Ora non c'è niente che ci impedisca di fare affari.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Baltram_PICKPOCKET (C_INFO)
{
	npc			= VLK_410_Baltram;
	nr			= 900;
	condition	= DIA_Baltram_PICKPOCKET_Condition;
	information	= DIA_Baltram_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen (76, 175);
};
 
FUNC VOID DIA_Baltram_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Baltram_PICKPOCKET);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_BACK 		,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};
	
func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};



















