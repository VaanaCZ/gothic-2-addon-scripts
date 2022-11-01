///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bengar_EXIT   (C_INFO)
{
	npc         = BAU_960_Bengar;
	nr          = 999;
	condition   = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	3;
	condition	 = 	DIA_Bengar_HALLO_Condition;
	information	 = 	DIA_Bengar_HALLO_Info;

	description	 = 	"Sei tu il coltivatore, qui?";
};

func int DIA_Bengar_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Sei tu il contadino, qui?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Diciamo di sì, anche se sono solo un affittuario.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Tutta la terra che vedi appartiene a un unico grande proprietario.

};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Bengar_WOVONLEBTIHR_Condition;
	information	 = 	DIA_Bengar_WOVONLEBTIHR_Info;

	description	 = 	"Come ti guadagni da vivere?";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_WOVONLEBTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Come ti guadagni da vivere?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //Soprattutto cacciando e vendendo la legna che tagliamo. Ovviamente alleviamo anche le pecore e coltiviamo i campi.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar mi affida tutti questi lavoratori e io devo tenerli occupati in qualche modo, anche se solo un paio di loro sono dei buoni cacciatori.

};


///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	6;
	condition	 = 	DIA_Bengar_TAGELOEHNER_Condition;
	information	 = 	DIA_Bengar_TAGELOEHNER_Info;

	description	 = 	"Assumi lavoratori a giornata?";
};

func int DIA_Bengar_TAGELOEHNER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_TAGELOEHNER_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Assumi lavoratori a giornata?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar manda via i lavoratori che non gli servono nella sua fattoria.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //E li manda da me. Io gli do da mangiare e loro lavorano qui per me.

};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bengar_MissingPeople_Info;

	description	 = 	"Ti è successo qualcosa di insolito, ultimamente?";
};

func int DIA_Addon_Bengar_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //È accaduto qualcosa di strano qui, ultimamente?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Ultimamente di cose strane ne ho viste tante.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Ma nessuna così strana come la misteriosa sparizione di Pardos.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //È uno dei miei braccianti, e non è proprio il tipo da piantare tutto e andarsene alla chetichella, capisci?

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Bengar, il contadino, sta cercando il suo bracciante Pardos."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Nessun indizio?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Forse si è stufato.", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Cosa c'è di così strano nella sua sparizione?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Cosa c'è di così strano nella sua sparizione?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos è un tipo timido, non si è mai avventurato oltre il confine dei miei campi.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Scapperebbe a gambe levate davanti a uno scarabeo.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Certo, quelle bestiacce non sono belle, ma non sono neppure pericolose, no?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //(disgustato) Dicono che c'è gente che li mangia. Che schifo.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Ci si abitua.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Forse si è stufato.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //Il lavoro dei campi era la sua vita. Non riesco a immaginare che sia andato a lavorare per un altro.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //Con me poteva fare quel che gli pareva.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //Nessun indizio?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Penso che siano stati quei briganti a rapirlo. Ormai sono giorni che scorrazzano in questa zona.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Una volta li ho visti trascinare al loro campo un cittadino.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Ho avuto l'impressione che volessero farne uno schiavo.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Dov'è l'accampamento?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Dov'è l'accampamento?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Al limitare dei miei campi ci sono degli scalini che portano in una piccola conca. È lì che si sono accampati.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Vorrei andare a cercare Pardos, ma non ho intenzione di affrontare quei tizi.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //Anzi, farai bene a starne alla larga anche tu. Quella gente non ha un gran senso dell'umorismo.
	Bengar_ToldAboutRangerBandits = TRUE;
};
func void DIA_Addon_Bengar_MissingPeople_back ()
{
	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_ReturnPardos_Condition;
	information	 = 	DIA_Addon_Bengar_ReturnPardos_Info;

	description	 = 	"Pardos è tornato?";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition ()
{
	if 	(MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&&  (Npc_GetDistToWP (Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Pardos è tornato?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Sì, è dentro che riposa. Grazie per tutto quello che...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //Non importa.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Aspetta, vorrei darti una ricompensa, ma non ho...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Non pensarci.
	
	B_GivePlayerXP (XP_Ambient);
};	

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Bengar_FernandosWeapons_Info;

	description	 = 	"I briganti che sono passati di qui portavano armi?";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition ()
{
	if (Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //I briganti portavano delle armi quando sono passati di qui?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //Che domanda è? Conosci dei briganti che non girino armati?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Voglio dire un CARICO di armi. Una grossa consegna.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Capisco. Sì, ora che mi ci fai pensare, portavano un sacco di armi.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Alcune in barili, altre in borse e altre ancora su un carro.
	 B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	8;
	condition	 = 	DIA_Bengar_REBELLIEREN_Condition;
	information	 = 	DIA_Bengar_REBELLIEREN_Info;

	description	 = 	"Cosa pensate di Onar?";
};

func int DIA_Bengar_REBELLIEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Cosa pensate di Onar?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //È un avido bastardo che finirà col farci impiccare tutti.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Uno di questi giorni, i paladini lasceranno la città e verranno qui a punirci per ciò che ha fatto.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Ma non ho scelta. Le guardie cittadine vengono qui solo per razziare e non per difendere la fattoria.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Se continuassi a essere fedele alla città, mi ritroverei solo, abbandonato da tutti.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Almeno ogni tanto Onar manda dei mercenari per controllare come vanno le cose.
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	9;
	condition	 = 	DIA_Bengar_PALADINE_Condition;
	information	 = 	DIA_Bengar_PALADINE_Info;

	description	 = 	"Come siete equipaggiati contro l’esercito reale?";
};

func int DIA_Bengar_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) 
		{
				return TRUE;
		};
};

func void DIA_Bengar_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Cos'hai contro l’esercito reale?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //È ovvio. Non c'è stato alcun miglioramento ora che i paladini sono in città, anzi è accaduto l'esatto contrario.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Ora queste dannate guardie ci fanno visita ancora più spesso e rubano tutto ciò che possono senza che i paladini muovano un dito.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Gli unici paladini che abbia mai visto sono le due guardie al passo.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Essi non si sposterebbero di un centimetro, nemmeno se venissimo massacrati dalle guardie.

};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	10;
	condition	 = 	DIA_Bengar_PASS_Condition;
	information	 = 	DIA_Bengar_PASS_Info;

	description	 = 	"Il passaggio?";
};

func int DIA_Bengar_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Bengar_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //Il passo?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //Sì. Il passo che conduce alla vecchia Valle delle Miniere vicino la cascata dall'altra parte dei pascoli dell'altopiano.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Parla con Malak. È stato lì un paio di volte la scorsa settimana.

};

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZ (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_MILIZ_Condition;
	information	= DIA_Bengar_MILIZ_Info;
	permanent 	= FALSE;
	description	= "Ho il compito di occuparmi del vostro problema con la guardia cittadina.";
};

func int DIA_Bengar_MILIZ_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Ho il compito di occuparmi del vostro problema con la guardia cittadina.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Cosa? Avevo detto a Onar di mandare un paio dei suoi MERCENARI.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //Questa è la mia occasione per dimostrare il mio valore.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Incredibile. Hai idea di cosa mi faranno le guardie se attaccherai briga con loro?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Credevo che non sarebbe venuto nessuno.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //L'avevo già detto a Onar giorni fa. A che serve pagare l'affitto?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Questi bastardi vengono qui una volta alla settimana per riscuotere le tasse per la città.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //È un bene che tu sia venuto proprio adesso. Di solito le guardie arrivano a quest'ora.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Dovrebbero essere qui a momenti.
};

// ************************************************************
// 			  				Selber vorknöpfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "Perché non contrastate la guardia cittadina per conto vostro?";
};

func int DIA_Bengar_Selber_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info ()
{
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Siete in tanti. Perché non vi ribellate da soli alle guardie?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //È vero che siamo in tanti, ma non siamo guerrieri esperti come le guardie cittadine.
};		

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN		(C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information	= DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent	= FALSE;
	description	= "Lasciate che la guardia cittadina venga, allora: me ne occuperò io!";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Lasciate che la guardia cittadina venga, allora: me ne occuperò io!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Non vedo l'ora. Eccoli che arrivano, proprio come ti avevo detto.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Non immischiarti!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //Beh, allora buona fortuna! Fagli vedere chi sei.
	};

	AI_StopProcessInfos (self);
				
	Npc_ExchangeRoutine	(self,"MilComing"); 
	
	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))
	{
		Npc_ExchangeRoutine	(Rick,"MilComing");
		AI_ContinueRoutine (Rick);
	};
	if (Hlp_IsValidNpc (Rumbold))
	&& (!Npc_IsDead (Rumbold))
	{		
		Npc_ExchangeRoutine	(Rumbold,"MilComing"); 
		AI_ContinueRoutine (Rumbold);
	};
};
	
// ************************************************************
// 			  				Miliz weg 
// ************************************************************
var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZWEG_Condition;
	information	= DIA_Bengar_MILIZWEG_Info;
	permanent	= TRUE;
	description	= "Il vostro problema con la guardia cittadina fa parte del passato.";
};

func int DIA_Bengar_MILIZWEG_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE)
	{
		if (Npc_IsDead (Rick) && Npc_IsDead (Rumbold))
		|| (Rumbold_Bezahlt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //Il vostro problema con la guardia cittadina fa parte del passato.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Sei impazzito? Sai cosa mi faranno quei tizi una volta che te ne sarai andato?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Sono ancora qui nei paraggi. Digli che devono sparire DEFINITIVAMENTE!
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //Non male. Forse ci rimarrà finalmente qualcosa alla fine del mese. Grazie.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Saresti stato addirittura disposto a pagare per me? Questo è un gesto nobile da parte tua.
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
		};
		
		Bengar_MilSuccess = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	13;
	condition	 = 	DIA_Bengar_BALTHASAR_Condition;
	information	 = 	DIA_Bengar_BALTHASAR_Info;

	description	 = 	"A Balthasar il pastore non è permesso accedere al tuo pascolo? ";
};

func int DIA_Bengar_BALTHASAR_Condition ()
{
	if 	(
		(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASAR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Al pastore Balthasar non è permesso accedere al tuo pascolo?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //Oh sì, quella storia. Gli ho detto che Sekob deve pagarmi se vuole portare le sue pecore al mio pascolo.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //A dire la verità, è solo un dispetto. Non sopporto Balthasar.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Se voglio persuadere Bengar a permettere l'accesso ai pascoli a Balthasar, devo prima fargli un favore. Sono sicuro che si presenterà un'occasione."); 
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	14;
	condition	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;

	description	 = 	"La guardia cittadina è stata sconfitta e Balthasar può calpestare di nuovo la vostra terra.";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
		&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
		&& (Bengar_MilSuccess == TRUE)
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //La guardia cittadina è stata sconfitta, e ora Balthasar potrà calpestare di nuovo la vostra terra.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Perché?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(minaccioso) Perché lo dico io.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Mmmh. D'accordo, farò come vuoi tu.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //Lascia che si trovi un posto per le sue bestie da qualche parte dietro il campo.

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	15;
	condition	 = 	DIA_Bengar_PERMKAP1_Condition;
	information	 = 	DIA_Bengar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Stai attento.";
};

func int DIA_Bengar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3)
			{
					return TRUE;
			};
};

func void DIA_Bengar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Stammi bene.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Anche tu.

	AI_StopProcessInfos (self);
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

INSTANCE DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP3_EXIT_Condition;
	information	= DIA_Bengar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	30;
	condition	 = 	DIA_Bengar_ALLEIN_Condition;
	information	 = 	DIA_Bengar_ALLEIN_Info;

	description	 = 	"Come vanno le cose?";
};

func int DIA_Bengar_ALLEIN_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_ALLEIN_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Come vanno le cose?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak è scomparso portandosi dietro tutto e tutti quelli che lavoravano per me. Ha detto di essere diretto verso le montagne.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Non ce la faceva più a restare qui.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Sono tempi duri. Non so per quanto tempo ancora potrò resistere.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Le orde di mostri che attraversano il passo ogni giorno per minacciare i pascoli dell'altopiano si stanno facendo sempre più pericolose.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Se almeno avessi un paio di aiutanti o di mercenari.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //C'era persino uno disposto a lavorare per me, ma poi ha cambiato idea. Credo si chiamasse 'Wolf'.
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar è solo nella sua fattoria. Il suo socio Malak se n'è andato e ha portato gli altri con sé. Bengar pensa che sia fuggito sulle montagne."); 
	B_LogEntry (TOPIC_BengarALLEIN,"La sua fattoria è totalmente indifesa adesso. Ha bisogno di aiuto. Ha detto qualcosa riguardo un mercenario di nome Wolf. Non conosco già quel tizio?"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_MALAKTOT_Condition;
	information	 = 	DIA_Bengar_MALAKTOT_Info;

	description	 = 	"Malak è morto.";
};

func int DIA_Bengar_MALAKTOT_Condition ()
{
	if (Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKTOT_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak è morto.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //Allora le cose peggioreranno ulteriormente.
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_SLDDA_Condition;
	information	 = 	DIA_Bengar_SLDDA_Info;

	description	 = 	"Ho trovato il mercenario che volevi.";
};

func int DIA_Bengar_SLDDA_Condition ()
{
	if (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_SLDDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Ho trovato il mercenario che volevi.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Non ho mai visto uno così alla mia fattoria. Spero che se la sappia cavare.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Tieni, prendi questo. Credo che ti tornerà utile.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	B_GivePlayerXP (XP_BengarsHelpingSLDArrived);
					
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	35;
	condition	 = 	DIA_Bengar_MALAKWIEDERDA_Condition;
	information	 = 	DIA_Bengar_MALAKWIEDERDA_Info;

	description	 = 	"Malak è tornato.";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition ()
{
	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS)||(NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak))==FALSE)

		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKWIEDERDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak è tornato.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Finalmente. Credevo che non l'avrei mai più rivisto.
	B_GivePlayerXP (XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	80;
	condition	 = 	DIA_Bengar_PERM_Condition;
	information	 = 	DIA_Bengar_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Andrà tutto bene.";
};

func int DIA_Bengar_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //Andrà tutto bene.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak è di nuovo qui, ma la situazione non è cambiata.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //A meno di un miracolo, tutti noi verremo spazzati via.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Wolf è un tipo strano, ma sono sicuro che saprà farsi valere, in un modo o nell'altro.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Senza Malak tutto il lavoro qui intorno si è fermato. Se non cambia qualcosa in fretta, dovrò cedere la mia fattoria.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Spero che torni presto.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"Start");
	B_StartOtherRoutine	(SLD_817_Soeldner,"Start");
	};
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

INSTANCE DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP4_EXIT_Condition;
	information	= DIA_Bengar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP4_EXIT_Info()
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

INSTANCE DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP5_EXIT_Condition;
	information	= DIA_Bengar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP5_EXIT_Info()
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


INSTANCE DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP6_EXIT_Condition;
	information	= DIA_Bengar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bengar_PICKPOCKET (C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 900;
	condition	= DIA_Bengar_PICKPOCKET_Condition;
	information	= DIA_Bengar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen (28, 50);
};
 
FUNC VOID DIA_Bengar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bengar_PICKPOCKET);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_BACK 		,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};
	
func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};


















































































